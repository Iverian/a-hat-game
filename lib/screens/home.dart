import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../provider.dart";
import "../util.dart";
import "create_game.dart";
import "game.dart";
import "player_name.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameIsActive = ref.watch(gameIsActivePod);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            ...gameIsActive ? _gameActiveMenu(context, ref) : _gameInactiveMenu(context, ref),
            // TODO: добавить еще настроек, когда-нибудь...
            _buildMenuItem(
              context,
              title: "ЗАДАТЬ ИМЯ",
              onTap: () async => navPush(context, (_) => const PlayerNameScreen(null)),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _gameInactiveMenu(BuildContext context, WidgetRef ref) {
    final nameIsEmpty = ref.watch(pNamePod.select((value) => value.isEmpty));

    return [
      _buildMenuItem(
        context,
        title: "СОЗДАТЬ ИГРУ",
        onTap: () async => navPush(context, (_) {
          const widget = CreateGameScreen();
          return nameIsEmpty ? PlayerNameScreen((_) => widget) : widget;
        }),
      ),
    ];
  }

  List<Widget> _gameActiveMenu(BuildContext context, WidgetRef ref) => [
        _buildMenuItem(
          context,
          title: "ВЕРНУТЬСЯ К ИГРЕ",
          onTap: () async {
            if (Navigator.of(context).widget.pages.length > 1) {
              navPop(context);
            } else {
              await navPush(context, (_) => const GameScreen());
            }
          },
        ),
        _buildMenuItem(
          context,
          title: "ВЫЙТИ ИЗ ИГРЫ",
          onTap: () async {
            await ref.read(gamePod).exitGame();
          },
        ),
      ];

  static Widget _buildLogo() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          "ШЛЯПА!!!",
          style: TextStyle(fontSize: 30),
        ),
      );

  static Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required void Function() onTap,
  }) =>
      Card(
        child: ListTile(
          title: Text(title),
          onTap: onTap,
        ),
      );
}
