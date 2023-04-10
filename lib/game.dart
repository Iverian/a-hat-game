import "dart:async";
import "dart:convert";
import "dart:developer" as dev;
import "dart:io";
import "dart:isolate";

import "package:flutter/foundation.dart";
import "package:grpc/grpc.dart";
import "package:nanoid/async.dart";
import "package:nsd/nsd.dart" as nsd;

import "const.dart";
import "generated/proto/discovery.pb.dart";
import "generated/proto/state.pb.dart";
import "rpc/spawn.dart";
import "rpc/state_game_listeners.dart";

const kNameKey = "X-Name";

// TODO: implement other stages
enum GameStage {
  inactive,
  creating,
  lobby,
  preparing,
  round,
  finished,
  notSet,
}

class GameStateNotifier extends ChangeNotifier {
  _InnerState? _state;
  GameStage? _stage;

  GameStateNotifier() : _stage = GameStage.inactive;

  bool get isActive => _state != null;

  GameStage get stage {
    if (_stage == null) {
      switch (_state!.inner.whichStage()) {
        case GameState_Stage.lobby:
          return GameStage.lobby;
        case GameState_Stage.preparing:
          return GameStage.preparing;
        case GameState_Stage.round:
          return GameStage.round;
        case GameState_Stage.finished:
          return GameStage.finished;
        case GameState_Stage.notSet:
          return GameStage.creating;
      }
    }
    return _stage!;
  }

  GameState get state => _state!.inner;

  Future<void> create({
    required String name,
    required String playerName,
    required Settings settings,
  }) async {
    assert(_state == null, "invalid game state transition");
    _stage = GameStage.creating;

    unawaited(() async {
      final id = await nanoid();
      final port = await _assignPort();
      final result = await spawnHost(
        hostPlayerName: playerName,
        port: port,
        settings: settings,
      );
      final handle = _HostHandle(
        close: result.close,
        hostRegistration: await _registerService(
          id: id,
          name: name,
          port: port,
        ),
      );

      _state = _InnerState(listener: result.listener, host: handle);
      _stage = null;
      await result.listener.createListener(notifyListeners);
    }());
  }

  Future<void> exit() async {
    if (_state == null) {
      return;
    }

    await _state!.onExit();
    _state = null;
    notifyListeners();
  }

  Future<nsd.Registration> _registerService({
    required String id,
    required String name,
    required int port,
  }) async {
    final reg = await nsd.register(
      // TODO: extract service encoding and decoding
      nsd.Service(
        name: id,
        port: port,
        type: networkServiceType,
        txt: Map.fromEntries([
          MapEntry(
            kNameKey,
            Uint8List.fromList(utf8.encode(name)),
          )
        ]),
      ),
    );
    dev.log(
      "registered service (id=${reg.id}, name=$name, port=$port, type=$networkServiceType",
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
          dev.log("error binding TCP socket: $e");
          port = 0;
        }
      }
      return socket.port;
    } finally {
      await socket?.close();
    }
  }
}

class _HostHandle {
  final CloseHandle close;
  final nsd.Registration hostRegistration;

  _HostHandle({required this.close, required this.hostRegistration});

  Future<void> onExit() async {
    dev.log("unregistered service with id=${hostRegistration.id}");
    await nsd.unregister(hostRegistration);
    close.close();
  }
}

class _InnerState {
  final GameStateListener listener;
  final _HostHandle? host;

  _InnerState({required this.listener, this.host});

  GameState get inner => listener.state;

  Future<void> onExit() async {
    await host?.onExit();
  }
}
