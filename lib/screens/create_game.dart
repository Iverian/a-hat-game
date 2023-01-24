import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../const.dart";
import "../provider.dart";
import "../util.dart";
import "game.dart";

class CreateGameScreen extends ConsumerStatefulWidget {
  const CreateGameScreen({super.key});

  @override
  ConsumerState<CreateGameScreen> createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends ConsumerState<CreateGameScreen> {
  static final _rng = Random();

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _controller,
                  validator: nameValidator,
                  decoration: const InputDecoration(
                    labelText: "Имя игры",
                  ),
                ),
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    await ref.read(gamePod).createGame(_controller.text);
                    await navReplace(context, (_) => const GameScreen());
                  },
                )
              ],
            ),
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    _controller.text = roomNames[_rng.nextInt(roomNames.length)];
  }
}
