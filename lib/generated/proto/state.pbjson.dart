///
//  Generated code. Do not modify.
//  source: proto/state.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use playerStatusDescriptor instead')
const PlayerStatus$json = {
  '1': 'PlayerStatus',
  '2': [
    {'1': 'JOINING', '2': 0},
    {'1': 'CONNECTED', '2': 1},
    {'1': 'DISCONNECTED', '2': 2},
  ],
};

/// Descriptor for `PlayerStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List playerStatusDescriptor = $convert.base64Decode(
    'CgxQbGF5ZXJTdGF0dXMSCwoHSk9JTklORxAAEg0KCUNPTk5FQ1RFRBABEhAKDERJU0NPTk5FQ1RFRBAC');
@$core.Deprecated('Use turnEndReasonDescriptor instead')
const TurnEndReason$json = {
  '1': 'TurnEndReason',
  '2': [
    {'1': 'TIMEOUT', '2': 0},
    {'1': 'MANUAL', '2': 1},
  ],
};

/// Descriptor for `TurnEndReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List turnEndReasonDescriptor =
    $convert.base64Decode('Cg1UdXJuRW5kUmVhc29uEgsKB1RJTUVPVVQQABIKCgZNQU5VQUwQAQ==');
@$core.Deprecated('Use characterVoteOutcomeDescriptor instead')
const CharacterVoteOutcome$json = {
  '1': 'CharacterVoteOutcome',
  '2': [
    {'1': 'APPROVED', '2': 0},
    {'1': 'REJECTED', '2': 1},
  ],
};

/// Descriptor for `CharacterVoteOutcome`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List characterVoteOutcomeDescriptor =
    $convert.base64Decode('ChRDaGFyYWN0ZXJWb3RlT3V0Y29tZRIMCghBUFBST1ZFRBAAEgwKCFJFSkVDVEVEEAE=');
@$core.Deprecated('Use gameStateDescriptor instead')
const GameState$json = {
  '1': 'GameState',
  '2': [
    {'1': 'rev', '3': 1, '4': 1, '5': 13, '10': 'rev'},
    {
      '1': 'players',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.hat_game.state.GameState.PlayersEntry',
      '10': 'players'
    },
    {'1': 'host_id', '3': 3, '4': 1, '5': 7, '10': 'hostId'},
    {'1': 'settings', '3': 4, '4': 1, '5': 11, '6': '.hat_game.state.Settings', '10': 'settings'},
    {'1': 'lobby', '3': 5, '4': 1, '5': 11, '6': '.hat_game.state.Lobby', '9': 0, '10': 'lobby'},
    {
      '1': 'preparing',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.RunningGameState',
      '9': 0,
      '10': 'preparing'
    },
    {'1': 'round', '3': 7, '4': 1, '5': 11, '6': '.hat_game.state.Round', '9': 0, '10': 'round'},
    {
      '1': 'finished',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.RunningGameState',
      '9': 0,
      '10': 'finished'
    },
  ],
  '3': [GameState_PlayersEntry$json],
  '8': [
    {'1': 'stage'},
  ],
};

@$core.Deprecated('Use gameStateDescriptor instead')
const GameState_PlayersEntry$json = {
  '1': 'PlayersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.Player', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GameState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameStateDescriptor = $convert.base64Decode(
    'CglHYW1lU3RhdGUSEAoDcmV2GAEgASgNUgNyZXYSQAoHcGxheWVycxgCIAMoCzImLmhhdF9nYW1lLnN0YXRlLkdhbWVTdGF0ZS5QbGF5ZXJzRW50cnlSB3BsYXllcnMSFwoHaG9zdF9pZBgDIAEoB1IGaG9zdElkEjQKCHNldHRpbmdzGAQgASgLMhguaGF0X2dhbWUuc3RhdGUuU2V0dGluZ3NSCHNldHRpbmdzEi0KBWxvYmJ5GAUgASgLMhUuaGF0X2dhbWUuc3RhdGUuTG9iYnlIAFIFbG9iYnkSQAoJcHJlcGFyaW5nGAYgASgLMiAuaGF0X2dhbWUuc3RhdGUuUnVubmluZ0dhbWVTdGF0ZUgAUglwcmVwYXJpbmcSLQoFcm91bmQYByABKAsyFS5oYXRfZ2FtZS5zdGF0ZS5Sb3VuZEgAUgVyb3VuZBI+CghmaW5pc2hlZBgIIAEoCzIgLmhhdF9nYW1lLnN0YXRlLlJ1bm5pbmdHYW1lU3RhdGVIAFIIZmluaXNoZWQaUgoMUGxheWVyc0VudHJ5EhAKA2tleRgBIAEoB1IDa2V5EiwKBXZhbHVlGAIgASgLMhYuaGF0X2dhbWUuc3RhdGUuUGxheWVyUgV2YWx1ZToCOAFCBwoFc3RhZ2U=');
@$core.Deprecated('Use playerDescriptor instead')
const Player$json = {
  '1': 'Player',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.hat_game.state.PlayerStatus', '10': 'status'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'slug', '3': 3, '4': 1, '5': 9, '10': 'slug'},
    {'1': 'order', '3': 4, '4': 1, '5': 13, '10': 'order'},
  ],
};

