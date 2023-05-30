import "dart:async";
import "dart:collection";
import "dart:developer" as dev;
import "dart:isolate";

import "package:fixnum/fixnum.dart";
import "package:mutex/mutex.dart";

import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_event_ext.dart";
import "game_state_ext.dart";
import "game_state_manager.dart";
import "player_metadata.dart";
import "util.dart";

// TODO: add lobby kick method
class GameServer {
  final GameStateManager _state;
  final ReceivePort _rx;
  final _Listeners _listeners;

  GameServer({required GameStateManager state})
      : _state = state,
        _rx = ReceivePort(),
        _listeners = _Listeners(
          Duration(
            seconds: state.inner.settings.confirmTimeoutS,
          ),
        );

  GameServerClient getClient() => GameServerClient(tx: _rx.sendPort);

  Future<void> serve() async {
    await for (final _Request req in _rx) {
      if (req.kind == _RequestKind.shutdown) {
        req.tx.send(await _shutdown().then((value) => null));
        return;
      }
      // TODO: is there a better solution?
      unawaited(_handle(req));
    }
  }

  Future<void> _handle(_Request req) async {
    dynamic response;
    try {
      switch (req.kind) {
        case _RequestKind.confirm:
          response =
              await _confirm(req.data as _ConfirmData).then((value) => null);
          break;
        case _RequestKind.subscribe:
          response = await _subscribe(req.data as _SubscribeData)
              .then((value) => null);
          break;
        case _RequestKind.lobbyJoin:
          response = await _lobbyJoin(req.data as String);
          break;
        case _RequestKind.lobbyLeave:
          response = await _lobbyLeave(req.data as PlayerMetadata)
              .then((value) => null);
          break;
        case _RequestKind.lobbyPlayerReady:
          response = await _lobbyPlayerReady(req.data as _LobbyPlayerReadyData)
              .then((value) => null);
          break;
        case _RequestKind.lobbyPlayerNotReady:
          response = await _lobbyPlayerNotReady(req.data as PlayerMetadata)
              .then((value) => null);
          break;
        case _RequestKind.gamePrepareStart:
          response = await _gamePrepareStart().then((value) => null);
          break;
        case _RequestKind.gameStart:
          response = await _gameStart().then((value) => null);
          break;
        case _RequestKind.startTurn:
          response = await _startTurn(req.data as PlayerMetadata)
              .then((value) => null);
          break;
        case _RequestKind.endTurn:
          response =
              await _endTurn(req.data as _EndTurnData).then((value) => null);
          break;
        case _RequestKind.castVote:
          response =
              await _castVote(req.data as _CastVoteData).then((value) => null);
          break;
        case _RequestKind.countVotes:
          response = await _countVotes().then((value) => null);
          break;
        case _RequestKind.nextTurn:
          response = await _nextTurn().then((value) => null);
          break;
        case _RequestKind.shutdown:
          throw UnimplementedError();
      }
    } on Exception catch (e) {
      req.tx.send(e);
      return;
    }
    req.tx.send(response);
  }

  Future<void> _confirm(_ConfirmData data) async {
    dev.log(
        "received confirmation request (clientRev = ${data.rev}, serverRev = ${_state.rev})");
    if (data.rev != _state.rev) {
      throw InvalidStateRevisionError();
    }
    await _listeners.setReady(data.player.playerId);
  }

  Future<void> _subscribe(_SubscribeData data) async {
    _state.ensurePlayerPresent(data.player.playerId);
    await _listeners.add(data.player.playerId, () {
      final rewind = GameEventExt.doRewind(_state.inner);
      dev.log("sending rewind to ${data.player.playerId}: $rewind");
      data.tx.send(rewind);
      return data.tx;
    });

    for (final patch in _state.tryUpdatePlayerConnected(data.player.playerId)) {
      await _notifyAllPatch(patch);
    }
  }

  Future<int> _lobbyJoin(String data) async {
    final result = _state.updateLobbyJoin(data);
    await _notifyAllPatch(result.item2);
    return result.item1;
  }

  Future<void> _lobbyLeave(PlayerMetadata data) async {
    await _notifyAllPatch(_state.updateLobbyLeave(data.playerId));
  }

  Future<void> _lobbyPlayerReady(_LobbyPlayerReadyData data) async {
    await _notifyAllPatch(
        _state.updateLobbyPlayerReady(data.player.playerId, data.characters));
  }

  Future<void> _lobbyPlayerNotReady(PlayerMetadata data) async {
    await _notifyAllPatch(_state.updateLobbyPlayerNotReady(data.playerId));
  }

  Future<void> _gamePrepareStart() async {
    await _notifyAllPatch(_state.updateLobbyPrepareStartGame());
  }

