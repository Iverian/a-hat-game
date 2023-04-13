import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../provider.dart";

class LobbyScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  @override
  Widget build(BuildContext context) {
    final players = ref.watch(gamePod.select((value) => value.state.players));
    final myPlayerId = ref.watch(gamePod.select((value) => value.playerId));

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.person_add)),
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.contacts)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Center(child: Text("1")),
            Center(
              child: ListView(
                children: players.entries
                    .map(
                      (e) => ListTile(
                        title: Text("${e.value.name}#${e.value.slug}"),
                        subtitle: myPlayerId == e.key ? const Text("(me)") : null,
                      ),
                    )
                    .toList(),
              ),
            ),
            const Center(child: Text("3")),
          ],
        ),
      ),
    );
  }
}
