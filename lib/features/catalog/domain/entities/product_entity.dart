import 'product_media_entity.dart';

class ProductEntity {
  final String id;
  final String productName;
  final String sellerName;
  final String description;
  final double price;
  final int stock;
  final double productRating;
  final int totalReviews;
  final String productImage;
  final String? categoryId;
  final String? categoryName;
  final bool isActive;
  final List<String> images;
  final String? videoUrl;
  final String? model3dUrl;
  final List<ProductMediaEntity> media;

  const ProductEntity({
    required this.id,
    required this.productName,
    this.sellerName = 'Shoppy Verified',
    this.description = '',
    required this.price,
    this.stock = 0,
    this.productRating = 0.0,
    this.totalReviews = 0,
    required this.productImage,
    this.categoryId,
    this.categoryName,
    this.isActive = true,
    this.images = const [],
    this.videoUrl,
    this.model3dUrl,
    this.media = const [],
  });

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

  List<ProductMediaEntity> get allMedia {
    if (media.isNotEmpty) return media;
    final List<ProductMediaEntity> result = [];
    for (int i = 0; i < allImages.length; i++) {
      result.add(ProductMediaEntity(
        id: '${id}_img_$i',
        type: ProductMediaType.image,
        url: allImages[i],
        thumbnailUrl: allImages[i],
        sortOrder: i,
      ));
    }
    if (hasVideo) {
      result.add(ProductMediaEntity(
        id: '${id}_video',
        type: ProductMediaType.video,
        url: videoUrl!,
        thumbnailUrl: productImage,
        sortOrder: result.length,
      ));
    }
    if (has3dModel) {
      result.add(ProductMediaEntity(
        id: '${id}_3d',
        type: ProductMediaType.model3d,
        url: model3dUrl!,
        thumbnailUrl: productImage,
        sortOrder: result.length,
      ));
    }
    return result;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ProductEntity && other.id == id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ProductEntity(id: $id, name: $productName, price: $price)';
}
