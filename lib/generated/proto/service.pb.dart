///
//  Generated code. Do not modify.
//  source: proto/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'error.pb.dart' as $1;
import 'state.pb.dart' as $2;

import 'state.pbenum.dart' as $2;

enum FallibleResponse_Result { ok, err, notSet }

class FallibleResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, FallibleResponse_Result> _FallibleResponse_ResultByTag = {
    1: FallibleResponse_Result.ok,
    2: FallibleResponse_Result.err,
    0: FallibleResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FallibleResponse',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.Empty>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok',
        subBuilder: $1.Empty.create)
    ..aOM<$1.ProtocolError>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'err',
        subBuilder: $1.ProtocolError.create)
    ..hasRequiredFields = false;

  FallibleResponse._() : super();
  factory FallibleResponse({
    $1.Empty? ok,
    $1.ProtocolError? err,
  }) {
    final _result = create();
    if (ok != null) {
      _result.ok = ok;
    }
    if (err != null) {
      _result.err = err;
    }
    return _result;
  }
  factory FallibleResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FallibleResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FallibleResponse clone() => FallibleResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FallibleResponse copyWith(void Function(FallibleResponse) updates) =>
      super.copyWith((message) => updates(message as FallibleResponse))
          as FallibleResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FallibleResponse create() => FallibleResponse._();
  FallibleResponse createEmptyInstance() => create();
  static $pb.PbList<FallibleResponse> createRepeated() => $pb.PbList<FallibleResponse>();
  @$core.pragma('dart2js:noInline')
  static FallibleResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FallibleResponse>(create);
  static FallibleResponse? _defaultInstance;

  FallibleResponse_Result whichResult() => _FallibleResponse_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Empty get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok($1.Empty v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  $1.Empty ensureOk() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.ProtocolError get err => $_getN(1);
  @$pb.TagNumber(2)
  set err($1.ProtocolError v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErr() => $_has(1);
  @$pb.TagNumber(2)
  void clearErr() => clearField(2);
  @$pb.TagNumber(2)
  $1.ProtocolError ensureErr() => $_ensure(1);
}

class LobbyJoinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LobbyJoinRequest',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerName')
    ..hasRequiredFields = false;

  LobbyJoinRequest._() : super();
  factory LobbyJoinRequest({
    $core.String? playerName,
  }) {
    final _result = create();
    if (playerName != null) {
      _result.playerName = playerName;
    }
    return _result;
  }
  factory LobbyJoinRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LobbyJoinRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LobbyJoinRequest clone() => LobbyJoinRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LobbyJoinRequest copyWith(void Function(LobbyJoinRequest) updates) =>
      super.copyWith((message) => updates(message as LobbyJoinRequest))
          as LobbyJoinRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LobbyJoinRequest create() => LobbyJoinRequest._();
  LobbyJoinRequest createEmptyInstance() => create();
  static $pb.PbList<LobbyJoinRequest> createRepeated() => $pb.PbList<LobbyJoinRequest>();
  @$core.pragma('dart2js:noInline')
  static LobbyJoinRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LobbyJoinRequest>(create);
  static LobbyJoinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);
}

enum LobbyJoinResponse_Result { ok, err, notSet }

class LobbyJoinResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, LobbyJoinResponse_Result> _LobbyJoinResponse_ResultByTag = {
    1: LobbyJoinResponse_Result.ok,
    2: LobbyJoinResponse_Result.err,
    0: LobbyJoinResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LobbyJoinResponse',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok',
        $pb.PbFieldType.OF3)
    ..aOM<$1.ProtocolError>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'err',
        subBuilder: $1.ProtocolError.create)
    ..hasRequiredFields = false;

  LobbyJoinResponse._() : super();
  factory LobbyJoinResponse({
    $core.int? ok,
    $1.ProtocolError? err,
  }) {
    final _result = create();
    if (ok != null) {
      _result.ok = ok;
    }
    if (err != null) {
      _result.err = err;
    }
    return _result;
  }
  factory LobbyJoinResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LobbyJoinResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LobbyJoinResponse clone() => LobbyJoinResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LobbyJoinResponse copyWith(void Function(LobbyJoinResponse) updates) =>
      super.copyWith((message) => updates(message as LobbyJoinResponse))
          as LobbyJoinResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LobbyJoinResponse create() => LobbyJoinResponse._();
  LobbyJoinResponse createEmptyInstance() => create();
  static $pb.PbList<LobbyJoinResponse> createRepeated() => $pb.PbList<LobbyJoinResponse>();
  @$core.pragma('dart2js:noInline')
  static LobbyJoinResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LobbyJoinResponse>(create);
  static LobbyJoinResponse? _defaultInstance;

  LobbyJoinResponse_Result whichResult() => _LobbyJoinResponse_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get ok => $_getIZ(0);
  @$pb.TagNumber(1)
  set ok($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);

  @$pb.TagNumber(2)
  $1.ProtocolError get err => $_getN(1);
  @$pb.TagNumber(2)
  set err($1.ProtocolError v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErr() => $_has(1);
  @$pb.TagNumber(2)
  void clearErr() => clearField(2);
  @$pb.TagNumber(2)
  $1.ProtocolError ensureErr() => $_ensure(1);
}

class LobbyPlayerReadyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LobbyPlayerReadyRequest',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..pc<$2.Character>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characters',
        $pb.PbFieldType.PM,
        subBuilder: $2.Character.create)
    ..hasRequiredFields = false;

  LobbyPlayerReadyRequest._() : super();
  factory LobbyPlayerReadyRequest({
    $core.Iterable<$2.Character>? characters,
  }) {
    final _result = create();
    if (characters != null) {
      _result.characters.addAll(characters);
    }
    return _result;
  }
  factory LobbyPlayerReadyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LobbyPlayerReadyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LobbyPlayerReadyRequest clone() => LobbyPlayerReadyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LobbyPlayerReadyRequest copyWith(void Function(LobbyPlayerReadyRequest) updates) =>
      super.copyWith((message) => updates(message as LobbyPlayerReadyRequest))
          as LobbyPlayerReadyRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LobbyPlayerReadyRequest create() => LobbyPlayerReadyRequest._();
  LobbyPlayerReadyRequest createEmptyInstance() => create();
  static $pb.PbList<LobbyPlayerReadyRequest> createRepeated() =>
      $pb.PbList<LobbyPlayerReadyRequest>();
  @$core.pragma('dart2js:noInline')
  static LobbyPlayerReadyRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LobbyPlayerReadyRequest>(create);
  static LobbyPlayerReadyRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$2.Character> get characters => $_getList(0);
}

class EndTurnRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EndTurnRequest',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..e<$2.TurnEndReason>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason',
        $pb.PbFieldType.OE,
        defaultOrMaker: $2.TurnEndReason.TIMEOUT,
        valueOf: $2.TurnEndReason.valueOf,
        enumValues: $2.TurnEndReason.values)
    ..aOM<$2.CharacterIdList>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'guessed',
        subBuilder: $2.CharacterIdList.create)
    ..hasRequiredFields = false;

  EndTurnRequest._() : super();
  factory EndTurnRequest({
    $2.TurnEndReason? reason,
    $2.CharacterIdList? guessed,
  }) {
    final _result = create();
    if (reason != null) {
      _result.reason = reason;
    }
    if (guessed != null) {
      _result.guessed = guessed;
    }
    return _result;
  }
  factory EndTurnRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EndTurnRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EndTurnRequest clone() => EndTurnRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EndTurnRequest copyWith(void Function(EndTurnRequest) updates) =>
      super.copyWith((message) => updates(message as EndTurnRequest))
          as EndTurnRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EndTurnRequest create() => EndTurnRequest._();
  EndTurnRequest createEmptyInstance() => create();
  static $pb.PbList<EndTurnRequest> createRepeated() => $pb.PbList<EndTurnRequest>();
  @$core.pragma('dart2js:noInline')
  static EndTurnRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndTurnRequest>(create);
  static EndTurnRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $2.TurnEndReason get reason => $_getN(0);
  @$pb.TagNumber(2)
  set reason($2.TurnEndReason v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);

  @$pb.TagNumber(3)
  $2.CharacterIdList get guessed => $_getN(1);
  @$pb.TagNumber(3)
  set guessed($2.CharacterIdList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGuessed() => $_has(1);
  @$pb.TagNumber(3)
  void clearGuessed() => clearField(3);
  @$pb.TagNumber(3)
  $2.CharacterIdList ensureGuessed() => $_ensure(1);
}

class CastVoteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CastVoteRequest',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..aOM<$2.VoteResult>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result',
        subBuilder: $2.VoteResult.create)
    ..hasRequiredFields = false;

  CastVoteRequest._() : super();
  factory CastVoteRequest({
    $2.VoteResult? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory CastVoteRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CastVoteRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CastVoteRequest clone() => CastVoteRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CastVoteRequest copyWith(void Function(CastVoteRequest) updates) =>
      super.copyWith((message) => updates(message as CastVoteRequest))
          as CastVoteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CastVoteRequest create() => CastVoteRequest._();
  CastVoteRequest createEmptyInstance() => create();
  static $pb.PbList<CastVoteRequest> createRepeated() => $pb.PbList<CastVoteRequest>();
  @$core.pragma('dart2js:noInline')
  static CastVoteRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CastVoteRequest>(create);
  static CastVoteRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $2.VoteResult get result => $_getN(0);
  @$pb.TagNumber(2)
  set result($2.VoteResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
  @$pb.TagNumber(2)
  $2.VoteResult ensureResult() => $_ensure(0);
}
