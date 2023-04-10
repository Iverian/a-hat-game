import "dart:isolate";

import "package:flutter/material.dart";

import "../generated/proto/state.pb.dart";
import "game_server.dart";
import "game_state_manager.dart";

enum ListenerRole {
  host,
  client,
}

abstract class GameStateListener {
  GameState get state;
  int get playerId;
  ListenerRole get role;
  Future<void> createListener(VoidCallback callback);
}
