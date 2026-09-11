import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Type alias for Future containing Dartz Either
typedef FutureEither<T> = Future<Either<Failure, T>>;

/// Sealed Result class to handle Success and Failure functionally and safely.
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => switch (this) {
        Success<T>(data: final data) => data,
        FailureResult<T>() => null,
      };

  Failure? get failureOrNull => switch (this) {
        Success<T>() => null,
        FailureResult<T>(failure: final failure) => failure,
      };

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Failure failure) onFailure,
  }) {
    return switch (this) {
      Success<T>(data: final data) => onSuccess(data),
      FailureResult<T>(failure: final failure) => onFailure(failure),
    };
  }

  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success<T>(data: final data) => Success(transform(data)),
      FailureResult<T>(failure: final failure) => FailureResult(failure),
    };
  }

  /// Converts this [Result] into a Dartz [Either].
  Either<Failure, T> toEither() {
    return switch (this) {
      Success<T>(data: final data) => Right(data),
      FailureResult<T>(failure: final failure) => Left(failure),
    };
  }

  /// Creates a [Result] from a Dartz [Either].
  static Result<T> fromEither<T>(Either<Failure, T> either) {
    return either.fold(
      (failure) => FailureResult<T>(failure),
      (data) => Success<T>(data),
    );
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Success<T> && other.data == data);

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success($data)';
}

class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FailureResult<T> && other.failure == failure);

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'FailureResult($failure)';
}

/// Extension on Dartz [Either] to easily convert to [Result].
extension EitherToResultExtension<T> on Either<Failure, T> {
  Result<T> toResult() => Result.fromEither(this);
}

