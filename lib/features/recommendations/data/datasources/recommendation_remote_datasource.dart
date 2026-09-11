import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/recommendation_model.dart';

abstract class RecommendationRemoteDataSource {
  Future<RecommendationResponseModel> getRecommendations({
    String type = 'PERSONALIZED',
    String? productId,
    String? categoryId,
    int limit = 10,
  });

  Future<void> trackEvent({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  });
}

class RecommendationRemoteDataSourceImpl implements RecommendationRemoteDataSource {
  final ApiClient _client;

  RecommendationRemoteDataSourceImpl(this._client);

  @override
  Future<RecommendationResponseModel> getRecommendations({
    String type = 'PERSONALIZED',
    String? productId,
    String? categoryId,
    int limit = 10,
  }) async {
    final queryParams = <String, dynamic>{
      'type': type,
      'limit': limit,
      if (productId != null && productId.isNotEmpty) 'productId': productId,
      if (categoryId != null && categoryId.isNotEmpty) 'categoryId': categoryId,
    };

    final response = await _client.get(
      Urls.recommendations,
      queryParameters: queryParams,
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return RecommendationResponseModel.fromJson(map);
  }

  @override
  Future<void> trackEvent({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  }) async {
    final payload = <String, dynamic>{
      'eventType': eventType,
      'productId': productId,
      if (categoryId != null && categoryId.isNotEmpty) 'categoryId': categoryId,
      if (metadata != null) 'metadata': metadata,
    };

    await _client.post(Urls.recommendationEvents, data: payload);
  }
}
