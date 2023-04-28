import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:shared_preferences_riverpod/shared_preferences_riverpod.dart";

import "rpc/game_client.dart";
import "state/game_notifier.dart";

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

final gameProvider = ChangeNotifierProvider((ref) => GameNotifier());

final gameStageProvider = Provider<GameStage>(
  (ref) => ref.watch(gameProvider.select((value) => value.stage)),
);

final meIsHostProvider = Provider<bool>(
  (ref) => ref.watch(gameProvider.select((value) => value.client.role == GameClientRole.host)),
);