/// Descriptor for `Player`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDescriptor = $convert.base64Decode(
    'CgZQbGF5ZXISNAoGc3RhdHVzGAEgASgOMhwuaGF0X2dhbWUuc3RhdGUuUGxheWVyU3RhdHVzUgZzdGF0dXMSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgRzbHVnGAMgASgJUgRzbHVnEhQKBW9yZGVyGAQgASgNUgVvcmRlcg==');
@$core.Deprecated('Use settingsDescriptor instead')
const Settings$json = {
  '1': 'Settings',
  '2': [
    {'1': 'character_count', '3': 1, '4': 1, '5': 13, '10': 'characterCount'},
    {'1': 'turn_duration_s', '3': 2, '4': 1, '5': 13, '10': 'turnDurationS'},
    {'1': 'vote_timeout_s', '3': 3, '4': 1, '5': 13, '10': 'voteTimeoutS'},
    {'1': 'start_timeout_s', '3': 4, '4': 1, '5': 13, '10': 'startTimeoutS'},
    {'1': 'confirm_timeout_s', '3': 5, '4': 1, '5': 13, '10': 'confirmTimeoutS'},
  ],
};

/// Descriptor for `Settings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingsDescriptor = $convert.base64Decode(
    'CghTZXR0aW5ncxInCg9jaGFyYWN0ZXJfY291bnQYASABKA1SDmNoYXJhY3RlckNvdW50EiYKD3R1cm5fZHVyYXRpb25fcxgCIAEoDVINdHVybkR1cmF0aW9uUxIkCg52b3RlX3RpbWVvdXRfcxgDIAEoDVIMdm90ZVRpbWVvdXRTEiYKD3N0YXJ0X3RpbWVvdXRfcxgEIAEoDVINc3RhcnRUaW1lb3V0UxIqChFjb25maXJtX3RpbWVvdXRfcxgFIAEoDVIPY29uZmlybVRpbWVvdXRT');
@$core.Deprecated('Use characterDescriptor instead')
const Character$json = {
  '1': 'Character',
  '2': [
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Character`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterDescriptor = $convert.base64Decode(
    'CglDaGFyYWN0ZXISFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbg==');
@$core.Deprecated('Use lobbyDescriptor instead')
const Lobby$json = {
  '1': 'Lobby',
  '2': [
    {'1': 'state', '3': 1, '4': 3, '5': 11, '6': '.hat_game.state.Lobby.StateEntry', '10': 'state'},
  ],
  '3': [Lobby_StateEntry$json],
};

@$core.Deprecated('Use lobbyDescriptor instead')
const Lobby_StateEntry$json = {
  '1': 'StateEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.PlayerLobbyState', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Lobby`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyDescriptor = $convert.base64Decode(
    'CgVMb2JieRI2CgVzdGF0ZRgBIAMoCzIgLmhhdF9nYW1lLnN0YXRlLkxvYmJ5LlN0YXRlRW50cnlSBXN0YXRlGloKClN0YXRlRW50cnkSEAoDa2V5GAEgASgHUgNrZXkSNgoFdmFsdWUYAiABKAsyIC5oYXRfZ2FtZS5zdGF0ZS5QbGF5ZXJMb2JieVN0YXRlUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use playerLobbyStateDescriptor instead')
const PlayerLobbyState$json = {
  '1': 'PlayerLobbyState',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.hat_game.state.Character', '10': 'value'},
  ],
};

/// Descriptor for `PlayerLobbyState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerLobbyStateDescriptor = $convert.base64Decode(
    'ChBQbGF5ZXJMb2JieVN0YXRlEi8KBXZhbHVlGAEgAygLMhkuaGF0X2dhbWUuc3RhdGUuQ2hhcmFjdGVyUgV2YWx1ZQ==');
@$core.Deprecated('Use runningGameStateDescriptor instead')
const RunningGameState$json = {
  '1': 'RunningGameState',
  '2': [
    {'1': 'teams', '3': 1, '4': 1, '5': 11, '6': '.hat_game.state.TeamList', '10': 'teams'},
    {
      '1': 'characters',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.hat_game.state.RunningGameState.CharactersEntry',
      '10': 'characters'
    },
    {
      '1': 'round_points',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.RoundPoints',
      '10': 'roundPoints'
    },
  ],
  '3': [RunningGameState_CharactersEntry$json],
};

