import 'package:shopp_app/features/catalog/data/mappers/catalog_mappers.dart';
import '../../domain/entities/recommendation_entity.dart';
import '../models/recommendation_model.dart';

extension RecommendedProductModelMapper on RecommendedProductModel {
  RecommendedProductEntity toEntity() {
    return RecommendedProductEntity(
      product: product.toEntity(),
      recommendationReason: recommendationReason,
      score: score,
      source: source,
    );
  }
}

extension RecommendedProductEntityMapper on RecommendedProductEntity {
  RecommendedProductModel toModel() {
    return RecommendedProductModel(
      product: product.toModel(),
      recommendationReason: recommendationReason,
      score: score,
      source: source,
    );
  }
}

extension RecommendationResponseModelMapper on RecommendationResponseModel {
  RecommendationResponseEntity toEntity() {
    return RecommendationResponseEntity(
      recommendationType: recommendationType,
      reason: reason,
      count: count,
      items: items.map((i) => i.toEntity()).toList(),
      metadata: metadata,
    );
  }
}

extension RecommendationResponseEntityMapper on RecommendationResponseEntity {
  RecommendationResponseModel toModel() {
    return RecommendationResponseModel(
      recommendationType: recommendationType,
      reason: reason,
      count: count,
      items: items.map((i) => i.toModel()).toList(),
      metadata: metadata,
    );
  }
}
