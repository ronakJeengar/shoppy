import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../mappers/review_mappers.dart';
import '../models/review_model.dart';
import '../../domain/entities/review_entity.dart';

abstract class ReviewRemoteDataSource {
  Future<ProductReviewsResult> getProductReviews(
    String productId, {
    int page = 1,
    int limit = 10,
    int? ratingFilter,
  });

  Future<ReviewModel> submitReview({
    required String productId,
    required int rating,
    required String title,
    required String comment,
  });

  Future<ReviewModel> updateReview(
    String reviewId, {
    int? rating,
    String? title,
    String? comment,
  });

  Future<void> deleteReview(String reviewId);

  Future<void> voteHelpful(String reviewId);
}

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final ApiClient _client;

  ReviewRemoteDataSourceImpl(this._client);

  @override
  Future<ProductReviewsResult> getProductReviews(
    String productId, {
    int page = 1,
    int limit = 10,
    int? ratingFilter,
  }) async {
    final response = await _client.get(
      Urls.productReviews(productId),
      queryParameters: {
        'page': page,
        'limit': limit,
        if (ratingFilter != null) 'rating': ratingFilter,
      },
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    final rawReviews = map['reviews'] as List? ?? [];
    final reviews = <ReviewModel>[];
    for (final item in rawReviews) {
      if (item is Map<String, dynamic>) {
        reviews.add(ReviewModel.fromJson(item));
      }
    }

    final summary = map['summary'] is Map<String, dynamic>
        ? ReviewSummaryModel.fromJson(map['summary'] as Map<String, dynamic>)
        : const ReviewSummaryModel(
            averageRating: 0.0,
            totalReviews: 0,
            ratingDistribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 0},
          );

    return ProductReviewsResult(
      reviews: reviews.map((r) => r.toEntity()).toList(),
      summary: summary.toEntity(),
    );
  }

  @override
  Future<ReviewModel> submitReview({
    required String productId,
    required int rating,
    required String title,
    required String comment,
  }) async {
    final response = await _client.post(
      Urls.productReviews(productId),
      data: {
        'rating': rating,
        'title': title,
        'comment': comment,
      },
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return ReviewModel.fromJson(map);
  }

  @override
  Future<ReviewModel> updateReview(
    String reviewId, {
    int? rating,
    String? title,
    String? comment,
  }) async {
    final response = await _client.put(
      Urls.review(reviewId),
      data: {
        if (rating != null) 'rating': rating,
        if (title != null) 'title': title,
        if (comment != null) 'comment': comment,
      },
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return ReviewModel.fromJson(map);
  }

  @override
  Future<void> deleteReview(String reviewId) async {
    await _client.delete(Urls.review(reviewId));
  }

  @override
  Future<void> voteHelpful(String reviewId) async {
    await _client.post(Urls.voteReviewHelpful(reviewId));
  }
}
