class ServerException implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message])
      : super(message ?? "Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(message ?? "Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(message ?? "Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super(message ?? "Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(message ?? "Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super(message ?? "Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super(message ?? "No Internet Connection");
}
