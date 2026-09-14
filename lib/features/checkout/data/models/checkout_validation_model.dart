import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/addresses/data/models/address_model.dart';
import 'package:shopp_app/features/emi/data/models/emi_plan_model.dart';
import 'package:shopp_app/features/orders/data/models/order_model.dart';
import 'tax_breakdown_model.dart';

part 'checkout_validation_model.freezed.dart';

@freezed
abstract class PaymentMethodOptionModel with _$PaymentMethodOptionModel {
  const factory PaymentMethodOptionModel({
    required String type,
    required String name,
    required bool available,
    @Default(0.0) double fee,
    @Default(0.0) double standardFee,
    @Default(false) bool isFeeFree,
    String? reasonCode,
    String? message,
    double? freeAboveAmount,
    double? minOrderValue,
    double? maxOrderValue,
  }) = _PaymentMethodOptionModel;

  factory PaymentMethodOptionModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptionModel(
      type: json['type']?.toString() ?? 'CARD',
      name: json['name']?.toString() ?? 'Payment Method',
      available: json['available'] == true,
      fee: (json['fee'] is num) ? (json['fee'] as num).toDouble() : 0.0,
      standardFee: (json['standardFee'] is num) ? (json['standardFee'] as num).toDouble() : 0.0,
      isFeeFree: json['isFeeFree'] == true,
      reasonCode: json['reasonCode']?.toString(),
      message: json['message']?.toString(),
      freeAboveAmount: (json['freeAboveAmount'] is num) ? (json['freeAboveAmount'] as num).toDouble() : null,
      minOrderValue: (json['minOrderValue'] is num) ? (json['minOrderValue'] as num).toDouble() : null,
      maxOrderValue: (json['maxOrderValue'] is num) ? (json['maxOrderValue'] as num).toDouble() : null,
    );
  }
}

@freezed
abstract class CodDetailsModel with _$CodDetailsModel {
  const factory CodDetailsModel({
    @Default(false) bool isCod,
    @Default(0.0) double fee,
    @Default(0.0) double standardFee,
    @Default(false) bool isFeeFree,
    @Default(1499.0) double freeAboveAmount,
    @Default(299.0) double minOrderValue,
    @Default(50000.0) double maxOrderValue,
    @Default(true) bool isEligible,
    String? reasonCode,
    String? message,
    @Default([]) List<String> eligibleShippingZones,
  }) = _CodDetailsModel;

  factory CodDetailsModel.fromJson(Map<String, dynamic> json) {
    final snapshot = json['eligibilitySnapshot'] is Map<String, dynamic>
        ? json['eligibilitySnapshot'] as Map<String, dynamic>
        : null;

    final zones = <String>[];
    final rawZones = snapshot?['eligibleShippingZones'] ?? json['eligibleShippingZones'];
    if (rawZones is List) {
      for (final z in rawZones) {
        if (z != null) zones.add(z.toString());
      }
    }

    return CodDetailsModel(
      isCod: json['isCod'] == true,
      fee: (json['fee'] is num) ? (json['fee'] as num).toDouble() : 0.0,
      standardFee: (json['standardFee'] is num) ? (json['standardFee'] as num).toDouble() : 40.0,
      isFeeFree: json['isFeeFree'] == true,
      freeAboveAmount: (json['freeAboveAmount'] is num) ? (json['freeAboveAmount'] as num).toDouble() : 1499.0,
      minOrderValue: (json['minOrderValue'] is num) ? (json['minOrderValue'] as num).toDouble() : 299.0,
      maxOrderValue: (json['maxOrderValue'] is num) ? (json['maxOrderValue'] as num).toDouble() : 50000.0,
      isEligible: snapshot != null ? snapshot['isEligible'] == true : (json['isEligible'] != false),
      reasonCode: snapshot?['reasonCode']?.toString() ?? json['reasonCode']?.toString(),
      message: snapshot?['message']?.toString() ?? json['message']?.toString(),
      eligibleShippingZones: zones,
    );
  }
}

