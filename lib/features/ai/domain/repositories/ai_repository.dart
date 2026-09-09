import '../../../../core/utils/result.dart';
import '../../../../data/models/ai_config_model.dart';
import '../../../../data/models/assistant_message_model.dart';

abstract class AiRepository {
  Future<Result<AiHealthModel>> getAiHealth();

  Future<Result<AssistantChatResponseModel>> chatWithAssistant({
    required String message,
    String? conversationId,
    Map<String, dynamic>? options,
  });

  Future<Result<bool>> confirmAction({
    required String confirmationId,
    String? conversationId,
  });

  Future<Result<bool>> cancelAction({
    required String confirmationId,
    String? conversationId,
  });
}
