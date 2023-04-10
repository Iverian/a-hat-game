import "dart:async";

import "package:grpc/grpc.dart";

import "../generated/proto/error.pb.dart";
import "../generated/proto/service.pbgrpc.dart";
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
  Stream<GameEvent> subscribe(ServiceCall call, Empty request) async* {
    yield* client.subscribe(player: PlayerMetadata.fromGrpc(call.clientMetadata));
  }

  @override
  Future<FallibleResponse> confirm(
    ServiceCall call,
    Empty request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.confirm(player: player);
      });

  @override
  Future<FallibleResponse> heartbeat(
    ServiceCall call,
    Empty request,
  ) =>
      _wrapRequest(call, (player) async {
        // TODO: implement heartbeat
        throw UnimplementedError();
      });

  @override
  Future<FallibleResponse> lobbyLeave(
    ServiceCall call,
    Empty request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.lobbyLeave(player: player);
      });

  @override
  Future<FallibleResponse> lobbyPlayerReady(
    ServiceCall call,
    LobbyPlayerReadyRequest request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.lobbyPlayerReady(
          player: player,
          characters: request.characters,
        );
      });

  @override
  Future<FallibleResponse> lobbyPlayerNotReady(
    ServiceCall call,
    Empty request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.lobbyPlayerNotReady(player: player);
      });

  @override
  Future<FallibleResponse> startTurn(
    ServiceCall call,
    Empty request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.startTurn(
          player: player,
        );
      });

  @override
  Future<FallibleResponse> endTurn(
    ServiceCall call,
    EndTurnRequest request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.endTurn(
          player: player,
          reason: request.reason,
          guessed: request.guessed.characters,
        );
      });

  @override
  Future<FallibleResponse> castVote(
    ServiceCall call,
    CastVoteRequest request,
  ) =>
      _wrapRequest(call, (player) async {
        await client.castVote(
          player: player,
          result: request.result.value,
        );
      });
}

Future<FallibleResponse> _wrapRequest(
  ServiceCall call,
  Future<void> Function(PlayerMetadata) inner,
) async {
  final response = FallibleResponse()..clearResult();
  try {
    final player = PlayerMetadata.fromGrpc(call.clientMetadata);
    await inner(player);
    return response..ok = Empty();
  } on RpcError catch (e) {
    return response..err = e.toProtocolError();
  }
}
