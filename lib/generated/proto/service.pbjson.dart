///
//  Generated code. Do not modify.
//  source: proto/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fallibleResponseDescriptor instead')
const FallibleResponse$json = {
  '1': 'FallibleResponse',
  '2': [
    {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.hat_game.error.Empty', '9': 0, '10': 'ok'},
    {
      '1': 'err',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hat_game.error.ProtocolError',
      '9': 0,
      '10': 'err'
    },
  ],
  '8': [
    {'1': 'result'},
  ],
};

/// Descriptor for `FallibleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fallibleResponseDescriptor = $convert.base64Decode(
    'ChBGYWxsaWJsZVJlc3BvbnNlEicKAm9rGAEgASgLMhUuaGF0X2dhbWUuZXJyb3IuRW1wdHlIAFICb2sSMQoDZXJyGAIgASgLMh0uaGF0X2dhbWUuZXJyb3IuUHJvdG9jb2xFcnJvckgAUgNlcnJCCAoGcmVzdWx0');
@$core.Deprecated('Use lobbyJoinRequestDescriptor instead')
const LobbyJoinRequest$json = {
  '1': 'LobbyJoinRequest',
  '2': [
    {'1': 'player_name', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
  ],
};

/// Descriptor for `LobbyJoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyJoinRequestDescriptor =
    $convert.base64Decode('ChBMb2JieUpvaW5SZXF1ZXN0Eh8KC3BsYXllcl9uYW1lGAEgASgJUgpwbGF5ZXJOYW1l');
@$core.Deprecated('Use lobbyJoinResponseDescriptor instead')
const LobbyJoinResponse$json = {
  '1': 'LobbyJoinResponse',
  '2': [
    {'1': 'ok', '3': 1, '4': 1, '5': 7, '9': 0, '10': 'ok'},
    {
      '1': 'err',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hat_game.error.ProtocolError',
      '9': 0,
      '10': 'err'
    },
  ],
  '8': [
    {'1': 'result'},
  ],
};

/// Descriptor for `LobbyJoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyJoinResponseDescriptor = $convert.base64Decode(
    'ChFMb2JieUpvaW5SZXNwb25zZRIQCgJvaxgBIAEoB0gAUgJvaxIxCgNlcnIYAiABKAsyHS5oYXRfZ2FtZS5lcnJvci5Qcm90b2NvbEVycm9ySABSA2VyckIICgZyZXN1bHQ=');
@$core.Deprecated('Use lobbyPlayerReadyRequestDescriptor instead')
const LobbyPlayerReadyRequest$json = {
  '1': 'LobbyPlayerReadyRequest',
  '2': [
    {
      '1': 'characters',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.hat_game.state.Character',
      '10': 'characters'
    },
  ],
};

/// Descriptor for `LobbyPlayerReadyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyPlayerReadyRequestDescriptor = $convert.base64Decode(
    'ChdMb2JieVBsYXllclJlYWR5UmVxdWVzdBI5CgpjaGFyYWN0ZXJzGAIgAygLMhkuaGF0X2dhbWUuc3RhdGUuQ2hhcmFjdGVyUgpjaGFyYWN0ZXJz');
@$core.Deprecated('Use endTurnRequestDescriptor instead')
const EndTurnRequest$json = {
  '1': 'EndTurnRequest',
  '2': [
    {'1': 'reason', '3': 2, '4': 1, '5': 14, '6': '.hat_game.state.TurnEndReason', '10': 'reason'},
    {
      '1': 'guessed',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.CharacterIdList',
      '10': 'guessed'
    },
  ],
};

/// Descriptor for `EndTurnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endTurnRequestDescriptor = $convert.base64Decode(
    'Cg5FbmRUdXJuUmVxdWVzdBI1CgZyZWFzb24YAiABKA4yHS5oYXRfZ2FtZS5zdGF0ZS5UdXJuRW5kUmVhc29uUgZyZWFzb24SOQoHZ3Vlc3NlZBgDIAEoCzIfLmhhdF9nYW1lLnN0YXRlLkNoYXJhY3RlcklkTGlzdFIHZ3Vlc3NlZA==');
@$core.Deprecated('Use castVoteRequestDescriptor instead')
const CastVoteRequest$json = {
  '1': 'CastVoteRequest',
  '2': [
    {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.VoteResult', '10': 'result'},
  ],
};

/// Descriptor for `CastVoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List castVoteRequestDescriptor = $convert.base64Decode(
    'Cg9DYXN0Vm90ZVJlcXVlc3QSMgoGcmVzdWx0GAIgASgLMhouaGF0X2dhbWUuc3RhdGUuVm90ZVJlc3VsdFIGcmVzdWx0');
