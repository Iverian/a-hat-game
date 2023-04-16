import "dart:collection";
import "dart:developer" as dev;
import "dart:math";

import "package:fixnum/fixnum.dart";
import "package:nanoid/nanoid.dart" as nanoid;
import "package:tuple/tuple.dart";

import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_state_ext.dart";

const int kInt32Max = 0x7fffffff;
const int kFirstRev = 1;
const String kPlayerSlugAlphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

class GameStateManager {
  GameState inner = GameState(rev: 0);
  int counter = 0;

  GameStateManager();

  factory GameStateManager.fromClient({required GameState state}) =>
      GameStateManager()..inner = state;

  factory GameStateManager.fromHost({
    required Settings settings,
    required String playerName,
  }) {
    final result = GameStateManager();
    final hostId = result._generatePlayerIds(playerName);
    result.inner
      ..rev = kFirstRev
      ..players[hostId.id] = Player(
        status: PlayerStatus.JOINING,
        name: playerName,
        slug: hostId.slug,
      )
      ..hostId = hostId.id
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

  Tuple2<int, GameStatePatch> updateLobbyJoin(String playerName) {
    final playerId = _generatePlayerIds(playerName);
    final playerOrder = counter;
    final patch = _applyServer(
      _makePatch(confirm: false)
        ..clearKind()
        ..playerJoined = DoPlayerJoined(
          playerId: playerId.id,
          // TODO: handle connection status
          player: Player(
            status: PlayerStatus.JOINING,
            name: playerName,
            slug: playerId.slug,
            order: playerOrder,
          ),
        ),
    );
    counter += 1;
    return Tuple2(playerId.id, patch);
  }

  GameStatePatch updateLobbyLeave(int playerId) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..playerLeft = DoPlayerLeft(playerId: playerId),
      );

