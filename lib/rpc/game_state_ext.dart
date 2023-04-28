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

  List<LobbyPlayerView> getLobbyPlayersView() => players.entries
      .map(
        (e) => LobbyPlayerView(
          playerId: e.key,
          data: e.value,
          ready: lobby.state.containsKey(e.key),
        ),
      )
      .toList();

  List<TeamView> getTeamsView() {
    late RunningGameState state;
    PlayerPoints? curPoints;
    switch (whichStage()) {
      case GameState_Stage.preparing:
        state = preparing;
        break;
      case GameState_Stage.start:
        state = start;
        break;
      case GameState_Stage.round:
        state = round.state;
        curPoints = round.playerPoints;
        break;
      case GameState_Stage.finished:
        state = finished;
        break;
      case GameState_Stage.lobby:
      case GameState_Stage.notSet:
        throw UnimplementedError();
    }

    return state.teams.value.map((i) {
      var teamPoints = state.roundPoints.value.fold(
        0,
        (previousValue, j) =>
            previousValue +
            j.value[i.firstPlayerId]!.characters.length +
            j.value[i.secondPlayerId]!.characters.length,
      );
      if (curPoints != null) {
        teamPoints += curPoints.value[i.firstPlayerId]!.characters.length +
            curPoints.value[i.secondPlayerId]!.characters.length;
      }

      return TeamView(
        props: i.props,
        firstPlayer: players[i.firstPlayerId]!,
        secondPlayer: players[i.secondPlayerId]!,
        points: teamPoints,
      );
    }).toList();
  }
}

@immutable
class LobbyPlayerView {
  final int playerId;
  final Player data;
  final bool ready;

  const LobbyPlayerView({
    required this.playerId,
    required this.data,
    required this.ready,
  });
}

@immutable
class TeamView {
  final TeamProps props;
  final Player firstPlayer;
  final Player secondPlayer;
  final int points;

  const TeamView({
    required this.props,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.points,
  });
}
