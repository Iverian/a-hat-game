import "dart:collection";
import "dart:developer" as dev;
import "dart:math";

import "package:fixnum/fixnum.dart";
import "package:tuple/tuple.dart";

import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";

const int kInt32Max = 0x7fffffff;
const int kFirstRev = 1;

class GameStateManager {
  final Random rng;
  GameState state;

  GameStateManager({required this.state}) : rng = Random.secure();

  factory GameStateManager.fromClient({required GameState state}) => GameStateManager(state: state);

  factory GameStateManager.fromHost({
    required String id,
    required Settings settings,
    required String playerName,
  }) {
    final result = GameStateManager(state: GameState.create());
    final hostId = result._generatePlayerId();
    result.state
      ..id = id
      ..rev = kFirstRev
      ..players[hostId] = Player(connected: true, name: playerName)
      ..hostId = hostId
      ..settings = settings
      ..clearStage()
      ..lobby = Lobby.create();

    return result;
  }

  int get rev => state.rev;

  void ensurePlayerPresent(int playerId) {
    if (!state.players.containsKey(playerId)) {
      throw PlayerNotFoundError();
    }
  }

  int getActivePlayer() {
    _ensureRoundStage();
    final teams = state.round.state.teams.value;
    final teamsTotal = teams.length;
    final turnIndex = state.round.turnIndex % state.players.length;

    final activeTeam = teams[turnIndex % teamsTotal];
    return (turnIndex >= teamsTotal) ? activeTeam.firstPlayerId : activeTeam.secondPlayerId;
  }

  UpdateState makeRewindPatch() => UpdateState(rev: state.rev, confirm: false)
    ..clearAction()
    ..rewind = DoRewind(state: state);

  Tuple2<int, UpdateState> updateLobbyJoin(String playerName) {
    final playerId = _generatePlayerId();
    final patch = _makeUpdate(confirm: false)
      ..clearAction()
      ..playerJoined = DoPlayerJoined(
        playerId: playerId,
        player: Player(connected: true, name: playerName),
      );
    _applyUpdateUnchecked(patch);

    return Tuple2(playerId, patch);
  }