@$core.Deprecated('Use runningGameStateDescriptor instead')
const RunningGameState_CharactersEntry$json = {
  '1': 'CharactersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 6, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.Character', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RunningGameState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runningGameStateDescriptor = $convert.base64Decode(
    'ChBSdW5uaW5nR2FtZVN0YXRlEi4KBXRlYW1zGAEgASgLMhguaGF0X2dhbWUuc3RhdGUuVGVhbUxpc3RSBXRlYW1zElAKCmNoYXJhY3RlcnMYAiADKAsyMC5oYXRfZ2FtZS5zdGF0ZS5SdW5uaW5nR2FtZVN0YXRlLkNoYXJhY3RlcnNFbnRyeVIKY2hhcmFjdGVycxI+Cgxyb3VuZF9wb2ludHMYAyABKAsyGy5oYXRfZ2FtZS5zdGF0ZS5Sb3VuZFBvaW50c1ILcm91bmRQb2ludHMaWAoPQ2hhcmFjdGVyc0VudHJ5EhAKA2tleRgBIAEoBlIDa2V5Ei8KBXZhbHVlGAIgASgLMhkuaGF0X2dhbWUuc3RhdGUuQ2hhcmFjdGVyUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use roundPointsDescriptor instead')
const RoundPoints$json = {
  '1': 'RoundPoints',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.hat_game.state.PlayerPoints', '10': 'value'},
  ],
};

/// Descriptor for `RoundPoints`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roundPointsDescriptor = $convert.base64Decode(
    'CgtSb3VuZFBvaW50cxIyCgV2YWx1ZRgBIAMoCzIcLmhhdF9nYW1lLnN0YXRlLlBsYXllclBvaW50c1IFdmFsdWU=');
@$core.Deprecated('Use teamDescriptor instead')
const Team$json = {
  '1': 'Team',
  '2': [
    {'1': 'first_player_id', '3': 1, '4': 1, '5': 7, '10': 'firstPlayerId'},
    {'1': 'second_player_id', '3': 2, '4': 1, '5': 7, '10': 'secondPlayerId'},
    {'1': 'props', '3': 3, '4': 1, '5': 11, '6': '.hat_game.state.TeamProps', '10': 'props'},
  ],
};

/// Descriptor for `Team`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamDescriptor = $convert.base64Decode(
    'CgRUZWFtEiYKD2ZpcnN0X3BsYXllcl9pZBgBIAEoB1INZmlyc3RQbGF5ZXJJZBIoChBzZWNvbmRfcGxheWVyX2lkGAIgASgHUg5zZWNvbmRQbGF5ZXJJZBIvCgVwcm9wcxgDIAEoCzIZLmhhdF9nYW1lLnN0YXRlLlRlYW1Qcm9wc1IFcHJvcHM=');
@$core.Deprecated('Use teamPropsDescriptor instead')
const TeamProps$json = {
  '1': 'TeamProps',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'style_id', '3': 2, '4': 1, '5': 13, '10': 'styleId'},
  ],
};

/// Descriptor for `TeamProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamPropsDescriptor = $convert.base64Decode(
    'CglUZWFtUHJvcHMSEgoEbmFtZRgBIAEoCVIEbmFtZRIZCghzdHlsZV9pZBgCIAEoDVIHc3R5bGVJZA==');
@$core.Deprecated('Use teamListDescriptor instead')
const TeamList$json = {
  '1': 'TeamList',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.hat_game.state.Team', '10': 'value'},
  ],
};

/// Descriptor for `TeamList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamListDescriptor = $convert
    .base64Decode('CghUZWFtTGlzdBIqCgV2YWx1ZRgBIAMoCzIULmhhdF9nYW1lLnN0YXRlLlRlYW1SBXZhbHVl');
@$core.Deprecated('Use playerPointsDescriptor instead')
const PlayerPoints$json = {
  '1': 'PlayerPoints',
  '2': [
    {
      '1': 'value',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.hat_game.state.PlayerPoints.ValueEntry',
      '10': 'value'
    },
  ],
  '3': [PlayerPoints_ValueEntry$json],
};

