import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:go_router/go_router.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../provider.dart";
import "../screens/lobby.dart";
import "../state/game_notifier.dart";
import "routes.dart";

part "router_notifier.freezed.dart";
part "router_notifier.g.dart";

@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? _routerListener;
  String? _redirectedFrom;
  RouterState _inner = const RouterState(
    isPlayerNameSet: false,
    gameStage: GameStage.inactive,
  );

  static List<String> kPlayerNameRedirectFrom = [
    const CreateGameRoute().location,
    const JoinGameRoute().location,
  ];

  static List<String> kInactiveGameRoutes = [
    const MainMenuRoute().location,
    const CreateGameRoute().location,
    const JoinGameRoute().location,
    const PlayerNameRoute().location,
  ];

  static List<String> kLobbyRoutes = [
    const LobbyRoute().location,
  ];

  @override
  Future<void> build() async {
    _inner = RouterState(
      isPlayerNameSet: ref.watch(
        pNamePod.select((value) => value.isNotEmpty),
      ),
      gameStage: ref.watch(
        gameProvider.select((value) => value.stage),
      ),
    );
    ref.listenSelf((_, __) {
      if (state.isLoading) {
        return;
      }
      _routerListener?.call();
    });
  }

  List<RouteBase> get routes => $appRoutes;

  String? consumeRedirectedFrom() {
    final result = _redirectedFrom;
    _redirectedFrom = null;
    return result;
  }

  String? redirect(BuildContext context, GoRouterState state) {
    dev.log("redirect for (state: $_inner, location: ${state.location})");
    if (!_inner.isPlayerNameSet && kPlayerNameRedirectFrom.contains(state.location)) {
      return _redirectImpl(const PlayerNameRoute().location, state.location);
    }

    switch (_inner.gameStage) {
      case GameStage.inactive:
        if (!kInactiveGameRoutes.contains(state.location)) {
          return _redirectImpl(const MainMenuRoute().location, state.location);
        }
        break;
      case GameStage.loading:
        if (state.location != const SplashRoute().location) {
          return _redirectImpl(const SplashRoute().location, state.location);
        }
        break;
      case GameStage.lobby:
      case GameStage.preparing:
        if (!kLobbyRoutes.contains(state.location)) {
          return _redirectImpl(const LobbyRoute().location, state.location);
        }
        break;
      case GameStage.round:
        // TODO: Handle this case.
        break;
      case GameStage.finished:
        // TODO: Handle this case.
        break;
    }

    return null;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }

  String? _redirectImpl(String location, String from) {
    _redirectedFrom = from;
    dev.log("redirected from $from to $location");
    return location;
  }
}

@freezed
class RouterState with _$RouterState {
  const factory RouterState({
    required bool isPlayerNameSet,
    required GameStage gameStage,
  }) = _RouterState;
}
