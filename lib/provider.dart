import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "package:riverpod/riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:shared_preferences_riverpod/shared_preferences_riverpod.dart";

import "game.dart";

late SharedPreferences pref;

final databasePod = FutureProvider(
  (ref) async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([], directory: dir.path);
  },
);

final pNamePod = createPrefProvider<String>(
  prefs: (_) => pref,
  prefKey: "player.name",
  defaultValue: "",
);

final gamePod = ChangeNotifierProvider((ref) => GameStateNotifier());

final gameIsActivePod =
    StateProvider((ref) => ref.watch(gamePod.select((value) => value.isActive)));
