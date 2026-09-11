import '../../../../core/utils/result.dart';
import '../../../assistant/domain/entities/assistant_message_entity.dart';
import '../entities/ai_config_entity.dart';
import '../repositories/ai_repository.dart';

class GetAiHealthUseCase {
  final AiRepository _repository;

  GetAiHealthUseCase(this._repository);

  Future<Result<AiHealthEntity>> call() => _repository.getAiHealth();
}

class ChatWithAssistantUseCase {
  final AiRepository _repository;

  ChatWithAssistantUseCase(this._repository);

  Future<Result<AssistantChatResponseEntity>> call({
    required String message,
    String? conversationId,
    Map<String, dynamic>? options,
  }) {
    return _repository.chatWithAssistant(
      message: message,
      conversationId: conversationId,
      options: options,
    );
  }
}

class ConfirmAiActionUseCase {
  final AiRepository _repository;

  ConfirmAiActionUseCase(this._repository);

  Future<Result<bool>> call({
    required String confirmationId,
    String? conversationId,
  }) {
    return _repository.confirmAction(
      confirmationId: confirmationId,
      conversationId: conversationId,
    );
  }
}

class CancelAiActionUseCase {
  final AiRepository _repository;

  CancelAiActionUseCase(this._repository);

  Future<Result<bool>> call({
    required String confirmationId,
    String? conversationId,
  }) {
    return _repository.cancelAction(
      confirmationId: confirmationId,
      conversationId: conversationId,
    );
  }
}
