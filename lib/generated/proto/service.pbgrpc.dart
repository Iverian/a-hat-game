///
//  Generated code. Do not modify.
//  source: proto/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
import 'error.pb.dart' as $1;
export 'service.pb.dart';

class JoinClient extends $grpc.Client {
  static final _$lobbyJoin = $grpc.ClientMethod<$0.LobbyJoinRequest, $0.LobbyJoinResponse>(
      '/hat_game.service.Join/LobbyJoin',
      ($0.LobbyJoinRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LobbyJoinResponse.fromBuffer(value));

  JoinClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LobbyJoinResponse> lobbyJoin($0.LobbyJoinRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lobbyJoin, request, options: options);
  }
}

abstract class JoinServiceBase extends $grpc.Service {
  $core.String get $name => 'hat_game.service.Join';

  JoinServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LobbyJoinRequest, $0.LobbyJoinResponse>(
        'LobbyJoin',
        lobbyJoin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LobbyJoinRequest.fromBuffer(value),
        ($0.LobbyJoinResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LobbyJoinResponse> lobbyJoin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LobbyJoinRequest> request) async {
    return lobbyJoin(call, await request);
  }

  $async.Future<$0.LobbyJoinResponse> lobbyJoin(
      $grpc.ServiceCall call, $0.LobbyJoinRequest request);
}

class GameClient extends $grpc.Client {
  static final _$subscribe = $grpc.ClientMethod<$1.Empty, $0.GameEvent>(
      '/hat_game.service.Game/Subscribe',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GameEvent.fromBuffer(value));
  static final _$confirm = $grpc.ClientMethod<$1.Empty, $0.FallibleResponse>(
      '/hat_game.service.Game/Confirm',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$heartbeat = $grpc.ClientMethod<$1.Empty, $0.FallibleResponse>(
      '/hat_game.service.Game/Heartbeat',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$lobbyLeave = $grpc.ClientMethod<$1.Empty, $0.FallibleResponse>(
      '/hat_game.service.Game/LobbyLeave',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$lobbyPlayerReady =
      $grpc.ClientMethod<$0.LobbyPlayerReadyRequest, $0.FallibleResponse>(
          '/hat_game.service.Game/LobbyPlayerReady',
          ($0.LobbyPlayerReadyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$lobbyPlayerNotReady = $grpc.ClientMethod<$1.Empty, $0.FallibleResponse>(
      '/hat_game.service.Game/LobbyPlayerNotReady',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$startTurn = $grpc.ClientMethod<$1.Empty, $0.FallibleResponse>(
      '/hat_game.service.Game/StartTurn',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$endTurn = $grpc.ClientMethod<$0.EndTurnRequest, $0.FallibleResponse>(
      '/hat_game.service.Game/EndTurn',
      ($0.EndTurnRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));
  static final _$castVote = $grpc.ClientMethod<$0.CastVoteRequest, $0.FallibleResponse>(
      '/hat_game.service.Game/CastVote',
      ($0.CastVoteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FallibleResponse.fromBuffer(value));

  GameClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.GameEvent> subscribe($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribe, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> confirm($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$confirm, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> heartbeat($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$heartbeat, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> lobbyLeave($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lobbyLeave, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> lobbyPlayerReady($0.LobbyPlayerReadyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lobbyPlayerReady, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> lobbyPlayerNotReady($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lobbyPlayerNotReady, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> startTurn($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startTurn, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> endTurn($0.EndTurnRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endTurn, request, options: options);
  }

  $grpc.ResponseFuture<$0.FallibleResponse> castVote($0.CastVoteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$castVote, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'hat_game.service.Game';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GameEvent>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GameEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.FallibleResponse>(
        'Confirm',
        confirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.FallibleResponse>(
        'Heartbeat',
        heartbeat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.FallibleResponse>(
        'LobbyLeave',
        lobbyLeave_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LobbyPlayerReadyRequest, $0.FallibleResponse>(
        'LobbyPlayerReady',
        lobbyPlayerReady_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LobbyPlayerReadyRequest.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.FallibleResponse>(
        'LobbyPlayerNotReady',
        lobbyPlayerNotReady_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.FallibleResponse>(
        'StartTurn',
        startTurn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EndTurnRequest, $0.FallibleResponse>(
        'EndTurn',
        endTurn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EndTurnRequest.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CastVoteRequest, $0.FallibleResponse>(
        'CastVote',
        castVote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CastVoteRequest.fromBuffer(value),
        ($0.FallibleResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.GameEvent> subscribe_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$0.FallibleResponse> confirm_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return confirm(call, await request);
  }

  $async.Future<$0.FallibleResponse> heartbeat_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return heartbeat(call, await request);
  }

  $async.Future<$0.FallibleResponse> lobbyLeave_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return lobbyLeave(call, await request);
  }

  $async.Future<$0.FallibleResponse> lobbyPlayerReady_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LobbyPlayerReadyRequest> request) async {
    return lobbyPlayerReady(call, await request);
  }

  $async.Future<$0.FallibleResponse> lobbyPlayerNotReady_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return lobbyPlayerNotReady(call, await request);
  }

  $async.Future<$0.FallibleResponse> startTurn_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return startTurn(call, await request);
  }

  $async.Future<$0.FallibleResponse> endTurn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EndTurnRequest> request) async {
    return endTurn(call, await request);
  }

  $async.Future<$0.FallibleResponse> castVote_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CastVoteRequest> request) async {
    return castVote(call, await request);
  }

  $async.Stream<$0.GameEvent> subscribe($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.FallibleResponse> confirm($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.FallibleResponse> heartbeat($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.FallibleResponse> lobbyLeave($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.FallibleResponse> lobbyPlayerReady(
      $grpc.ServiceCall call, $0.LobbyPlayerReadyRequest request);
  $async.Future<$0.FallibleResponse> lobbyPlayerNotReady($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.FallibleResponse> startTurn($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.FallibleResponse> endTurn($grpc.ServiceCall call, $0.EndTurnRequest request);
  $async.Future<$0.FallibleResponse> castVote($grpc.ServiceCall call, $0.CastVoteRequest request);
}
