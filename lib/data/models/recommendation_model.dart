import 'package:shopp_app/data/models/product_model.dart';

class RecommendedProduct {
  final Product product;
  final String? recommendationReason;
  final double score;
  final String? source;

  RecommendedProduct({
    required this.product,
    this.recommendationReason,
    this.score = 0.0,
    this.source,
  });

  factory RecommendedProduct.fromJson(Map<String, dynamic> json) {
    return RecommendedProduct(
      product: Product.fromJson(json),
      recommendationReason: json['recommendationReason'] as String?,
      score: (json['score'] is num) ? (json['score'] as num).toDouble() : 0.0,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = product.toJson();
    if (recommendationReason != null) {
      map['recommendationReason'] = recommendationReason;
    }
    map['score'] = score;
    if (source != null) {
      map['source'] = source;
    }
    return map;
  }
}

class RecommendationResponseModel {
  final String recommendationType;
  final String reason;
  final int count;
  final List<RecommendedProduct> items;
  final Map<String, dynamic>? metadata;

  RecommendationResponseModel({
    required this.recommendationType,
    required this.reason,
    required this.count,
    required this.items,
    this.metadata,
  });

  List<Product> get products => items.map((e) => e.product).toList();

  factory RecommendationResponseModel.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'] as List? ?? [];
    final items = <RecommendedProduct>[];
    for (final item in rawProducts) {
      if (item is Map<String, dynamic>) {
        items.add(RecommendedProduct.fromJson(item));
      }
    }

    return RecommendationResponseModel(
      recommendationType: (json['recommendationType'] ?? 'TRENDING').toString(),
      reason: (json['reason'] ?? '').toString(),
      count: (json['count'] is num)
          ? (json['count'] as num).toInt()
          : items.length,
      items: items,
      metadata: json['metadata'] is Map<String, dynamic>
          ? json['metadata'] as Map<String, dynamic>
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recommendationType': recommendationType,
      'reason': reason,
      'count': count,
      'products': items.map((e) => e.toJson()).toList(),
      if (metadata != null) 'metadata': metadata,
    };
  }
}
