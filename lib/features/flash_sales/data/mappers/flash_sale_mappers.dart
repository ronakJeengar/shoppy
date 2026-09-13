import '../../domain/entities/flash_sale_entity.dart';
import '../models/flash_sale_model.dart';

extension FlashSaleItemModelMapper on FlashSaleItemModel {
  FlashSaleItemEntity toEntity() {
    return FlashSaleItemEntity(
      id: id,
      productId: productId,
      productName: productName,
      productImage: productImage,
      sellerName: sellerName,
      regularPrice: regularPrice,
      salePrice: salePrice,
      mrp: mrp,
      discountType: discountType,
      discountValue: discountValue,
      discountPercentage: discountPercentage,
      maximumQuantityPerOrder: maximumQuantityPerOrder,
      stockAllocated: stockAllocated,
      stockSold: stockSold,
      remainingStock: remainingStock,
      isSoldOut: isSoldOut,
      endAt: endAt,
      serverTime: serverTime,
    );
  }
}

extension FlashSaleItemEntityMapper on FlashSaleItemEntity {
  FlashSaleItemModel toModel() {
    return FlashSaleItemModel(
      id: id,
      productId: productId,
      productName: productName,
      productImage: productImage,
      sellerName: sellerName,
      regularPrice: regularPrice,
      salePrice: salePrice,
      mrp: mrp,
      discountType: discountType,
      discountValue: discountValue,
      discountPercentage: discountPercentage,
      maximumQuantityPerOrder: maximumQuantityPerOrder,
      stockAllocated: stockAllocated,
      stockSold: stockSold,
      remainingStock: remainingStock,
      isSoldOut: isSoldOut,
      endAt: endAt,
      serverTime: serverTime,
    );
  }
}

extension FlashSaleModelMapper on FlashSaleModel {
  FlashSaleEntity toEntity() {
    return FlashSaleEntity(
      id: id,
      name: name,
      title: title,
      description: description,
      saleType: saleType,
      bannerImage: bannerImage,
      startAt: startAt,
      endAt: endAt,
      isActive: isActive,
      priority: priority,
      items: items.map((i) => i.toEntity()).toList(),
      itemCount: itemCount,
      serverTime: serverTime,
    );
  }
}

extension FlashSaleEntityMapper on FlashSaleEntity {
  FlashSaleModel toModel() {
    return FlashSaleModel(
      id: id,
      name: name,
      title: title,
      description: description,
      saleType: saleType,
      bannerImage: bannerImage,
      startAt: startAt,
      endAt: endAt,
      isActive: isActive,
      priority: priority,
      items: items.map((i) => i.toModel()).toList(),
      itemCount: itemCount,
      serverTime: serverTime,
    );
  }
}
