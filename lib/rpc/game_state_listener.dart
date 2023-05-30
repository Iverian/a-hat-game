import "package:flutter/material.dart";

import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";

enum ListenerRole {
  host,
  client,
}

typedef SubscribeFunction = Stream<GameEvent> Function();

abstract class GameStateListener {
  GameState get state;
  int get playerId;
  ListenerRole get role;
  void createListener(VoidCallback callback);
}