  GameStatePatch updateLobbyPlayerReady(int playerId, List<Character> characters) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..playerReady = DoPlayerReady(playerId: playerId, characters: characters),
      );

  GameStatePatch updateLobbyPlayerNotReady(int playerId) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..playerNotReady = DoPlayerNotReady(playerId: playerId),
      );

  GameStatePatch updateLobbyPrepareStartGame() {
    _ensureGameStart();

    final rng = Random.secure();
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

    return _applyServer(
      _makePatch(confirm: true)
        ..clearKind()
        ..prepareStart = DoPrepareStart(teams: TeamList(value: teams)),
    );
  }

  GameStatePatch updateLobbyStartGame() => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..roundNext = DoNextRound(roundIndex: 0),
      );

  List<GameStatePatch> tryUpdatePlayerConnected(int playerId) {
    ensurePlayerPresent(playerId);
    if (inner.players[playerId]!.status == PlayerStatus.CONNECTED) {
      return [];
    }
    return [updatePlayerConnected(playerId)];
  }

  GameStatePatch updatePlayerConnected(int playerId) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..playerConnected = DoPlayerConnected(playerId: playerId),
      );

  GameStatePatch updatePlayerDisconnected(int playerId) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..playerDisconnected = DoPlayerDisconnected(playerId: playerId),
      );

  GameStatePatch updateStartTurn() => _applyServer(
        _makePatch(confirm: true)
          ..clearKind()
          ..turnStart = DoStartTurn(),
      );

  GameStatePatch updateEndTurn(TurnEndReason reason, List<Int64> guessed) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..turnEnd = DoEndTurn(
            reason: reason,
            guessed: CharacterIdList(characters: guessed),
          ),
      );

  GameStatePatch updateCastVote(int playerId, List<CharacterVote> result) => _applyServer(
        _makePatch(confirm: false)
          ..clearKind()
          ..votePlayer = DoPlayerVoted(
            playerId: playerId,
            result: VoteResult(value: result),
          ),
      );

  GameStatePatch updateCountVotes() {
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

    return _applyServer(
      _makePatch(confirm: false)
        ..clearKind()
        ..voteCount = DoVoteCount(result: result),
    );
  }

  GameStatePatch updateNextTurn() {
    late GameStatePatch patch;
    if (inner.round.characterPool.characters.isEmpty) {
      patch = _makePatch(confirm: true)
        ..clearKind()
        ..roundNext = DoNextRound(roundIndex: inner.round.roundIndex + 1);
    } else {
      patch = _makePatch(confirm: false)
        ..clearKind()
        ..turnNext = DoNextTurn(turnIndex: inner.round.turnIndex + 1);
    }
    return _applyServer(patch);
  }

  int rewind(GameState state) {
    inner = state;
    return inner.rev;
  }

  int apply(GameStatePatch patch) {
    if (patch.rev <= inner.rev) {
      dev.log("old revision received (current = ${inner.rev}, received = ${patch.rev})");
      return inner.rev;
    }
    if (patch.rev != inner.rev + 1) {
      dev.log("skipped some states, requesting rewind");
      throw StateNotSyncedError();
    }

    _applyImpl(patch);
    return inner.rev;
  }

  GameStatePatch _applyServer(GameStatePatch patch) {
    dev.log("updating server state to rev ${patch.rev}: $patch");
    return _applyImpl(patch);
  }

  GameStatePatch _applyImpl(GameStatePatch patch) {
    switch (patch.whichKind()) {
      case GameStatePatch_Kind.playerConnected:
        ensurePlayerPresent(patch.playerConnected.playerId);
        inner.players[patch.playerConnected.playerId]!.status = PlayerStatus.CONNECTED;
        break;
      case GameStatePatch_Kind.playerDisconnected:
        ensurePlayerPresent(patch.playerDisconnected.playerId);
        inner.players[patch.playerDisconnected.playerId]!.status = PlayerStatus.DISCONNECTED;
        break;
      case GameStatePatch_Kind.playerJoined:
        _ensureLobbyStage();
        inner.players[patch.playerJoined.playerId] = patch.playerJoined.player;
        break;
      case GameStatePatch_Kind.playerLeft:
        _ensureLobbyStage();
        ensurePlayerPresent(patch.playerLeft.playerId);
        if (patch.playerLeft.playerId == inner.hostId) {
          throw InvalidUpdateError(message: "Host cannot leave");
        }

        inner
          ..players.remove(patch.playerLeft.playerId)
          ..lobby.state.remove(patch.playerLeft.playerId);
        break;
      case GameStatePatch_Kind.playerReady:
        _ensureLobbyStage();
        if (patch.playerReady.characters.length != inner.settings.characterCount) {
          throw CharactersInvalidError();
        }

        inner.lobby.state[patch.playerReady.playerId] =
            PlayerLobbyState(value: patch.playerReady.characters);
        break;
      case GameStatePatch_Kind.playerNotReady:
        _ensureLobbyStage();
        ensurePlayerPresent(patch.playerNotReady.playerId);

        inner.lobby.state.remove(patch.playerNotReady.playerId);
        break;
      case GameStatePatch_Kind.prepareStart:
        _ensureLobbyStage();

        final lobbyState = inner.lobby;
        inner
          ..clearStage()
          ..preparing = _stateFromLobby(
            lobbyState,
            patch.prepareStart.teams,
          );
        break;
      case GameStatePatch_Kind.roundNext:
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
      case GameStatePatch_Kind.pause:
        _ensureRoundStage();

        inner.round.paused = patch.pause.state;
        break;
      case GameStatePatch_Kind.turnNext:
        _ensureNotPaused();
        _ensureTurnOverviewOrVoteCountStage();

        inner.round
          ..turnIndex = patch.turnNext.turnIndex
          ..clearTurnState()
          ..prepare = TurnPrepare();
        break;
      case GameStatePatch_Kind.turnStart:
        _ensureNotPaused();
        _ensureTurnPrepareStage();

        inner
          ..round.clearTurnState()
          ..round.active = TurnActive();
        break;
      case GameStatePatch_Kind.turnEnd:
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
      case GameStatePatch_Kind.votePlayer:
        _ensureNotPaused();
        _ensureTurnVoteStage();

        inner.round.vote.playerVote[patch.votePlayer.playerId] = patch.votePlayer.result;
        break;
      case GameStatePatch_Kind.voteCount:
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
      case GameStatePatch_Kind.gameFinished:
        _ensureNotPaused();
        _ensureTurnVoteCountStage();

        final innerState = inner.round.state;
        inner
          ..clearStage()
          ..finished = innerState;
        break;
      case GameStatePatch_Kind.notSet:
        throw UnimplementedError();
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

  // TODO: replace random slugs with last two bytes of player ip
  // it can be extracted from grpc header :authority
  _PlayerId _generatePlayerIds(String playerName) {
    final rng = Random.secure();

    var id = rng.nextInt(kInt32Max);
    while (inner.players.keys.contains(id)) {
      id = rng.nextInt(kInt32Max);
    }

    final sameNameSlugs =
        inner.players.values.where((e) => e.name == playerName).map((e) => e.slug).toList();
    var slug = _playerSlug();
    while (sameNameSlugs.contains(slug)) {
      slug = _playerSlug();
    }

    return _PlayerId(id: id, slug: slug);
  }

  GameStatePatch _makePatch({required bool confirm}) => GameStatePatch(
        rev: inner.rev + 1,
        confirm: confirm,
      );
}

class _PlayerId {
  final int id;
  final String slug;

  _PlayerId({required this.id, required this.slug});
}

class _CharacterVoteCount {
  int playersVoted = 0;
  bool activePlayerVoted = false;
}

String _playerSlug() => nanoid.customAlphabet(kPlayerSlugAlphabet, 4);
