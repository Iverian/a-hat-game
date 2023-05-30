import "dart:math";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tuple/tuple.dart";

import "../const.dart";
import "../generated/proto/state.pb.dart";
import "../provider.dart";
import "../rpc/game_state_ext.dart";
import "../state/game_notifier.dart";
import "../widgets/edit_character.dart";
import "../widgets/menu_item.dart";
import "splash.dart";

const kCountdownDummy = -1;

final _characterListProvider =
    StateProvider.autoDispose<List<Character>>((ref) => []);
final _autoStartFlagProvider = StateProvider.autoDispose<bool>((ref) => false);
final _gameStartTriggeredFlagProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final _playersProvider = Provider(
  (ref) => ref.watch(
    gameProvider.select((value) => value.state.getLobbyPlayersView()),
  ),
);
final _autoStartConditionProvider = Provider.autoDispose(
  (ref) {
    final canGameAutoStart = ref.watch(
      gameProvider.select(
        (value) {
          final players = value.state.getLobbyPlayersView();
          final minimalPlayers = value.state.settings.minimalPlayers;
          final playersCount = players.length;
          final playersIsReady = players.fold(
              true, (previousValue, element) => previousValue && element.ready,);

          return playersCount.isEven &&
              playersCount >= minimalPlayers &&
              playersIsReady;
        },
      ),
    );
    final autoStartSet = ref.watch(_autoStartFlagProvider);

    return autoStartSet && canGameAutoStart;
  },
);

class LobbyScreen extends HookConsumerWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(gameStageProvider) != GameStage.lobby) {
      return const SplashScreen();
    }
    ref
      ..watch(_characterListProvider)
      ..watch(_autoStartFlagProvider)
      ..watch(_gameStartTriggeredFlagProvider);

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
  const _LobbyJoinTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Scaffold(
        body: Center(
          child: Text("1"),
        ),
      );
}

class _LobbyPlayersTab extends HookConsumerWidget {
  const _LobbyPlayersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPlayerId =
        ref.watch(gameProvider.select((value) => value.playerId));
    final players = ref.watch(_playersProvider)
      ..sort((a, b) => a.data.order.compareTo(b.data.order));
    final meIsHost = ref.watch(meIsHostProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
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
          ),
          if (meIsHost)
            const Align(
              alignment: Alignment.bottomCenter,
              child: _LobbyStartButton(),
            ),
        ],
      ),
    );
  }
}

class _LobbyStartButton extends StatefulHookConsumerWidget {
  const _LobbyStartButton();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LobbyStartButtonState();
}

class _LobbyStartButtonState extends ConsumerState<_LobbyStartButton> {
  _LobbyStartButtonState();

  @override
  Widget build(BuildContext context) {
    final canGameStart = ref.watch(
      _playersProvider.select(
        (value) =>
            value.length.isEven &&
            value.length >= kForcedMinimalPlayers &&
            value.fold(true,
                (previousValue, element) => previousValue && element.ready,),
      ),
    );
    final readyPlayers = ref.watch(
      gameProvider.select((value) {
        final players = value.state.getLobbyPlayersView();
        return Tuple2(
          players.fold(
              0,
              (previousValue, element) =>
                  previousValue += element.ready ? 1 : 0,),
          min(players.length, value.state.settings.minimalPlayers),
        );
      }),
    );
    final autoStartSet = ref.watch(_autoStartFlagProvider);
    final gameStartTriggered = ref.watch(_gameStartTriggeredFlagProvider);

    ref.listen(
      _autoStartConditionProvider,
      (_, next) async {
        if (next) {
          setState(() {
            ref.read(_gameStartTriggeredFlagProvider.notifier).state = true;
          });
          await ref.read(gameProvider).client.gamePrepareStart();
        }
      },
    );

    if (autoStartSet) {
      return MenuItem(
        title: "${readyPlayers.item1} / ${readyPlayers.item2}",
        enabled: !gameStartTriggered,
        onTap: () async {
          ref.read(_autoStartFlagProvider.notifier).state = false;
        },
        onLongPress: canGameStart
            ? () async {
                setState(() {
                  ref.read(_gameStartTriggeredFlagProvider.notifier).state =
                      true;
                });
                await ref.read(gameProvider).client.gamePrepareStart();
              }
            : null,
      );
    }

    if (canGameStart) {
      return MenuItem(
        title: "НАЧАТЬ ИГРУ",
        enabled: !gameStartTriggered,
        onTap: () async {
          setState(() {
            ref.read(_gameStartTriggeredFlagProvider.notifier).state = true;
          });
          await ref.read(gameProvider).client.gamePrepareStart();
        },
      );
    }

    return MenuItem(
      title: "НАЧАТЬ ПО ГОТОВНОСТИ",
      enabled: !gameStartTriggered,
      onTap: () async {
        ref.read(_autoStartFlagProvider.notifier).state = true;
      },
    );
  }
}

class _LobbyCharacterTab extends StatefulHookConsumerWidget {
  const _LobbyCharacterTab();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LobbyCharacterTabState();
}

class _LobbyCharacterTabState extends ConsumerState<_LobbyCharacterTab> {
  @override
  Widget build(BuildContext context) {
    final characterCount = ref.watch(
        gameProvider.select((value) => value.state.settings.characterCount),);
    final isMeReady = ref.watch(gameProvider.select(
        (value) => value.state.lobby.state.containsKey(value.playerId),),);
    final characters = ref.watch(_characterListProvider);

    final isDone = characterCount == characters.length;
    return Scaffold(
      body: ListView(
        children: characters
            .asMap()
            .entries
            .map(
              (e) => _CharacterCard(
                value: e.value,
                enabled: !isMeReady,
                onEdit: () async {
                  await EditCharacterWidget.modalRoute(
                    context: context,
                    initialValue: e.value,
                    onSubmit: (result) {
                      setState(() {
                        ref.read(_characterListProvider.notifier).state[e.key] =
                            result;
                      });
                    },
                  );
                },
                onDelete: () {
                  setState(() {
                    ref
                        .read(_characterListProvider.notifier)
                        .state
                        .removeAt(e.key);
                  });
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
          await EditCharacterWidget.modalRoute(
            context: context,
            onSubmit: (result) {
              setState(() {
                ref.read(_characterListProvider.notifier).state.add(result);
              });
            },
          );
        },
      ),
    );
  }
}

@immutable
class _CharacterCard extends StatelessWidget {
  final Character value;
  final void Function() onEdit;
  final void Function() onDelete;
  final bool enabled;

  const _CharacterCard({
    required this.value,
    required this.onEdit,
    required this.onDelete,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(value.title),
        subtitle:
            Text(value.description.isNotEmpty ? value.description : "(пусто)"),
        enabled: enabled,
        onTap: onEdit,
        onLongPress: onDelete,
      );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Character>("value", value))
      ..add(ObjectFlagProperty<void Function()>.has("onEdit", onEdit))
      ..add(ObjectFlagProperty<void Function()>.has("onDelete", onDelete))
      ..add(DiagnosticsProperty<bool>("enabled", enabled));
  }
}
