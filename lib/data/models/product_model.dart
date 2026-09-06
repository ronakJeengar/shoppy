import 'package:shopp_app/data/models/product_media_model.dart';

class Product {
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
  final List<ProductMedia> media;

  Product({
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

  // Backwards compatibility & convenience getters
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

  List<ProductMedia> get allMedia {
    if (media.isNotEmpty) return media;
    final List<ProductMedia> result = [];
    for (int i = 0; i < allImages.length; i++) {
      result.add(ProductMedia(
        id: '${id}_img_$i',
        type: ProductMediaType.image,
        url: allImages[i],
        thumbnailUrl: allImages[i],
        sortOrder: i,
      ));
    }
    if (hasVideo) {
      result.add(ProductMedia(
        id: '${id}_video',
        type: ProductMediaType.video,
        url: videoUrl!,
        thumbnailUrl: productImage,
        sortOrder: result.length,
      ));
    }
    if (has3dModel) {
      result.add(ProductMedia(
        id: '${id}_3d',
        type: ProductMediaType.model3d,
        url: model3dUrl!,
        thumbnailUrl: productImage,
        sortOrder: result.length,
      ));
    }
    return result;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    String parsedCategoryId = '';
    String parsedCategoryName = '';

    if (json['category'] != null) {
      if (json['category'] is Map<String, dynamic>) {
        final catMap = json['category'] as Map<String, dynamic>;
        parsedCategoryId = (catMap['id'] ?? catMap['_id'] ?? '').toString();
        parsedCategoryName = (catMap['name'] ?? '').toString();
      } else {
        parsedCategoryId = json['category'].toString();
      }
    }

    final num rawPrice = json['price'] is num ? json['price'] as num : 0;
    final num rawRating =
        json['productRating'] is num ? json['productRating'] as num : 0;
    final int parsedStock = json['stock'] is int
        ? json['stock'] as int
        : (int.tryParse(json['stock']?.toString() ?? '0') ?? 0);
    final int parsedTotalReviews = json['totalReviews'] is int
        ? json['totalReviews'] as int
        : (int.tryParse(json['totalReviews']?.toString() ?? '0') ?? 0);

    final List<String> parsedImages = [];
    if (json['images'] is List) {
      for (final item in json['images'] as List) {
        if (item != null && item.toString().isNotEmpty) {
          parsedImages.add(item.toString());
        }
      }
    }

    final List<ProductMedia> parsedMedia = [];
    if (json['media'] is List) {
      for (final item in json['media'] as List) {
        if (item is Map<String, dynamic>) {
          parsedMedia.add(ProductMedia.fromJson(item));
        }
      }
    }

    final mainImage =
        (json['productImage'] ?? json['imageUrl'] ?? '').toString();
    if (parsedImages.isEmpty && mainImage.isNotEmpty) {
      parsedImages.add(mainImage);
    }

    return Product(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      productName: (json['productName'] ?? json['name'] ?? '').toString(),
      sellerName: (json['sellerName'] ?? 'Shoppy Verified').toString(),
      description: (json['description'] ?? '').toString(),
      price: rawPrice.toDouble(),
      stock: parsedStock,
      productRating: rawRating.toDouble(),
      totalReviews: parsedTotalReviews,
      productImage: mainImage,
      categoryId: parsedCategoryId.isNotEmpty ? parsedCategoryId : null,
      categoryName: parsedCategoryName.isNotEmpty ? parsedCategoryName : null,
      isActive: json['isActive'] != false,
      images: parsedImages,
      videoUrl: json['videoUrl']?.toString(),
      model3dUrl: json['model3dUrl']?.toString(),
      media: parsedMedia,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'productName': productName,
      'name': productName,
      'sellerName': sellerName,
      'description': description,
      'price': price,
      'stock': stock,
      'productRating': productRating,
      'totalReviews': totalReviews,
      'productImage': productImage,
      'imageUrl': productImage,
      'images': images,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (model3dUrl != null) 'model3dUrl': model3dUrl,
      'media': media.map((m) => m.toJson()).toList(),
      if (categoryId != null)
        'category': {
          'id': categoryId,
          'name': categoryName ?? '',
        },
    };
  }
}
