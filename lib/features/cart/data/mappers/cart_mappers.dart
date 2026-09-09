import '../../../../data/models/cart_model.dart';
import '../../domain/entities/cart_entity.dart';

extension CartItemMapper on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(
      id: id,
      productId: productId,
      productName: productName,
      sellerName: sellerName,
      productImage: productImage,
      price: price,
      quantity: quantity,
      stock: stock,
      isAvailable: isAvailable,
      lineTotal: lineTotal,
    );
  }
}

extension CartMapper on CartModel {
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      items: items.map((i) => i.toEntity()).toList(),
      itemCount: itemCount,
      subtotal: subtotal,
      shipping: shipping,
      tax: tax,
      total: total,
    );
  }
}