  Future<void> _gameStart() async {
    await _notifyAllPatch(_state.updateLobbyStartGame());
  }

  Future<void> _startTurn(PlayerMetadata data) async {
    if (_state.inner.getActivePlayer()! != data.playerId) {
      dev.log("received start turn command from inactive player");
      return;
    }
    await _notifyAllPatch(_state.updateStartTurn());
  }

  Future<void> _endTurn(_EndTurnData data) async {
    if (_state.inner.getActivePlayer()! != data.player.playerId) {
      dev.log("received end turn command from inactive player");
      return;
    }
    await _notifyAllPatch(_state.updateEndTurn(data.reason, data.guessed));
  }

  Future<void> _castVote(_CastVoteData data) async {
    await _notifyAllPatch(
        _state.updateCastVote(data.player.playerId, data.result));
  }

  Future<void> _countVotes() async {
    await _notifyAllPatch(_state.updateCountVotes());
  }

  Future<void> _nextTurn() async {
    await _notifyAllPatch(_state.updateNextTurn());
  }

  Future<void> _shutdown() async {
    await _listeners.notifyAll(GameEventExt.doShutdown());
  }

  Future<void> _notifyAllPatch(GameStatePatch patch) async {
    final disconnected = await _listeners.notifyAllPatch(patch);
    for (final playerId in disconnected) {
      await _listeners.notifyAllPatch(
        _state.updatePlayerDisconnected(playerId),
        forceNoConfirm: true,
      );
    }
  }
}

class GameServerClient {
  final SendPort tx;

  GameServerClient({required this.tx});

  Stream<GameEvent> subscribe({required PlayerMetadata player}) async* {
    final result = ReceivePort();
    try {
      await _request(
        kind: _RequestKind.subscribe,
        data: _SubscribeData(tx: result.sendPort, player: player),
      );
    } on RpcError catch (e) {
      yield GameEventExt.doHandshakeErr(e.code);
      return;
    }

    yield GameEventExt.doHandshakeOk();
    await for (final dynamic event in result) {
      if (event == null) {
        return;
      }
      yield event as GameEvent;
    }
  }

  Future<void> confirm(
      {required PlayerMetadata player, required int rev}) async {
    await _request(
      kind: _RequestKind.confirm,
      data: _ConfirmData(player: player, rev: rev),
    );
  }

  Future<int> lobbyJoin({required String playerName}) async => await _request(
        kind: _RequestKind.lobbyJoin,
        data: playerName,
      ) as int;

  Future<void> lobbyLeave({required PlayerMetadata player}) async {
    await _request(kind: _RequestKind.lobbyLeave, data: player);
  }

  Future<void> lobbyPlayerReady({
    required PlayerMetadata player,
    required List<Character> characters,
  }) async {
    await _request(
      kind: _RequestKind.lobbyPlayerReady,
      data: _LobbyPlayerReadyData(player: player, characters: characters),
    );
  }

  Future<void> lobbyPlayerNotReady({required PlayerMetadata player}) async {
    await _request(
      kind: _RequestKind.lobbyPlayerNotReady,
      data: player,
    );
  }

  Future<void> lobbyPrepareStartGame() async {
    await _request(kind: _RequestKind.gamePrepareStart);
  }

  Future<void> lobbyStartGame() async {
    await _request(kind: _RequestKind.gameStart);
  }

  Future<void> startTurn({required PlayerMetadata player}) async {
    await _request(kind: _RequestKind.startTurn, data: player);
  }

  Future<void> endTurn({
    required PlayerMetadata player,
    required TurnEndReason reason,
    required List<Int64> guessed,
  }) async {
    await _request(
      kind: _RequestKind.endTurn,
      data: _EndTurnData(player: player, reason: reason, guessed: guessed),
    );
  }

  Future<void> castVote({
    required PlayerMetadata player,
    required List<CharacterVote> result,
  }) async {
    await _request(
      kind: _RequestKind.castVote,
      data: _CastVoteData(player: player, result: result),
    );
  }

  Future<void> countVotes() async {
    await _request(kind: _RequestKind.countVotes);
  }

  Future<void> nextTurn() async {
    await _request(kind: _RequestKind.nextTurn);
  }

  Future<void> shutdown() async {
    await _request(kind: _RequestKind.shutdown);
  }

  Future<dynamic> _request({
    required _RequestKind kind,
    data,
  }) async {
    final rx = ReceivePort();
    tx.send(
      _Request(
        tx: rx.sendPort,
        kind: kind,
        data: data,
      ),
    );
    return handleResponse(await rx.first);
  }
}

enum _RequestKind {
  confirm,
  subscribe,
  lobbyJoin,
  lobbyLeave,
  lobbyPlayerNotReady,
  lobbyPlayerReady,
  gamePrepareStart,
  gameStart,
  startTurn,
  endTurn,
  castVote,
  countVotes,
  nextTurn,
  shutdown,
}

