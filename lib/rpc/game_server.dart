import "dart:async";
import "dart:collection";
import "dart:developer" as dev;
import "dart:isolate";

import "package:fixnum/fixnum.dart";
import "package:mutex/mutex.dart";

import "../generated/proto/error.pb.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_state_ext.dart";
import "game_state_manager.dart";
import "util.dart";

const kConfirmTimeout = Duration(seconds: 5);
const kGrpcPlayerId = "X-Player-Id";
const kGrpcRev = "X-Revision";

class PlayerMetadata {
  final int playerId;
  int rev;

  PlayerMetadata({required this.playerId, required this.rev});

  factory PlayerMetadata.fromId({required int playerId}) =>
      PlayerMetadata(playerId: playerId, rev: 0);

  factory PlayerMetadata.fromGrpc(Map<String, String>? clientMetadata) {
    try {
      final src = clientMetadata!;
      return PlayerMetadata(
        playerId: int.tryParse(src[kGrpcPlayerId]!)!,
        rev: int.tryParse(src[kGrpcRev]!)!,
      );
    } on Exception catch (_) {
      throw MissingMetadataError();
    }
  }

  Map<String, String> toGrpc() {
    final result = HashMap<String, String>();
    result[kGrpcPlayerId] = playerId.toString();
    result[kGrpcRev] = rev.toString();
    return result;
  }
}

class GameServer {
  final GameStateManager _state;
  final ReceivePort _rx;
  final _Listeners _listeners;

  GameServer({required GameStateManager state})
      : _state = state,
        _rx = ReceivePort(),
        _listeners = _Listeners();

  LocalGameClient getClient() => LocalGameClient(tx: _rx.sendPort);

  Future<void> serve() async {
    var exit = false;
    await for (final _Request req in _rx) {
      dynamic response;
      try {
        switch (req.kind) {
          case _RequestKind.confirm:
            response = await _confirm(req.data as PlayerMetadata).then((value) => null);
            break;
          case _RequestKind.subscribe:
            response = await _subscribe(req.data as _SubscribeData).then((value) => null);
            break;
          case _RequestKind.lobbyJoin:
            response = await _lobbyJoin(req.data as String);
            break;
          case _RequestKind.lobbyLeave:
            response = await _lobbyLeave(req.data as PlayerMetadata).then((value) => null);
            break;
          case _RequestKind.lobbyPlayerReady:
            response =
                await _lobbyPlayerReady(req.data as _LobbyPlayerReadyData).then((value) => null);
            break;
          case _RequestKind.lobbyPlayerNotReady:
            response = await _lobbyPlayerNotReady(req.data as PlayerMetadata).then((value) => null);
            break;
          case _RequestKind.lobbyPrepareStartGame:
            response = await _lobbyPrepareStartGame().then((value) => null);
            break;
          case _RequestKind.lobbyStartGame:
            response = await _lobbyStartGame().then((value) => null);
            break;
          case _RequestKind.startTurn:
            response = await _startTurn(req.data as PlayerMetadata).then((value) => null);
            break;
          case _RequestKind.endTurn:
            response = await _endTurn(req.data as _EndTurnData).then((value) => null);
            break;
          case _RequestKind.castVote:
            response = await _castVote(req.data as _CastVoteData).then((value) => null);
            break;
          case _RequestKind.countVotes:
            response = await _countVotes().then((value) => null);
            break;
          case _RequestKind.nextTurn:
            response = await _nextTurn().then((value) => null);
            break;
          case _RequestKind.shutdown:
            response = await _shutdown().then((value) => null);
            exit = true;
            break;
        }
      } on Exception catch (e) {
        req.tx.send(e);
      }
      req.tx.send(response);
      if (exit) {
        break;
      }
    }
  }

  Future<void> _confirm(PlayerMetadata data) async {
    if (data.rev != _state.rev) {
      throw InvalidStateRevisionError();
    }
    await _listeners.barrier.setReady(data.playerId);
  }

  Future<void> _subscribe(_SubscribeData data) async {
    _state.ensurePlayerPresent(data.player.playerId);
    await _listeners.add(data.player.playerId, () {
      if (data.player.rev != _state.rev) {
        data.tx.send(_state.makeRewindPatch());
      }
      return data.tx;
    });
  }

  Future<int> _lobbyJoin(String data) async {
    final result = _state.updateLobbyJoin(data);
    await _listeners.notifyAll(result.item2);
    return result.item1;
  }

  Future<void> _lobbyLeave(PlayerMetadata data) async {
    await _listeners.notifyAll(_state.updateLobbyLeave(data.playerId));
  }

  Future<void> _lobbyPlayerReady(_LobbyPlayerReadyData data) async {
    await _listeners
        .notifyAll(_state.updateLobbyPlayerReady(data.player.playerId, data.characters));
  }

  Future<void> _lobbyPlayerNotReady(PlayerMetadata data) async {
    await _listeners.notifyAll(_state.updateLobbyPlayerNotReady(data.playerId));
  }

  Future<void> _lobbyPrepareStartGame() async {
    await _listeners.notifyAll(_state.updateLobbyPrepareStartGame());
  }

