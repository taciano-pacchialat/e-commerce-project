class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Network error occurred.']);

  @override
  String toString() => message;
}

class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException(this.statusCode, [this.message = 'Server error occured.']);

  @override
  String toString() => 'ServerException: $statusCode $message';
}

class ClientException implements Exception {
  final int statusCode;
  final String message;

  ClientException(this.statusCode, [this.message = 'Client error occured.']);

  @override
  String toString() => 'ClientException: $statusCode $message';
}

class ParsingException implements Exception {
  final String message;

  ParsingException([this.message = 'Client error occured.']);

  @override
  String toString() => 'ClientException: $message';
}
