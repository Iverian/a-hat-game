Future<dynamic> handleResponse(value) async {
  if (value is Exception) {
    throw value;
  }
  return value;
}
