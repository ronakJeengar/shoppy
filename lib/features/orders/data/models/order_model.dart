import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/addresses/data/models/address_model.dart';
import 'package:shopp_app/features/checkout/data/models/payment_model.dart';
import 'package:shopp_app/features/checkout/data/models/tax_breakdown_model.dart';
import 'package:shopp_app/features/emi/data/models/emi_plan_model.dart';

part 'order_model.freezed.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String productId,
    required String productName,
    required String productImage,
    required String sellerName,
    required double unitPrice,
    required int quantity,
    required double lineTotal,
    @Default('8518') String hsnCode,
    @Default(18.0) double gstRate,
    @Default(true) bool isTaxInclusive,
    @Default(0.0) double taxableAmount,
  }) = _OrderItemModel;

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
      hsnCode: json['hsnCode']?.toString() ?? '8518',
      gstRate: (json['gstRate'] is num)
          ? (json['gstRate'] as num).toDouble()
          : 18.0,
      isTaxInclusive: json['isTaxInclusive'] != null
          ? json['isTaxInclusive'] == true
          : true,
      taxableAmount: (json['taxableAmount'] is num)
          ? (json['taxableAmount'] as num).toDouble()
          : 0.0,
    );
  }
}

extension OrderItemModelX on OrderItemModel {
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'sellerName': sellerName,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'lineTotal': lineTotal,
      'hsnCode': hsnCode,
      'gstRate': gstRate,
      'isTaxInclusive': isTaxInclusive,
      'taxableAmount': taxableAmount,
    };
  }
}

@freezed
abstract class OrderStatusHistoryItem with _$OrderStatusHistoryItem {
  const factory OrderStatusHistoryItem({
    required String status,
    required DateTime timestamp,
    required String note,
  }) = _OrderStatusHistoryItem;

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

extension OrderStatusHistoryItemX on OrderStatusHistoryItem {
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'timestamp': timestamp.toIso8601String(),
      'note': note,
    };
  }
}

@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    required String orderNumber,
    @Default([]) List<OrderItemModel> orderItems,
    AddressModel? shippingAddress,
    @Default('STANDARD') String shippingMethod,
    required double subtotal,
    required double shippingFee,
    required double tax,
    required double totalAmount,
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    @Default(0.0) double taxableAmount,
    @Default(0.0) double discount,
    TaxBreakdownModel? taxBreakdown,
    String? customerGstin,
    @Default(0.0) double codFee,
    Map<String, dynamic>? codDetails,
    EmiDetailsSnapshotModel? emiDetails,
    required String status,
    PaymentModel? payment,
    @Default('') String carrier,
    @Default('') String trackingNumber,
    @Default('') String cancellationReason,
    @Default(false) bool canCancel,
    @Default([]) List<OrderStatusHistoryItem> statusHistory,
    required DateTime createdAt,
  }) = _OrderModel;

  bool get isCod => payment?.paymentMethod == 'COD' || codDetails?['isCod'] == true;
  bool get isEmi => payment?.paymentMethod == 'EMI' || emiDetails?.isEmi == true;
  bool get isPendingPayment => status == 'PENDING_PAYMENT';
  bool get isCancelled => status == 'CANCELLED';
  bool get isDelivered => status == 'DELIVERED';
  bool get isShipped => status == 'SHIPPED';
  bool get isProcessing => status == 'PROCESSING';
  bool get isConfirmed => status == 'CONFIRMED';

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

    TaxBreakdownModel? taxBreakdown;
    if (json['taxBreakdown'] is Map<String, dynamic>) {
      taxBreakdown = TaxBreakdownModel.fromJson(
        json['taxBreakdown'] as Map<String, dynamic>,
      );
    }

    EmiDetailsSnapshotModel? emiDetailsObj;
    if (json['emiDetails'] is Map<String, dynamic>) {
      emiDetailsObj = EmiDetailsSnapshotModel.fromJson(
        json['emiDetails'] as Map<String, dynamic>,
      );
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
      currency: json['currency']?.toString() ?? 'INR',
      currencySymbol: json['currencySymbol']?.toString() ?? '₹',
      taxableAmount: (json['taxableAmount'] is num)
          ? (json['taxableAmount'] as num).toDouble()
          : 0.0,
      discount: (json['discount'] is num)
          ? (json['discount'] as num).toDouble()
          : 0.0,
      taxBreakdown: taxBreakdown,
      customerGstin: json['customerGstin']?.toString(),
      codFee: (json['codFee'] is num) ? (json['codFee'] as num).toDouble() : 0.0,
      codDetails: json['codDetails'] is Map<String, dynamic>
          ? json['codDetails'] as Map<String, dynamic>
          : null,
      emiDetails: emiDetailsObj,
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

typedef Order = OrderModel;
