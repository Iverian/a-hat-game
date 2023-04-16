import "package:flutter/material.dart";

import "../generated/proto/state.pb.dart";
import "error.dart";

extension GameStateExt on GameState {
  void ensurePlayerPresent(int playerId) {
    if (!players.containsKey(playerId)) {
      throw PlayerNotFoundError();
    }
  }

  int? getActivePlayer() {
    if (whichStage() != GameState_Stage.round) {
      return null;
    }

    final teams = round.state.teams.value;
    final teamsTotal = teams.length;
    final turnIndex = round.turnIndex % players.length;

    final activeTeam = teams[turnIndex % teamsTotal];
    return (turnIndex >= teamsTotal) ? activeTeam.firstPlayerId : activeTeam.secondPlayerId;
  }

  List<LobbyPlayer> lobbyPlayers() => players.entries
      .map(
        (e) => LobbyPlayer(
          playerId: e.key,
          data: e.value,
          ready: lobby.state.containsKey(e.key),
        ),
      )
      .toList();
}

@immutable
class LobbyPlayer {
  final int playerId;
  final Player data;
  final bool ready;

  const LobbyPlayer({
    required this.playerId,
    required this.data,
    required this.ready,
  });
}
