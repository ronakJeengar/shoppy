import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_media_model.dart';

part 'product_model.freezed.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String productName,
    @Default('Shoppy Verified') String sellerName,
    @Default('') String description,
    required double price,
    double? mrp,
    @Default('8518') String hsnCode,
    @Default(18.0) double gstRate,
    @Default(true) bool isTaxInclusive,
    @Default(true) bool isCodEligible,
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
    @Default([]) List<ProductMediaModel> media,
  }) = _ProductModel;

  String get name => productName;
  String get imageUrl => productImage;
  bool get isInStock => stock > 0;

  bool get hasDiscount => mrp != null && mrp! > price;
  double get discountPercentage =>
      hasDiscount ? (((mrp! - price) / mrp!) * 100).roundToDouble() : 0.0;

  List<String> get allImages {
    if (images.isNotEmpty) return images;
    if (productImage.isNotEmpty) return [productImage];
    return const [];
  }

  bool get hasVideo => videoUrl != null && videoUrl!.trim().isNotEmpty;
  bool get has3dModel => model3dUrl != null && model3dUrl!.trim().isNotEmpty;

  List<ProductMediaModel> get allMedia {
    if (media.isNotEmpty) return media;
    final List<ProductMediaModel> result = [];
    for (int i = 0; i < allImages.length; i++) {
      result.add(ProductMediaModel(
        id: '${id}_img_$i',
        type: ProductMediaType.image,
        url: allImages[i],
        thumbnailUrl: allImages[i],
        sortOrder: i,
      ));
    }
    if (hasVideo) {
      result.add(ProductMediaModel(
        id: '${id}_video',
        type: ProductMediaType.video,
        url: videoUrl!,
        thumbnailUrl: productImage,
        sortOrder: result.length,
      ));
    }
    if (has3dModel) {
      result.add(ProductMediaModel(
        id: '${id}_3d',
        type: ProductMediaType.model3d,
        url: model3dUrl!,
        thumbnailUrl: productImage,
        sortOrder: result.length,
      ));
    }
    return result;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
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
    final double? parsedMrp = (json['mrp'] is num)
        ? (json['mrp'] as num).toDouble()
        : null;
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

    final List<ProductMediaModel> parsedMedia = [];
    if (json['media'] is List) {
      for (final item in json['media'] as List) {
        if (item is Map<String, dynamic>) {
          parsedMedia.add(ProductMediaModel.fromJson(item));
        }
      }
    }

    final mainImage =
        (json['productImage'] ?? json['imageUrl'] ?? '').toString();
    if (parsedImages.isEmpty && mainImage.isNotEmpty) {
      parsedImages.add(mainImage);
    }

    return ProductModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      productName: (json['productName'] ?? json['name'] ?? '').toString(),
      sellerName: (json['sellerName'] ?? 'Shoppy Verified').toString(),
      description: (json['description'] ?? '').toString(),
      price: rawPrice.toDouble(),
      mrp: parsedMrp,
      hsnCode: json['hsnCode']?.toString() ?? '8518',
      gstRate: (json['gstRate'] is num)
          ? (json['gstRate'] as num).toDouble()
          : 18.0,
      isTaxInclusive: json['isTaxInclusive'] != null
          ? json['isTaxInclusive'] == true
          : true,
      isCodEligible: json['isCodEligible'] != null
          ? json['isCodEligible'] == true
          : true,
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
      'productName': productName,
      'sellerName': sellerName,
      'description': description,
      'price': price,
      'mrp': mrp,
      'hsnCode': hsnCode,
      'gstRate': gstRate,
      'isTaxInclusive': isTaxInclusive,
      'isCodEligible': isCodEligible,
      'stock': stock,
      'productRating': productRating,
      'totalReviews': totalReviews,
      'productImage': productImage,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'isActive': isActive,
      'images': images,
      'videoUrl': videoUrl,
      'model3dUrl': model3dUrl,
      'media': media.map((m) => m.toJson()).toList(),
    };
  }
}

typedef Product = ProductModel;
