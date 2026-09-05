class AiFeaturesModel {
  final bool assistantEnabled;
  final bool semanticSearchEnabled;
  final bool toolCallingEnabled;

  const AiFeaturesModel({
    this.assistantEnabled = true,
    this.semanticSearchEnabled = true,
    this.toolCallingEnabled = true,
  });

  factory AiFeaturesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const AiFeaturesModel();
    return AiFeaturesModel(
      assistantEnabled: json['assistantEnabled'] != false,
      semanticSearchEnabled: json['semanticSearchEnabled'] != false,
      toolCallingEnabled: json['toolCallingEnabled'] != false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assistantEnabled': assistantEnabled,
      'semanticSearchEnabled': semanticSearchEnabled,
      'toolCallingEnabled': toolCallingEnabled,
    };
  }
}

class AiHealthModel {
  final bool enabled;
  final String provider;
  final String model;
  final bool healthy;
  final AiFeaturesModel features;
  final List<String> allowlistedTools;
  final bool vectorStoreReady;

  const AiHealthModel({
    required this.enabled,
    required this.provider,
    required this.model,
    required this.healthy,
    required this.features,
    required this.allowlistedTools,
    required this.vectorStoreReady,
  });

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

class AiQueryResultModel {
  final String requestId;
  final String answer;
  final List<Map<String, dynamic>> toolResults;
  final String provider;
  final String model;
  final int durationMs;

  const AiQueryResultModel({
    required this.requestId,
    required this.answer,
    required this.toolResults,
    required this.provider,
    required this.model,
    required this.durationMs,
  });

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
