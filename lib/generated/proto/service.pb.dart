///
//  Generated code. Do not modify.
//  source: proto/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'state.pb.dart' as $2;
import 'error.pb.dart' as $1;

import 'state.pbenum.dart' as $2;

enum GameEvent_Kind { handshake, shutdown, ack, rewind, patch, notSet }

class GameEvent extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameEvent_Kind> _GameEvent_KindByTag = {
    1: GameEvent_Kind.handshake,
    2: GameEvent_Kind.shutdown,
    3: GameEvent_Kind.ack,
    4: GameEvent_Kind.rewind,
    5: GameEvent_Kind.patch,
    0: GameEvent_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameEvent',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<FallibleResponse>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'handshake',
        subBuilder: FallibleResponse.create)
    ..aOM<EventShutdown>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shutdown',
        subBuilder: EventShutdown.create)
    ..aOM<EventAck>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ack',
        subBuilder: EventAck.create)
    ..aOM<EventRewind>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewind',
        subBuilder: EventRewind.create)
    ..aOM<EventPatch>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patch',
        subBuilder: EventPatch.create)
    ..hasRequiredFields = false;

  GameEvent._() : super();
  factory GameEvent({
    FallibleResponse? handshake,
    EventShutdown? shutdown,
    EventAck? ack,
    EventRewind? rewind,
    EventPatch? patch,
  }) {
    final _result = create();
    if (handshake != null) {
      _result.handshake = handshake;
    }
    if (shutdown != null) {
      _result.shutdown = shutdown;
    }
    if (ack != null) {
      _result.ack = ack;
    }
    if (rewind != null) {
      _result.rewind = rewind;
    }
    if (patch != null) {
      _result.patch = patch;
    }
    return _result;
  }
  factory GameEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GameEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GameEvent clone() => GameEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GameEvent copyWith(void Function(GameEvent) updates) =>
      super.copyWith((message) => updates(message as GameEvent))
          as GameEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameEvent create() => GameEvent._();
  GameEvent createEmptyInstance() => create();
  static $pb.PbList<GameEvent> createRepeated() => $pb.PbList<GameEvent>();
  @$core.pragma('dart2js:noInline')
  static GameEvent getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameEvent>(create);
  static GameEvent? _defaultInstance;

  GameEvent_Kind whichKind() => _GameEvent_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  FallibleResponse get handshake => $_getN(0);
  @$pb.TagNumber(1)
  set handshake(FallibleResponse v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHandshake() => $_has(0);
  @$pb.TagNumber(1)
  void clearHandshake() => clearField(1);
  @$pb.TagNumber(1)
  FallibleResponse ensureHandshake() => $_ensure(0);

  @$pb.TagNumber(2)
  EventShutdown get shutdown => $_getN(1);
  @$pb.TagNumber(2)
  set shutdown(EventShutdown v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShutdown() => $_has(1);
  @$pb.TagNumber(2)
  void clearShutdown() => clearField(2);
  @$pb.TagNumber(2)
  EventShutdown ensureShutdown() => $_ensure(1);

  @$pb.TagNumber(3)
  EventAck get ack => $_getN(2);
  @$pb.TagNumber(3)
  set ack(EventAck v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAck() => $_has(2);
  @$pb.TagNumber(3)
  void clearAck() => clearField(3);
  @$pb.TagNumber(3)
  EventAck ensureAck() => $_ensure(2);

  @$pb.TagNumber(4)
  EventRewind get rewind => $_getN(3);
  @$pb.TagNumber(4)
  set rewind(EventRewind v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRewind() => $_has(3);
  @$pb.TagNumber(4)
  void clearRewind() => clearField(4);
  @$pb.TagNumber(4)
  EventRewind ensureRewind() => $_ensure(3);

  @$pb.TagNumber(5)
  EventPatch get patch => $_getN(4);
  @$pb.TagNumber(5)
  set patch(EventPatch v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPatch() => $_has(4);
  @$pb.TagNumber(5)
  void clearPatch() => clearField(5);
  @$pb.TagNumber(5)
  EventPatch ensurePatch() => $_ensure(4);
}

class EventShutdown extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventShutdown',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EventShutdown._() : super();
  factory EventShutdown() => create();
  factory EventShutdown.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EventShutdown.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EventShutdown clone() => EventShutdown()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EventShutdown copyWith(void Function(EventShutdown) updates) =>
      super.copyWith((message) => updates(message as EventShutdown))
          as EventShutdown; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventShutdown create() => EventShutdown._();
  EventShutdown createEmptyInstance() => create();
  static $pb.PbList<EventShutdown> createRepeated() => $pb.PbList<EventShutdown>();
  @$core.pragma('dart2js:noInline')
  static EventShutdown getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventShutdown>(create);
  static EventShutdown? _defaultInstance;
}

class EventAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventAck',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EventAck._() : super();
  factory EventAck() => create();
  factory EventAck.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EventAck.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EventAck clone() => EventAck()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EventAck copyWith(void Function(EventAck) updates) =>
      super.copyWith((message) => updates(message as EventAck))
          as EventAck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventAck create() => EventAck._();
  EventAck createEmptyInstance() => create();
  static $pb.PbList<EventAck> createRepeated() => $pb.PbList<EventAck>();
  @$core.pragma('dart2js:noInline')
  static EventAck getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventAck>(create);
  static EventAck? _defaultInstance;
}

class EventRewind extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventRewind',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..aOM<$2.GameState>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state',
        subBuilder: $2.GameState.create)
    ..hasRequiredFields = false;

  EventRewind._() : super();
  factory EventRewind({
    $2.GameState? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory EventRewind.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EventRewind.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EventRewind clone() => EventRewind()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EventRewind copyWith(void Function(EventRewind) updates) =>
      super.copyWith((message) => updates(message as EventRewind))
          as EventRewind; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventRewind create() => EventRewind._();
  EventRewind createEmptyInstance() => create();
  static $pb.PbList<EventRewind> createRepeated() => $pb.PbList<EventRewind>();
  @$core.pragma('dart2js:noInline')
  static EventRewind getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventRewind>(create);
  static EventRewind? _defaultInstance;

  @$pb.TagNumber(1)
  $2.GameState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($2.GameState v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  $2.GameState ensureState() => $_ensure(0);
}

class EventPatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventPatch',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.service'),
      createEmptyInstance: create)
    ..aOM<$2.GameStatePatch>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'patch',
        subBuilder: $2.GameStatePatch.create)
    ..hasRequiredFields = false;

  EventPatch._() : super();
  factory EventPatch({
    $2.GameStatePatch? patch,
  }) {
    final _result = create();
    if (patch != null) {
      _result.patch = patch;
    }
    return _result;
  }
  factory EventPatch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EventPatch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EventPatch clone() => EventPatch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EventPatch copyWith(void Function(EventPatch) updates) =>
      super.copyWith((message) => updates(message as EventPatch))
          as EventPatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventPatch create() => EventPatch._();
  EventPatch createEmptyInstance() => create();
  static $pb.PbList<EventPatch> createRepeated() => $pb.PbList<EventPatch>();
  @$core.pragma('dart2js:noInline')
  static EventPatch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventPatch>(create);
  static EventPatch? _defaultInstance;

  @$pb.TagNumber(1)
  $2.GameStatePatch get patch => $_getN(0);
  @$pb.TagNumber(1)
  set patch($2.GameStatePatch v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPatch() => $_has(0);
  @$pb.TagNumber(1)
  void clearPatch() => clearField(1);
  @$pb.TagNumber(1)
  $2.GameStatePatch ensurePatch() => $_ensure(0);
}

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
