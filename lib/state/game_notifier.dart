import "dart:async";
import "dart:developer" as dev;
import "dart:io";

import "package:flutter/material.dart";
import "package:nsd/nsd.dart" as nsd;

import "../generated/proto/state.pb.dart";
import "../rpc/game_client.dart";
import "../rpc/spawn.dart";
import "../service_data.dart";
import "../util.dart";
import "game_client_state_notifier.dart";

// TODO: add stages for all screens
enum GameStage {
  inactive,
  loading,
  lobby,
  preparing,
  round,
  finished,
}

class GameNotifier extends ChangeNotifier {
  GameStage? _stage = GameStage.inactive;
  _Data? _data;

  GameNotifier();

  GameStage get stage {
    if (_stage != null) {
      return _stage!;
    }

    switch (_data!.notifier.state.whichStage()) {
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

  BaseGameClient get client => _data!.notifier.client;

  int get playerId => _data!.notifier.playerId;

  GameState get state => _data!.notifier.state;

  @override
  void dispose() {
    super.dispose();
    exit();
  }

  void create({
    required String name,
    required String playerName,
    required Settings settings,
    required bool isPrivate,
  }) {
    _ensureInactive();
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      final port = await assignPort();
      final code = isPrivate ? generateLobbyCode() : null;
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

      _data = _Data(notifier: result.notifier, host: handle);
      _stage = null;
      result.notifier.addListener(notifyListeners);
    }());
  }

  void join({
    required String playerName,
    required InternetAddress address,
    required int port,
    required String? code,
  }) {
    _ensureInactive();
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      final notifier = await spawnClient(
        playerName: playerName,
        address: address,
        port: port,
        code: code,
      );

      _data = _Data(notifier: notifier);
      _stage = null;
      notifier.addListener(notifyListeners, onExit: exit);
    }());
  }

  void lobbyLeave() {
    _ensureActive();
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      await _data!.notifier.removeListener();
      await _data!.notifier.client.lobbyLeave();
      await _data!.onExit();

      _stage = GameStage.inactive;
      notifyListeners();
      _data = null;
    }());
  }

  void exit() {
    if (_data == null) {
      return;
    }
    _stage = GameStage.loading;
    notifyListeners();

    unawaited(() async {
      await _data!.onExit();
      _stage = GameStage.inactive;
      notifyListeners();
      _data = null;
    }());
  }

  void _ensureActive() {
    assert(_data != null, "invalid game state transition");
  }

  void _ensureInactive() {
    assert(_data == null, "invalid game state transition");
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

class _Data {
  final GameClientStateNotifier notifier;
  final _HostHandle? host;

  _Data({required this.notifier, this.host});

  Future<void> onExit() async {
    await host?.onExit();
  }
}
