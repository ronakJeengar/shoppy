import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/addresses/domain/entities/address_entity.dart';
import 'package:shopp_app/features/emi/domain/entities/emi_plan_entity.dart';
import 'tax_breakdown_entity.dart';

part 'checkout_entity.freezed.dart';

@freezed
abstract class PaymentMethodOptionEntity with _$PaymentMethodOptionEntity {
  const factory PaymentMethodOptionEntity({
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
  }) = _PaymentMethodOptionEntity;
}

@freezed
abstract class CodDetailsEntity with _$CodDetailsEntity {
  const factory CodDetailsEntity({
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
  }) = _CodDetailsEntity;
}

@freezed
abstract class CheckoutValidationEntity with _$CheckoutValidationEntity {
  const factory CheckoutValidationEntity({
    required bool valid,
    AddressEntity? shippingAddress,
    @Default('STANDARD') String shippingMethod,
    required double subtotal,
    required double shippingFee,
    required double tax,
    required double grandTotal,
    @Default(0.0) double taxableAmount,
    @Default(0.0) double discount,
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    TaxBreakdownEntity? taxBreakdown,
    String? customerGstin,
    String? deliveryWindow,
    bool? isFreeShipping,
    Map<String, dynamic>? shippingDetails,
    @Default(0.0) double codFee,
    CodDetailsEntity? codDetails,
    EmiDetailsSnapshotEntity? emiDetails,
    EmiQuoteEntity? emiQuote,
    @Default([]) List<PaymentMethodOptionEntity> paymentMethods,
  }) = _CheckoutValidationEntity;
}
