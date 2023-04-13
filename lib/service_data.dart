import "dart:convert";
import "dart:developer" as dev;
import "dart:io";
import "dart:typed_data";

import "package:nanoid/async.dart";
import "package:nsd/nsd.dart" as nsd;

import "const.dart";
import "version.dart";

const kTxtApiVersionKey = "0";
const kTxtNameKey = "1";
const kTxtPlayerNameKey = "2";
const kTxtIsPrivateKey = "3";

class ServiceDataError implements Exception {}

class ServiceData {
  final String id;
  final String name;
  final int port;
  final String playerName;
  final bool isPrivate;
  final int apiVersion;
  final InternetAddress? address;

  ServiceData({
    required this.id,
    required this.name,
    required this.port,
    required this.playerName,
    required this.isPrivate,
    this.address,
    int? apiVersion,
  }) : apiVersion = apiVersion ?? kApiVersion;

  String get idSuffix => id.substring(kNetworkServiceNameLength - 4, kNetworkServiceNameLength);

  static ServiceData? fromService(nsd.Service svc) {
    // TODO: add null handling
    try {
      final name = _decode(svc.txt![kTxtNameKey]!);
      final playerName = _decode(svc.txt![kTxtPlayerNameKey]!);
      final isPrivate = int.parse(_decode(svc.txt![kTxtIsPrivateKey]!)) == 1;
      final apiVersion = int.parse(_decode(svc.txt![kTxtApiVersionKey]!));
      return ServiceData(
        id: svc.name!,
        name: name,
        port: svc.port!,
        playerName: playerName,
        isPrivate: isPrivate,
        address: svc.addresses!.first,
        apiVersion: apiVersion,
      );
    } on Exception catch (e) {
      dev.log("error parsing service: $e");
      return null;
    }
  }

  Future<nsd.Registration> register() async {
    final result = await nsd.register(toService());
    dev.log("registered service (id=$id, name=$name)");
    return result;
  }

  nsd.Service toService() => nsd.Service(
        name: id,
        port: port,
        type: kNetworkServiceType,
        txt: _toTxtRecords(),
      );

  Map<String, Uint8List> _toTxtRecords() => Map.fromEntries(
        [
          MapEntry(
            kTxtApiVersionKey,
            _encode(apiVersion.toString()),
          ),
          MapEntry(
            kTxtNameKey,
            _encode(name),
          ),
          MapEntry(
            kTxtPlayerNameKey,
            _encode(playerName),
          ),
          MapEntry(
            kTxtIsPrivateKey,
            _encode(isPrivate ? "1" : "0"),
          ),
        ],
      );
}

Future<ServiceData> serviceDataFromMeta({
  required String name,
  required int port,
  required String playerName,
  required bool isPrivate,
}) async =>
    ServiceData(
      id: await nanoid(kNetworkServiceNameLength),
      name: name,
      port: port,
      playerName: playerName,
      isPrivate: isPrivate,
    );

Uint8List _encode(String string) => Uint8List.fromList(utf8.encode(string));

String _decode(Uint8List bytes) => utf8.decode(bytes);
