import "dart:developer" as dev;
import "dart:io";

import "package:flutter/foundation.dart";
import "package:nsd/nsd.dart";

import "const.dart";

class GameStateNotifier extends ChangeNotifier {
  _InnerState? _state;

  GameStateNotifier();

  bool get isActive => _state != null;

  Future<void> create({required String name, required String playerName}) async {
    // assert(_state == null, "invalid game state transition");

    // final port = await GameStateNotifier._assignPort();
    // final result = await spawnHost(name, playerName, port);

    // _state = _InnerState(
    //   client: result.client,
    //   hostHandle: result.handle,
    //   hostRegistration: await registerService(name, port),
    // );
    // notifyListeners();
  }

  Future<void> exit() async {
    if (_state == null) {
      return;
    }

    await _state!.onExit();
    _state = null;
    notifyListeners();
  }

  Future<Registration> registerService(String name, int port) async {
    final reg = await register(Service(name: name, port: port, type: networkServiceType));
    dev.log(
      "registered service (id=${reg.id}, host=${reg.service.host} name=$name, port=$port, type=$networkServiceType",
    );
    return reg;
  }

  static Future<int> _assignPort() async {
    RawServerSocket? socket;
    var port = serverPortDefault;
    try {
      while (socket == null) {
        try {
          socket = await RawServerSocket.bind(InternetAddress.anyIPv4, port);
          break;
        } on IOException catch (e) {
          dev.log("error binding TCP socket: ${e.toString()}");
          port = 0;
        }
      }
      return socket.port;
    } finally {
      await socket?.close();
    }
  }
}

class _InnerState {
  // final Isolate? hostHandle;
  // final Registration? hostRegistration;

  // _InnerState({required this.client, this.hostHandle, this.hostRegistration});

  Future<void> onExit() async {
    // if (hostRegistration != null) {
    //   dev.log("unregistered service with id=${hostRegistration!.id}");
    //   await unregister(hostRegistration!);
    // }
    // hostHandle?.kill();
  }
}
