import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/models/payment_model.dart';

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

class OrderStatusHistoryItem {
  final String status;
  final DateTime timestamp;
  final String note;

  OrderStatusHistoryItem({
    required this.status,
    required this.timestamp,
    required this.note,
  });

  factory OrderStatusHistoryItem.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.now();
    if (json['timestamp'] != null) {
      time = DateTime.tryParse(json['timestamp'].toString()) ?? DateTime.now();
    }
    return OrderStatusHistoryItem(
      status: json['status']?.toString() ?? '',
      timestamp: time,
      note: json['note']?.toString() ?? '',
    );
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
  final PaymentModel? payment;
  final String carrier;
  final String trackingNumber;
  final String cancellationReason;
  final bool canCancel;
  final List<OrderStatusHistoryItem> statusHistory;
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
    this.payment,
    this.carrier = '',
    this.trackingNumber = '',
    this.cancellationReason = '',
    this.canCancel = false,
    this.statusHistory = const [],
    required this.createdAt,
  });

  bool get isCancelled => status == 'CANCELLED';
  bool get isDelivered => status == 'DELIVERED';
  bool get isShipped => status == 'SHIPPED';
  bool get isProcessing => status == 'PROCESSING';
  bool get isConfirmed => status == 'CONFIRMED';

  // Tracking step index: 0: Confirmed, 1: Processing, 2: Shipped, 3: Delivered, -1: Cancelled
  int get trackingStepIndex {
    switch (status) {
      case 'CONFIRMED':
        return 0;
      case 'PROCESSING':
        return 1;
      case 'SHIPPED':
        return 2;
      case 'DELIVERED':
        return 3;
      case 'CANCELLED':
      default:
        return -1;
    }
  }

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

    PaymentModel? paymentObj;
    if (json['payment'] is Map<String, dynamic>) {
      paymentObj = PaymentModel.fromJson(
        json['payment'] as Map<String, dynamic>,
      );
    }

    final rawHistory = json['statusHistory'];
    final List<OrderStatusHistoryItem> history = [];
    if (rawHistory is List) {
      for (final h in rawHistory) {
        if (h is Map<String, dynamic>) {
          history.add(OrderStatusHistoryItem.fromJson(h));
        }
      }
    }

    DateTime parsedDate = DateTime.now();
    if (json['createdAt'] != null) {
      parsedDate = DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now();
    }

    final rawStatus = json['status']?.toString() ?? 'PENDING_PAYMENT';
    final serverCanCancel = json['canCancel'];
    final computedCanCancel = serverCanCancel != null
        ? serverCanCancel == true
        : ['PENDING_PAYMENT', 'CONFIRMED', 'PROCESSING'].contains(rawStatus);

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
      status: rawStatus,
      payment: paymentObj,
      carrier: json['carrier']?.toString() ?? '',
      trackingNumber: json['trackingNumber']?.toString() ?? '',
      cancellationReason: json['cancellationReason']?.toString() ?? '',
      canCancel: computedCanCancel,
      statusHistory: history,
      createdAt: parsedDate,
    );
  }
}
