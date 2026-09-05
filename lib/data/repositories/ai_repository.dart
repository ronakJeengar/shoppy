import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/ai_config_model.dart';
import 'package:shopp_app/data/models/assistant_message_model.dart';

class AiRepository {
  final Api _api;

  AiRepository({Api? api}) : _api = api ?? Api();

  /// Retrieve the subsystem health and enabled capabilities of Shoppy AI.
  Future<ApiResponse> getAiHealth() async {
    try {
      final response = await _api.getRequest(Urls.aiHealth);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final model = AiHealthModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: model,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      log("AiRepository.getAiHealth DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to connect to Shoppy AI service",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.getAiHealth generic error: $e");
      return ApiResponse(
        status: false,
        message: "Failed to connect to Shoppy AI service: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Submit a query or conversational message to the backend AI orchestrator.
  Future<ApiResponse> queryAi(
    String message, {
    List<Map<String, String>> history = const [],
    Map<String, dynamic> options = const {},
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.aiQuery,
        data: {
          'message': message,
          'history': history,
          'options': options,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final resultModel = AiQueryResultModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: resultModel,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      log("AiRepository.queryAi DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "AI service request failed",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.queryAi generic error: $e");
      return ApiResponse(
        status: false,
        message: "AI service request failed: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Send message to conversational AI shopping assistant.
  Future<ApiResponse> chatWithAssistant({
    required String message,
    String? conversationId,
    Map<String, dynamic>? options,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'message': message,
      };
      if (conversationId != null && conversationId.isNotEmpty) {
        body['conversationId'] = conversationId;
      }
      if (options != null) {
        body['options'] = options;
      }

      final response = await _api.postRequest(Urls.aiChat, data: body);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final chatModel = AssistantChatResponseModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: chatModel,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      log("AiRepository.chatWithAssistant DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Assistant conversation failed",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.chatWithAssistant generic error: $e");
      return ApiResponse(
        status: false,
        message: "Assistant conversation failed: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Retrieve list of past conversations for authenticated customer.
  Future<ApiResponse> getConversations({int page = 1, int limit = 10}) async {
    try {
      final response = await _api.getRequest(
        Urls.aiConversations,
        queryParameters: {'page': page, 'limit': limit},
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final rawConvs = (apiResponse.data as Map<String, dynamic>)['conversations'];
        final List<AssistantConversationSummaryModel> list = (rawConvs is List)
            ? rawConvs
                .whereType<Map<String, dynamic>>()
                .map((c) => AssistantConversationSummaryModel.fromJson(c))
                .toList()
            : [];

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: list,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to load conversations",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(
        status: false,
        message: "Failed to load conversations: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Retrieve a specific conversation by ID with all messages.
  Future<ApiResponse> getConversation(String conversationId) async {
    try {
      final response = await _api.getRequest(Urls.aiConversation(conversationId));
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final rawMessages = (apiResponse.data as Map<String, dynamic>)['messages'];
        final List<AssistantMessageModel> messages = (rawMessages is List)
            ? rawMessages
                .whereType<Map<String, dynamic>>()
                .map((m) => AssistantMessageModel.fromJson(m))
                .toList()
            : [];

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: messages,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to load conversation",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(
        status: false,
        message: "Failed to load conversation: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Archive or delete a conversation.
  Future<ApiResponse> deleteConversation(String conversationId) async {
    try {
      final response = await _api.deleteRequest(Urls.aiConversation(conversationId));
      return ApiResponse.fromJson(response.data);
    } on DioException catch (dioError) {
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to delete conversation",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(
        status: false,
        message: "Failed to delete conversation: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Confirm and execute a pending consequential action.
  Future<ApiResponse> confirmAction({
    required String confirmationId,
    String? conversationId,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'confirmationId': confirmationId,
      };
      if (conversationId != null && conversationId.isNotEmpty) {
        body['conversationId'] = conversationId;
      }

      final response = await _api.postRequest(Urls.aiConfirmAction, data: body);
      return ApiResponse.fromJson(response.data);
    } on DioException catch (dioError) {
      log("AiRepository.confirmAction DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to confirm action",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.confirmAction generic error: $e");
      return ApiResponse(
        status: false,
        message: "Failed to confirm action: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Cancel a pending action proposal.
  Future<ApiResponse> cancelAction({
    required String confirmationId,
    String? conversationId,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'confirmationId': confirmationId,
      };
      if (conversationId != null && conversationId.isNotEmpty) {
        body['conversationId'] = conversationId;
      }

      final response = await _api.postRequest(Urls.aiCancelAction, data: body);
      return ApiResponse.fromJson(response.data);
    } on DioException catch (dioError) {
      log("AiRepository.cancelAction DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to cancel action",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.cancelAction generic error: $e");
      return ApiResponse(
        status: false,
        message: "Failed to cancel action: $e",
        data: null,
        statusCode: 500,
      );
    }
  }
}
