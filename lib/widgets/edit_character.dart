import "dart:async";
import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../generated/proto/state.pb.dart";
import "../util.dart";
import 'full_screen_modal.dart';

class EditCharacterWidget extends HookConsumerWidget {
  final Character? initialValue;
  final void Function(Character) onSubmit;

  const EditCharacterWidget({required this.initialValue, required this.onSubmit, super.key});

  static Future<void> modalRoute({
    required BuildContext context,
    required void Function(Character) onSubmit,
    Character? initialValue,
  }) async {
    await Navigator.of(context).push(
      FullScreenModal(
        builder: (context) => EditCharacterWidget(
          initialValue: initialValue,
          onSubmit: (result) {
            onSubmit(result);
            context.pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final titleController = useTextEditingController.fromValue(
      initialValue != null ? TextEditingValue(text: initialValue!.title) : TextEditingValue.empty,
    );
    final descController = useTextEditingController.fromValue(
      initialValue != null
          ? TextEditingValue(text: initialValue!.description)
          : TextEditingValue.empty,
    );

    return Form(
      key: formKey,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                validator: nameValidator,
              ),
              TextFormField(
                controller: descController,
                validator: (value) {
                  if (value == null) {
                    return null;
                  }
                  if (value.length > 160) {
                    return "Описание не может быть длиннее 160 символов";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.done),
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }

            final result = Character(
              title: titleController.text,
              description: descController.text,
            );
            dev.log("character: $result");
            onSubmit(result);
          },
        ),
      ),
    );
  }
}
