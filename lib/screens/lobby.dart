import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          body: Stack(
            children: [
              const TabBarView(
                children: [
                  Text("1"),
                  Text("2"),
                  Text("3"),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 40,
                child: Container(
                  height: 40,
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: const TabPageSelector(),
                ),
              )
            ],
          ),
        ),
      );
}
