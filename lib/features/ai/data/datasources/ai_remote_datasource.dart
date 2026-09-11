import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/ai_config_model.dart';
import '../../../assistant/data/models/assistant_message_model.dart';

abstract class AiRemoteDataSource {
  Future<AiHealthModel> getAiHealth();
  Future<AssistantChatResponseModel> chatWithAssistant({
    required String message,
    String? conversationId,
    Map<String, dynamic>? options,
  });
  Future<bool> confirmAction({
    required String confirmationId,
    String? conversationId,
  });
  Future<bool> cancelAction({
    required String confirmationId,
    String? conversationId,
  });
  Future<List<AssistantMessageModel>> getConversation(String conversationId);
}

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final ApiClient _client;

  AiRemoteDataSourceImpl(this._client);

  @override
  Future<AiHealthModel> getAiHealth() async {
    final response = await _client.get(Urls.aiHealth);
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return AiHealthModel.fromJson(map);
  }

  @override
  Future<AssistantChatResponseModel> chatWithAssistant({
    required String message,
    String? conversationId,
    Map<String, dynamic>? options,
  }) async {
    final Map<String, dynamic> body = {
      'message': message,
      if (conversationId != null && conversationId.isNotEmpty)
        'conversationId': conversationId,
      if (options != null) 'options': options,
    };

    final response = await _client.post(Urls.aiChat, data: body);
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return AssistantChatResponseModel.fromJson(map);
  }

  @override
  Future<bool> confirmAction({
    required String confirmationId,
    String? conversationId,
  }) async {
    final Map<String, dynamic> body = {
      'confirmationId': confirmationId,
      if (conversationId != null && conversationId.isNotEmpty)
        'conversationId': conversationId,
    };
    final response = await _client.post(Urls.aiConfirmAction, data: body);
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['success'] == true || data['status'] == true;
    }
    return true;
  }

  @override
  Future<bool> cancelAction({
    required String confirmationId,
    String? conversationId,
  }) async {
    final Map<String, dynamic> body = {
      'confirmationId': confirmationId,
      if (conversationId != null && conversationId.isNotEmpty)
        'conversationId': conversationId,
    };
    final response = await _client.post(Urls.aiCancelAction, data: body);
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['success'] == true || data['status'] == true;
    }
    return true;
  }

  @override
  Future<List<AssistantMessageModel>> getConversation(String conversationId) async {
    final response = await _client.get(Urls.aiConversation(conversationId));
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data) as Map<String, dynamic>;
    final rawMessages = map['messages'];
    if (rawMessages is List) {
      return rawMessages
          .whereType<Map<String, dynamic>>()
          .map((m) => AssistantMessageModel.fromJson(m))
          .toList();
    }
    return [];
  }
}
