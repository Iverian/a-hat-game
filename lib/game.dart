import "dart:developer" as dev;
import "dart:io";

import "package:flutter/foundation.dart";
import "package:nsd/nsd.dart";

import "const.dart";

enum GameStage {
  lobby,
}

enum DeviceRole {
  host,
  client,
}

class GameStateNotifier extends ChangeNotifier {
  _GameState? _state;

  GameStateNotifier();

  bool get isActive => _state != null;

  // TODO: implement all game stages
  // Defines what screen should be active
  GameStage? get stage {
    if (_state == null) {
      return null;
    }
    return GameStage.lobby;
  }

  String get name {
    _checkActive();
    return _state!.name;
  }

  int? get port {
    _checkActive();
    return _state!.port;
  }

  DeviceRole get role {
    _checkActive();
    return _state!.role;
  }

  Future<void> create({required String name, required String playerName}) async {
    assert(_state == null, "invalid game state transition");

    _state = _GameState(
      name: name,
      playerName: playerName,
      hostRegistration: await registerService(
        name,
        await GameStateNotifier._assignPort(),
      ),
    );
    notifyListeners();
  }

  Future<void> exit() async {
    _checkActive();
    await _state!._onDispose();
    _state = null;
    notifyListeners();
  }

  Future<Registration> registerService(String name, int port) async {
    final reg = await register(Service(name: name, port: port, type: networkServiceType));
    dev.log(
      "registered service (id=${reg.id}, name=$name, port=$port, type=$networkServiceType",
    );
    return reg;
  }

  void _checkActive() {
    assert(_state != null, "game is not active");
  }

  static Future<int> _assignPort() async {
    RawServerSocket? socket;
    try {
      while (socket == null) {
        try {
          socket = await RawServerSocket.bind(InternetAddress.anyIPv4, 0);
          break;
        } on IOException catch (e) {
          dev.log("error binding TCP socket: ${e.toString()}");
        }
      }
      return socket.port;
    } finally {
      await socket?.close();
    }
  }
}

class _GameState {
  final String _name;
  final String _playerName;
  final Registration? _hostRegistration;

  _GameState({
    required String name,
    required String playerName,
    Registration? hostRegistration,
  })  : _name = name,
        _playerName = playerName,
        _hostRegistration = hostRegistration;

  String get name => _name;
  String get playerName => _playerName;
  DeviceRole get role => _hostRegistration == null ? DeviceRole.client : DeviceRole.host;
  int? get port => _hostRegistration?.service.port;

  Future<void> _onDispose() async {
    if (_hostRegistration != null) {
      dev.log("unregistered service with id=${_hostRegistration!.id}");
      await unregister(_hostRegistration!);
    }
  }
}
