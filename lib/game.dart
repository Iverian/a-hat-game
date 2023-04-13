import "dart:async";
import "dart:developer" as dev;
import "dart:io";
import "dart:math";

import "package:flutter/foundation.dart";
import "package:nsd/nsd.dart" as nsd;

import "const.dart";
import "generated/proto/state.pb.dart";
import "rpc/game_state_listener.dart";
import "rpc/spawn_client.dart";
import 'rpc/spawn_host.dart';
import "service_data.dart";

// TODO: implement other stages
enum GameStage {
  inactive,
  loading,
  lobby,
  preparing,
  round,
  finished,
  notSet,
}

class GameStateNotifier extends ChangeNotifier {
  _InnerState? _state;
  GameStage? _stage = GameStage.inactive;

  GameStateNotifier();

  bool get isActive => _state != null;

  GameStage get stage {
    if (_stage == null) {
      switch (_state!.listener.state.whichStage()) {
        case GameState_Stage.lobby:
          return GameStage.lobby;
        case GameState_Stage.preparing:
          return GameStage.preparing;
        case GameState_Stage.round:
          return GameStage.round;
        case GameState_Stage.finished:
          return GameStage.finished;
        case GameState_Stage.notSet:
          return GameStage.loading;
      }
    }
    return _stage!;
  }

  GameState get state => _state!.listener.state;

  int get playerId => _state!.listener.playerId;

  void create({
    required String name,
    required String playerName,
    required Settings settings,
    required bool isPrivate,
  }) {
    assert(_state == null, "invalid game state transition");
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      final port = await _assignPort();
      final code = isPrivate ? _generateLobbyCode() : null;
      dev.log("lobby code: $code");
      final result = await spawnHost(
        playerName: playerName,
        port: port,
        settings: settings,
        code: code,
      );
      final reg = await (await serviceDataFromMeta(
        name: name,
        port: port,
        playerName: playerName,
        isPrivate: isPrivate,
      ))
          .register();
      final handle = _HostHandle(
        close: result.close,
        hostRegistration: reg,
        code: code,
      );

      _state = _InnerState(listener: result.listener, host: handle);
      _stage = null;
      result.listener.createListener(notifyListeners);
    }());
  }

  void join({
    required String playerName,
    required InternetAddress address,
    required int port,
    required String? code,
  }) {
    assert(_state == null, "invalid game state transition");
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      final listener = await spawnClient(
        playerName: playerName,
        address: address,
        port: port,
        code: code,
      );

      _state = _InnerState(listener: listener);
      _stage = null;
      listener.createListener(notifyListeners);
    }());
  }

  void exit() {
    if (_state == null) {
      return;
    }
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      await _state!.onExit();
      _state = null;
      _stage = GameStage.inactive;
      notifyListeners();
    }());
  }
}

class _HostHandle {
  final CloseHandle close;
  final nsd.Registration hostRegistration;
  final String? code;

  _HostHandle({
    required this.close,
    required this.hostRegistration,
    required this.code,
  });

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

  Future<void> onExit() async {
    await host?.onExit();
  }
}

String _generateLobbyCode() =>
    Random.secure().nextInt(pow(10, kLobbyCodeLength).toInt()).toString().padLeft(6, "0");

Future<int> _assignPort() async {
  RawServerSocket? socket;
  var port = kServerPortDefault;
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
