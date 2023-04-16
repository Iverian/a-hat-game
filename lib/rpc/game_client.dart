import "package:grpc/grpc.dart";

import "../generated/proto/error.pb.dart";
import "../generated/proto/service.pbgrpc.dart";
import "../generated/proto/state.pb.dart";
import "game_server.dart";
import "player_metadata.dart";

enum GameClientRole {
  host,
  client,
}

abstract class BaseGameClient {
  GameClientRole get role;
  int get playerId;
  Stream<GameEvent> subscribe();
  Future<void> confirm({required int rev});
  Future<void> lobbyLeave();
  Future<void> lobbyPlayerReady(List<Character> characters);
  Future<void> lobbyPlayerNotReady();
}

class LocalGameClient implements BaseGameClient {
  final PlayerMetadata _player;
  final GameServerClient _client;

  LocalGameClient({required int playerId, required GameServerClient client})
      : _player = PlayerMetadata.fromId(playerId: playerId),
        _client = client;

  @override
  Future<void> confirm({required int rev}) => _client.confirm(player: _player, rev: rev);

  @override
  int get playerId => _player.playerId;

  @override
  GameClientRole get role => GameClientRole.host;

  @override
  Stream<GameEvent> subscribe() => _client.subscribe(player: _player);

  @override
  Future<void> lobbyLeave() async {
    // noop
  }

  @override
  Future<void> lobbyPlayerReady(List<Character> characters) =>
      _client.lobbyPlayerReady(player: _player, characters: characters);

  @override
  Future<void> lobbyPlayerNotReady() => _client.lobbyPlayerNotReady(player: _player);
}

class RemoteGameClient implements BaseGameClient {
  final int _playerId;
  final GameClient _client;

  RemoteGameClient({required int playerId, required ClientChannel channel})
      : _playerId = playerId,
        _client = GameClient(
          channel,
          options: CallOptions(metadata: PlayerMetadata.fromId(playerId: playerId).toGrpc()),
        );

  @override
  Future<void> confirm({required int rev}) => _client.confirm(ConfirmRequest(rev: rev));

  @override
  int get playerId => _playerId;

  @override
  GameClientRole get role => GameClientRole.client;

  @override
  Stream<GameEvent> subscribe() => _client.subscribe(Empty());

  @override
  Future<void> lobbyLeave() => _client.lobbyLeave(Empty());

  @override
  Future<void> lobbyPlayerReady(List<Character> characters) =>
      _client.lobbyPlayerReady(LobbyPlayerReadyRequest(characters: characters));

  @override
  Future<void> lobbyPlayerNotReady() => _client.lobbyPlayerNotReady(Empty());
}
