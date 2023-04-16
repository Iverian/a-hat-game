import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../generated/proto/state.pb.dart";
import "../provider.dart";
import "../rpc/game_state_ext.dart";
import "../state/game_notifier.dart";
import "../widgets/edit_character.dart";
import "../widgets/menu_item.dart";
import "splash.dart";

final _characterListProvider = StateProvider.autoDispose<List<Character>>((ref) => []);

class LobbyScreen extends HookConsumerWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(gameStageProvider) != GameStage.lobby) {
      return const SplashScreen();
    }
    ref.watch(_characterListProvider);

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.menu)),
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.contacts)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            _LobbyJoinTab(),
            _LobbyPlayersTab(),
            _LobbyCharacterTab(),
          ],
        ),
      ),
    );
  }
}

class _LobbyJoinTab extends HookConsumerWidget {
  const _LobbyJoinTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200),
            MenuItem(
              title: "ВЫЙТИ ИЗ ИГРЫ",
              onTap: () => ref.read(gameProvider).lobbyLeave(),
            ),
          ],
        ),
      );
}

class _LobbyPlayersTab extends HookConsumerWidget {
  const _LobbyPlayersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPlayerId = ref.watch(gameProvider.select((value) => value.playerId));
    final players = ref.watch(
      gameProvider.select((value) => value.state.lobbyPlayers()),
    )..sort((a, b) => a.data.order.compareTo(b.data.order));

    return Center(
      child: ListView(
        children: players.map((e) {
          final readyFmt = e.ready ? "ready" : "not ready";
          final meFmt = e.playerId == myPlayerId ? "me" : "not me";
          return ListTile(
            title: Text("${e.data.name}#${e.data.slug}"),
            subtitle: Text("$readyFmt / $meFmt"),
          );
        }).toList(),
      ),
    );
  }
}

class _LobbyCharacterTab extends StatefulHookConsumerWidget {
  const _LobbyCharacterTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LobbyCharacterTab1State();
}

class _LobbyCharacterTab1State extends ConsumerState<_LobbyCharacterTab> {
  @override
  Widget build(BuildContext context) {
    final characterCount =
        ref.watch(gameProvider.select((value) => value.state.settings.characterCount));
    final isMeReady = ref
        .watch(gameProvider.select((value) => value.state.lobby.state.containsKey(value.playerId)));
    final characters = ref.watch(_characterListProvider);

    dev.log("render");

    final isDone = characterCount == characters.length;
    return Scaffold(
      body: ListView(
        children: characters
            .asMap()
            .entries
            .map(
              (e) => _CharacterCard(
                value: e.value,
                onEdit: isMeReady
                    ? null
                    : (value) async {
                        await Navigator.of(context).push(
                          _EditCharacterOverlay(
                            builder: (context) => EditCharacterWidget(
                              initialValue: value,
                              onSubmit: (result) {
                                setState(() {
                                  ref.read(_characterListProvider.notifier).state[e.key] = result;
                                });
                                context.pop();
                              },
                            ),
                          ),
                        );
                      },
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMeReady ? Icons.undo : (isDone ? Icons.done : Icons.add)),
        onPressed: () async {
          if (isMeReady) {
            await ref.read(gameProvider).client.lobbyPlayerNotReady();
            return;
          }
          if (isDone) {
            await ref.read(gameProvider).client.lobbyPlayerReady(characters);
            return;
          }

          await Navigator.of(context).push(
            _EditCharacterOverlay(
              builder: (context) => EditCharacterWidget(
                initialValue: null,
                onSubmit: (result) {
                  setState(() {
                    ref.read(_characterListProvider.notifier).state.add(result);
                  });
                  context.pop();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EditCharacterOverlay extends ModalRoute {
  final Widget Function(BuildContext) builder;

  _EditCharacterOverlay({required this.builder});

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => null;

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => false;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      builder(context);

  @override
  // TODO: implement maintainState
  bool get maintainState => false;
  @override
  // TODO: implement opaque
  bool get opaque => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration.zero;
}

class _CharacterCard extends StatelessWidget {
  final Character value;
  void Function(Character)? onEdit;

  _CharacterCard({required this.value, required this.onEdit, super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(value.title),
        subtitle: Text(value.description.isNotEmpty ? value.description : "(пусто)"),
        onTap: () => onEdit?.call(value),
      );
}
