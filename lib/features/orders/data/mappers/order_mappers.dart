import 'package:shopp_app/features/addresses/data/mappers/address_mappers.dart';
import 'package:shopp_app/features/checkout/data/mappers/checkout_mappers.dart';
import 'package:shopp_app/features/checkout/data/models/tax_breakdown_model.dart';
import '../../domain/entities/order_entity.dart';
import '../models/order_model.dart';

extension OrderItemModelMapper on OrderItemModel {
  OrderItemEntity toEntity() {
    return OrderItemEntity(
      productId: productId,
      productName: productName,
      productImage: productImage,
      sellerName: sellerName,
      unitPrice: unitPrice,
      quantity: quantity,
      lineTotal: lineTotal,
      hsnCode: hsnCode,
      gstRate: gstRate,
      isTaxInclusive: isTaxInclusive,
      taxableAmount: taxableAmount,
    );
  }
}

extension OrderItemEntityMapper on OrderItemEntity {
  OrderItemModel toModel() {
    return OrderItemModel(
      productId: productId,
      productName: productName,
      productImage: productImage,
      sellerName: sellerName,
      unitPrice: unitPrice,
      quantity: quantity,
      lineTotal: lineTotal,
      hsnCode: hsnCode,
      gstRate: gstRate,
      isTaxInclusive: isTaxInclusive,
      taxableAmount: taxableAmount,
    );
  }
}

extension OrderStatusHistoryItemMapper on OrderStatusHistoryItem {
  OrderStatusHistoryEntity toEntity() {
    return OrderStatusHistoryEntity(
      status: status,
      timestamp: timestamp,
      note: note,
    );
  }
}

extension OrderStatusHistoryEntityMapper on OrderStatusHistoryEntity {
  OrderStatusHistoryItem toModel() {
    return OrderStatusHistoryItem(
      status: status,
      timestamp: timestamp,
      note: note,
    );
  }
}

extension OrderModelMapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      orderNumber: orderNumber,
      orderItems: orderItems.map((i) => i.toEntity()).toList(),
      shippingAddress: shippingAddress?.toEntity(),
      shippingMethod: shippingMethod,
      subtotal: subtotal,
      shippingFee: shippingFee,
      tax: tax,
      totalAmount: totalAmount,
      currency: currency,
      currencySymbol: currencySymbol,
      taxableAmount: taxableAmount,
      discount: discount,
      taxBreakdown: taxBreakdown?.toEntity(),
      customerGstin: customerGstin,
      codFee: codFee,
      codDetails: codDetails,
      status: status,
      payment: payment?.toEntity(),
      carrier: carrier,
      trackingNumber: trackingNumber,
      cancellationReason: cancellationReason,
      canCancel: canCancel,
      statusHistory: statusHistory.map((h) => h.toEntity()).toList(),
      createdAt: createdAt,
    );
  }
}

extension OrderEntityMapper on OrderEntity {
  OrderModel toModel() {
    return OrderModel(
      id: id,
      orderNumber: orderNumber,
      orderItems: orderItems.map((i) => i.toModel()).toList(),
      shippingAddress: shippingAddress?.toModel(),
      shippingMethod: shippingMethod,
      subtotal: subtotal,
      shippingFee: shippingFee,
      tax: tax,
      totalAmount: totalAmount,
      currency: currency,
      currencySymbol: currencySymbol,
      taxableAmount: taxableAmount,
      discount: discount,
      taxBreakdown: taxBreakdown != null ? TaxBreakdownModel.fromEntity(taxBreakdown!) : null,
      customerGstin: customerGstin,
      codFee: codFee,
      codDetails: codDetails,
      status: status,
      payment: payment?.toModel(),
      carrier: carrier,
      trackingNumber: trackingNumber,
      cancellationReason: cancellationReason,
      canCancel: canCancel,
      statusHistory: statusHistory.map((h) => h.toModel()).toList(),
      createdAt: createdAt,
    );
  }
}
