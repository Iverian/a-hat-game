import "dart:io";

import "package:grpc/grpc.dart";

import "../generated/proto/service.pbgrpc.dart";
import "error.dart";
import "game_state_listener.dart";
import "remote_game_state_listener.dart";

class SpawnClientResult {}

Future<GameStateListener> spawnClient({
  required String playerName,
  required InternetAddress address,
  required int port,
  required String? code,
}) async {
  final channel = ClientChannel(
    address.address,
    port: port,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final resp = await JoinClient(channel).lobbyJoin(
    LobbyJoinRequest(
      playerName: playerName,
      code: code,
    ),
  );
  if (resp.hasErr()) {
    throw RpcError.fromProtocolErr(resp.err);
  }

  return RemoteGameStateListener(
    playerId: resp.ok,
    client: GameClient(channel),
  );
}
