///
//  Generated code. Do not modify.
//  source: proto/discovery.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use directLinkDescriptor instead')
const DirectLink$json = {
  '1': 'DirectLink',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'port', '3': 2, '4': 1, '5': 13, '10': 'port'},
    {'1': 'code', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'code', '17': true},
  ],
  '8': [
    {'1': '_code'},
  ],
};

/// Descriptor for `DirectLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List directLinkDescriptor = $convert.base64Decode(
    'CgpEaXJlY3RMaW5rEg4KAmlkGAEgASgJUgJpZBISCgRwb3J0GAIgASgNUgRwb3J0EhcKBGNvZGUYAyABKAlIAFIEY29kZYgBAUIHCgVfY29kZQ==');
@$core.Deprecated('Use serviceMetadataDescriptor instead')
const ServiceMetadata$json = {
  '1': 'ServiceMetadata',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ServiceMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceMetadataDescriptor =
    $convert.base64Decode('Cg9TZXJ2aWNlTWV0YWRhdGESEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
