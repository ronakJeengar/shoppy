import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../../assistant/data/mappers/assistant_mappers.dart';
import '../../../assistant/domain/entities/assistant_message_entity.dart';
import '../../domain/entities/ai_config_entity.dart';
import '../../domain/repositories/ai_repository.dart';
import '../datasources/ai_remote_datasource.dart';
import '../mappers/ai_mappers.dart';

class AiRepositoryImpl implements AiRepository {
  final AiRemoteDataSource _remoteDataSource;

  AiRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<AiHealthEntity>> getAiHealth() async {
    try {
      final health = await _remoteDataSource.getAiHealth();
      return Success(health.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'AI service unavailable');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AssistantChatResponseEntity>> chatWithAssistant({
    required String message,
    String? conversationId,
    Map<String, dynamic>? options,
  }) async {
    try {
      final chat = await _remoteDataSource.chatWithAssistant(
        message: message,
        conversationId: conversationId,
        options: options,
      );
      return Success(chat.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'AI assistant communication failed');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool>> confirmAction({
    required String confirmationId,
    String? conversationId,
  }) async {
    try {
      final res = await _remoteDataSource.confirmAction(
        confirmationId: confirmationId,
        conversationId: conversationId,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Action confirmation failed');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool>> cancelAction({
    required String confirmationId,
    String? conversationId,
  }) async {
    try {
      final res = await _remoteDataSource.cancelAction(
        confirmationId: confirmationId,
        conversationId: conversationId,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Action cancellation failed');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<AssistantMessageEntity>>> getConversation(String conversationId) async {
    try {
      final models = await _remoteDataSource.getConversation(conversationId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load conversation');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
