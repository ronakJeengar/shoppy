import '../../../../core/utils/result.dart';
import '../../../../data/models/review_model.dart';
import '../entities/review_entity.dart';
import '../repositories/review_repository.dart';

class GetProductReviewsUseCase {
  final ReviewRepository _repository;

  GetProductReviewsUseCase(this._repository);

  Future<Result<ProductReviewsResult>> call(
    String productId, {
    int page = 1,
    int limit = 10,
    int? ratingFilter,
  }) {
    return _repository.getProductReviews(
      productId,
      page: page,
      limit: limit,
      ratingFilter: ratingFilter,
    );
  }
}

class SubmitReviewUseCase {
  final ReviewRepository _repository;

  SubmitReviewUseCase(this._repository);

  Future<Result<ReviewModel>> call({
    required String productId,
    required int rating,
    required String title,
    required String comment,
  }) {
    return _repository.submitReview(
      productId: productId,
      rating: rating,
      title: title,
      comment: comment,
    );
  }
}

class UpdateReviewUseCase {
  final ReviewRepository _repository;

  UpdateReviewUseCase(this._repository);

  Future<Result<ReviewModel>> call({
    required String reviewId,
    int? rating,
    String? title,
    String? comment,
  }) {
    return _repository.updateReview(
      reviewId,
      rating: rating,
      title: title,
      comment: comment,
    );
  }
}

class DeleteReviewUseCase {
  final ReviewRepository _repository;

  DeleteReviewUseCase(this._repository);

  Future<Result<void>> call(String reviewId) => _repository.deleteReview(reviewId);
}

class VoteHelpfulUseCase {
  final ReviewRepository _repository;

  VoteHelpfulUseCase(this._repository);

  Future<Result<void>> call(String reviewId) => _repository.voteHelpful(reviewId);
}
