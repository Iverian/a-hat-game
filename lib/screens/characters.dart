import "dart:math";
import 'dart:developer' as developer; //TODO: delete import

import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:isar/isar.dart";

import "../const.dart";
import "../provider.dart";
import "../util.dart";
import "game.dart";

class CharacterData {
  String name;
  String desccription;

  CharacterData(this.name, this.desccription) {
    name = name;
    desccription = desccription;
  }
}

class CharactersPage extends ConsumerStatefulWidget {
  const CharactersPage({super.key});

  @override
  ConsumerState<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends ConsumerState<CharactersPage> {
  final cardList = [
    CharacterData("page", "title"),
    CharacterData("Фалька 1", "Прозвище Цириллы из Ведьмака"),
    CharacterData("Фалька 2", "Прозвище Цириллы из Ведьмака"),
    CharacterData("Фалька 3", "Прозвище Цириллы из Ведьмака")
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontSize: 40,
      fontWeight: FontWeight.w900,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Stack(
            children: [
              ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Text(
                      "Копилка персонажей",
                      style: style,
                    );
                  }
                  return GestureDetector(
                    child: CharacterCard(character: cardList[index]),
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.primaryVelocity! < 0) {
                        setState(() {
                          cardList.remove(cardList[index]);
                        });
                      }
                    },
                  );
                },
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      cardList.add(CharacterData("Макс Ферстаппен", "Гонщик формулы 1"));
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final CharacterData character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // in case the main app theme changes
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: ListTile(
        title: Text(
          character.name,
          style: style.copyWith(fontWeight: FontWeight.w600, fontSize: 30),
        ),
        subtitle: Text(
          character.desccription,
          style: style.copyWith(fontWeight: FontWeight.w200, fontSize: 20),
        ),
      ),
    );
  }
}
