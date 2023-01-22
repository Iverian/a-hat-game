import "package:grpc/src/server/call.dart";

import "src/generated/gamehost.pbgrpc.dart";

class GameHostService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async =>
      HelloReply(message: "Hello, ${request.name}!");
}
