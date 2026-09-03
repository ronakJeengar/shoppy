import 'package:shopp_app/data/models/address_model.dart';

class OrderItemModel {
  final String productId;
  final String productName;
  final String productImage;
  final String sellerName;
  final double unitPrice;
  final int quantity;
  final double lineTotal;

  OrderItemModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.sellerName,
    required this.unitPrice,
    required this.quantity,
    required this.lineTotal,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId']?.toString() ?? '',
      productName: json['productName']?.toString() ?? 'Product',
      productImage: json['productImage']?.toString() ?? '',
      sellerName: json['sellerName']?.toString() ?? 'Official Store',
      unitPrice:
          (json['unitPrice'] is num) ? (json['unitPrice'] as num).toDouble() : 0.0,
      quantity:
          (json['quantity'] is num) ? (json['quantity'] as num).toInt() : 1,
      lineTotal:
          (json['lineTotal'] is num) ? (json['lineTotal'] as num).toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'sellerName': sellerName,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'lineTotal': lineTotal,
    };
  }
}

class OrderModel {
  final String id;
  final String orderNumber;
  final List<OrderItemModel> orderItems;
  final AddressModel? shippingAddress;
  final String shippingMethod;
  final double subtotal;
  final double shippingFee;
  final double tax;
  final double totalAmount;
  final String currency;
  final String status;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.orderItems,
    this.shippingAddress,
    this.shippingMethod = 'STANDARD',
    required this.subtotal,
    required this.shippingFee,
    required this.tax,
    required this.totalAmount,
    this.currency = 'USD',
    required this.status,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['orderItems'];
    final List<OrderItemModel> items = [];
    if (rawItems is List) {
      for (final i in rawItems) {
        if (i is Map<String, dynamic>) {
          items.add(OrderItemModel.fromJson(i));
        }
      }
    }

    AddressModel? address;
    if (json['shippingAddress'] is Map<String, dynamic>) {
      address = AddressModel.fromJson(
        json['shippingAddress'] as Map<String, dynamic>,
      );
    }

    DateTime parsedDate = DateTime.now();
    if (json['createdAt'] != null) {
      parsedDate = DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now();
    }

    return OrderModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      orderNumber: json['orderNumber']?.toString() ?? 'ORD-UNKNOWN',
      orderItems: items,
      shippingAddress: address,
      shippingMethod: json['shippingMethod']?.toString() ?? 'STANDARD',
      subtotal:
          (json['subtotal'] is num) ? (json['subtotal'] as num).toDouble() : 0.0,
      shippingFee: (json['shippingFee'] is num)
          ? (json['shippingFee'] as num).toDouble()
          : 0.0,
      tax: (json['tax'] is num) ? (json['tax'] as num).toDouble() : 0.0,
      totalAmount: (json['totalAmount'] is num)
          ? (json['totalAmount'] as num).toDouble()
          : (json['orderPrice'] is num)
              ? (json['orderPrice'] as num).toDouble()
              : 0.0,
      currency: json['currency']?.toString() ?? 'USD',
      status: json['status']?.toString() ?? 'PENDING_PAYMENT',
      createdAt: parsedDate,
    );
  }
}
