import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_config_entity.freezed.dart';

@freezed
abstract class AiFeaturesEntity with _$AiFeaturesEntity {
  const factory AiFeaturesEntity({
    @Default(true) bool assistantEnabled,
    @Default(true) bool semanticSearchEnabled,
    @Default(true) bool toolCallingEnabled,
  }) = _AiFeaturesEntity;
}

@freezed
abstract class AiHealthEntity with _$AiHealthEntity {
  const factory AiHealthEntity({
    required bool enabled,
    required String provider,
    required String model,
    required bool healthy,
    required AiFeaturesEntity features,
    @Default([]) List<String> allowlistedTools,
    @Default(true) bool vectorStoreReady,
  }) = _AiHealthEntity;
}

@freezed
abstract class AiQueryResultEntity with _$AiQueryResultEntity {
  const factory AiQueryResultEntity({
    required String requestId,
    required String answer,
    @Default([]) List<Map<String, dynamic>> toolResults,
    required String provider,
    required String model,
    @Default(0) int durationMs,
  }) = _AiQueryResultEntity;
}
