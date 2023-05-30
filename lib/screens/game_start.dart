import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../provider.dart";
import "../rpc/game_state_ext.dart";
import "../state/game_notifier.dart";
import "../widgets/menu_item.dart";
import "splash.dart";

class GameStartScreen extends HookConsumerWidget {
  const GameStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(gameStageProvider) != GameStage.lobby) {
      return const SplashScreen();
    }

    final meIsHost = ref.watch(meIsHostProvider);
    final teams =
        ref.watch(gameProvider.select((value) => value.state.getTeamsView()));
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              children: teams.map((e) => _TeamCard(value: e)).toList(),
            ),
          ),
          if (meIsHost)
            Align(
              alignment: Alignment.bottomCenter,
              child: MenuItem(
                title: "ОК",
                onTap: () async {
                  await ref.read(gameProvider).client.nextTurn();
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  final TeamView value;

  const _TeamCard({required this.value});

  @override
  Widget build(BuildContext context) => Card(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("${value.firstPlayer.name}#${value.firstPlayer.slug}"),
                  Text("${value.secondPlayer.name}#${value.secondPlayer.slug}"),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text("${value.points}"),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TeamView>("value", value));
  }
}
