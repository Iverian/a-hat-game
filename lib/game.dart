// ignore: prefer_double_quotes
import 'package:flutter/foundation.dart';

enum GameStage {
  lobby,
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

  Future<void> createGame(String name) async {
    assert(_state == null, "invalid game state transition");
    _state = _GameState(name);
    notifyListeners();
  }

  Future<void> exitGame() async {
    _checkActive();
    _state = null;
    notifyListeners();
  }

  void _checkActive() {
    assert(_state != null, "game is not active");
  }
}

class _GameState {
  String name;

  _GameState(this.name);
}
