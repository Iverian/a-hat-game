import "../generated/proto/state.pb.dart";

const kStartTimeoutS = 3;
const kVoteTimeoutS = 15;
const kConfirmTimeoutS = 5;

extension SettingsExt on Settings {
  static Settings fromGameSettings({
    required int characterCount,
    required int minimalPlayers,
    required int turnDurationS,
  }) =>
      Settings(
        characterCount: characterCount,
        minimalPlayers: minimalPlayers,
        turnDurationS: turnDurationS,
        voteTimeoutS: kVoteTimeoutS,
        startTimeoutS: kStartTimeoutS,
        confirmTimeoutS: kConfirmTimeoutS,
      );
}
