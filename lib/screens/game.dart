import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../game.dart";
import "../provider.dart";
import "home.dart";
import "lobby.dart";

// Родитель всех игровых экранов, определяет корректный экран динамически из игрового состояния
class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameStage = ref.watch(gamePod.select((value) => value.stage));
    assert(gameStage != null, "invalid game stage");

    switch (gameStage!) {
      case GameStage.lobby:
        return const LobbyScreen();
    }
  }
}