  UpdateState updateLobbyLeave(int playerId) {
    final patch = _makeUpdate(confirm: false)
      ..clearAction()
      ..playerLeft = DoPlayerLeft(playerId: playerId);
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateLobbyPlayerReady(int playerId, List<Character> characters) {
    final patch = _makeUpdate(confirm: false)
      ..clearAction()
      ..playerReady = DoPlayerReady(playerId: playerId, characters: characters);
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateLobbyPlayerNotReady(int playerId) {
    final patch = _makeUpdate(confirm: false)
      ..clearAction()
      ..playerNotReady = DoPlayerNotReady(playerId: playerId);
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateLobbyPrepareStartGame() {
    _ensureGameStart();

    final players = state.players.keys.toList()..shuffle(rng);
    final teamsTotal = players.length ~/ 2;
    final teams = List<Team>.empty(growable: true);
    for (var i = 0; i < teamsTotal; ++i) {
      teams.add(
        Team(
          firstPlayerId: players[i],
          secondPlayerId: players[teamsTotal + i],
          // TODO: generate team name and style
          props: TeamProps(
            name: i.toString(),
            styleId: i,
          ),
        ),
      );
    }

    final patch = _makeUpdate(confirm: true)
      ..clearAction()
      ..prepareStart = DoPrepareStart(teams: TeamList(value: teams));
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateLobbyStartGame() {
    final patch = _makeUpdate(confirm: false)
      ..clearAction()
      ..roundNext = DoNextRound(roundIndex: 0);
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateStartTurn() {
    final patch = _makeUpdate(confirm: true)
      ..clearAction()
      ..turnStart = DoStartTurn();
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateEndTurn(TurnEndReason reason, List<Int64> guessed) {
    final patch = _makeUpdate(confirm: false)
      ..clearAction()
      ..turnEnd = DoEndTurn(
        reason: reason,
        guessed: CharacterIdList(characters: guessed),
      );
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateCastVote(int playerId, List<CharacterVote> result) {
    final patch = UpdateState(rev: state.rev, confirm: false)
      ..clearAction()
      ..votePlayer = DoPlayerVoted(
        playerId: playerId,
        result: VoteResult(value: result),
      );
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateCountVotes() {
    _ensureTurnVoteStage();

    final activePlayer = getActivePlayer();
    final teamsTotal = state.round.state.teams.value.length;

    final voteCounter = Map.fromEntries(
      state.round.vote.guessed.characters.map((e) => MapEntry(e, _CharacterVoteCount())),
    );
    for (final i in state.round.vote.playerVote.entries) {
      for (final charVote in i.value.value) {
        final charCounter = voteCounter[charVote.characterId]!;
        if (charVote.outcome == CharacterVoteOutcome.APPROVED) {
          continue;
        }

        if (activePlayer == i.key) {
          charCounter.activePlayerVoted = true;
        }
        charCounter.playersVoted += 1;
      }
    }

    final result = VoteResult(
      value: voteCounter.entries
          .map(
            (e) => CharacterVote(
              characterId: e.key,
              outcome: (e.value.activePlayerVoted || e.value.playersVoted > teamsTotal)
                  ? CharacterVoteOutcome.REJECTED
                  : CharacterVoteOutcome.APPROVED,
            ),
          )
          .toList(),
    );
    final patch = UpdateState(rev: state.rev, confirm: false)
      ..clearAction()
      ..voteCount = DoVoteCount(result: result);
    _applyUpdateUnchecked(patch);
    return patch;
  }

  UpdateState updateNextTurn() {
    late UpdateState patch;
    if (state.round.characterPool.characters.isEmpty) {
      patch = _makeUpdate(confirm: true)
        ..clearAction()
        ..roundNext = DoNextRound(roundIndex: state.round.roundIndex + 1);
    } else {
      patch = _makeUpdate(confirm: false)
        ..clearAction()
        ..turnNext = DoNextTurn(turnIndex: state.round.turnIndex + 1);
    }
    _applyUpdateUnchecked(patch);
    return patch;
  }

  bool applyUpdate(UpdateState patch) {
    if (patch.rev <= state.rev) {
      dev.log("old revision received (current = ${state.rev}, received = ${patch.rev})");
      return false;
    }
    if (patch.whichAction() != UpdateState_Action.rewind && patch.rev != state.rev + 1) {
      dev.log("skipped some states, requesting rewind");
      return true;
    }

    return _applyUpdateUnchecked(patch);
  }

  bool _applyUpdateUnchecked(UpdateState patch) {
    switch (patch.whichAction()) {
      case UpdateState_Action.rewind:
        state = patch.rewind.state;
        break;
      case UpdateState_Action.playerDisconnected:
        state.players[patch.playerDisconnected.playerId]?.connected = false;
        break;
      case UpdateState_Action.playerConnected:
        state.players[patch.playerConnected.playerId]?.connected = true;
        break;
      case UpdateState_Action.playerJoined:
        _ensureLobbyStage();
        for (final i in state.players.entries) {
          if (i.value.name == patch.playerJoined.player.name) {
            throw PlayerNameTakenError();
          }
        }

        state.players[patch.playerJoined.playerId] = patch.playerJoined.player;
        break;
      case UpdateState_Action.playerLeft:
        _ensureLobbyStage();
        ensurePlayerPresent(patch.playerLeft.playerId);

        state
          ..players.remove(patch.playerLeft.playerId)
          ..lobby.state.remove(patch.playerLeft.playerId);
        break;
      case UpdateState_Action.playerReady:
        _ensureLobbyStage();
        if (patch.playerReady.characters.length != state.settings.characterCount) {
          throw CharactersInvalid();
        }

        state.lobby.state[patch.playerReady.playerId] =
            PlayerLobbyState(value: patch.playerReady.characters);
        break;
      case UpdateState_Action.playerNotReady:
        _ensureLobbyStage();
        ensurePlayerPresent(patch.playerNotReady.playerId);

        state.lobby.state.remove(patch.playerNotReady.playerId);
        break;
      case UpdateState_Action.prepareStart:
        _ensureLobbyStage();

        final lobbyState = state.lobby;
        state
          ..clearStage()
          ..preparing = _stateFromLobby(
            lobbyState,
            patch.prepareStart.teams,
          );
        break;
      case UpdateState_Action.roundNext:
        _ensureNotPaused();

        final value = patch.roundNext;
        final nextRound = Round(
          roundIndex: value.roundIndex,
          turnIndex: 0,
          paused: false,
          overview: TurnOverview(),
        );

        late RunningGameState innerState;
        if (value.roundIndex == 0) {
          _ensurePreparingStage();
          innerState = state.preparing;
        } else {
          _ensureTurnVoteCountStage();
          innerState = state.round.state;
        }

        nextRound
          ..characterPool = CharacterIdList(
            characters: innerState.characters.keys.toList(),
          )
          ..state = innerState;

        state
          ..clearStage()
          ..round = nextRound;
        break;
      case UpdateState_Action.pause:
        _ensureRoundStage();

        state.round.paused = patch.pause.state;
        break;
      case UpdateState_Action.turnNext:
        _ensureNotPaused();
        _ensureTurnOverviewOrVoteCountStage();

        state.round
          ..turnIndex = patch.turnNext.turnIndex
          ..clearTurnState()
          ..prepare = TurnPrepare();
        break;
      case UpdateState_Action.turnStart:
        _ensureNotPaused();
        _ensureTurnPrepareStage();

        state
          ..round.clearTurnState()
          ..round.active = TurnActive();
        break;
      case UpdateState_Action.turnEnd:
        _ensureNotPaused();
        _ensureTurnActiveStage();

        state.round
          ..clearTurnState()
          ..vote = TurnVote(
            reason: patch.turnEnd.reason,
            guessed: patch.turnEnd.guessed,
            playerVote: _defaultPlayerVote(patch.turnEnd.guessed.characters),
          );
        break;
      case UpdateState_Action.votePlayer:
        _ensureNotPaused();
        _ensureTurnVoteStage();

        state.round.vote.playerVote[patch.votePlayer.playerId] = patch.votePlayer.result;
        break;
      case UpdateState_Action.voteCount:
        _ensureNotPaused();
        _ensureTurnVoteStage();

        final activePlayer = getActivePlayer();
        final approved = patch.voteCount.result.value
            .where((e) => e.outcome == CharacterVoteOutcome.APPROVED)
            .map((e) => e.characterId)
            .toList();

        state.round
          ..characterPool.characters.removeWhere(approved.contains)
          ..playerPoints.value.update(activePlayer, (value) {
            value.characters.addAll(approved);
            return value;
          })
          ..clearTurnState()
          ..voteCount = TurnVoteCount(result: patch.voteCount.result);
        break;
      case UpdateState_Action.gameFinished:
        _ensureNotPaused();
        _ensureTurnVoteCountStage();

        final innerState = state.round.state;
        state
          ..clearStage()
          ..finished = innerState;
        break;
      case UpdateState_Action.handshake:
      case UpdateState_Action.closed:
      case UpdateState_Action.notSet:
        throw InvalidUpdateError(message: "unsupported action");
    }

    state.rev = patch.rev;
    return false;
  }

  static RunningGameState _stateFromLobby(Lobby lobbyState, TeamList teams) {
    final characters = HashMap<Int64, Character>();
    for (final i in lobbyState.state.entries) {
      var index = 0;
      for (final char in i.value.value) {
        final charId = _makeCharacterId(i.key, index);
        characters[charId] = char;
        index += 1;
      }
    }

    return RunningGameState(
      teams: teams,
      characters: characters,
      roundPoints: RoundPoints.create(),
    );
  }

  static Int64 _makeCharacterId(int playerId, int characterIndex) =>
      Int64(playerId) + (Int64(characterIndex) << 32);

  static Tuple2<int, int> characterIdToPair(Int64 characterId) {
    final playerId = characterId & kInt32Max;
    final characterIndex = (characterId >> 32) & kInt32Max;
    return Tuple2(playerId.toInt(), characterIndex.toInt());
  }

  Map<int, VoteResult> _defaultPlayerVote(List<Int64> guessed) {
    final allApproved = VoteResult(
      value:
          guessed.map((e) => CharacterVote(characterId: e, outcome: CharacterVoteOutcome.APPROVED)),
    );
    final result = HashMap<int, VoteResult>();
    for (final playerId in state.players.keys) {
      result[playerId] = allApproved;
    }
    return result;
  }

  void _ensureGameStart() {
    for (final i in state.players.entries) {
      if (!i.value.connected || !state.lobby.state.containsKey(i.key)) {
        throw StartGameError();
      }
    }
  }

  void _ensureLobbyStage() {
    if (state.whichStage() != GameState_Stage.lobby) {
      throw InvalidUpdateError(message: "game is not in lobby stage");
    }
  }

  void _ensurePreparingStage() {
    if (state.whichStage() != GameState_Stage.preparing) {
      throw InvalidUpdateError(message: "game is not in preparing stage");
    }
  }

  void _ensureRoundStage() {
    if (state.whichStage() != GameState_Stage.round) {
      throw InvalidUpdateError(message: "game is not in round stage");
    }
  }

  void _ensureNotPaused() {
    if (state.whichStage() == GameState_Stage.round && state.round.paused) {
      throw InvalidUpdateError(message: "game is paused");
    }
  }

  void _ensureTurnPrepareStage() {
    if (state.whichStage() != GameState_Stage.round ||
        state.round.whichTurnState() != Round_TurnState.prepare) {
      throw InvalidUpdateError(message: "game is not in turn prepare stage");
    }
  }

  void _ensureTurnActiveStage() {
    if (state.whichStage() != GameState_Stage.round ||
        state.round.whichTurnState() != Round_TurnState.active) {
      throw InvalidUpdateError(message: "game is not in turn active stage");
    }
  }

  void _ensureTurnVoteStage() {
    if (state.whichStage() != GameState_Stage.round ||
        state.round.whichTurnState() != Round_TurnState.vote) {
      throw InvalidUpdateError(message: "game is not in turn vote stage");
    }
  }

  void _ensureTurnVoteCountStage() {
    if (state.whichStage() != GameState_Stage.round ||
        state.round.whichTurnState() != Round_TurnState.voteCount) {
      throw InvalidUpdateError(message: "game is not in turn vote count stage");
    }
  }

  void _ensureTurnOverviewOrVoteCountStage() {
    if (state.whichStage() != GameState_Stage.round ||
        (state.round.whichTurnState() != Round_TurnState.overview &&
            state.round.whichTurnState() != Round_TurnState.voteCount)) {
      throw InvalidUpdateError(message: "game is not in turn overview stage");
    }
  }

  int _generatePlayerId() {
    var result = rng.nextInt(kInt32Max);
    while (state.players.keys.contains(result)) {
      result = rng.nextInt(kInt32Max);
    }
    return result;
  }

  UpdateState _makeUpdate({required bool confirm}) =>
      UpdateState(rev: state.rev + 1, confirm: confirm);
}

class _CharacterVoteCount {
  int playersVoted = 0;
  bool activePlayerVoted = false;
}