@freezed
abstract class CheckoutValidationModel with _$CheckoutValidationModel {
  const factory CheckoutValidationModel({
    required bool valid,
    @Default([]) List<OrderItemModel> items,
    AddressModel? shippingAddress,
    @Default('STANDARD') String shippingMethod,
    required double subtotal,
    required double shippingFee,
    required double tax,
    required double grandTotal,
    @Default(0.0) double taxableAmount,
    @Default(0.0) double discount,
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    TaxBreakdownModel? taxBreakdown,
    String? customerGstin,
    String? deliveryWindow,
    bool? isFreeShipping,
    Map<String, dynamic>? shippingDetails,
    @Default(0.0) double codFee,
    CodDetailsModel? codDetails,
    EmiDetailsSnapshotModel? emiDetails,
    EmiQuoteModel? emiQuote,
    @Default([]) List<PaymentMethodOptionModel> paymentMethods,
  }) = _CheckoutValidationModel;

  factory CheckoutValidationModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
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

    TaxBreakdownModel? taxBreakdown;
    if (json['taxBreakdown'] is Map<String, dynamic>) {
      taxBreakdown = TaxBreakdownModel.fromJson(
        json['taxBreakdown'] as Map<String, dynamic>,
      );
    }

    final shipDetails = json['shippingDetails'] is Map<String, dynamic>
        ? json['shippingDetails'] as Map<String, dynamic>
        : null;
    final isFree = shipDetails?['isFreeShipping'] == true;
    final delWindow = shipDetails?['deliveryEstimate'] is Map<String, dynamic>
        ? shipDetails!['deliveryEstimate']['formattedWindow']?.toString()
        : null;

    final rawPaymentMethods = json['paymentMethods'];
    final List<PaymentMethodOptionModel> paymentMethods = [];
    if (rawPaymentMethods is List) {
      for (final p in rawPaymentMethods) {
        if (p is Map<String, dynamic>) {
          paymentMethods.add(PaymentMethodOptionModel.fromJson(p));
        }
      }
    }

    CodDetailsModel? codDetails;
    if (json['codDetails'] is Map<String, dynamic>) {
      codDetails = CodDetailsModel.fromJson(json['codDetails'] as Map<String, dynamic>);
    }

    EmiDetailsSnapshotModel? emiDetails;
    if (json['emiDetails'] is Map<String, dynamic>) {
      emiDetails = EmiDetailsSnapshotModel.fromJson(json['emiDetails'] as Map<String, dynamic>);
    }

    EmiQuoteModel? emiQuote;
    if (json['emiQuote'] is Map<String, dynamic>) {
      emiQuote = EmiQuoteModel.fromJson(json['emiQuote'] as Map<String, dynamic>);
    }

    return CheckoutValidationModel(
      valid: json['valid'] == true,
      items: items,
      shippingAddress: address,
      shippingMethod: json['shippingMethod']?.toString() ?? 'STANDARD',
      subtotal:
          (json['subtotal'] is num) ? (json['subtotal'] as num).toDouble() : 0.0,
      shippingFee: (json['shippingFee'] is num)
          ? (json['shippingFee'] as num).toDouble()
          : 0.0,
      tax: (json['tax'] is num) ? (json['tax'] as num).toDouble() : 0.0,
      grandTotal: (json['grandTotal'] is num)
          ? (json['grandTotal'] as num).toDouble()
          : 0.0,
      taxableAmount: (json['taxableAmount'] is num)
          ? (json['taxableAmount'] as num).toDouble()
          : 0.0,
      discount: (json['discount'] is num)
          ? (json['discount'] as num).toDouble()
          : 0.0,
      currency: json['currency']?.toString() ?? 'INR',
      currencySymbol: json['currencySymbol']?.toString() ?? '₹',
      taxBreakdown: taxBreakdown,
      customerGstin: json['customerGstin']?.toString(),
      deliveryWindow: delWindow,
      isFreeShipping: isFree,
      shippingDetails: shipDetails,
      codFee: (json['codFee'] is num) ? (json['codFee'] as num).toDouble() : 0.0,
      codDetails: codDetails,
      emiDetails: emiDetails,
      emiQuote: emiQuote,
      paymentMethods: paymentMethods,
    );
  }
}