@$core.Deprecated('Use playerPointsDescriptor instead')
const PlayerPoints_ValueEntry$json = {
  '1': 'ValueEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.CharacterIdList', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PlayerPoints`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerPointsDescriptor = $convert.base64Decode(
    'CgxQbGF5ZXJQb2ludHMSPQoFdmFsdWUYASADKAsyJy5oYXRfZ2FtZS5zdGF0ZS5QbGF5ZXJQb2ludHMuVmFsdWVFbnRyeVIFdmFsdWUaWQoKVmFsdWVFbnRyeRIQCgNrZXkYASABKAdSA2tleRI1CgV2YWx1ZRgCIAEoCzIfLmhhdF9nYW1lLnN0YXRlLkNoYXJhY3RlcklkTGlzdFIFdmFsdWU6AjgB');
@$core.Deprecated('Use characterIdListDescriptor instead')
const CharacterIdList$json = {
  '1': 'CharacterIdList',
  '2': [
    {'1': 'characters', '3': 1, '4': 3, '5': 6, '10': 'characters'},
  ],
};

/// Descriptor for `CharacterIdList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterIdListDescriptor =
    $convert.base64Decode('Cg9DaGFyYWN0ZXJJZExpc3QSHgoKY2hhcmFjdGVycxgBIAMoBlIKY2hhcmFjdGVycw==');
@$core.Deprecated('Use roundDescriptor instead')
const Round$json = {
  '1': 'Round',
  '2': [
    {'1': 'round_index', '3': 1, '4': 1, '5': 13, '10': 'roundIndex'},
    {'1': 'turn_index', '3': 2, '4': 1, '5': 13, '10': 'turnIndex'},
    {'1': 'paused', '3': 3, '4': 1, '5': 8, '10': 'paused'},
    {
      '1': 'character_pool',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.CharacterIdList',
      '10': 'characterPool'
    },
    {
      '1': 'player_points',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.PlayerPoints',
      '10': 'playerPoints'
    },
    {'1': 'state', '3': 6, '4': 1, '5': 11, '6': '.hat_game.state.RunningGameState', '10': 'state'},
    {
      '1': 'overview',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.TurnOverview',
      '9': 0,
      '10': 'overview'
    },
    {
      '1': 'prepare',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.TurnPrepare',
      '9': 0,
      '10': 'prepare'
    },
    {
      '1': 'active',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.TurnActive',
      '9': 0,
      '10': 'active'
    },
    {'1': 'vote', '3': 10, '4': 1, '5': 11, '6': '.hat_game.state.TurnVote', '9': 0, '10': 'vote'},
    {
      '1': 'vote_count',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.TurnVoteCount',
      '9': 0,
      '10': 'voteCount'
    },
  ],
  '8': [
    {'1': 'turn_state'},
  ],
};

/// Descriptor for `Round`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roundDescriptor = $convert.base64Decode(
    'CgVSb3VuZBIfCgtyb3VuZF9pbmRleBgBIAEoDVIKcm91bmRJbmRleBIdCgp0dXJuX2luZGV4GAIgASgNUgl0dXJuSW5kZXgSFgoGcGF1c2VkGAMgASgIUgZwYXVzZWQSRgoOY2hhcmFjdGVyX3Bvb2wYBCABKAsyHy5oYXRfZ2FtZS5zdGF0ZS5DaGFyYWN0ZXJJZExpc3RSDWNoYXJhY3RlclBvb2wSQQoNcGxheWVyX3BvaW50cxgFIAEoCzIcLmhhdF9nYW1lLnN0YXRlLlBsYXllclBvaW50c1IMcGxheWVyUG9pbnRzEjYKBXN0YXRlGAYgASgLMiAuaGF0X2dhbWUuc3RhdGUuUnVubmluZ0dhbWVTdGF0ZVIFc3RhdGUSOgoIb3ZlcnZpZXcYByABKAsyHC5oYXRfZ2FtZS5zdGF0ZS5UdXJuT3ZlcnZpZXdIAFIIb3ZlcnZpZXcSNwoHcHJlcGFyZRgIIAEoCzIbLmhhdF9nYW1lLnN0YXRlLlR1cm5QcmVwYXJlSABSB3ByZXBhcmUSNAoGYWN0aXZlGAkgASgLMhouaGF0X2dhbWUuc3RhdGUuVHVybkFjdGl2ZUgAUgZhY3RpdmUSLgoEdm90ZRgKIAEoCzIYLmhhdF9nYW1lLnN0YXRlLlR1cm5Wb3RlSABSBHZvdGUSPgoKdm90ZV9jb3VudBgLIAEoCzIdLmhhdF9nYW1lLnN0YXRlLlR1cm5Wb3RlQ291bnRIAFIJdm90ZUNvdW50QgwKCnR1cm5fc3RhdGU=');
@$core.Deprecated('Use turnOverviewDescriptor instead')
const TurnOverview$json = {
  '1': 'TurnOverview',
};

/// Descriptor for `TurnOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List turnOverviewDescriptor = $convert.base64Decode('CgxUdXJuT3ZlcnZpZXc=');
@$core.Deprecated('Use turnPrepareDescriptor instead')
const TurnPrepare$json = {
  '1': 'TurnPrepare',
};

/// Descriptor for `TurnPrepare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List turnPrepareDescriptor = $convert.base64Decode('CgtUdXJuUHJlcGFyZQ==');
@$core.Deprecated('Use turnActiveDescriptor instead')
const TurnActive$json = {
  '1': 'TurnActive',
};

