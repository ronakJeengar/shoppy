import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/coupons/data/models/coupon_model.dart';

part 'cart_model.freezed.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String id,
    required String productId,
    required String productName,
    required String sellerName,
    required String productImage,
    required double price,
    required int quantity,
    required int stock,
    required bool isAvailable,
    required double lineTotal,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      productId: json['productId']?.toString() ?? '',
      productName: json['productName']?.toString() ?? 'Product',
      sellerName: json['sellerName']?.toString() ?? 'Official Seller',
      productImage: json['productImage']?.toString() ?? '',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      quantity: (json['quantity'] is num) ? (json['quantity'] as num).toInt() : 1,
      stock: (json['stock'] is num) ? (json['stock'] as num).toInt() : 99,
      isAvailable: json['isAvailable'] == true || json['isAvailable'] == null,
      lineTotal: (json['lineTotal'] is num)
          ? (json['lineTotal'] as num).toDouble()
          : 0.0,
    );
  }
}

typedef CartItem = CartItemModel;

@freezed
abstract class CartModel with _$CartModel {
  const CartModel._();

  const factory CartModel({
    @Default('') String id,
    @Default([]) List<CartItemModel> items,
    @Default(0) int itemCount,
    @Default(0.0) double subtotal,
    @Default(0.0) double shipping,
    @Default(0.0) double tax,
    @Default(0.0) double total,
    @Default(0.0) double discount,
    @Default(0.0) double taxableAmount,
    String? couponCode,
    AppliedCouponModel? appliedCoupon,
  }) = _CartModel;

  const factory CartModel.empty({
    @Default('') String id,
    @Default([]) List<CartItemModel> items,
    @Default(0) int itemCount,
    @Default(0.0) double subtotal,
    @Default(0.0) double shipping,
    @Default(0.0) double tax,
    @Default(0.0) double total,
    @Default(0.0) double discount,
    @Default(0.0) double taxableAmount,
    String? couponCode,
    AppliedCouponModel? appliedCoupon,
  }) = _CartModelEmpty;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    final List<CartItemModel> parsedItems = [];

    if (rawItems is List) {
      for (final item in rawItems) {
        if (item is Map<String, dynamic>) {
          parsedItems.add(CartItemModel.fromJson(item));
        }
      }
    }

    AppliedCouponModel? appliedCoupon;
    final rawCoupon = json['appliedCoupon'] ?? json['coupon'];
    if (rawCoupon is Map<String, dynamic>) {
      appliedCoupon = AppliedCouponModel.fromJson(rawCoupon);
    }

    return CartModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      items: parsedItems,
      itemCount: (json['itemCount'] is num)
          ? (json['itemCount'] as num).toInt()
          : parsedItems.fold(0, (sum, i) => sum + i.quantity),
      subtotal: (json['subtotal'] is num)
          ? (json['subtotal'] as num).toDouble()
          : 0.0,
      shipping: (json['shipping'] is num)
          ? (json['shipping'] as num).toDouble()
          : 0.0,
      tax: (json['tax'] is num) ? (json['tax'] as num).toDouble() : 0.0,
      total: (json['total'] is num) ? (json['total'] as num).toDouble() : 0.0,
      discount: (json['discount'] is num)
          ? (json['discount'] as num).toDouble()
          : 0.0,
      taxableAmount: (json['taxableAmount'] is num)
          ? (json['taxableAmount'] as num).toDouble()
          : 0.0,
      couponCode: json['couponCode']?.toString() ?? appliedCoupon?.code,
      appliedCoupon: appliedCoupon,
    );
  }
}

extension CartItemModelX on CartItemModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'sellerName': sellerName,
      'productImage': productImage,
      'price': price,
      'quantity': quantity,
      'stock': stock,
      'isAvailable': isAvailable,
      'lineTotal': lineTotal,
    };
  }
}

extension CartModelX on CartModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((i) => i.toJson()).toList(),
      'itemCount': itemCount,
      'subtotal': subtotal,
      'shipping': shipping,
      'tax': tax,
      'total': total,
      'discount': discount,
      'taxableAmount': taxableAmount,
      'couponCode': couponCode,
    };
  }
}
