///
//  Generated code. Do not modify.
//  source: proto/direct.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DirectLink extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DirectLink',
      package: const $pb.PackageName(
          $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hat_game.direct'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port',
        $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false;

  DirectLink._() : super();
  factory DirectLink({
    $core.String? serviceId,
    $core.int? port,
    $core.String? code,
  }) {
    final _result = create();
    if (serviceId != null) {
      _result.serviceId = serviceId;
    }
    if (port != null) {
      _result.port = port;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory DirectLink.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DirectLink.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DirectLink clone() => DirectLink()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DirectLink copyWith(void Function(DirectLink) updates) =>
      super.copyWith((message) => updates(message as DirectLink))
          as DirectLink; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DirectLink create() => DirectLink._();
  DirectLink createEmptyInstance() => create();
  static $pb.PbList<DirectLink> createRepeated() => $pb.PbList<DirectLink>();
  @$core.pragma('dart2js:noInline')
  static DirectLink getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DirectLink>(create);
  static DirectLink? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasServiceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);
}
