import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState<T> with _$UiState<T> {
  const factory UiState.initial() = _Initial<T>;
  const factory UiState.loading() = _Loading<T>;
  const factory UiState.success(T data) = _Success<T>;
  const factory UiState.empty([String? message]) = _Empty<T>;
  const factory UiState.error(String message, {int? code}) = _Error<T>;
}

extension UiStateX<T> on UiState<T> {
  bool get isInitial => this is _Initial<T>;
  bool get isLoading => this is _Loading<T>;
  bool get isSuccess => this is _Success<T>;
  bool get isEmpty => this is _Empty<T>;
  bool get isError => this is _Error<T>;
  T? get dataOrNull => whenOrNull(success: (data) => data);
}
