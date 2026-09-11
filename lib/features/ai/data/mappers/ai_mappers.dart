import '../models/ai_config_model.dart';
import '../../domain/entities/ai_config_entity.dart';

extension AiFeaturesModelMapper on AiFeaturesModel {
  AiFeaturesEntity toEntity() {
    return AiFeaturesEntity(
      assistantEnabled: assistantEnabled,
      semanticSearchEnabled: semanticSearchEnabled,
      toolCallingEnabled: toolCallingEnabled,
    );
  }
}

extension AiFeaturesEntityMapper on AiFeaturesEntity {
  AiFeaturesModel toModel() {
    return AiFeaturesModel(
      assistantEnabled: assistantEnabled,
      semanticSearchEnabled: semanticSearchEnabled,
      toolCallingEnabled: toolCallingEnabled,
    );
  }
}

extension AiHealthModelMapper on AiHealthModel {
  AiHealthEntity toEntity() {
    return AiHealthEntity(
      enabled: enabled,
      provider: provider,
      model: model,
      healthy: healthy,
      features: features.toEntity(),
      allowlistedTools: allowlistedTools,
      vectorStoreReady: vectorStoreReady,
    );
  }
}

extension AiHealthEntityMapper on AiHealthEntity {
  AiHealthModel toModel() {
    return AiHealthModel(
      enabled: enabled,
      provider: provider,
      model: model,
      healthy: healthy,
      features: features.toModel(),
      allowlistedTools: allowlistedTools,
      vectorStoreReady: vectorStoreReady,
    );
  }
}

extension AiQueryResultModelMapper on AiQueryResultModel {
  AiQueryResultEntity toEntity() {
    return AiQueryResultEntity(
      requestId: requestId,
      answer: answer,
      toolResults: toolResults,
      provider: provider,
      model: model,
      durationMs: durationMs,
    );
  }
}

extension AiQueryResultEntityMapper on AiQueryResultEntity {
  AiQueryResultModel toModel() {
    return AiQueryResultModel(
      requestId: requestId,
      answer: answer,
      toolResults: toolResults,
      provider: provider,
      model: model,
      durationMs: durationMs,
    );
  }
}
