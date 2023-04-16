import "dart:math";

import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../const.dart";
import "../provider.dart";
import "../rpc/settings_ext.dart";
import "../util.dart";

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

                    ref.read(gameProvider).create(
                          name: _controller.text,
                          playerName: ref.read(pNamePod),
                          // TODO: replace with settings
                          settings: SettingsExt.fromGameSettings(
                            characterCount: 2,
                            turnDurationS: 60,
                          ),
                          // TODO: make configurable
                          isPrivate: false,
                        );
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
    _controller.text = kRoomNames[_rng.nextInt(kRoomNames.length)];
  }
}
