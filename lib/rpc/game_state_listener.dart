import "package:async/async.dart";
import "package:flutter/material.dart";

import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_server.dart";

import "dart:developer" as dev;

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
