import "package:flutter/material.dart";

import "../generated/proto/state.pb.dart";

enum ListenerRole {
  host,
  client,
}

abstract class GameStateListener {
  GameState get state;
  int get playerId;
  ListenerRole get role;
  void createListener(VoidCallback callback);
}
