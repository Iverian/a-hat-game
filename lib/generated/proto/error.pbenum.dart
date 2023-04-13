///
//  Generated code. Do not modify.
//  source: proto/error.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode OTHER =
      ErrorCode._(0, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTHER');
  static const ErrorCode MISSING_METADATA = ErrorCode._(
      1, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MISSING_METADATA');
  static const ErrorCode EARLY_REVISION = ErrorCode._(
      2, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EARLY_REVISION');
  static const ErrorCode INVALID_REVISION = ErrorCode._(
      3, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID_REVISION');
  static const ErrorCode PLAYER_NAME_TAKEN = ErrorCode._(
      4, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAYER_NAME_TAKEN');
  static const ErrorCode PLAYER_NOT_FOUND = ErrorCode._(
      5, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAYER_NOT_FOUND');
  static const ErrorCode INVALID_CHARACTER_DATA = ErrorCode._(
      6, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID_CHARACTER_DATA');
  static const ErrorCode INVALID_LOBBY_CODE = ErrorCode._(
      7, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID_LOBBY_CODE');

  static const $core.List<ErrorCode> values = <ErrorCode>[
    OTHER,
    MISSING_METADATA,
    EARLY_REVISION,
    INVALID_REVISION,
    PLAYER_NAME_TAKEN,
    PLAYER_NOT_FOUND,
    INVALID_CHARACTER_DATA,
    INVALID_LOBBY_CODE,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._($core.int v, $core.String n) : super(v, n);
}
