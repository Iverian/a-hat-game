import "dart:developer" as dev;
import "dart:io";
import "dart:math";

import "const.dart";

final _emptyPattern = RegExp(r"^\s+$");
final _whitespaceStartPattern = RegExp(r"^\s+");
const _nameMaxLength = 31;

String? nameValidator(String? value) {
  if (value == null || value.isEmpty || _emptyPattern.hasMatch(value)) {
    return "Имя не должно быть пустым";
  }
  if (_whitespaceStartPattern.hasMatch(value)) {
    return "Имя не должно начинаться с пробела";
  }
  if (value.length > _nameMaxLength) {
    return "Имя должно быть короче ${_nameMaxLength + 1} символов";
  }
  return null;
}

String generateLobbyCode() =>
    Random.secure().nextInt(pow(10, kLobbyCodeLength).toInt()).toString().padLeft(6, "0");

Future<int> assignPort() async {
  RawServerSocket? socket;
  var port = kServerPortDefault;
  try {
    while (socket == null) {
      try {
        socket = await RawServerSocket.bind(InternetAddress.anyIPv4, port);
        break;
      } on IOException catch (e) {
        dev.log("error binding TCP socket: $e");
        port = 0;
      }
    }
    return socket.port;
  } finally {
    await socket?.close();
  }
}
