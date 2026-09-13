import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_sale_entity.freezed.dart';

@freezed
abstract class FlashSaleItemEntity with _$FlashSaleItemEntity {
  const factory FlashSaleItemEntity({
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
  }) = _FlashSaleItemEntity;
}

@freezed
abstract class FlashSaleEntity with _$FlashSaleEntity {
  const factory FlashSaleEntity({
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
    @Default([]) List<FlashSaleItemEntity> items,
    @Default(0) int itemCount,
    DateTime? serverTime,
  }) = _FlashSaleEntity;
}