class _Request {
  final SendPort tx;
  final _RequestKind kind;
  final dynamic data;

  _Request({required this.tx, required this.kind, required this.data});
}

class _SubscribeData {
  final SendPort tx;
  final PlayerMetadata player;

  _SubscribeData({required this.tx, required this.player});
}

class _ConfirmData {
  final PlayerMetadata player;
  final int rev;

  _ConfirmData({required this.player, required this.rev});
}

class _LobbyPlayerReadyData {
  final PlayerMetadata player;
  final List<Character> characters;

  _LobbyPlayerReadyData({required this.player, required this.characters});
}

class _EndTurnData {
  final PlayerMetadata player;
  final TurnEndReason reason;
  final List<Int64> guessed;

  _EndTurnData(
      {required this.player, required this.reason, required this.guessed});
}

class _CastVoteData {
  final PlayerMetadata player;
  final List<CharacterVote> result;

  _CastVoteData({required this.player, required this.result});
}

class _Listeners {
  final ReadWriteMutex _lock;
  final Map<int, SendPort> _data;
  final _BarrierLock _barrier;
  final Duration _confirmTimeout;

  _Listeners(Duration confirmTimeout)
      : _lock = ReadWriteMutex(),
        _data = HashMap(),
        _barrier = _BarrierLock(),
        _confirmTimeout = confirmTimeout;

  Future<void> add(int listenerId, SendPort Function() getListener) =>
      _lock.protectWrite(() async {
        _removeRaw(listenerId);
        _data[listenerId] = getListener();
      });

  Future<void> remove(int listenerId) => _lock.protectWrite(() async {
        _removeRaw(listenerId);
      });

  Future<void> setReady(int listenerId) => _barrier.setReady(listenerId);

  Future<void> notifyRewind(int listenerId, GameState state) =>
      _lock.protectRead(() async {
        _data[listenerId]?.send(GameEventExt.doRewind(state));
      });

  Future<List<int>> notifyAllPatch(
    GameStatePatch patch, {
    bool forceNoConfirm = false,
  }) =>
      _lock.protectWrite(() async {
        final event = GameEventExt.doPatch(patch);
        _notifyAllRaw(event);
        if (forceNoConfirm || !patch.confirm) {
          return List.empty();
        }

        dev.log("waiting confirmation of patch ${patch.rev}");
        final rx = ReceivePort();
        await _barrier.activate(rx.sendPort, _data.keys);
        try {
          final _ = await rx.first.timeout(_confirmTimeout);
          final notReady = await _barrier.deactivate();
          notReady.forEach(_removeRaw);
          _notifyAllRaw(GameEventExt.doAck());
          return notReady;
        } finally {
          await _barrier.close();
        }
      });

  Future<void> notifyAll(GameEvent event) => _lock.protectRead(() async {
        _notifyAllRaw(event);
      });

  void _removeRaw(int listenerId) {
    final tx = _data.remove(listenerId);
    if (tx != null) {
      dev.log("removed listener for $listenerId");
      tx.send(null);
    }
  }

  void _notifyAllRaw(GameEvent event) {
    for (final i in _data.entries) {
      dev.log("sending event to ${i.key}: $event");
      i.value.send(event);
    }
  }
}

class _BarrierLock {
  final Mutex _lock;
  _Barrier? _data;

  _BarrierLock() : _lock = Mutex();

  Future<void> setReady(int id) async {
    await _lock.protect(() async {
      if (_data == null) {
        dev.log("barrier is not active");
        return;
      }
      dev.log("received confirmation from $id");
      _data!.setReady(id);
    });
  }

  Future<void> activate(SendPort tx, Iterable<int> ids) async {
    await _lock.protect(() async {
      assert(_data == null, "already active");
      _data = _Barrier(tx, ids);
    });
  }

  Future<List<int>> deactivate() => _lock.protect(() async {
        assert(_data != null, "not active");
        final result = _data!.notReady();
        _data = null;
        return result;
      });

  Future<void> close() async {
    await _lock.protect(() async {
      _data = null;
    });
  }
}

class _Barrier {
  final SendPort tx;
  final Map<int, bool> data;

  _Barrier(this.tx, Iterable<int> ids)
      : data = Map.fromEntries(ids.map((e) => MapEntry(e, false)));

  void setReady(int id) {
    if (!data.containsKey(id)) {
      return;
    }
    data[id] = true;
    if (data.values
        .fold(true, (previousValue, element) => previousValue && element)) {
      tx.send(true);
    }
  }

  List<int> notReady() =>
      data.entries.where((e) => !e.value).map((e) => e.key).toList();
}
