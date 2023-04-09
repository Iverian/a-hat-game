// import "dart:async";
// import "dart:isolate";

// import "package:async/async.dart";
// import "package:grpc/grpc.dart";

// import 'game_state_manager.dart';
// import "grpc_server.dart";
// import "local_client.dart";
// import "local_server.dart";

// class SpawnResult {
//   final LocalClient client;
//   final Isolate handle;

//   SpawnResult(this.client, this.handle);
// }

// class _SpawnRequest {
//   final SendPort tx;
//   final int port;
//   final String gameName;
//   final String playerName;

//   _SpawnRequest(this.tx, this.port, this.gameName, this.playerName);
// }

// class _SpawnResponse {
//   final SendPort tx;
//   final String playerId;

//   _SpawnResponse(this.tx, this.playerId);
// }

// Future<SpawnResult> spawnHost(String gameName, String playerName, int port) async {
//   final rx = ReceivePort();

//   final handle =
//       await Isolate.spawn(_serverIsolate, _SpawnRequest(rx.sendPort, port, gameName, playerName));

//   final events = StreamQueue(rx);
//   final _SpawnResponse resp = await events.next;
//   final client = LocalClient(playerId: resp.playerId, tx: resp.tx, rx: events);

//   return SpawnResult(client, handle);
// }

// Future<void> _serverIsolate(_SpawnRequest req) async {
//   final rx = ReceivePort();
//   final state = GameState(name: req.gameName);
//   final playerId = await state.join(req.playerName);
//   req.tx.send(_SpawnResponse(rx.sendPort, playerId!));

//   final localServer = LocalServer(state, req.tx, rx);
//   final grpcServer = Server(
//     [GameHostService()],
//     [],
//     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
//   );

//   final futureGroup = FutureGroup()
//     ..add(grpcServer.serve(port: req.port))
//     ..add(localServer.serve())
//     ..close();
//   await futureGroup.future;
// }
