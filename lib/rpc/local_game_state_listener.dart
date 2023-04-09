import "dart:isolate";

import "package:async/async.dart";

import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_server.dart";
import "game_state_manager.dart";
import "state_game_listeners.dart";
import "update_state_ext.dart";

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

  // TODO: add error handling
  @override
  Future<void> listen(SendPort tx) async {
    final q = StreamQueue(_client.subscribe(player: _player));
    if ((await q.next).handshake.hasErr()) {
      throw RpcError.fromProtocolErr((await q.next).handshake.err);
    }
    await for (final patch in q.rest) {
      if (patch.isFinal()) {
        _player.rev = patch.rev;
        break;
      }
      _player.rev = _state.applyUpdate(patch);
      if (patch.confirm) {
        await _client.confirm(player: _player);
      }
      tx.send(true);
    }
  }
}