/// Descriptor for `TurnActive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List turnActiveDescriptor = $convert.base64Decode('CgpUdXJuQWN0aXZl');
@$core.Deprecated('Use turnVoteDescriptor instead')
const TurnVote$json = {
  '1': 'TurnVote',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 14, '6': '.hat_game.state.TurnEndReason', '10': 'reason'},
    {
      '1': 'guessed',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.CharacterIdList',
      '10': 'guessed'
    },
    {
      '1': 'player_vote',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.hat_game.state.TurnVote.PlayerVoteEntry',
      '10': 'playerVote'
    },
  ],
  '3': [TurnVote_PlayerVoteEntry$json],
};

@$core.Deprecated('Use turnVoteDescriptor instead')
const TurnVote_PlayerVoteEntry$json = {
  '1': 'PlayerVoteEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 7, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.VoteResult', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TurnVote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List turnVoteDescriptor = $convert.base64Decode(
    'CghUdXJuVm90ZRI1CgZyZWFzb24YASABKA4yHS5oYXRfZ2FtZS5zdGF0ZS5UdXJuRW5kUmVhc29uUgZyZWFzb24SOQoHZ3Vlc3NlZBgCIAEoCzIfLmhhdF9nYW1lLnN0YXRlLkNoYXJhY3RlcklkTGlzdFIHZ3Vlc3NlZBJJCgtwbGF5ZXJfdm90ZRgDIAMoCzIoLmhhdF9nYW1lLnN0YXRlLlR1cm5Wb3RlLlBsYXllclZvdGVFbnRyeVIKcGxheWVyVm90ZRpZCg9QbGF5ZXJWb3RlRW50cnkSEAoDa2V5GAEgASgHUgNrZXkSMAoFdmFsdWUYAiABKAsyGi5oYXRfZ2FtZS5zdGF0ZS5Wb3RlUmVzdWx0UgV2YWx1ZToCOAE=');
@$core.Deprecated('Use voteResultDescriptor instead')
const VoteResult$json = {
  '1': 'VoteResult',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.hat_game.state.CharacterVote', '10': 'value'},
  ],
};

/// Descriptor for `VoteResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteResultDescriptor = $convert.base64Decode(
    'CgpWb3RlUmVzdWx0EjMKBXZhbHVlGAEgAygLMh0uaGF0X2dhbWUuc3RhdGUuQ2hhcmFjdGVyVm90ZVIFdmFsdWU=');
@$core.Deprecated('Use characterVoteDescriptor instead')
const CharacterVote$json = {
  '1': 'CharacterVote',
  '2': [
    {'1': 'character_id', '3': 1, '4': 1, '5': 6, '10': 'characterId'},
    {
      '1': 'outcome',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.hat_game.state.CharacterVoteOutcome',
      '10': 'outcome'
    },
  ],
};

/// Descriptor for `CharacterVote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterVoteDescriptor = $convert.base64Decode(
    'Cg1DaGFyYWN0ZXJWb3RlEiEKDGNoYXJhY3Rlcl9pZBgBIAEoBlILY2hhcmFjdGVySWQSPgoHb3V0Y29tZRgCIAEoDjIkLmhhdF9nYW1lLnN0YXRlLkNoYXJhY3RlclZvdGVPdXRjb21lUgdvdXRjb21l');
@$core.Deprecated('Use turnVoteCountDescriptor instead')
const TurnVoteCount$json = {
  '1': 'TurnVoteCount',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.hat_game.state.VoteResult', '10': 'result'},
  ],
};

/// Descriptor for `TurnVoteCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List turnVoteCountDescriptor = $convert.base64Decode(
    'Cg1UdXJuVm90ZUNvdW50EjIKBnJlc3VsdBgBIAEoCzIaLmhhdF9nYW1lLnN0YXRlLlZvdGVSZXN1bHRSBnJlc3VsdA==');
