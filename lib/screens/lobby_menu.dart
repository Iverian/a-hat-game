import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../provider.dart";
import "../widgets/logo.dart";
import "../widgets/menu_item.dart";

class LobbyMenuScreen extends HookConsumerWidget {
  const LobbyMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 200, 30, 0),
          child: Column(
            children: <Widget>[
              const Logo(),
              const SizedBox(height: 50),
              MenuItem(
                title: "ВЫЙТИ ИЗ ИГРЫ",
                onTap: () {
                  ref.read(gameProvider).exit();
                },
              )
            ],
          ),
        ),
      );
}
