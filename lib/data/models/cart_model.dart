class CartItemModel {
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

  CartItemModel({
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

// Backward compatibility alias for any legacy code referencing CartItem
typedef CartItem = CartItemModel;

class CartModel {
  final String id;
  final List<CartItemModel> items;
  final int itemCount;
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;

  CartModel({
    required this.id,
    required this.items,
    required this.itemCount,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });

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

    return CartModel(
      id: json['id']?.toString() ?? '',
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
    );
  }

  factory CartModel.empty() {
    return CartModel(
      id: '',
      items: [],
      itemCount: 0,
      subtotal: 0.0,
      shipping: 0.0,
      tax: 0.0,
      total: 0.0,
    );
  }
}
