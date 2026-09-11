import '../models/review_model.dart';
import '../../domain/entities/review_entity.dart';

extension ReviewModelMapper on ReviewModel {
  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      rating: rating,
      title: title,
      comment: comment,
      verifiedPurchase: verifiedPurchase,
      authorName: authorName,
      isOwner: isOwner,
      createdAt: createdAt,
    );
  }
}

extension ReviewEntityMapper on ReviewEntity {
  ReviewModel toModel() {
    return ReviewModel(
      id: id,
      rating: rating,
      title: title,
      comment: comment,
      verifiedPurchase: verifiedPurchase,
      authorName: authorName,
      isOwner: isOwner,
      createdAt: createdAt,
    );
  }
}

extension ReviewSummaryModelMapper on ReviewSummaryModel {
  ReviewSummaryEntity toEntity() {
    return ReviewSummaryEntity(
      averageRating: averageRating,
      totalReviews: totalReviews,
      ratingDistribution: ratingDistribution,
    );
  }
}

extension ReviewSummaryEntityMapper on ReviewSummaryEntity {
  ReviewSummaryModel toModel() {
    return ReviewSummaryModel(
      averageRating: averageRating,
      totalReviews: totalReviews,
      ratingDistribution: ratingDistribution,
    );
  }
}

extension ReviewEligibilityModelMapper on ReviewEligibilityModel {
  ReviewEligibilityEntity toEntity() {
    return ReviewEligibilityEntity(
      canReview: canReview,
      hasReviewed: hasReviewed,
      isVerifiedPurchase: isVerifiedPurchase,
      reason: reason,
      existingReviewId: existingReviewId,
      existingRating: existingRating,
      existingComment: existingComment,
    );
  }
}

extension ReviewEligibilityEntityMapper on ReviewEligibilityEntity {
  ReviewEligibilityModel toModel() {
    return ReviewEligibilityModel(
      canReview: canReview,
      hasReviewed: hasReviewed,
      isVerifiedPurchase: isVerifiedPurchase,
      reason: reason,
      existingReviewId: existingReviewId,
      existingRating: existingRating,
      existingComment: existingComment,
    );
  }
}

extension AdminReviewModelMapper on AdminReviewModel {
  AdminReviewEntity toEntity() {
    return AdminReviewEntity(
      id: id,
      rating: rating,
      title: title,
      comment: comment,
      status: status,
      verifiedPurchase: verifiedPurchase,
      userName: userName,
      userEmail: userEmail,
      productName: productName,
      productImage: productImage,
      createdAt: createdAt,
    );
  }
}

extension AdminReviewEntityMapper on AdminReviewEntity {
  AdminReviewModel toModel() {
    return AdminReviewModel(
      id: id,
      rating: rating,
      title: title,
      comment: comment,
      status: status,
      verifiedPurchase: verifiedPurchase,
      userName: userName,
      userEmail: userEmail,
      productName: productName,
      productImage: productImage,
      createdAt: createdAt,
    );
  }
}
