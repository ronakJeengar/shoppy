import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/review_model.dart';

class ReviewRepository {
  final Api _api = Api();

  // 1. Get Product Reviews (Public)
  Future<ApiResponse> getProductReviews(
    String productId, {
    int page = 1,
    int limit = 10,
    int? rating,
    String sort = 'newest',
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        'sort': sort,
        if (rating != null && rating >= 1 && rating <= 5) 'rating': rating,
      };

      final response = await _api.getRequest(
        Urls.productReviews(productId),
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawReviews = data['reviews'] as List? ?? [];
        final reviews = <ReviewModel>[];
        for (final item in rawReviews) {
          if (item is Map<String, dynamic>) {
            reviews.add(ReviewModel.fromJson(item));
          }
        }

        final summary = data['summary'] is Map<String, dynamic>
            ? ReviewSummaryModel.fromJson(data['summary'] as Map<String, dynamic>)
            : ReviewSummaryModel(
                averageRating: 0.0,
                totalReviews: 0,
                ratingDistribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 0},
              );

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: {
            'reviews': reviews,
            'summary': summary,
          },
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('ReviewRepository getProductReviews error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load product reviews',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 2. Check Review Eligibility (Auth)
  Future<ApiResponse> getReviewEligibility(String productId) async {
    try {
      final response = await _api.getRequest(Urls.reviewEligibility(productId));
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final eligibility = ReviewEligibilityModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: eligibility,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('ReviewRepository getReviewEligibility error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to check review eligibility',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 3. Create Product Review (Auth)
  Future<ApiResponse> createReview(
    String productId, {
    required int rating,
    String? title,
    required String comment,
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.productReviews(productId),
        data: {
          'rating': rating,
          if (title != null && title.isNotEmpty) 'title': title,
          'comment': comment,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final review = ReviewModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: review,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('ReviewRepository createReview error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to submit review',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 4. Update Review (Auth)
  Future<ApiResponse> updateReview(
    String reviewId, {
    int? rating,
    String? title,
    String? comment,
  }) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.reviews}/$reviewId',
        data: {
          if (rating != null) 'rating': rating,
          if (title != null) 'title': title,
          if (comment != null) 'comment': comment,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final review = ReviewModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: review,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('ReviewRepository updateReview error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update review',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 5. Delete Review (Auth)
  Future<ApiResponse> deleteReview(String reviewId) async {
    try {
      final response = await _api.deleteRequest('${Urls.reviews}/$reviewId');
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('ReviewRepository deleteReview error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to delete review',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 6. Admin Reviews (Moderation)
  Future<ApiResponse> getAdminReviews({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
    String? productId,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (status != null && status.isNotEmpty) 'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
        if (productId != null && productId.isNotEmpty) 'productId': productId,
      };

      final response = await _api.getRequest(
        Urls.adminReviews,
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawReviews = data['reviews'] as List? ?? [];
        final reviews = <AdminReviewModel>[];
        for (final item in rawReviews) {
          if (item is Map<String, dynamic>) {
            reviews.add(AdminReviewModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: reviews,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('ReviewRepository getAdminReviews error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load admin reviews',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateAdminReviewStatus(
    String reviewId, {
    required String status,
    String? reason,
  }) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.adminReviews}/$reviewId/status',
        data: {
          'status': status,
          if (reason != null && reason.isNotEmpty) 'reason': reason,
        },
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('ReviewRepository updateAdminReviewStatus error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update review status',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
