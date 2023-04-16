import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

import "provider.dart";
import "router/router_notifier.dart";
import "router/routes.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerNotifierProvider.notifier);

    final key = useRef(GlobalKey<NavigatorState>(debugLabel: "routerKey"));
    final router = useMemoized(
      () => GoRouter(
        navigatorKey: key.value,
        refreshListenable: notifier,
        debugLogDiagnostics: true,
        initialLocation: const MainMenuRoute().location,
        routes: notifier.routes,
        redirect: notifier.redirect,
      ),
      [notifier],
    );

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
