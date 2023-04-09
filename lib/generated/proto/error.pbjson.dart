///
//  Generated code. Do not modify.
//  source: proto/error.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode$json = {
  '1': 'ErrorCode',
  '2': [
    {'1': 'OTHER', '2': 0},
    {'1': 'MISSING_METADATA', '2': 1},
    {'1': 'EARLY_REVISION', '2': 2},
    {'1': 'INVALID_REVISION', '2': 3},
    {'1': 'PLAYER_NAME_TAKEN', '2': 4},
    {'1': 'PLAYER_NOT_FOUND', '2': 5},
    {'1': 'INVALID_CHARACTER_DATA', '2': 6},
  ],
};

/// Descriptor for `ErrorCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorCodeDescriptor = $convert.base64Decode(
    'CglFcnJvckNvZGUSCQoFT1RIRVIQABIUChBNSVNTSU5HX01FVEFEQVRBEAESEgoORUFSTFlfUkVWSVNJT04QAhIUChBJTlZBTElEX1JFVklTSU9OEAMSFQoRUExBWUVSX05BTUVfVEFLRU4QBBIUChBQTEFZRVJfTk9UX0ZPVU5EEAUSGgoWSU5WQUxJRF9DSEFSQUNURVJfREFUQRAG');
@$core.Deprecated('Use protocolErrorDescriptor instead')
const ProtocolError$json = {
  '1': 'ProtocolError',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.hat_game.error.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `ProtocolError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protocolErrorDescriptor = $convert.base64Decode(
    'Cg1Qcm90b2NvbEVycm9yEi0KBGNvZGUYASABKA4yGS5oYXRfZ2FtZS5lcnJvci5FcnJvckNvZGVSBGNvZGU=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
