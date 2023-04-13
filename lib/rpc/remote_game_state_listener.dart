import "dart:async";
import "dart:developer" as dev;
import "dart:ui";

import "package:async/async.dart";
import "package:grpc/grpc.dart";

import "../generated/proto/error.pb.dart";
import "../generated/proto/service.pbgrpc.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_event_ext.dart";
import "game_server.dart";
import "game_state_listener.dart";
import "game_state_manager.dart";

class RemoteGameStateListener implements GameStateListener {
  final PlayerMetadata _player;
  final GameClient _client;
  final GameStateManager _state;

  RemoteGameStateListener({
    required int playerId,
    required GameClient client,
  })  : _player = PlayerMetadata.fromId(playerId: playerId),
        _client = client,
        _state = GameStateManager();

  @override
  int get playerId => _player.playerId;

  @override
  ListenerRole get role => ListenerRole.client;

  @override
  GameState get state => _state.inner;

  @override
  void createListener(VoidCallback callback) {
    unawaited(_listen(callback));
  }

  // TODO: deduplicate with local_listener
  Future<void> _listen(VoidCallback callback) async {
    while (true) {
      try {
        await _handleEvents(callback);
        dev.log("finished listen loop");
        break;
      } on RpcError catch (e) {
        dev.log("unhandled rpc error: $e");
        await Future.delayed(const Duration(seconds: 5));
      }
    }
  }

  Future<void> _handleEvents(VoidCallback callback) async {
    final resp = _client.subscribe(Empty(), options: _setCallOptions());
    final q = StreamQueue(resp);

    final handshakeMsg = await q.next;
    if (handshakeMsg.handshake.whichResult() == FallibleResponse_Result.err) {
      throw RpcError.fromProtocolErr(handshakeMsg.handshake.err);
    }

    for (;;) {
      final event = await q.next;
      switch (event.whichKind()) {
        case GameEvent_Kind.shutdown:
          return;
        case GameEvent_Kind.rewind:
          dev.log(
              "rewinding state of ${_player.playerId} to rev ${event.rewind.state.rev}: ${event.rewind.state}");
          _player.rev = _state.rewind(event.rewind.state);
          callback();
          break;
        case GameEvent_Kind.patch:
          dev.log(
              "updating state of ${_player.playerId} to rev ${event.patch.patch.rev}: ${event.patch.patch}");
          _player.rev = _state.apply(event.patch.patch);
          if (event.needsConfirm()) {
            await _client.confirm(Empty(), options: _setCallOptions());
            final ack = await q.next;
            if (!ack.isAck()) {
              throw RpcError();
            }
          }
          callback();
          break;
        case GameEvent_Kind.ack:
        case GameEvent_Kind.handshake:
        case GameEvent_Kind.notSet:
          throw UnimplementedError();
      }
    }
  }

  CallOptions _setCallOptions() => CallOptions(metadata: _player.toGrpc());
}
