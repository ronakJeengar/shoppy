import '../../../../core/utils/result.dart';
import '../../../assistant/domain/entities/assistant_message_entity.dart';
import '../entities/ai_config_entity.dart';

abstract class AiRepository {
  Future<Result<AiHealthEntity>> getAiHealth();

  Future<Result<AssistantChatResponseEntity>> chatWithAssistant({
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

  Future<Result<List<AssistantMessageEntity>>> getConversation(String conversationId);
}
