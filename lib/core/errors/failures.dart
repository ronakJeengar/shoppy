/// Centralized domain failures hierarchy for Shoppy Clean Architecture.
abstract class Failure {
  final String message;
  final int? statusCode;
  final Object? cause;

  const Failure(this.message, {this.statusCode, this.cause});

  @override
  String toString() => '$runtimeType: $message (statusCode: $statusCode)';
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode, super.cause});
}

class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Network connection failed. Please check your internet.',
    Object? cause,
  ]) : super(statusCode: null, cause: cause);
}

class AuthFailure extends Failure {
  const AuthFailure([
    super.message = 'Authentication failed. Please log in again.',
    int? statusCode = 401,
  ]) : super(statusCode: statusCode);
}

class UnauthorizedFailure extends AuthFailure {
  const UnauthorizedFailure([
    super.message = 'Unauthorized access.',
    super.statusCode = 401,
  ]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([
    super.message = 'The requested resource was not found.',
    int? statusCode = 404,
  ]) : super(statusCode: statusCode);
}

class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure([
    super.message = 'Connection timed out. Please try again later.',
    super.cause,
  ]);
}

class ValidationFailure extends Failure {
  final Map<String, String>? errors;

  const ValidationFailure(
    super.message, {
    this.errors,
    super.statusCode = 400,
  });
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local storage access failed.']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([
    super.message = 'An unexpected error occurred.',
    Object? cause,
  ]) : super(cause: cause);
}

/// Safely extracts error message from DioException response data, preventing
/// runtime TypeError when response.data is a String or non-Map object.
String extractDioErrorMessage(dynamic exception, [String fallback = 'An unexpected server error occurred']) {
  if (exception is! Exception) return fallback;
  try {
    final dynamic dynamicExp = exception;
    final dynamic data = dynamicExp.response?.data;
    if (data is Map) {
      final msg = data['message'] ?? data['error'];
      if (msg != null && msg.toString().isNotEmpty) {
        return msg.toString();
      }
    } else if (data is String && data.isNotEmpty) {
      return data;
    }
    return dynamicExp.message?.toString() ?? fallback;
  } catch (_) {
    return fallback;
  }
}
