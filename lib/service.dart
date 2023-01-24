import "package:grpc/src/server/call.dart";

import 'proto/gamehost.pbgrpc.dart';

class GameHostService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async =>
      HelloReply(message: "Hello, ${request.name}!");
}
