import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_entity.freezed.dart';

@freezed
abstract class DeliveryWindowEntity with _$DeliveryWindowEntity {
  const factory DeliveryWindowEntity({
    @Default(0) int minDays,
    @Default(0) int maxDays,
    @Default('') String formattedWindow,
    @Default(true) bool available,
  }) = _DeliveryWindowEntity;
}

@freezed
abstract class DeliveryOptionsEntity with _$DeliveryOptionsEntity {
  const factory DeliveryOptionsEntity({
    DeliveryWindowEntity? standard,
    DeliveryWindowEntity? express,
  }) = _DeliveryOptionsEntity;
}

@freezed
abstract class PinServiceabilityEntity with _$PinServiceabilityEntity {
  const factory PinServiceabilityEntity({
    required bool serviceable,
    required String pinCode,
    @Default('') String city,
    @Default('') String district,
    @Default('') String state,
    @Default('') String stateCode,
    @Default('') String shippingZone,
    @Default(false) bool codAvailable,
    DeliveryOptionsEntity? delivery,
    String? message,
  }) = _PinServiceabilityEntity;
}

@freezed
abstract class AvailableShippingMethodEntity with _$AvailableShippingMethodEntity {
  const factory AvailableShippingMethodEntity({
    required String code,
    required String name,
    @Default(0) int minDays,
    @Default(0) int maxDays,
    @Default(0.0) double baseCharge,
    @Default('') String formattedWindow,
  }) = _AvailableShippingMethodEntity;
}

@freezed
abstract class ShippingQuoteEntity with _$ShippingQuoteEntity {
  const factory ShippingQuoteEntity({
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    required bool serviceable,
    required String pinCode,
    String? city,
    String? district,
    String? state,
    String? stateCode,
    String? shippingZone,
    AvailableShippingMethodEntity? selectedMethod,
    @Default([]) List<AvailableShippingMethodEntity> availableMethods,
    @Default(0.0) double shippingAmount,
    @Default(false) bool freeShipping,
    @Default(999.0) double freeShippingThreshold,
    @Default(0.0) double amountNeededForFreeShipping,
    DeliveryWindowEntity? deliveryEstimate,
    String? message,
  }) = _ShippingQuoteEntity;
}
