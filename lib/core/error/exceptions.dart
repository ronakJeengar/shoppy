/// Base exception class for data layer exceptions.
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, [this.statusCode]);

  @override
  String toString() => '$runtimeType: $message (statusCode: $statusCode)';
}

class ServerException extends AppException {
  const ServerException(super.message, [super.statusCode]);
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection detected.', super.statusCode]);
}

class AuthException extends AppException {
  const AuthException([super.message = 'Authentication failed.', super.statusCode = 401]);
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Requested resource was not found.', super.statusCode = 404]);
}

class ValidationException extends AppException {
  final Map<String, String>? errors;
  const ValidationException(String message, {this.errors, int? statusCode = 400})
      : super(message, statusCode);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache failure.', super.statusCode]);
}
