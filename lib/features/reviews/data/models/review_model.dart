import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  const ReviewModel._();

  const factory ReviewModel({
    required String id,
    required int rating,
    @Default('') String title,
    required String comment,
    @Default(true) bool verifiedPurchase,
    @Default('Customer') String authorName,
    @Default(false) bool isOwner,
    required DateTime createdAt,
  }) = _ReviewModel;

  String get userName => authorName;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      rating: (json['rating'] is num) ? (json['rating'] as num).toInt() : 5,
      title: json['title']?.toString() ?? '',
      comment: json['comment']?.toString() ?? '',
      verifiedPurchase: json['verifiedPurchase'] != false,
      authorName: json['authorName']?.toString() ?? 'Customer',
      isOwner: json['isOwner'] == true,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

extension ReviewModelX on ReviewModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'title': title,
      'comment': comment,
      'verifiedPurchase': verifiedPurchase,
      'authorName': authorName,
      'isOwner': isOwner,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

@freezed
abstract class ReviewSummaryModel with _$ReviewSummaryModel {
  const factory ReviewSummaryModel({
    @Default(0.0) double averageRating,
    @Default(0) int totalReviews,
    @Default({1: 0, 2: 0, 3: 0, 4: 0, 5: 0}) Map<int, int> ratingDistribution,
  }) = _ReviewSummaryModel;

  factory ReviewSummaryModel.fromJson(Map<String, dynamic> json) {
    final distMap = <int, int>{1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    if (json['ratingDistribution'] is Map<String, dynamic>) {
      final raw = json['ratingDistribution'] as Map<String, dynamic>;
      raw.forEach((key, val) {
        final k = int.tryParse(key);
        if (k != null && val is num) {
          distMap[k] = val.toInt();
        }
      });
    }

    return ReviewSummaryModel(
      averageRating: (json['averageRating'] is num)
          ? (json['averageRating'] as num).toDouble()
          : 0.0,
      totalReviews: (json['totalReviews'] is num)
          ? (json['totalReviews'] as num).toInt()
          : 0,
      ratingDistribution: distMap,
    );
  }
}

@freezed
abstract class ReviewEligibilityModel with _$ReviewEligibilityModel {
  const factory ReviewEligibilityModel({
    required bool canReview,
    required bool hasReviewed,
    required bool isVerifiedPurchase,
    String? reason,
    String? existingReviewId,
    int? existingRating,
    String? existingComment,
  }) = _ReviewEligibilityModel;

  factory ReviewEligibilityModel.fromJson(Map<String, dynamic> json) {
    String? revId;
    int? revRating;
    String? revComment;

    if (json['existingReview'] is Map<String, dynamic>) {
      final rev = json['existingReview'] as Map<String, dynamic>;
      revId = rev['id']?.toString() ?? rev['_id']?.toString();
      revRating = (rev['rating'] is num) ? (rev['rating'] as num).toInt() : null;
      revComment = rev['comment']?.toString();
    }

    return ReviewEligibilityModel(
      canReview: json['canReview'] == true,
      hasReviewed: json['hasReviewed'] == true,
      isVerifiedPurchase: json['isVerifiedPurchase'] == true,
      reason: json['reason']?.toString(),
      existingReviewId: revId,
      existingRating: revRating,
      existingComment: revComment,
    );
  }
}

@freezed
abstract class AdminReviewModel with _$AdminReviewModel {
  const factory AdminReviewModel({
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
  }) = _AdminReviewModel;

  factory AdminReviewModel.fromJson(Map<String, dynamic> json) {
    String uName = 'User';
    String uEmail = '';
    if (json['user'] is Map<String, dynamic>) {
      final u = json['user'] as Map<String, dynamic>;
      uName = u['fullName']?.toString() ?? 'User';
      uEmail = u['email']?.toString() ?? '';
    }

    String pName = 'Product';
    String pImg = '';
    if (json['product'] is Map<String, dynamic>) {
      final p = json['product'] as Map<String, dynamic>;
      pName = p['name']?.toString() ?? p['productName']?.toString() ?? 'Product';
      pImg = p['image']?.toString() ?? p['productImage']?.toString() ?? '';
    }

    return AdminReviewModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      rating: (json['rating'] is num) ? (json['rating'] as num).toInt() : 5,
      title: json['title']?.toString() ?? '',
      comment: json['comment']?.toString() ?? '',
      status: json['status']?.toString() ?? 'PUBLISHED',
      verifiedPurchase: json['verifiedPurchase'] != false,
      userName: uName,
      userEmail: uEmail,
      productName: pName,
      productImage: pImg,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
