import "dart:developer" as dev;

import "../generated/proto/error.pb.dart";

class RpcError implements Exception {
  final ErrorCode code;

  RpcError({ErrorCode? code}) : code = (code == null) ? ErrorCode.OTHER : code;

  factory RpcError.fromProtocolErr(ProtocolError e) => RpcError(code: e.code);

  ProtocolError toProtocolError() => ProtocolError(code: code);
}

class InvalidStateRevisionError extends RpcError {
  InvalidStateRevisionError() : super(code: ErrorCode.INVALID_REVISION);
}

class PlayerNameTakenError extends RpcError {
  PlayerNameTakenError() : super(code: ErrorCode.PLAYER_NAME_TAKEN);
}

class PlayerNotFoundError extends RpcError {
  PlayerNotFoundError() : super(code: ErrorCode.PLAYER_NOT_FOUND);
}

class CharactersInvalidError extends RpcError {
  CharactersInvalidError() : super(code: ErrorCode.INVALID_CHARACTER_DATA);
}

class MissingMetadataError extends RpcError {
  MissingMetadataError() : super(code: ErrorCode.MISSING_METADATA);
}

class StartGameError extends RpcError {}

class StateNotSyncedError extends RpcError {}

class InvalidUpdateError extends RpcError {
  final String message;

  InvalidUpdateError({required this.message});
}
