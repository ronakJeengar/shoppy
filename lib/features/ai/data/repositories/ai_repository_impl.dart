import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../../../data/models/ai_config_model.dart';
import '../../../../data/models/assistant_message_model.dart';
import '../../domain/repositories/ai_repository.dart';
import '../datasources/ai_remote_datasource.dart';

class AiRepositoryImpl implements AiRepository {
  final AiRemoteDataSource _remoteDataSource;

  AiRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<AiHealthModel>> getAiHealth() async {
    try {
      final health = await _remoteDataSource.getAiHealth();
      return Success(health);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'AI service unavailable');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AssistantChatResponseModel>> chatWithAssistant({
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
      return Success(chat);
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
      final success = await _remoteDataSource.confirmAction(
        confirmationId: confirmationId,
        conversationId: conversationId,
      );
      return Success(success);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to confirm AI action');
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
      final success = await _remoteDataSource.cancelAction(
        confirmationId: confirmationId,
        conversationId: conversationId,
      );
      return Success(success);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to cancel AI action');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