  Future<void> _lobbyStartGame() async {
    await _listeners.notifyAll(_state.updateLobbyStartGame());
  }

  Future<void> _startTurn(PlayerMetadata data) async {
    if (_state.inner.getActivePlayer()! != data.playerId) {
      dev.log("received start turn command from inactive player");
      return;
    }
    await _listeners.notifyAll(_state.updateStartTurn());
  }

  Future<void> _endTurn(_EndTurnData data) async {
    if (_state.inner.getActivePlayer()! != data.player.playerId) {
      dev.log("received end turn command from inactive player");
      return;
    }
    await _listeners.notifyAll(_state.updateEndTurn(data.reason, data.guessed));
  }

  Future<void> _castVote(_CastVoteData data) async {
    await _listeners.notifyAll(_state.updateCastVote(data.player.playerId, data.result));
  }

  Future<void> _countVotes() async {
    await _listeners.notifyAll(_state.updateCountVotes());
  }

  Future<void> _nextTurn() async {
    await _listeners.notifyAll(_state.updateNextTurn());
  }

  Future<void> _shutdown() async {
    await _listeners.notifyAll(_state.makeShutdownPatch());
  }
}

class LocalGameClient {
  final SendPort tx;

  LocalGameClient({required this.tx});

  Stream<UpdateState> subscribe({required PlayerMetadata player}) async* {
    final result = ReceivePort();
    try {
      await _request(
        kind: _RequestKind.subscribe,
        data: _SubscribeData(tx: result.sendPort, player: player),
      );
    } on RpcError catch (e) {
      yield UpdateState(
        rev: 0,
        confirm: false,
        handshake: DoHandshake(err: e.toProtocolError()),
      );
      return;
    }
    yield UpdateState(
      rev: 0,
      confirm: false,
      handshake: DoHandshake(ok: Empty()),
    );
    await for (final dynamic event in result) {
      if (event == null) {
        return;
      }
      yield event as UpdateState;
    }
  }

  Future<void> confirm({required PlayerMetadata player}) async {
    await _request(
      kind: _RequestKind.confirm,
      data: player,
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
    await _request(kind: _RequestKind.lobbyPrepareStartGame);
  }

  Future<void> lobbyStartGame() async {
    await _request(kind: _RequestKind.lobbyStartGame);
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
  lobbyPrepareStartGame,
  lobbyStartGame,
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

class _LobbyPlayerReadyData {
  final PlayerMetadata player;
  final List<Character> characters;

  _LobbyPlayerReadyData({required this.player, required this.characters});
}

class _EndTurnData {
  final PlayerMetadata player;
  final TurnEndReason reason;
  final List<Int64> guessed;

  _EndTurnData({required this.player, required this.reason, required this.guessed});
}

class _CastVoteData {
  final PlayerMetadata player;
  final List<CharacterVote> result;

  _CastVoteData({required this.player, required this.result});
}

class _Listeners {
  final ReadWriteMutex _lock;
  final Map<int, SendPort> _data;
  final _ConfirmBarrier barrier;

  _Listeners()
      : _lock = ReadWriteMutex(),
        _data = HashMap(),
        barrier = _ConfirmBarrier();

  Future<void> add(int listenerId, SendPort Function() getListener) async {
    await _lock.protectWrite(() async {
      _data[listenerId] = getListener();
    });
  }

  Future<void> remove(int listenerId) async {
    await _lock.protectWrite(() async {
      final tx = _data.remove(listenerId);
      tx?.send(null);
    });
  }

  Future<void> notifyAll(UpdateState message) async {
    await _lock.protectRead(() async {
      for (final i in _data.entries) {
        dev.log("updating player ${i.key} state to ${message.rev}: $message");
        i.value.send(message);
      }
      if (message.confirm) {
        final result = await barrier.waitFor(_data.keys);
        if (!result) {
          // TODO: add better timeout handling
          throw Exception("timed out");
        }
      }
    });
  }
}

class _ConfirmBarrier {
  final Mutex _lock;
  _ConfirmBarrierData? _data;

  _ConfirmBarrier() : _lock = Mutex();

  Future<void> setReady(int listenerId) async {
    await _lock.protect(() async {
      if (_data == null) {
        dev.log("no confirm barrier active");
        return;
      }
      _data!.setReady(listenerId);
    });
  }

  Future<bool> waitFor(Iterable<int> listeners) async {
    final rx = ReceivePort();
    await _lock.protect(() async {
      _data = _ConfirmBarrierData(rx.sendPort, listeners);
    });
    final bool result = await rx.timeout(
      kConfirmTimeout,
      onTimeout: (sink) {
        dev.log("timed out waiting for confirmation");
        sink
          ..add(false)
          ..close();
      },
    ).first;
    await _lock.protect(() async {
      _data = null;
    });
    return result;
  }
}

class _ConfirmBarrierData {
  final SendPort tx;
  final Map<int, bool> data;

  _ConfirmBarrierData(this.tx, Iterable<int> listeners)
      : data = HashMap.fromEntries(listeners.map((e) => MapEntry(e, false)));

  void setReady(int id) {
    data.update(id, (value) => true);
    if (data.values.reduce((value, element) => value && element)) {
      tx.send(true);
    }
  }
}
