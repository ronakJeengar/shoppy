import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/addresses/domain/entities/address_entity.dart';
import 'package:shopp_app/features/checkout/domain/entities/payment_entity.dart';
import 'package:shopp_app/features/checkout/domain/entities/tax_breakdown_entity.dart';

part 'order_entity.freezed.dart';

@freezed
abstract class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
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
  }) = _OrderItemEntity;
}

@freezed
abstract class OrderStatusHistoryEntity with _$OrderStatusHistoryEntity {
  const factory OrderStatusHistoryEntity({
    required String status,
    required DateTime timestamp,
    required String note,
  }) = _OrderStatusHistoryEntity;
}

@freezed
abstract class OrderEntity with _$OrderEntity {
  const OrderEntity._();

  const factory OrderEntity({
    required String id,
    required String orderNumber,
    @Default([]) List<OrderItemEntity> orderItems,
    AddressEntity? shippingAddress,
    @Default('STANDARD') String shippingMethod,
    required double subtotal,
    required double shippingFee,
    required double tax,
    required double totalAmount,
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    @Default(0.0) double taxableAmount,
    @Default(0.0) double discount,
    TaxBreakdownEntity? taxBreakdown,
    String? customerGstin,
    @Default(0.0) double codFee,
    Map<String, dynamic>? codDetails,
    required String status,
    PaymentEntity? payment,
    @Default('') String carrier,
    @Default('') String trackingNumber,
    @Default('') String cancellationReason,
    @Default(false) bool canCancel,
    @Default([]) List<OrderStatusHistoryEntity> statusHistory,
    required DateTime createdAt,
  }) = _OrderEntity;

  bool get isCod => payment?.paymentMethod == 'COD' || codDetails?['isCod'] == true;
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
}