@$core.Deprecated('Use gameStatePatchDescriptor instead')
const GameStatePatch$json = {
  '1': 'GameStatePatch',
  '2': [
    {'1': 'rev', '3': 1, '4': 1, '5': 13, '10': 'rev'},
    {'1': 'confirm', '3': 2, '4': 1, '5': 8, '10': 'confirm'},
    {
      '1': 'player_joined',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerJoined',
      '9': 0,
      '10': 'playerJoined'
    },
    {
      '1': 'player_left',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerLeft',
      '9': 0,
      '10': 'playerLeft'
    },
    {
      '1': 'player_ready',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerReady',
      '9': 0,
      '10': 'playerReady'
    },
    {
      '1': 'player_not_ready',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerNotReady',
      '9': 0,
      '10': 'playerNotReady'
    },
    {
      '1': 'player_disconnected',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerDisconnected',
      '9': 0,
      '10': 'playerDisconnected'
    },
    {
      '1': 'player_connected',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerConnected',
      '9': 0,
      '10': 'playerConnected'
    },
    {
      '1': 'prepare_start',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPrepareStart',
      '9': 0,
      '10': 'prepareStart'
    },
    {'1': 'pause', '3': 17, '4': 1, '5': 11, '6': '.hat_game.state.DoPause', '9': 0, '10': 'pause'},
    {
      '1': 'round_next',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoNextRound',
      '9': 0,
      '10': 'roundNext'
    },
    {
      '1': 'turn_next',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoNextTurn',
      '9': 0,
      '10': 'turnNext'
    },
    {
      '1': 'turn_start',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoStartTurn',
      '9': 0,
      '10': 'turnStart'
    },
    {
      '1': 'turn_end',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoEndTurn',
      '9': 0,
      '10': 'turnEnd'
    },
    {
      '1': 'vote_player',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoPlayerVoted',
      '9': 0,
      '10': 'votePlayer'
    },
    {
      '1': 'vote_count',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoVoteCount',
      '9': 0,
      '10': 'voteCount'
    },
    {
      '1': 'game_finished',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.DoGameFinished',
      '9': 0,
      '10': 'gameFinished'
    },
  ],
  '8': [
    {'1': 'kind'},
  ],
};

/// Descriptor for `GameStatePatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameStatePatchDescriptor = $convert.base64Decode(
    'Cg5HYW1lU3RhdGVQYXRjaBIQCgNyZXYYASABKA1SA3JldhIYCgdjb25maXJtGAIgASgIUgdjb25maXJtEkUKDXBsYXllcl9qb2luZWQYCiABKAsyHi5oYXRfZ2FtZS5zdGF0ZS5Eb1BsYXllckpvaW5lZEgAUgxwbGF5ZXJKb2luZWQSPwoLcGxheWVyX2xlZnQYCyABKAsyHC5oYXRfZ2FtZS5zdGF0ZS5Eb1BsYXllckxlZnRIAFIKcGxheWVyTGVmdBJCCgxwbGF5ZXJfcmVhZHkYDCABKAsyHS5oYXRfZ2FtZS5zdGF0ZS5Eb1BsYXllclJlYWR5SABSC3BsYXllclJlYWR5EkwKEHBsYXllcl9ub3RfcmVhZHkYDSABKAsyIC5oYXRfZ2FtZS5zdGF0ZS5Eb1BsYXllck5vdFJlYWR5SABSDnBsYXllck5vdFJlYWR5ElcKE3BsYXllcl9kaXNjb25uZWN0ZWQYDiABKAsyJC5oYXRfZ2FtZS5zdGF0ZS5Eb1BsYXllckRpc2Nvbm5lY3RlZEgAUhJwbGF5ZXJEaXNjb25uZWN0ZWQSTgoQcGxheWVyX2Nvbm5lY3RlZBgPIAEoCzIhLmhhdF9nYW1lLnN0YXRlLkRvUGxheWVyQ29ubmVjdGVkSABSD3BsYXllckNvbm5lY3RlZBJFCg1wcmVwYXJlX3N0YXJ0GBAgASgLMh4uaGF0X2dhbWUuc3RhdGUuRG9QcmVwYXJlU3RhcnRIAFIMcHJlcGFyZVN0YXJ0Ei8KBXBhdXNlGBEgASgLMhcuaGF0X2dhbWUuc3RhdGUuRG9QYXVzZUgAUgVwYXVzZRI8Cgpyb3VuZF9uZXh0GBIgASgLMhsuaGF0X2dhbWUuc3RhdGUuRG9OZXh0Um91bmRIAFIJcm91bmROZXh0EjkKCXR1cm5fbmV4dBgTIAEoCzIaLmhhdF9nYW1lLnN0YXRlLkRvTmV4dFR1cm5IAFIIdHVybk5leHQSPAoKdHVybl9zdGFydBgUIAEoCzIbLmhhdF9nYW1lLnN0YXRlLkRvU3RhcnRUdXJuSABSCXR1cm5TdGFydBI2Cgh0dXJuX2VuZBgVIAEoCzIZLmhhdF9nYW1lLnN0YXRlLkRvRW5kVHVybkgAUgd0dXJuRW5kEkAKC3ZvdGVfcGxheWVyGBYgASgLMh0uaGF0X2dhbWUuc3RhdGUuRG9QbGF5ZXJWb3RlZEgAUgp2b3RlUGxheWVyEjwKCnZvdGVfY291bnQYFyABKAsyGy5oYXRfZ2FtZS5zdGF0ZS5Eb1ZvdGVDb3VudEgAUgl2b3RlQ291bnQSRQoNZ2FtZV9maW5pc2hlZBgYIAEoCzIeLmhhdF9nYW1lLnN0YXRlLkRvR2FtZUZpbmlzaGVkSABSDGdhbWVGaW5pc2hlZEIGCgRraW5k');
