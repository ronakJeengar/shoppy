import 'package:dio/dio.dart';
import '../errors/failures.dart';
import 'exceptions.dart';

/// Centralized mapper that converts low-level exceptions into domain [Failure] objects.
Failure mapExceptionToFailure(Object exception, [StackTrace? stackTrace]) {
  if (exception is Failure) {
    return exception;
  }

  if (exception is AppException) {
    if (exception is ServerException) {
      return ServerFailure(exception.message, statusCode: exception.statusCode);
    }
    if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    }
    if (exception is AuthException) {
      return AuthFailure(exception.message, exception.statusCode);
    }
    if (exception is NotFoundException) {
      return NotFoundFailure(exception.message, exception.statusCode);
    }
    if (exception is ValidationException) {
      return ValidationFailure(exception.message, errors: exception.errors, statusCode: exception.statusCode);
    }
    if (exception is CacheException) {
      return CacheFailure(exception.message);
    }
  }

  if (exception is DioException) {
    final statusCode = exception.response?.statusCode;
    final message = extractDioErrorMessage(exception);

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return TimeoutFailure('Connection timed out. Please try again later.', exception);
    }

    if (exception.type == DioExceptionType.connectionError) {
      return NetworkFailure('Unable to reach server. Please check your network connection.', exception);
    }

    if (statusCode == 401) {
      return AuthFailure(message, 401);
    }
    if (statusCode == 403) {
      return UnauthorizedFailure(message, 403);
    }
    if (statusCode == 404) {
      return NotFoundFailure(message, 404);
    }
    if (statusCode == 422 || statusCode == 400) {
      return ValidationFailure(message, statusCode: statusCode);
    }

    return ServerFailure(message, statusCode: statusCode, cause: exception);
  }

  if (exception is FormatException) {
    return ValidationFailure('Invalid data format received: ${exception.message}');
  }

  return UnknownFailure(exception.toString(), exception);
}
