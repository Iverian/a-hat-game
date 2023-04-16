import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../router/routes.dart";
import "../widgets/logo.dart";
import "../widgets/menu_item.dart";

class MainMenuScreen extends HookConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 200, 30, 0),
          child: Column(
            children: <Widget>[
              const Logo(),
              const SizedBox(height: 50),
              MenuItem(
                title: "СОЗДАТЬ ИГРУ",
                onTap: () => context.go(const CreateGameRoute().location),
              ),
              MenuItem(
                title: "ПРИСОЕДИНИТЬСЯ К ИГРЕ",
                onTap: () => context.go(const JoinGameRoute().location),
              ),
              const SizedBox(height: 50),
              MenuItem(
                title: "ЗАДАТЬ ИМЯ",
                onTap: () => context.go(const PlayerNameRoute().location),
              ),
            ],
          ),
        ),
      );
}
