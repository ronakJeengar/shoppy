class CartItemEntity {
  final String id;
  final String productId;
  final String productName;
  final String sellerName;
  final String productImage;
  final double price;
  final int quantity;
  final int stock;
  final bool isAvailable;
  final double lineTotal;

  const CartItemEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.sellerName,
    required this.productImage,
    required this.price,
    required this.quantity,
    required this.stock,
    required this.isAvailable,
    required this.lineTotal,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItemEntity &&
          other.productId == productId &&
          other.quantity == quantity &&
          other.lineTotal == lineTotal);

  @override
  int get hashCode => Object.hash(productId, quantity, lineTotal);
}

class CartEntity {
  final String id;
  final List<CartItemEntity> items;
  final int itemCount;
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;

  const CartEntity({
    required this.id,
    required this.items,
    required this.itemCount,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });

  const CartEntity.empty()
      : id = '',
        items = const [],
        itemCount = 0,
        subtotal = 0.0,
        shipping = 0.0,
        tax = 0.0,
        total = 0.0;

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartEntity &&
          other.id == id &&
          other.itemCount == itemCount &&
          other.total == total);

  @override
  int get hashCode => Object.hash(id, itemCount, total);
}
