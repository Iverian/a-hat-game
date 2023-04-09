import "dart:collection";
import "dart:developer" as dev;
import "dart:math";

import "package:fixnum/fixnum.dart";
import "package:tuple/tuple.dart";

import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_state_ext.dart";

const int kInt32Max = 0x7fffffff;
const int kFirstRev = 1;

class GameStateManager {
  final Random rng;
  GameState inner;

  GameStateManager()
      : inner = GameState(rev: 0),
        rng = Random.secure();

  factory GameStateManager.fromClient({required GameState state}) =>
      GameStateManager()..inner = state;

  factory GameStateManager.fromHost({
    required Settings settings,
    required String playerName,
  }) {
    final result = GameStateManager();
    final hostId = result._generatePlayerId();
    result.inner
      ..rev = kFirstRev
      // TODO: handle connection status
      ..players[hostId] = Player(status: PlayerStatus.CONNECTED, name: playerName)
      ..hostId = hostId
      ..settings = settings
      ..clearStage()
      ..lobby = Lobby.create();

    return result;
  }

  int get rev => inner.rev;

  void ensurePlayerPresent(int playerId) {
    if (!inner.players.containsKey(playerId)) {
      throw PlayerNotFoundError();
    }
  }

  UpdateState makeRewindPatch() => UpdateState(rev: inner.rev, confirm: false)
    ..clearAction()
    ..rewind = DoRewind(state: inner);

  UpdateState makeShutdownPatch() => _makeUpdate(confirm: false)
    ..clearAction()
    ..closed = DoGameClosed();

