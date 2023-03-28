import "dart:math";

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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontSize: 40,
      fontWeight: FontWeight.w900,
    );
    final Falka = CharacterData("Фалька", "Прозвище Цириллы из Ведьмака");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: ListView(
          children: [
            (Text(
              "Копилка персонажей",
              style: style,
            )),
            const SizedBox(
              height: 30,
            ),
            CharacterCard(
                character: CharacterData("Фалька",
                    "Прозвище Цириллы из Ведьмака. Saga o wiedźminie) — цикл книг польского писателя Анджея Сапковского в жанре фэнтези.")),
            const SizedBox(
              height: 10,
            ),
            CharacterCard(
                character: CharacterData("Гвидо ван Россум",
                    "Написал python. Python — это язык программирования, который широко используется в интернет-приложениях, разработке программного обеспечения, науке о данных и машинном обучении (ML).")),
            const SizedBox(
              height: 10,
            ),
            CharacterCard(
                character: CharacterData("Поросенок Петр",
                    "Тот самый из мема, уезжающий на красном тракторе. Очень далеко уезжающий на очень красном тракторе")),
            const SizedBox(
              height: 10,
            ),
            CharacterCard(character: CharacterData("Макс Ферстаппен", "Гонщик формулы 1")),
            const SizedBox(
              height: 10,
            ),
            CharacterCard(character: CharacterData("Александр Дрозд", "Киномеханик НИИЧАВО")),
          ],
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
      child: SizedBox(
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  character.name,
                  style: style.copyWith(fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  character.desccription,
                  style: style.copyWith(fontWeight: FontWeight.w200, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
