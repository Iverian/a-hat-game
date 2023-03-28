import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../provider.dart";
import "../util.dart";
import "../widgets/logo.dart";
import "../widgets/main_menu_item.dart";
import "create_game.dart";
import "game.dart";
import "characters.dart";
import "join_game.dart";
import "player_name.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameIsActive = ref.watch(gameIsActivePod);

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const Logo(),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...gameIsActive
                              ? _gameActiveMenu(context, ref)
                              : _gameInactiveMenu(context, ref),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    // TODO: добавить еще настроек, когда-нибудь...
                    MainMenuItem(
                      title: "ЗАДАТЬ ИМЯ",
                      onTap: () async => navPush(context, (_) => const PlayerNameScreen()),
                    ),
                    MainMenuItem(
                      title: "МОИ ПЕРСОНАЖИ",
                      onTap: () async => navPush(context, (_) => CharactersPage()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _gameInactiveMenu(BuildContext context, WidgetRef ref) {
    final nameIsEmpty = ref.watch(pNamePod.select((value) => value.isEmpty));

    return [
      MainMenuItem(
        title: "СОЗДАТЬ ИГРУ",
        onTap: () async => navPush(
          context,
          (_) {
            const next = CreateGameScreen();
            return nameIsEmpty ? PlayerNameScreen(next: (_) => next) : next;
          },
        ),
      ),
      const SizedBox(
        height: 7,
      ),
      MainMenuItem(
        title: "ПРИСОЕДИНИТЬСЯ К ИГРЕ",
        onTap: () async => navPush(
          context,
          (_) {
            const next = JoinGameScreen();
            return nameIsEmpty ? PlayerNameScreen(next: (_) => next) : next;
          },
        ),
      ),
    ];
  }

  List<Widget> _gameActiveMenu(BuildContext context, WidgetRef ref) => [
        MainMenuItem(
          title: "ВЕРНУТЬСЯ К ИГРЕ",
          onTap: () async {
            if (Navigator.of(context).widget.pages.length > 1) {
              navPop(context);
            } else {
              await navPush(context, (_) => const GameScreen());
            }
          },
        ),
        const SizedBox(
          height: 7,
        ),
        MainMenuItem(
          title: "ВЫЙТИ ИЗ ИГРЫ",
          onTap: () async {
            await ref.read(gamePod).exit();
          },
        ),
      ];
}
