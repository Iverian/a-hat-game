import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../provider.dart";
import "../util.dart";

class PlayerNameScreen extends ConsumerStatefulWidget {
  final Widget Function(BuildContext)? _next;

  const PlayerNameScreen(this._next, {super.key});

  @override
  ConsumerState<PlayerNameScreen> createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends ConsumerState<PlayerNameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = ref.watch(pNamePod);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controller,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "ВАШЕ ИМЯ",
                ),
                validator: nameValidator,
              ),
              ElevatedButton(
                child: const Text("OK"),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  unawaited(ref.read(pNamePod.notifier).update(_controller.text));
                  if (widget._next != null) {
                    await navReplace(context, widget._next!);
                  } else {
                    navPop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
