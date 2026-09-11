import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_entity.freezed.dart';

@freezed
abstract class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
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
  }) = _CartItemEntity;
}

@freezed
abstract class CartEntity with _$CartEntity {
  const CartEntity._();

  const factory CartEntity({
    @Default('') String id,
    @Default([]) List<CartItemEntity> items,
    @Default(0) int itemCount,
    @Default(0.0) double subtotal,
    @Default(0.0) double shipping,
    @Default(0.0) double tax,
    @Default(0.0) double total,
  }) = _CartEntity;

  const factory CartEntity.empty({
    @Default('') String id,
    @Default([]) List<CartItemEntity> items,
    @Default(0) int itemCount,
    @Default(0.0) double subtotal,
    @Default(0.0) double shipping,
    @Default(0.0) double tax,
    @Default(0.0) double total,
  }) = _CartEntityEmpty;

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
}
