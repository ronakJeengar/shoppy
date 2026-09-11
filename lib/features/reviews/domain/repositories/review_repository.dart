import '../../../../core/utils/result.dart';
import '../entities/review_entity.dart';

abstract class ReviewRepository {
  Future<Result<ProductReviewsResult>> getProductReviews(
    String productId, {
    int page = 1,
    int limit = 10,
    int? ratingFilter,
  });

  Future<Result<ReviewEntity>> submitReview({
    required String productId,
    required int rating,
    required String title,
    required String comment,
  });

  Future<Result<ReviewEntity>> updateReview(
    String reviewId, {
    int? rating,
    String? title,
    String? comment,
  });

  Future<Result<void>> deleteReview(String reviewId);

  Future<Result<void>> voteHelpful(String reviewId);
}
