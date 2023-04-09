///
//  Generated code. Do not modify.
//  source: proto/error.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'error.pbenum.dart';

export 'error.pbenum.dart';

class ProtocolError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProtocolError',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.error'),
      createEmptyInstance: create)
    ..e<ErrorCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code',
        $pb.PbFieldType.OE,
        defaultOrMaker: ErrorCode.OTHER, valueOf: ErrorCode.valueOf, enumValues: ErrorCode.values)
    ..hasRequiredFields = false;

  ProtocolError._() : super();
  factory ProtocolError({
    ErrorCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory ProtocolError.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProtocolError.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProtocolError clone() => ProtocolError()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProtocolError copyWith(void Function(ProtocolError) updates) =>
      super.copyWith((message) => updates(message as ProtocolError))
          as ProtocolError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtocolError create() => ProtocolError._();
  ProtocolError createEmptyInstance() => create();
  static $pb.PbList<ProtocolError> createRepeated() => $pb.PbList<ProtocolError>();
  @$core.pragma('dart2js:noInline')
  static ProtocolError getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtocolError>(create);
  static ProtocolError? _defaultInstance;

  @$pb.TagNumber(1)
  ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(ErrorCode v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.error'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty))
          as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}
