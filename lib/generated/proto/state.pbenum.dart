///
//  Generated code. Do not modify.
//  source: proto/state.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TurnEndReason extends $pb.ProtobufEnum {
  static const TurnEndReason TIMEOUT =
      TurnEndReason._(0, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMEOUT');
  static const TurnEndReason MANUAL =
      TurnEndReason._(1, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MANUAL');

  static const $core.List<TurnEndReason> values = <TurnEndReason>[
    TIMEOUT,
    MANUAL,
  ];

  static final $core.Map<$core.int, TurnEndReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TurnEndReason? valueOf($core.int value) => _byValue[value];

  const TurnEndReason._($core.int v, $core.String n) : super(v, n);
}

class CharacterVoteOutcome extends $pb.ProtobufEnum {
  static const CharacterVoteOutcome APPROVED = CharacterVoteOutcome._(
      0, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APPROVED');
  static const CharacterVoteOutcome REJECTED = CharacterVoteOutcome._(
      1, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REJECTED');

  static const $core.List<CharacterVoteOutcome> values = <CharacterVoteOutcome>[
    APPROVED,
    REJECTED,
  ];

  static final $core.Map<$core.int, CharacterVoteOutcome> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CharacterVoteOutcome? valueOf($core.int value) => _byValue[value];

  const CharacterVoteOutcome._($core.int v, $core.String n) : super(v, n);
}
