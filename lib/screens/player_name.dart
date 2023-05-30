import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../provider.dart";
import "../router/router_notifier.dart";
import "../util.dart";

class PlayerNameScreen extends ConsumerStatefulWidget {
  const PlayerNameScreen({super.key});

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
                  await ref.read(pNamePod.notifier).update(_controller.text);
                  // ignore: use_build_context_synchronously
                  if (!context.mounted) {
                    return;
                  }

                  final prevRoute = ref
                      .read(routerNotifierProvider.notifier)
                      .consumeRedirectedFrom();
                  dev.log("player name prev route: $prevRoute");
                  if (prevRoute != null) {
                    context.go(prevRoute);
                  } else {
                    context.pop();
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
