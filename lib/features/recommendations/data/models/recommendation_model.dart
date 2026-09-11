import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/catalog/data/models/product_model.dart';

part 'recommendation_model.freezed.dart';

@freezed
abstract class RecommendedProductModel with _$RecommendedProductModel {
  const factory RecommendedProductModel({
    required ProductModel product,
    String? recommendationReason,
    @Default(0.0) double score,
    String? source,
  }) = _RecommendedProductModel;

  factory RecommendedProductModel.fromJson(Map<String, dynamic> json) {
    return RecommendedProductModel(
      product: ProductModel.fromJson(json),
      recommendationReason: json['recommendationReason'] as String?,
      score: (json['score'] is num) ? (json['score'] as num).toDouble() : 0.0,
      source: json['source'] as String?,
    );
  }
}

extension RecommendedProductModelX on RecommendedProductModel {
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

typedef RecommendedProduct = RecommendedProductModel;

@freezed
abstract class RecommendationResponseModel with _$RecommendationResponseModel {
  const RecommendationResponseModel._();

  const factory RecommendationResponseModel({
    @Default('TRENDING') String recommendationType,
    @Default('') String reason,
    @Default(0) int count,
    @Default([]) List<RecommendedProductModel> items,
    Map<String, dynamic>? metadata,
  }) = _RecommendationResponseModel;

  List<ProductModel> get products => items.map((e) => e.product).toList();

  factory RecommendationResponseModel.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'] as List? ?? [];
    final items = <RecommendedProductModel>[];
    for (final item in rawProducts) {
      if (item is Map<String, dynamic>) {
        items.add(RecommendedProductModel.fromJson(item));
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
}

extension RecommendationResponseModelX on RecommendationResponseModel {
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
