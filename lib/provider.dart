import "dart:developer" as developer;
import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";
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

final serverPortPod = FutureProvider.autoDispose((_) async {
  RawServerSocket? socket;
  try {
    while (socket == null) {
      try {
        socket = await RawServerSocket.bind(InternetAddress.anyIPv4, 0);
        break;
      } on IOException catch (e) {
        developer.log("error binding TCP socket: ${e.toString()}");
      }
    }
    return socket.port;
  } finally {
    await socket?.close();
  }
});
