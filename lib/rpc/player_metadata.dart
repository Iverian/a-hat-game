import "dart:collection";

import "error.dart";

const kGrpcPlayerId = "x-player-id";
const kGrpcRev = "x-revision";

class PlayerMetadata {
  final int playerId;

  PlayerMetadata({required this.playerId});

  factory PlayerMetadata.fromId({required int playerId}) => PlayerMetadata(playerId: playerId);

  factory PlayerMetadata.fromGrpc(Map<String, String>? clientMetadata) {
    try {
      final src = clientMetadata!;
      return PlayerMetadata(
        playerId: int.tryParse(src[kGrpcPlayerId]!)!,
      );
    } on Exception catch (_) {
      throw MissingMetadataError();
    }
  }

  Map<String, String> toGrpc() {
    final result = HashMap<String, String>();
    result[kGrpcPlayerId] = playerId.toString();
    return result;
  }
}
