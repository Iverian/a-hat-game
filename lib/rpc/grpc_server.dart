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
      return response..err = e.toProtocolError();
    }
  }
}

class GrpcGameService extends GameServiceBase {
  final LocalGameClient client;

  GrpcGameService({required this.client});

  @override
  Stream<UpdateState> subscribe(ServiceCall call, Empty request) async* {
    yield* client.subscribe(player: PlayerMetadata.fromGrpc(call.clientMetadata));
  }

  @override
  Future<FallibleResponse> confirm(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.confirm(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = e.toProtocolError();
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
      return response..err = e.toProtocolError();
    }
  }

  @override
  Future<FallibleResponse> lobbyLeave(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.lobbyLeave(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = e.toProtocolError();
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
      return response..err = e.toProtocolError();
    }
  }

  @override
  Future<FallibleResponse> lobbyPlayerNotReady(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.lobbyPlayerNotReady(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = e.toProtocolError();
    }
  }

  @override
  Future<FallibleResponse> startTurn(ServiceCall call, Empty request) async {
    final response = FallibleResponse()..clearResult();
    try {
      await client.startTurn(player: PlayerMetadata.fromGrpc(call.clientMetadata));
      return response..ok = Empty();
    } on RpcError catch (e) {
      return response..err = e.toProtocolError();
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
      return response..err = e.toProtocolError();
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
      return response..err = e.toProtocolError();
    }
  }
}
