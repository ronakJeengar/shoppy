import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_media_entity.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const ProductEntity._();

  const factory ProductEntity({
    required String id,
    required String productName,
    @Default('Shoppy Verified') String sellerName,
    @Default('') String description,
    required double price,
    @Default(0) int stock,
    @Default(0.0) double productRating,
    @Default(0) int totalReviews,
    required String productImage,
    String? categoryId,
    String? categoryName,
    @Default(true) bool isActive,
    @Default([]) List<String> images,
    String? videoUrl,
    String? model3dUrl,
    @Default([]) List<ProductMediaEntity> media,
  }) = _ProductEntity;

  String get name => productName;
  String get imageUrl => productImage;
  bool get isInStock => stock > 0;

  List<String> get allImages {
    if (images.isNotEmpty) return images;
    if (productImage.isNotEmpty) return [productImage];
    return const [];
  }

  bool get hasVideo => videoUrl != null && videoUrl!.trim().isNotEmpty;
  bool get has3dModel => model3dUrl != null && model3dUrl!.trim().isNotEmpty;
}
