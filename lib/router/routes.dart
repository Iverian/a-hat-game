import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../screens/create_game.dart";
import "../screens/join_game.dart";
import "../screens/lobby.dart";
import "../screens/main_menu.dart";
import "../screens/player_name.dart";
import "../screens/splash.dart";

part "routes.g.dart";

@TypedGoRoute<SplashRoute>(
  path: SplashRoute.path,
)
class SplashRoute extends GoRouteData {
  static const path = "/splash";

  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashScreen();
}

@TypedGoRoute<MainMenuRoute>(
  path: MainMenuRoute.path,
  routes: [
    TypedGoRoute<PlayerNameRoute>(path: PlayerNameRoute.path),
    TypedGoRoute<CreateGameRoute>(path: CreateGameRoute.path),
    TypedGoRoute<JoinGameRoute>(path: JoinGameRoute.path),
    // TypedGoRoute<LobbyRoute>(path: LobbyRoute.path),
  ],
)
class MainMenuRoute extends GoRouteData {
  static const path = "/home";

  const MainMenuRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MainMenuScreen();
}

class PlayerNameRoute extends GoRouteData {
  static const path = "playerName";

  const PlayerNameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const PlayerNameScreen();
}

class CreateGameRoute extends GoRouteData {
  static const path = "create";

  const CreateGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateGameScreen();
}

class JoinGameRoute extends GoRouteData {
  static const path = "join";

  const JoinGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const JoinGameScreen();
}

@TypedGoRoute<LobbyRoute>(
  path: LobbyRoute.path,
)
class LobbyRoute extends GoRouteData {
  static const path = "/lobby";

  const LobbyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LobbyScreen();
}
