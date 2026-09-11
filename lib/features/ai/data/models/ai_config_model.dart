import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_config_model.freezed.dart';

@freezed
abstract class AiFeaturesModel with _$AiFeaturesModel {
  const factory AiFeaturesModel({
    @Default(true) bool assistantEnabled,
    @Default(true) bool semanticSearchEnabled,
    @Default(true) bool toolCallingEnabled,
  }) = _AiFeaturesModel;

  factory AiFeaturesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const AiFeaturesModel();
    return AiFeaturesModel(
      assistantEnabled: json['assistantEnabled'] != false,
      semanticSearchEnabled: json['semanticSearchEnabled'] != false,
      toolCallingEnabled: json['toolCallingEnabled'] != false,
    );
  }
}

extension AiFeaturesModelX on AiFeaturesModel {
  Map<String, dynamic> toJson() {
    return {
      'assistantEnabled': assistantEnabled,
      'semanticSearchEnabled': semanticSearchEnabled,
      'toolCallingEnabled': toolCallingEnabled,
    };
  }
}

@freezed
abstract class AiHealthModel with _$AiHealthModel {
  const factory AiHealthModel({
    required bool enabled,
    required String provider,
    required String model,
    required bool healthy,
    required AiFeaturesModel features,
    @Default([]) List<String> allowlistedTools,
    @Default(true) bool vectorStoreReady,
  }) = _AiHealthModel;

  factory AiHealthModel.fromJson(Map<String, dynamic> json) {
    final toolsRaw = json['allowlistedTools'];
    final List<String> tools = (toolsRaw is List)
        ? toolsRaw.map((t) => t.toString()).toList()
        : <String>[];

    final vs = json['vectorStore'];
    final bool vsReady = vs is Map<String, dynamic> ? vs['ready'] == true : true;

    return AiHealthModel(
      enabled: json['enabled'] == true,
      provider: json['provider']?.toString() ?? 'unknown',
      model: json['model']?.toString() ?? 'default',
      healthy: json['healthy'] == true,
      features: AiFeaturesModel.fromJson(
        json['features'] is Map<String, dynamic>
            ? json['features'] as Map<String, dynamic>
            : null,
      ),
      allowlistedTools: tools,
      vectorStoreReady: vsReady,
    );
  }
}

extension AiHealthModelX on AiHealthModel {
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'provider': provider,
      'model': model,
      'healthy': healthy,
      'features': features.toJson(),
      'allowlistedTools': allowlistedTools,
      'vectorStoreReady': vectorStoreReady,
    };
  }
}

@freezed
abstract class AiQueryResultModel with _$AiQueryResultModel {
  const factory AiQueryResultModel({
    required String requestId,
    required String answer,
    @Default([]) List<Map<String, dynamic>> toolResults,
    required String provider,
    required String model,
    @Default(0) int durationMs,
  }) = _AiQueryResultModel;

  factory AiQueryResultModel.fromJson(Map<String, dynamic> json) {
    final rawTools = json['toolResults'];
    final List<Map<String, dynamic>> tools = (rawTools is List)
        ? rawTools
            .whereType<Map<String, dynamic>>()
            .map((t) => Map<String, dynamic>.from(t))
            .toList()
        : <Map<String, dynamic>>[];

    final meta = json['metadata'] is Map<String, dynamic>
        ? json['metadata'] as Map<String, dynamic>
        : <String, dynamic>{};

    return AiQueryResultModel(
      requestId: json['requestId']?.toString() ?? '',
      answer: json['answer']?.toString() ?? '',
      toolResults: tools,
      provider: meta['provider']?.toString() ?? '',
      model: meta['model']?.toString() ?? '',
      durationMs: (meta['durationMs'] is num)
          ? (meta['durationMs'] as num).toInt()
          : 0,
    );
  }
}

extension AiQueryResultModelX on AiQueryResultModel {
  Map<String, dynamic> toJson() {
    return {
      'requestId': requestId,
      'answer': answer,
      'toolResults': toolResults,
      'provider': provider,
      'model': model,
      'durationMs': durationMs,
    };
  }
}
