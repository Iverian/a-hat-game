import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";

import "../game.dart";
import "../provider.dart";
import "lobby.dart";

// Родитель всех игровых экранов, определяет корректный экран динамически из игрового состояния
class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stage = ref.watch(gamePod.select((value) => value.stage));

    dev.log("stage = $stage");
    switch (stage) {
      case GameStage.lobby:
        return const LobbyScreen();
      // TODO: better solution?
      case GameStage.creating:
        return Scaffold(
          body: Center(
            child: LoadingAnimationWidget.bouncingBall(
              color: Theme.of(context).primaryColor,
              size: 100,
            ),
          ),
        );
      // TODO: implement other stages
      default:
        throw UnimplementedError();
    }
  }
}
