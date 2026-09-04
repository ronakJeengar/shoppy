class ReviewModel {
  final String id;
  final int rating;
  final String title;
  final String comment;
  final bool verifiedPurchase;
  final String authorName;
  final bool isOwner;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.rating,
    this.title = '',
    required this.comment,
    this.verifiedPurchase = true,
    this.authorName = 'Customer',
    this.isOwner = false,
    required this.createdAt,
  });

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

class ReviewSummaryModel {
  final double averageRating;
  final int totalReviews;
  final Map<int, int> ratingDistribution;

  ReviewSummaryModel({
    required this.averageRating,
    required this.totalReviews,
    required this.ratingDistribution,
  });

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

class ReviewEligibilityModel {
  final bool canReview;
  final bool hasReviewed;
  final bool isVerifiedPurchase;
  final String? reason;
  final String? existingReviewId;
  final int? existingRating;
  final String? existingComment;

  ReviewEligibilityModel({
    required this.canReview,
    required this.hasReviewed,
    required this.isVerifiedPurchase,
    this.reason,
    this.existingReviewId,
    this.existingRating,
    this.existingComment,
  });

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

class AdminReviewModel {
  final String id;
  final int rating;
  final String title;
  final String comment;
  final String status;
  final bool verifiedPurchase;
  final String userName;
  final String userEmail;
  final String productName;
  final String productImage;
  final DateTime createdAt;

  AdminReviewModel({
    required this.id,
    required this.rating,
    this.title = '',
    required this.comment,
    required this.status,
    this.verifiedPurchase = true,
    required this.userName,
    required this.userEmail,
    required this.productName,
    this.productImage = '',
    required this.createdAt,
  });

  AdminReviewModel copyWith({String? status}) {
    return AdminReviewModel(
      id: id,
      rating: rating,
      title: title,
      comment: comment,
      status: status ?? this.status,
      verifiedPurchase: verifiedPurchase,
      userName: userName,
      userEmail: userEmail,
      productName: productName,
      productImage: productImage,
      createdAt: createdAt,
    );
  }

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
