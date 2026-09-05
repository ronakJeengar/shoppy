import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/recommendation_model.dart';

class RecommendationRepository {
  final Api _api = Api();

  /// Fetches product recommendations by type:
  /// PERSONALIZED, SIMILAR_PRODUCTS, FREQUENTLY_BOUGHT_TOGETHER, TRENDING, RECENTLY_VIEWED
  Future<ApiResponse> getRecommendations({
    String type = 'PERSONALIZED',
    String? productId,
    String? categoryId,
    int limit = 10,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'type': type,
        'limit': limit,
        if (productId != null && productId.isNotEmpty) 'productId': productId,
        if (categoryId != null && categoryId.isNotEmpty) 'categoryId': categoryId,
      };

      final response = await _api.getRequest(
        Urls.recommendations,
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final recModel = RecommendationResponseModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: recModel,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      log('RecommendationRepository getRecommendations error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load recommendations',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  /// Dispatches an interaction event to backend (e.g. VIEW_PRODUCT, ADD_TO_CART)
  Future<ApiResponse> trackEvent({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final payload = <String, dynamic>{
        'eventType': eventType,
        'productId': productId,
        if (categoryId != null && categoryId.isNotEmpty) 'categoryId': categoryId,
        if (metadata != null) 'metadata': metadata,
      };

      final response = await _api.postRequest(
        Urls.recommendationEvents,
        data: payload,
      );

      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Background event logging should fail quietly without disrupting user flow
      log('RecommendationRepository trackEvent warning: $e');
      return ApiResponse(
        status: false,
        message: e.message ?? 'Failed to track event',
        data: null,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
