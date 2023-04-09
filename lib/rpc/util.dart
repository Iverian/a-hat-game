import "dart:isolate";

Future<dynamic> handleResponse(dynamic value) async {
  if (value is Exception) {
    throw value;
  }
  return value;
}
