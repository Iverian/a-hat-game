import "dart:async";
import "dart:developer" as dev;

import "package:grpc/src/server/call.dart";

import "../generated/proto/error.pb.dart";
import "../generated/proto/service.pbgrpc.dart";
import "../generated/proto/state.pb.dart";
import "error.dart";
import "game_server.dart";

class GrpcJoinService extends JoinServiceBase {
  final LocalGameClient client;

  GrpcJoinService({required this.client});

  @override
  Future<LobbyJoinResponse> lobbyJoin(ServiceCall call, LobbyJoinRequest request) async {
    final response = LobbyJoinResponse()..clearResult();
    try {
      final playerId = await client.lobbyJoin(playerName: request.playerName);
      return response..ok = playerId;
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }
}

class GrpcGameService extends GameServiceBase {
  final LocalGameClient client;

  GrpcGameService({required this.client});

  @override
  Stream<UpdateState> subscribe(ServiceCall call, Empty request) async* {
    late Stream<UpdateState> stream;
    try {
      stream = client.subscribe(player: PlayerMetadata.fromGrpc(call.clientMetadata));
    } on RpcError catch (e) {
      yield UpdateState(
        rev: 0,
        confirm: false,
        handshake: DoHandshake(err: toProtocolError(e)),
      );
      return;
    }
    yield UpdateState(
      rev: 0,
      confirm: false,
      handshake: DoHandshake(ok: Empty()),
    );
    await for (final dynamic event in stream) {
      if (event == null) {
        return;
      }
      yield event as UpdateState;
    }
  }

  @override
  Future<FallibleResponse> confirm(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.confirm(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> heartbeat(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      final player = PlayerMetadata.fromGrpc(call.clientMetadata);
      // TODO: implement heartbeat
      throw UnimplementedError();
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> lobbyLeave(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.lobbyLeave(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> lobbyPlayerReady(
    ServiceCall call,
    LobbyPlayerReadyRequest request,
  ) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.lobbyPlayerReady(
        player: PlayerMetadata.fromGrpc(call.clientMetadata),
        characters: request.characters,
      );
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> lobbyPlayerNotReady(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.lobbyPlayerNotReady(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> startTurn(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.startTurn(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> endTurn(ServiceCall call, EndTurnRequest request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.endTurn(
        player: PlayerMetadata.fromGrpc(call.clientMetadata),
        reason: request.reason,
        guessed: request.guessed.characters,
      );
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }

  @override
  Future<FallibleResponse> castVote(ServiceCall call, CastVoteRequest request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.castVote(
        player: PlayerMetadata.fromGrpc(call.clientMetadata),
        result: request.result.value,
      );
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = toProtocolError(e);
    }
  }
}

ProtocolError toProtocolError(RpcError e) {
  var code = ErrorCode.OTHER;
  if (e is InvalidStateRevisionError) {
    code = ErrorCode.INVALID_REVISION;
  } else if (e is PlayerNameTakenError) {
    code = ErrorCode.PLAYER_NAME_TAKEN;
  } else if (e is PlayerNotFoundError) {
    code = ErrorCode.PLAYER_NOT_FOUND;
  } else if (e is CharactersInvalid) {
    code = ErrorCode.INVALID_CHARACTER_DATA;
  } else if (e is MissingMetadata) {
    code = ErrorCode.MISSING_METADATA;
  } else {
    dev.log("unhandled rpc error: $e");
  }
  return ProtocolError(code: code);
}
