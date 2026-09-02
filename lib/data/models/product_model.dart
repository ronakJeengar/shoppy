class Product {
  final String id;
  final String productName;
  final String sellerName;
  final String description;
  final double price;
  final int stock;
  final double productRating;
  final String productImage;
  final String? categoryId;
  final String? categoryName;

  Product({
    required this.id,
    required this.productName,
    this.sellerName = 'Shoppy Verified',
    this.description = '',
    required this.price,
    this.stock = 0,
    this.productRating = 0.0,
    required this.productImage,
    this.categoryId,
    this.categoryName,
  });

  // Backwards compatibility getters
  String get name => productName;
  String get imageUrl => productImage;
  bool get isInStock => stock > 0;

  factory Product.fromJson(Map<String, dynamic> json) {
    String parsedCategoryId = '';
    String parsedCategoryName = '';

    if (json['category'] != null) {
      if (json['category'] is Map<String, dynamic>) {
        final catMap = json['category'] as Map<String, dynamic>;
        parsedCategoryId = (catMap['id'] ?? catMap['_id'] ?? '').toString();
        parsedCategoryName = (catMap['name'] ?? '').toString();
      } else {
        parsedCategoryId = json['category'].toString();
      }
    }

    final num rawPrice = json['price'] is num ? json['price'] as num : 0;
    final num rawRating =
        json['productRating'] is num ? json['productRating'] as num : 0;
    final int parsedStock = json['stock'] is int
        ? json['stock'] as int
        : (int.tryParse(json['stock']?.toString() ?? '0') ?? 0);

    return Product(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      productName: (json['productName'] ?? json['name'] ?? '').toString(),
      sellerName:
          (json['sellerName'] ?? 'Shoppy Verified').toString(),
      description: (json['description'] ?? '').toString(),
      price: rawPrice.toDouble(),
      stock: parsedStock,
      productRating: rawRating.toDouble(),
      productImage: (json['productImage'] ?? json['imageUrl'] ?? '').toString(),
      categoryId: parsedCategoryId.isNotEmpty ? parsedCategoryId : null,
      categoryName: parsedCategoryName.isNotEmpty ? parsedCategoryName : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'productName': productName,
      'name': productName,
      'sellerName': sellerName,
      'description': description,
      'price': price,
      'stock': stock,
      'productRating': productRating,
      'productImage': productImage,
      'imageUrl': productImage,
      if (categoryId != null)
        'category': {
          'id': categoryId,
          'name': categoryName ?? '',
        },
    };
  }
}
