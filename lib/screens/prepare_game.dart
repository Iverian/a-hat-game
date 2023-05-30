import "dart:async";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../provider.dart";

class PrepareGameScreen extends StatefulHookConsumerWidget {
  const PrepareGameScreen({super.key});

  @override
  ConsumerState<PrepareGameScreen> createState() => _PrepareGameScreenState();
}

class _PrepareGameScreenState extends ConsumerState<PrepareGameScreen> {
  int countdown = -1;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    countdown = ref.read(
        gameProvider.select((value) => value.state.settings.startTimeoutS),);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (countdown == 0) {
          await ref.read(gameProvider).client.gameStart();
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            countdown -= 1;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            "$countdown",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty("countdown", countdown))
      ..add(DiagnosticsProperty<Timer?>("timer", timer));
  }
}
