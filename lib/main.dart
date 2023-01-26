import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

import "provider.dart";
import "screens/home.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  static const route = "/";

  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: "Hat Game",
        theme: ThemeData.light(),
        routerConfig: App.router(),
      );

  static GoRouter router() => GoRouter(
        initialLocation: App.route,
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => const HomePage(),
          ),
          // Маршрут для присоединения по ссылке
          // TODO: добавить параметры присоединения: хост, порт, параметры аутентификации
          // GoRoute(
          //   path: JoinGamePage.route,
          //   builder: (context, state) => JoinGamePage(config: GameConfig()),
          // ),
        ],
      );
}
