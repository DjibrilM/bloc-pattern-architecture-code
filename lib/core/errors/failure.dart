class Failure implements Exception {
  final String message;
  Failure({this.message = "Unexpected error occurred."});
}