@$core.Deprecated('Use doHandshakeDescriptor instead')
const DoHandshake$json = {
  '1': 'DoHandshake',
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

/// Descriptor for `DoHandshake`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doHandshakeDescriptor = $convert.base64Decode(
    'CgtEb0hhbmRzaGFrZRInCgJvaxgBIAEoCzIVLmhhdF9nYW1lLmVycm9yLkVtcHR5SABSAm9rEjEKA2VychgCIAEoCzIdLmhhdF9nYW1lLmVycm9yLlByb3RvY29sRXJyb3JIAFIDZXJyQggKBnJlc3VsdA==');
@$core.Deprecated('Use doGameClosedDescriptor instead')
const DoGameClosed$json = {
  '1': 'DoGameClosed',
};

/// Descriptor for `DoGameClosed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doGameClosedDescriptor = $convert.base64Decode('CgxEb0dhbWVDbG9zZWQ=');
@$core.Deprecated('Use doRewindDescriptor instead')
const DoRewind$json = {
  '1': 'DoRewind',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.hat_game.state.GameState', '10': 'state'},
  ],
};

/// Descriptor for `DoRewind`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doRewindDescriptor = $convert.base64Decode(
    'CghEb1Jld2luZBIvCgVzdGF0ZRgBIAEoCzIZLmhhdF9nYW1lLnN0YXRlLkdhbWVTdGF0ZVIFc3RhdGU=');
@$core.Deprecated('Use doPlayerJoinedDescriptor instead')
const DoPlayerJoined$json = {
  '1': 'DoPlayerJoined',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
    {'1': 'player', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.Player', '10': 'player'},
  ],
};

/// Descriptor for `DoPlayerJoined`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerJoinedDescriptor = $convert.base64Decode(
    'Cg5Eb1BsYXllckpvaW5lZBIbCglwbGF5ZXJfaWQYASABKAdSCHBsYXllcklkEi4KBnBsYXllchgCIAEoCzIWLmhhdF9nYW1lLnN0YXRlLlBsYXllclIGcGxheWVy');
@$core.Deprecated('Use doPlayerLeftDescriptor instead')
const DoPlayerLeft$json = {
  '1': 'DoPlayerLeft',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
  ],
};

/// Descriptor for `DoPlayerLeft`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerLeftDescriptor =
    $convert.base64Decode('CgxEb1BsYXllckxlZnQSGwoJcGxheWVyX2lkGAEgASgHUghwbGF5ZXJJZA==');
@$core.Deprecated('Use doPlayerReadyDescriptor instead')
const DoPlayerReady$json = {
  '1': 'DoPlayerReady',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
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

/// Descriptor for `DoPlayerReady`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerReadyDescriptor = $convert.base64Decode(
    'Cg1Eb1BsYXllclJlYWR5EhsKCXBsYXllcl9pZBgBIAEoB1IIcGxheWVySWQSOQoKY2hhcmFjdGVycxgCIAMoCzIZLmhhdF9nYW1lLnN0YXRlLkNoYXJhY3RlclIKY2hhcmFjdGVycw==');
@$core.Deprecated('Use doPlayerNotReadyDescriptor instead')
const DoPlayerNotReady$json = {
  '1': 'DoPlayerNotReady',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
  ],
};

/// Descriptor for `DoPlayerNotReady`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerNotReadyDescriptor =
    $convert.base64Decode('ChBEb1BsYXllck5vdFJlYWR5EhsKCXBsYXllcl9pZBgBIAEoB1IIcGxheWVySWQ=');
@$core.Deprecated('Use doPlayerDisconnectedDescriptor instead')
const DoPlayerDisconnected$json = {
  '1': 'DoPlayerDisconnected',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
  ],
};

/// Descriptor for `DoPlayerDisconnected`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerDisconnectedDescriptor =
    $convert.base64Decode('ChREb1BsYXllckRpc2Nvbm5lY3RlZBIbCglwbGF5ZXJfaWQYASABKAdSCHBsYXllcklk');
@$core.Deprecated('Use doPlayerConnectedDescriptor instead')
const DoPlayerConnected$json = {
  '1': 'DoPlayerConnected',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
  ],
};

/// Descriptor for `DoPlayerConnected`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerConnectedDescriptor =
    $convert.base64Decode('ChFEb1BsYXllckNvbm5lY3RlZBIbCglwbGF5ZXJfaWQYASABKAdSCHBsYXllcklk');
