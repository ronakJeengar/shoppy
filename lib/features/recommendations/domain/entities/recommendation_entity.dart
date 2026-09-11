import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';

part 'recommendation_entity.freezed.dart';

@freezed
abstract class RecommendedProductEntity with _$RecommendedProductEntity {
  const factory RecommendedProductEntity({
    required ProductEntity product,
    String? recommendationReason,
    @Default(0.0) double score,
    String? source,
  }) = _RecommendedProductEntity;
}

@freezed
abstract class RecommendationResponseEntity with _$RecommendationResponseEntity {
  const RecommendationResponseEntity._();

  const factory RecommendationResponseEntity({
    @Default('TRENDING') String recommendationType,
    @Default('') String reason,
    @Default(0) int count,
    @Default([]) List<RecommendedProductEntity> items,
    Map<String, dynamic>? metadata,
  }) = _RecommendationResponseEntity;

  List<ProductEntity> get products => items.map((e) => e.product).toList();
}
