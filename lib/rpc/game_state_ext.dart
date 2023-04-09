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
}
