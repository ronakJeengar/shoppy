import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

@freezed
abstract class ReviewEntity with _$ReviewEntity {
  const ReviewEntity._();

  const factory ReviewEntity({
    required String id,
    required int rating,
    @Default('') String title,
    required String comment,
    @Default(true) bool verifiedPurchase,
    @Default('Customer') String authorName,
    @Default(false) bool isOwner,
    required DateTime createdAt,
  }) = _ReviewEntity;

  String get userName => authorName;
}

@freezed
abstract class ReviewSummaryEntity with _$ReviewSummaryEntity {
  const factory ReviewSummaryEntity({
    @Default(0.0) double averageRating,
    @Default(0) int totalReviews,
    @Default({1: 0, 2: 0, 3: 0, 4: 0, 5: 0}) Map<int, int> ratingDistribution,
  }) = _ReviewSummaryEntity;
}

@freezed
abstract class ReviewEligibilityEntity with _$ReviewEligibilityEntity {
  const factory ReviewEligibilityEntity({
    required bool canReview,
    required bool hasReviewed,
    required bool isVerifiedPurchase,
    String? reason,
    String? existingReviewId,
    int? existingRating,
    String? existingComment,
  }) = _ReviewEligibilityEntity;
}

@freezed
abstract class AdminReviewEntity with _$AdminReviewEntity {
  const factory AdminReviewEntity({
    required String id,
    required int rating,
    @Default('') String title,
    required String comment,
    required String status,
    @Default(true) bool verifiedPurchase,
    required String userName,
    required String userEmail,
    required String productName,
    @Default('') String productImage,
    required DateTime createdAt,
  }) = _AdminReviewEntity;
}

@freezed
abstract class ProductReviewsResult with _$ProductReviewsResult {
  const factory ProductReviewsResult({
    required List<ReviewEntity> reviews,
    required ReviewSummaryEntity summary,
  }) = _ProductReviewsResult;
}
