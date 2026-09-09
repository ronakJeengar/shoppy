import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../../../data/models/review_model.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repositories/review_repository.dart';
import '../datasources/review_remote_datasource.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource _remoteDataSource;

  ReviewRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<ProductReviewsResult>> getProductReviews(
    String productId, {
    int page = 1,
    int limit = 10,
    int? ratingFilter,
  }) async {
    try {
      final res = await _remoteDataSource.getProductReviews(
        productId,
        page: page,
        limit: limit,
        ratingFilter: ratingFilter,
      );
      return Success(res);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load reviews');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ReviewModel>> submitReview({
    required String productId,
    required int rating,
    required String title,
    required String comment,
  }) async {
    try {
      final review = await _remoteDataSource.submitReview(
        productId: productId,
        rating: rating,
        title: title,
        comment: comment,
      );
      return Success(review);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to submit review');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ReviewModel>> updateReview(
    String reviewId, {
    int? rating,
    String? title,
    String? comment,
  }) async {
    try {
      final review = await _remoteDataSource.updateReview(
        reviewId,
        rating: rating,
        title: title,
        comment: comment,
      );
      return Success(review);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to update review');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteReview(String reviewId) async {
    try {
      await _remoteDataSource.deleteReview(reviewId);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to delete review');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> voteHelpful(String reviewId) async {
    try {
      await _remoteDataSource.voteHelpful(reviewId);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to vote review');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
