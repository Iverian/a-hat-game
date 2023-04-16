// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $mainMenuRoute,
      $lobbyRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $mainMenuRoute => GoRouteData.$route(
      path: '/home',
      factory: $MainMenuRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'playerName',
          factory: $PlayerNameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'create',
          factory: $CreateGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'join',
          factory: $JoinGameRouteExtension._fromState,
        ),
      ],
    );

extension $MainMenuRouteExtension on MainMenuRoute {
  static MainMenuRoute _fromState(GoRouterState state) => const MainMenuRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $PlayerNameRouteExtension on PlayerNameRoute {
  static PlayerNameRoute _fromState(GoRouterState state) => const PlayerNameRoute();

  String get location => GoRouteData.$location(
        '/home/playerName',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $CreateGameRouteExtension on CreateGameRoute {
  static CreateGameRoute _fromState(GoRouterState state) => const CreateGameRoute();

  String get location => GoRouteData.$location(
        '/home/create',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $JoinGameRouteExtension on JoinGameRoute {
  static JoinGameRoute _fromState(GoRouterState state) => const JoinGameRoute();

  String get location => GoRouteData.$location(
        '/home/join',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $lobbyRoute => GoRouteData.$route(
      path: '/lobby',
      factory: $LobbyRouteExtension._fromState,
    );

extension $LobbyRouteExtension on LobbyRoute {
  static LobbyRoute _fromState(GoRouterState state) => const LobbyRoute();

  String get location => GoRouteData.$location(
        '/lobby',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}
