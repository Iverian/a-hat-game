import "dart:async";
import "dart:isolate";

import "package:async/async.dart";
import "package:grpc/grpc.dart" as grpc;
import "package:grpc/grpc_connection_interface.dart";

import "../generated/proto/state.pb.dart";
import "game_server.dart";
import "game_state_listener.dart";
import "game_state_manager.dart";
import "grpc_server.dart";
import "local_game_state_listener.dart";
import "util.dart";

class SpawnHostResult {
  final CloseHandle close;
  final GameStateListener listener;

  SpawnHostResult({required this.close, required this.listener});
}

class CloseHandle {
  final SendPort tx;

  CloseHandle({required this.tx});

  // TODO: wait for close completion and propagate errors
  void close() {
    tx.send(true);
  }
}

Future<SpawnHostResult> spawnHost({
  required String playerName,
  required int port,
  required Settings settings,
  required String? code,
}) async {
  final rx = ReceivePort();
  await Isolate.spawn(
    _doSpawnHost,
    _DoSpawnHostRequest(
      tx: rx.sendPort,
      port: port,
      hostPlayerName: playerName,
      settings: settings,
      code: code,
    ),
  );

  final _DoSpawnHostResponse response = await handleResponse(await rx.first);
  return SpawnHostResult(
    close: response.close,
    listener: LocalGameStateListener(
      playerId: response.hostPlayerId,
      client: response.client,
    ),
  );
}

class _DoSpawnHostRequest {
  final SendPort tx;
  final int port;
  final String hostPlayerName;
  final Settings settings;
  final String? code;

  _DoSpawnHostRequest({
    required this.tx,
    required this.port,
    required this.hostPlayerName,
    required this.settings,
    required this.code,
  });
}

class _DoSpawnHostResponse {
  final LocalGameClient client;
  final int hostPlayerId;
  final CloseHandle close;

  _DoSpawnHostResponse({required this.client, required this.hostPlayerId, required this.close});
}

// TODO: add graceful shutdown
Future<void> _doSpawnHost(_DoSpawnHostRequest request) async {
  final state = GameStateManager.fromHost(
    settings: request.settings,
    playerName: request.hostPlayerName,
  );
  final hostPlayerId = state.inner.hostId;
  final server = GameServer(state: state);
  final grpcServer = grpc.Server(
    [
      GrpcJoinService(client: server.getClient(), code: request.code),
      GrpcGameService(client: server.getClient()),
    ],
    [],
    CodecRegistry(codecs: const [grpc.GzipCodec(), grpc.IdentityCodec()]),
  );

  final rx = ReceivePort();
  request.tx.send(
    _DoSpawnHostResponse(
      client: server.getClient(),
      hostPlayerId: hostPlayerId,
      close: CloseHandle(tx: rx.sendPort),
    ),
  );

  final group = FutureGroup()
    ..add(server.serve())
    ..add(grpcServer.serve(port: request.port))
    ..close();
  final _ = await rx.first;
  await grpcServer.shutdown();
  await server.getClient().shutdown();
  await group.future;
}
