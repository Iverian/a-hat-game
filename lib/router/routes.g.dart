// GENERATED CODE - DO NOT MODIFY BY HAND

part of "routes.dart";

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $mainMenuRoute,
      $lobbyMenuRoute,
      $prepareGameRoute,
      $gameMenuRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: "/splash",
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        "/splash",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $mainMenuRoute => GoRouteData.$route(
      path: "/home",
      factory: $MainMenuRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: "playerName",
          factory: $PlayerNameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: "create",
          factory: $CreateGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: "join",
          factory: $JoinGameRouteExtension._fromState,
        ),
      ],
    );

extension $MainMenuRouteExtension on MainMenuRoute {
  static MainMenuRoute _fromState(GoRouterState state) => const MainMenuRoute();

  String get location => GoRouteData.$location(
        "/home",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $PlayerNameRouteExtension on PlayerNameRoute {
  static PlayerNameRoute _fromState(GoRouterState state) => const PlayerNameRoute();

  String get location => GoRouteData.$location(
        "/home/playerName",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $CreateGameRouteExtension on CreateGameRoute {
  static CreateGameRoute _fromState(GoRouterState state) => const CreateGameRoute();

  String get location => GoRouteData.$location(
        "/home/create",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $JoinGameRouteExtension on JoinGameRoute {
  static JoinGameRoute _fromState(GoRouterState state) => const JoinGameRoute();

  String get location => GoRouteData.$location(
        "/home/join",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $lobbyMenuRoute => GoRouteData.$route(
      path: "/lobby",
      factory: $LobbyMenuRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: "main",
          factory: $LobbyRouteExtension._fromState,
        ),
      ],
    );

extension $LobbyMenuRouteExtension on LobbyMenuRoute {
  static LobbyMenuRoute _fromState(GoRouterState state) => const LobbyMenuRoute();

  String get location => GoRouteData.$location(
        "/lobby",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $LobbyRouteExtension on LobbyRoute {
  static LobbyRoute _fromState(GoRouterState state) => const LobbyRoute();

  String get location => GoRouteData.$location(
        "/lobby/main",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $prepareGameRoute => GoRouteData.$route(
      path: "/prepare",
      factory: $PrepareGameRouteExtension._fromState,
    );

extension $PrepareGameRouteExtension on PrepareGameRoute {
  static PrepareGameRoute _fromState(GoRouterState state) => const PrepareGameRoute();

  String get location => GoRouteData.$location(
        "/prepare",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $gameMenuRoute => GoRouteData.$route(
      path: "/game",
      factory: $GameMenuRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: "start",
          factory: $GameStartRouteExtension._fromState,
        ),
      ],
    );

extension $GameMenuRouteExtension on GameMenuRoute {
  static GameMenuRoute _fromState(GoRouterState state) => const GameMenuRoute();

  String get location => GoRouteData.$location(
        "/game",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $GameStartRouteExtension on GameStartRoute {
  static GameStartRoute _fromState(GoRouterState state) => const GameStartRoute();

  String get location => GoRouteData.$location(
        "/game/start",
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}