@$core.Deprecated('Use doPrepareStartDescriptor instead')
const DoPrepareStart$json = {
  '1': 'DoPrepareStart',
  '2': [
    {'1': 'teams', '3': 1, '4': 1, '5': 11, '6': '.hat_game.state.TeamList', '10': 'teams'},
  ],
};

/// Descriptor for `DoPrepareStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPrepareStartDescriptor = $convert.base64Decode(
    'Cg5Eb1ByZXBhcmVTdGFydBIuCgV0ZWFtcxgBIAEoCzIYLmhhdF9nYW1lLnN0YXRlLlRlYW1MaXN0UgV0ZWFtcw==');
@$core.Deprecated('Use doPauseDescriptor instead')
const DoPause$json = {
  '1': 'DoPause',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 8, '10': 'state'},
  ],
};

/// Descriptor for `DoPause`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPauseDescriptor =
    $convert.base64Decode('CgdEb1BhdXNlEhQKBXN0YXRlGAEgASgIUgVzdGF0ZQ==');
@$core.Deprecated('Use doNextRoundDescriptor instead')
const DoNextRound$json = {
  '1': 'DoNextRound',
  '2': [
    {'1': 'round_index', '3': 1, '4': 1, '5': 13, '10': 'roundIndex'},
  ],
};

/// Descriptor for `DoNextRound`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doNextRoundDescriptor =
    $convert.base64Decode('CgtEb05leHRSb3VuZBIfCgtyb3VuZF9pbmRleBgBIAEoDVIKcm91bmRJbmRleA==');
@$core.Deprecated('Use doNextTurnDescriptor instead')
const DoNextTurn$json = {
  '1': 'DoNextTurn',
  '2': [
    {'1': 'turn_index', '3': 1, '4': 1, '5': 13, '10': 'turnIndex'},
  ],
};

/// Descriptor for `DoNextTurn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doNextTurnDescriptor =
    $convert.base64Decode('CgpEb05leHRUdXJuEh0KCnR1cm5faW5kZXgYASABKA1SCXR1cm5JbmRleA==');
@$core.Deprecated('Use doStartTurnDescriptor instead')
const DoStartTurn$json = {
  '1': 'DoStartTurn',
};

/// Descriptor for `DoStartTurn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doStartTurnDescriptor = $convert.base64Decode('CgtEb1N0YXJ0VHVybg==');
@$core.Deprecated('Use doEndTurnDescriptor instead')
const DoEndTurn$json = {
  '1': 'DoEndTurn',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 14, '6': '.hat_game.state.TurnEndReason', '10': 'reason'},
    {
      '1': 'guessed',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hat_game.state.CharacterIdList',
      '10': 'guessed'
    },
  ],
};

/// Descriptor for `DoEndTurn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doEndTurnDescriptor = $convert.base64Decode(
    'CglEb0VuZFR1cm4SNQoGcmVhc29uGAEgASgOMh0uaGF0X2dhbWUuc3RhdGUuVHVybkVuZFJlYXNvblIGcmVhc29uEjkKB2d1ZXNzZWQYAiABKAsyHy5oYXRfZ2FtZS5zdGF0ZS5DaGFyYWN0ZXJJZExpc3RSB2d1ZXNzZWQ=');
@$core.Deprecated('Use doPlayerVotedDescriptor instead')
const DoPlayerVoted$json = {
  '1': 'DoPlayerVoted',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 7, '10': 'playerId'},
    {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.hat_game.state.VoteResult', '10': 'result'},
  ],
};

/// Descriptor for `DoPlayerVoted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doPlayerVotedDescriptor = $convert.base64Decode(
    'Cg1Eb1BsYXllclZvdGVkEhsKCXBsYXllcl9pZBgBIAEoB1IIcGxheWVySWQSMgoGcmVzdWx0GAIgASgLMhouaGF0X2dhbWUuc3RhdGUuVm90ZVJlc3VsdFIGcmVzdWx0');
@$core.Deprecated('Use doVoteCountDescriptor instead')
const DoVoteCount$json = {
  '1': 'DoVoteCount',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.hat_game.state.VoteResult', '10': 'result'},
  ],
};

/// Descriptor for `DoVoteCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doVoteCountDescriptor = $convert.base64Decode(
    'CgtEb1ZvdGVDb3VudBIyCgZyZXN1bHQYASABKAsyGi5oYXRfZ2FtZS5zdGF0ZS5Wb3RlUmVzdWx0UgZyZXN1bHQ=');
@$core.Deprecated('Use doGameFinishedDescriptor instead')
const DoGameFinished$json = {
  '1': 'DoGameFinished',
};

/// Descriptor for `DoGameFinished`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doGameFinishedDescriptor =
    $convert.base64Decode('Cg5Eb0dhbWVGaW5pc2hlZA==');