  Tuple2<int, UpdateState> updateLobbyJoin(String playerName) {
    final playerId = _generatePlayerId();
    return Tuple2(
      playerId,
      _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..playerJoined = DoPlayerJoined(
            playerId: playerId,
            // TODO: handle connection status
            player: Player(status: PlayerStatus.CONNECTED, name: playerName),
          ),
      ),
    );
  }

  UpdateState updateLobbyLeave(int playerId) => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..playerLeft = DoPlayerLeft(playerId: playerId),
      );

  UpdateState updateLobbyPlayerReady(int playerId, List<Character> characters) =>
      _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..playerReady = DoPlayerReady(playerId: playerId, characters: characters),
      );

  UpdateState updateLobbyPlayerNotReady(int playerId) => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..playerNotReady = DoPlayerNotReady(playerId: playerId),
      );

  UpdateState updateLobbyPrepareStartGame() {
    _ensureGameStart();

    final players = inner.players.keys.toList()..shuffle(rng);
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

    return _applyUpdateUnchecked(
      _makeUpdate(confirm: true)
        ..clearAction()
        ..prepareStart = DoPrepareStart(teams: TeamList(value: teams)),
    );
  }

  UpdateState updateLobbyStartGame() => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..roundNext = DoNextRound(roundIndex: 0),
      );

  UpdateState updatePlayerConnected(int playerId) => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..playerConnected = DoPlayerConnected(playerId: playerId),
      );

  UpdateState updatePlayerDisconnected(int playerId) => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..playerDisconnected = DoPlayerDisconnected(playerId: playerId),
      );

  UpdateState updateStartTurn() => _applyUpdateUnchecked(
        _makeUpdate(confirm: true)
          ..clearAction()
          ..turnStart = DoStartTurn(),
      );

  UpdateState updateEndTurn(TurnEndReason reason, List<Int64> guessed) => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..turnEnd = DoEndTurn(
            reason: reason,
            guessed: CharacterIdList(characters: guessed),
          ),
      );

  UpdateState updateCastVote(int playerId, List<CharacterVote> result) => _applyUpdateUnchecked(
        _makeUpdate(confirm: false)
          ..clearAction()
          ..votePlayer = DoPlayerVoted(
            playerId: playerId,
            result: VoteResult(value: result),
          ),
      );

  UpdateState updateCountVotes() {
    _ensureTurnVoteStage();

    final activePlayer = inner.getActivePlayer()!;
    final teamsTotal = inner.round.state.teams.value.length;

    final voteCounter = Map.fromEntries(
      inner.round.vote.guessed.characters.map((e) => MapEntry(e, _CharacterVoteCount())),
    );
    for (final i in inner.round.vote.playerVote.entries) {
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

    return _applyUpdateUnchecked(
      _makeUpdate(confirm: false)
        ..clearAction()
        ..voteCount = DoVoteCount(result: result),
    );
  }

  UpdateState updateNextTurn() {
    late UpdateState patch;
    if (inner.round.characterPool.characters.isEmpty) {
      patch = _makeUpdate(confirm: true)
        ..clearAction()
        ..roundNext = DoNextRound(roundIndex: inner.round.roundIndex + 1);
    } else {
      patch = _makeUpdate(confirm: false)
        ..clearAction()
        ..turnNext = DoNextTurn(turnIndex: inner.round.turnIndex + 1);
    }
    return _applyUpdateUnchecked(patch);
  }

  int applyUpdate(UpdateState patch) {
    if (patch.rev <= inner.rev) {
      dev.log("old revision received (current = ${inner.rev}, received = ${patch.rev})");
      return inner.rev;
    }
    if (patch.whichAction() != UpdateState_Action.rewind && patch.rev != inner.rev + 1) {
      dev.log("skipped some states, requesting rewind");
      throw StateNotSyncedError();
    }

    _applyUpdateUnchecked(patch);
    return inner.rev;
  }

  UpdateState _applyUpdateUnchecked(UpdateState patch) {
    dev.log("applying update to rev = ${inner.rev}: $patch");
    switch (patch.whichAction()) {
      case UpdateState_Action.rewind:
        inner = patch.rewind.state;
        break;
      case UpdateState_Action.playerDisconnected:
        ensurePlayerPresent(patch.playerDisconnected.playerId);
        inner.players[patch.playerDisconnected.playerId]!.status = PlayerStatus.CONNECTED;
        break;
      case UpdateState_Action.playerConnected:
        ensurePlayerPresent(patch.playerConnected.playerId);
        inner.players[patch.playerConnected.playerId]!.status = PlayerStatus.DISCONNECTED;
        break;
      case UpdateState_Action.playerJoined:
        _ensureLobbyStage();
        for (final i in inner.players.entries) {
          if (i.value.name == patch.playerJoined.player.name) {
            throw PlayerNameTakenError();
          }
        }

        inner.players[patch.playerJoined.playerId] = patch.playerJoined.player;
        break;
      case UpdateState_Action.playerLeft:
        _ensureLobbyStage();
        ensurePlayerPresent(patch.playerLeft.playerId);

        inner
          ..players.remove(patch.playerLeft.playerId)
          ..lobby.state.remove(patch.playerLeft.playerId);
        break;
      case UpdateState_Action.playerReady:
        _ensureLobbyStage();
        if (patch.playerReady.characters.length != inner.settings.characterCount) {
          throw CharactersInvalidError();
        }

        inner.lobby.state[patch.playerReady.playerId] =
            PlayerLobbyState(value: patch.playerReady.characters);
        break;
      case UpdateState_Action.playerNotReady:
        _ensureLobbyStage();
        ensurePlayerPresent(patch.playerNotReady.playerId);

        inner.lobby.state.remove(patch.playerNotReady.playerId);
        break;
      case UpdateState_Action.prepareStart:
        _ensureLobbyStage();

        final lobbyState = inner.lobby;
        inner
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
          innerState = inner.preparing;
        } else {
          _ensureTurnVoteCountStage();
          innerState = inner.round.state;
          innerState.roundPoints.value.add(inner.round.playerPoints);
        }

        nextRound
          ..characterPool = CharacterIdList(
            characters: innerState.characters.keys.toList(),
          )
          ..state = innerState;

        inner
          ..clearStage()
          ..round = nextRound;
        break;
      case UpdateState_Action.pause:
        _ensureRoundStage();

        inner.round.paused = patch.pause.state;
        break;
      case UpdateState_Action.turnNext:
        _ensureNotPaused();
        _ensureTurnOverviewOrVoteCountStage();

        inner.round
          ..turnIndex = patch.turnNext.turnIndex
          ..clearTurnState()
          ..prepare = TurnPrepare();
        break;
      case UpdateState_Action.turnStart:
        _ensureNotPaused();
        _ensureTurnPrepareStage();

        inner
          ..round.clearTurnState()
          ..round.active = TurnActive();
        break;
      case UpdateState_Action.turnEnd:
        _ensureNotPaused();
        _ensureTurnActiveStage();

        inner.round
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

        inner.round.vote.playerVote[patch.votePlayer.playerId] = patch.votePlayer.result;
        break;
      case UpdateState_Action.voteCount:
        _ensureNotPaused();
        _ensureTurnVoteStage();

        final activePlayer = inner.getActivePlayer()!;
        final approved = patch.voteCount.result.value
            .where((e) => e.outcome == CharacterVoteOutcome.APPROVED)
            .map((e) => e.characterId)
            .toList();

        inner.round
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

        final innerState = inner.round.state;
        inner
          ..clearStage()
          ..finished = innerState;
        break;
      case UpdateState_Action.handshake:
      case UpdateState_Action.closed:
      case UpdateState_Action.notSet:
        dev.log("unsupported action: $patch");
        break;
    }

    inner.rev = patch.rev;
    return patch;
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
    for (final playerId in inner.players.keys) {
      result[playerId] = allApproved;
    }
    return result;
  }

  void _ensureGameStart() {
    for (final i in inner.players.entries) {
      if (i.value.status != PlayerStatus.CONNECTED || !inner.lobby.state.containsKey(i.key)) {
        throw StartGameError();
      }
    }
  }

  void _ensureLobbyStage() {
    if (inner.whichStage() != GameState_Stage.lobby) {
      throw InvalidUpdateError(message: "game is not in lobby stage");
    }
  }

  void _ensurePreparingStage() {
    if (inner.whichStage() != GameState_Stage.preparing) {
      throw InvalidUpdateError(message: "game is not in preparing stage");
    }
  }

  void _ensureRoundStage() {
    if (inner.whichStage() != GameState_Stage.round) {
      throw InvalidUpdateError(message: "game is not in round stage");
    }
  }

  void _ensureNotPaused() {
    if (inner.whichStage() == GameState_Stage.round && inner.round.paused) {
      throw InvalidUpdateError(message: "game is paused");
    }
  }

  void _ensureTurnPrepareStage() {
    if (inner.whichStage() != GameState_Stage.round ||
        inner.round.whichTurnState() != Round_TurnState.prepare) {
      throw InvalidUpdateError(message: "game is not in turn prepare stage");
    }
  }

  void _ensureTurnActiveStage() {
    if (inner.whichStage() != GameState_Stage.round ||
        inner.round.whichTurnState() != Round_TurnState.active) {
      throw InvalidUpdateError(message: "game is not in turn active stage");
    }
  }

  void _ensureTurnVoteStage() {
    if (inner.whichStage() != GameState_Stage.round ||
        inner.round.whichTurnState() != Round_TurnState.vote) {
      throw InvalidUpdateError(message: "game is not in turn vote stage");
    }
  }

  void _ensureTurnVoteCountStage() {
    if (inner.whichStage() != GameState_Stage.round ||
        inner.round.whichTurnState() != Round_TurnState.voteCount) {
      throw InvalidUpdateError(message: "game is not in turn vote count stage");
    }
  }

  void _ensureTurnOverviewOrVoteCountStage() {
    if (inner.whichStage() != GameState_Stage.round ||
        (inner.round.whichTurnState() != Round_TurnState.overview &&
            inner.round.whichTurnState() != Round_TurnState.voteCount)) {
      throw InvalidUpdateError(message: "game is not in turn overview stage");
    }
  }

  int _generatePlayerId() {
    var result = rng.nextInt(kInt32Max);
    while (inner.players.keys.contains(result)) {
      result = rng.nextInt(kInt32Max);
    }
    return result;
  }

  UpdateState _makeUpdate({required bool confirm}) =>
      UpdateState(rev: inner.rev + 1, confirm: confirm);
}

class _CharacterVoteCount {
  int playersVoted = 0;
  bool activePlayerVoted = false;
}
