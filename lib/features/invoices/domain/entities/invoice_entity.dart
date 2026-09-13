import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_entity.freezed.dart';

@freezed
abstract class InvoiceSellerEntity with _$InvoiceSellerEntity {
  const factory InvoiceSellerEntity({
    required String legalName,
    required String tradeName,
    required String address,
    required String city,
    @Default('') String district,
    required String state,
    @Default('') String stateCode,
    required String pinCode,
    @Default('India') String country,
    required String gstin,
    @Default('') String pan,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String cin,
  }) = _InvoiceSellerEntity;
}

@freezed
abstract class InvoiceAddressEntity with _$InvoiceAddressEntity {
  const factory InvoiceAddressEntity({
    required String fullName,
    required String phone,
    required String addressLine1,
    @Default('') String addressLine2,
    @Default('') String landmark,
    required String city,
    @Default('') String district,
    required String state,
    @Default('') String stateCode,
    required String pinCode,
    @Default('IN') String country,
    @Default('') String gstin,
  }) = _InvoiceAddressEntity;
}

@freezed
abstract class InvoiceItemEntity with _$InvoiceItemEntity {
  const factory InvoiceItemEntity({
    required String productId,
    required String productName,
    @Default('') String productImage,
    required String sellerName,
    required String sku,
    required String hsnCode,
    required int quantity,
    required double mrp,
    required double unitPrice,
    @Default(0.0) double discount,
    required double effectiveAmount,
    required double taxableAmount,
    required double gstRate,
    @Default(true) bool isTaxInclusive,
    @Default(0.0) double cgstRate,
    @Default(0.0) double cgst,
    @Default(0.0) double sgstRate,
    @Default(0.0) double sgst,
    @Default(0.0) double igstRate,
    @Default(0.0) double igst,
    required double totalTax,
    required double lineTotal,
  }) = _InvoiceItemEntity;
}

@freezed
abstract class InvoiceTaxSummaryEntity with _$InvoiceTaxSummaryEntity {
  const factory InvoiceTaxSummaryEntity({
    required String hsnCode,
    required double gstRate,
    required double taxableAmount,
    @Default(0.0) double cgst,
    @Default(0.0) double sgst,
    @Default(0.0) double igst,
    required double totalTax,
  }) = _InvoiceTaxSummaryEntity;
}

@freezed
abstract class InvoiceShippingEntity with _$InvoiceShippingEntity {
  const factory InvoiceShippingEntity({
    required String method,
    required String methodName,
    required double shippingAmount,
    @Default('NATIONAL') String shippingZone,
    @Default('') String destinationPinCode,
    @Default(false) bool isFreeShipping,
  }) = _InvoiceShippingEntity;
}

@freezed
abstract class InvoiceCodEntity with _$InvoiceCodEntity {
  const factory InvoiceCodEntity({
    @Default(false) bool isCod,
    @Default(0.0) double fee,
  }) = _InvoiceCodEntity;
}

@freezed
abstract class InvoicePaymentEntity with _$InvoicePaymentEntity {
  const factory InvoicePaymentEntity({
    required String method,
    required String status,
    @Default('') String transactionId,
    @Default('') String provider,
  }) = _InvoicePaymentEntity;
}

@freezed
abstract class InvoiceTotalsEntity with _$InvoiceTotalsEntity {
  const factory InvoiceTotalsEntity({
    required double subtotal,
    @Default(0.0) double discount,
    required double taxableAmount,
    @Default(0.0) double cgst,
    @Default(0.0) double sgst,
    @Default(0.0) double igst,
    required double totalTax,
    @Default(0.0) double shippingFee,
    @Default(0.0) double codFee,
    required double grandTotal,
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    @Default('') String amountInWords,
  }) = _InvoiceTotalsEntity;
}

@freezed
abstract class InvoiceEntity with _$InvoiceEntity {
  const InvoiceEntity._();

  const factory InvoiceEntity({
    required String invoiceNumber,
    required DateTime invoiceDate,
    required String invoiceStatus,
    required String orderId,
    required String orderNumber,
    required DateTime orderDate,
    required InvoiceSellerEntity seller,
    required InvoiceAddressEntity billingAddress,
    required InvoiceAddressEntity shippingAddress,
    @Default('') String customerGstin,
    @Default(false) bool isInterState,
    @Default([]) List<InvoiceItemEntity> items,
    @Default([]) List<InvoiceTaxSummaryEntity> taxSummary,
    required InvoiceShippingEntity shipping,
    required InvoiceCodEntity cod,
    required InvoicePaymentEntity payment,
    required InvoiceTotalsEntity totals,
  }) = _InvoiceEntity;

  bool get isIssued => invoiceStatus == 'ISSUED';
  bool get isCancelled => invoiceStatus == 'CANCELLED';
  bool get isCod => cod.isCod || payment.method == 'COD';
}
