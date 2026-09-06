import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/data/repositories/review_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepository();
});

class ProductReviewsData {
  final List<ReviewModel> reviews;
  final ReviewSummaryModel summary;

  const ProductReviewsData({
    required this.reviews,
    required this.summary,
  });
}

class ProductReviewsNotifier extends StateNotifier<UiState<ProductReviewsData>> {
  final ReviewRepository _repository;
  final String _productId;

  ProductReviewsNotifier(this._repository, this._productId)
      : super(const UiState.initial()) {
    loadReviews();
  }

  Future<void> loadReviews({int page = 1, int? rating, String sort = 'newest'}) async {
    state = const UiState.loading();
    try {
      final response = await _repository.getProductReviews(
        _productId,
        page: page,
        rating: rating,
        sort: sort,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final reviews = data['reviews'] as List<ReviewModel>? ?? [];
        final summary = data['summary'] as ReviewSummaryModel? ??
            ReviewSummaryModel(
              averageRating: 0.0,
              totalReviews: 0,
              ratingDistribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 0},
            );

        if (reviews.isEmpty) {
          state = const UiState.empty('No verified reviews yet');
        } else {
          state = UiState.success(
            ProductReviewsData(reviews: reviews, summary: summary),
          );
        }
      } else {
        state = UiState.error(response.message);
      }
    } catch (e) {
      state = UiState.error(e.toString());
    }
  }

  Future<bool> addReview({
    required int rating,
    String? title,
    required String comment,
  }) async {
    try {
      final response = await _repository.createReview(
        _productId,
        rating: rating,
        title: title,
        comment: comment,
      );
      if (response.status) {
        await loadReviews();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

final productReviewsProvider = StateNotifierProvider.family<
    ProductReviewsNotifier,
    UiState<ProductReviewsData>,
    String>((ref, productId) {
  final repository = ref.watch(reviewRepositoryProvider);
  return ProductReviewsNotifier(repository, productId);
});

final reviewEligibilityProvider =
    FutureProvider.family<ReviewEligibilityModel?, String>((ref, productId) async {
  final repository = ref.watch(reviewRepositoryProvider);
  final response = await repository.getReviewEligibility(productId);
  if (response.status && response.data is ReviewEligibilityModel) {
    return response.data as ReviewEligibilityModel;
  }
  return null;
});
