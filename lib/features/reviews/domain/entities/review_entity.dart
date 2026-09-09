import '../../../../data/models/review_model.dart';

class ProductReviewsResult {
  final List<ReviewModel> reviews;
  final ReviewSummaryModel summary;

  const ProductReviewsResult({
    required this.reviews,
    required this.summary,
  });
}
