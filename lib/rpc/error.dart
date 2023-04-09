class RpcError implements Exception {}

class InvalidStateRevisionError extends RpcError {}

class PlayerNameTakenError extends RpcError {}

class PlayerNotFoundError extends RpcError {}

class CharactersInvalid extends RpcError {}

class StartGameError extends RpcError {}

class MissingMetadata extends RpcError {}

class StateNotSyncedError extends RpcError {}

class InvalidUpdateError extends RpcError {
  final String message;

  InvalidUpdateError({required this.message});
}
