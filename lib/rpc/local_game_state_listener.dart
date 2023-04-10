import "dart:async";
import "dart:developer" as dev;

import "package:async/async.dart";
import "package:flutter/foundation.dart";

import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_event_ext.dart";
import "game_server.dart";
import "game_state_listener.dart";
import "game_state_manager.dart";

class LocalGameStateListener implements GameStateListener {
  final LocalGameClient _client;
  final GameStateManager _state;
  final PlayerMetadata _player;

  LocalGameStateListener({
    required int playerId,
    required LocalGameClient client,
  })  : _client = client,
        _state = GameStateManager(),
        _player = PlayerMetadata.fromId(playerId: playerId);

  @override
  GameState get state => _state.inner;

  @override
  int get playerId => _player.playerId;

  @override
  ListenerRole get role => ListenerRole.host;

  @override
  void createListener(VoidCallback callback) {
    unawaited(_listen(callback));
  }

  Future<void> _listen(VoidCallback callback) async {
    while (true) {
      try {
        await _handleEvents(callback);
        dev.log("finished listen loop");
        break;
      } on RpcError catch (e) {
        dev.log("unhandled rpc error: $e");
      }
    }
  }

  Future<void> _handleEvents(VoidCallback callback) async {
    final q = StreamQueue(_client.subscribe(player: _player));

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
          _player.rev = _state.rewind(event.rewind.state);
          callback();
          break;
        case GameEvent_Kind.patch:
          _player.rev = _state.apply(event.patch.patch);
          if (event.needsConfirm()) {
            await _client.confirm(player: _player);
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
}
