import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_sale_model.freezed.dart';

@freezed
abstract class FlashSaleItemModel with _$FlashSaleItemModel {
  const factory FlashSaleItemModel({
    required String id,
    required String productId,
    required String productName,
    @Default('') String productImage,
    @Default('Official Seller') String sellerName,
    required double regularPrice,
    required double salePrice,
    @Default(0.0) double mrp,
    @Default('FIXED_PRICE') String discountType,
    @Default(0.0) double discountValue,
    @Default(0) int discountPercentage,
    @Default(2) int maximumQuantityPerOrder,
    @Default(0) int stockAllocated,
    @Default(0) int stockSold,
    int? remainingStock,
    @Default(false) bool isSoldOut,
    DateTime? endAt,
    DateTime? serverTime,
  }) = _FlashSaleItemModel;

  factory FlashSaleItemModel.fromJson(Map<String, dynamic> json) {
    final regular = (json['regularPrice'] as num?)?.toDouble() ?? 0.0;
    final sale = (json['salePrice'] as num?)?.toDouble() ?? 0.0;
    final mrp = (json['mrp'] as num?)?.toDouble() ?? regular;
    final allocated = (json['stockAllocated'] as num?)?.toInt() ?? 0;
    final sold = (json['stockSold'] as num?)?.toInt() ?? 0;
    final remaining = json['remainingStock'] != null
        ? (json['remainingStock'] as num).toInt()
        : (allocated > 0 ? (allocated - sold) : null);
    final isSoldOut = json['isSoldOut'] == true || (allocated > 0 && sold >= allocated);

    int discountPercent = (json['discountPercentage'] as num?)?.toInt() ?? 0;
    if (discountPercent == 0 && regular > 0 && sale < regular) {
      discountPercent = (((regular - sale) / regular) * 100).round();
    }

    DateTime? endAt;
    if (json['endAt'] != null) {
      endAt = DateTime.tryParse(json['endAt'].toString());
    }

    DateTime? serverTime;
    if (json['serverTime'] != null) {
      serverTime = DateTime.tryParse(json['serverTime'].toString());
    }

    return FlashSaleItemModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? json['flashSaleId']?.toString() ?? '',
      productId: json['productId']?.toString() ?? '',
      productName: json['productName']?.toString() ?? json['flashSaleTitle']?.toString() ?? 'Product',
      productImage: json['productImage']?.toString() ?? '',
      sellerName: json['sellerName']?.toString() ?? 'Official Seller',
      regularPrice: regular,
      salePrice: sale,
      mrp: mrp,
      discountType: json['discountType']?.toString().toUpperCase() ?? 'FIXED_PRICE',
      discountValue: (json['discountValue'] as num?)?.toDouble() ?? 0.0,
      discountPercentage: discountPercent,
      maximumQuantityPerOrder: (json['maximumQuantityPerOrder'] as num?)?.toInt() ?? 2,
      stockAllocated: allocated,
      stockSold: sold,
      remainingStock: remaining,
      isSoldOut: isSoldOut,
      endAt: endAt,
      serverTime: serverTime,
    );
  }
}

@freezed
abstract class FlashSaleModel with _$FlashSaleModel {
  const factory FlashSaleModel({
    required String id,
    required String name,
    required String title,
    @Default('') String description,
    @Default('FLASH_SALE') String saleType,
    @Default('') String bannerImage,
    required DateTime startAt,
    required DateTime endAt,
    @Default(true) bool isActive,
    @Default(0) int priority,
    @Default([]) List<FlashSaleItemModel> items,
    @Default(0) int itemCount,
    DateTime? serverTime,
  }) = _FlashSaleModel;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json, {DateTime? serverTime}) {
    final rawItems = json['items'] as List<dynamic>? ?? [];
    final List<FlashSaleItemModel> parsedItems = [];
    for (final raw in rawItems) {
      if (raw is Map<String, dynamic>) {
        parsedItems.add(FlashSaleItemModel.fromJson(raw));
      }
    }

    return FlashSaleModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      saleType: json['saleType']?.toString() ?? 'FLASH_SALE',
      bannerImage: json['bannerImage']?.toString() ?? '',
      startAt: json['startAt'] != null
          ? DateTime.tryParse(json['startAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
      endAt: json['endAt'] != null
          ? DateTime.tryParse(json['endAt'].toString()) ?? DateTime.now().add(const Duration(hours: 24))
          : DateTime.now().add(const Duration(hours: 24)),
      isActive: json['isActive'] != false,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      items: parsedItems,
      itemCount: parsedItems.length,
      serverTime: serverTime,
    );
  }
}
