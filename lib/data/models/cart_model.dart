class CartItem {
  String productId;
  String productName;
  int quantity;
  double price;

  CartItem({required this.productId, required this.productName, required this.quantity, required this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }
}
