import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_model.freezed.dart';

@freezed
abstract class DeliveryWindowModel with _$DeliveryWindowModel {
  const factory DeliveryWindowModel({
    @Default(0) int minDays,
    @Default(0) int maxDays,
    @Default('') String formattedWindow,
    @Default(true) bool available,
  }) = _DeliveryWindowModel;

  factory DeliveryWindowModel.fromJson(Map<String, dynamic> json) {
    final min = (json['minDays'] as num?)?.toInt() ?? 0;
    final max = (json['maxDays'] as num?)?.toInt() ?? 0;
    final formatted = json['formattedWindow']?.toString() ??
        (min > 0 && max > 0 ? '$min–$max business days' : (min > 0 ? '$min business days' : ''));

    return DeliveryWindowModel(
      minDays: min,
      maxDays: max,
      formattedWindow: formatted,
      available: json['available'] == true || json['available'] == null,
    );
  }

  static Map<String, dynamic> toJsonMap(DeliveryWindowModel model) => {
        'minDays': model.minDays,
        'maxDays': model.maxDays,
        'formattedWindow': model.formattedWindow,
        'available': model.available,
      };
}

@freezed
abstract class DeliveryOptionsModel with _$DeliveryOptionsModel {
  const factory DeliveryOptionsModel({
    DeliveryWindowModel? standard,
    DeliveryWindowModel? express,
  }) = _DeliveryOptionsModel;

  factory DeliveryOptionsModel.fromJson(Map<String, dynamic> json) {
    DeliveryWindowModel? standard;
    if (json['standard'] is Map<String, dynamic>) {
      standard = DeliveryWindowModel.fromJson(json['standard'] as Map<String, dynamic>);
    }

    DeliveryWindowModel? express;
    if (json['express'] is Map<String, dynamic>) {
      express = DeliveryWindowModel.fromJson(json['express'] as Map<String, dynamic>);
    }

    return DeliveryOptionsModel(
      standard: standard,
      express: express,
    );
  }
}

@freezed
abstract class PinServiceabilityModel with _$PinServiceabilityModel {
  const factory PinServiceabilityModel({
    required bool serviceable,
    required String pinCode,
    @Default('') String city,
    @Default('') String district,
    @Default('') String state,
    @Default('') String stateCode,
    @Default('') String shippingZone,
    @Default(false) bool codAvailable,
    DeliveryOptionsModel? delivery,
    String? message,
  }) = _PinServiceabilityModel;

  factory PinServiceabilityModel.fromJson(Map<String, dynamic> json) {
    DeliveryOptionsModel? delivery;
    if (json['delivery'] is Map<String, dynamic>) {
      delivery = DeliveryOptionsModel.fromJson(json['delivery'] as Map<String, dynamic>);
    }

    return PinServiceabilityModel(
      serviceable: json['serviceable'] == true,
      pinCode: json['pinCode']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      district: json['district']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      stateCode: json['stateCode']?.toString() ?? '',
      shippingZone: json['shippingZone']?.toString() ?? '',
      codAvailable: json['codAvailable'] == true,
      delivery: delivery,
      message: json['message']?.toString(),
    );
  }
}

@freezed
abstract class AvailableShippingMethodModel with _$AvailableShippingMethodModel {
  const factory AvailableShippingMethodModel({
    required String code,
    required String name,
    @Default(0) int minDays,
    @Default(0) int maxDays,
    @Default(0.0) double baseCharge,
    @Default('') String formattedWindow,
  }) = _AvailableShippingMethodModel;

  factory AvailableShippingMethodModel.fromJson(Map<String, dynamic> json) {
    final min = (json['minDays'] as num?)?.toInt() ?? 0;
    final max = (json['maxDays'] as num?)?.toInt() ?? 0;
    final formatted = json['formattedWindow']?.toString() ??
        (min > 0 && max > 0 ? '$min–$max business days' : (min > 0 ? '$min business days' : ''));

    return AvailableShippingMethodModel(
      code: json['code']?.toString() ?? 'STANDARD',
      name: json['name']?.toString() ?? 'Standard Delivery',
      minDays: min,
      maxDays: max,
      baseCharge: (json['baseCharge'] as num?)?.toDouble() ?? 0.0,
      formattedWindow: formatted,
    );
  }
}

@freezed
abstract class ShippingQuoteModel with _$ShippingQuoteModel {
  const factory ShippingQuoteModel({
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    required bool serviceable,
    required String pinCode,
    String? city,
    String? district,
    String? state,
    String? stateCode,
    String? shippingZone,
    AvailableShippingMethodModel? selectedMethod,
    @Default([]) List<AvailableShippingMethodModel> availableMethods,
    @Default(0.0) double shippingAmount,
    @Default(false) bool freeShipping,
    @Default(999.0) double freeShippingThreshold,
    @Default(0.0) double amountNeededForFreeShipping,
    DeliveryWindowModel? deliveryEstimate,
    String? message,
  }) = _ShippingQuoteModel;

  factory ShippingQuoteModel.fromJson(Map<String, dynamic> json) {
    AvailableShippingMethodModel? selectedMethod;
    if (json['method'] is Map<String, dynamic>) {
      selectedMethod = AvailableShippingMethodModel.fromJson(json['method'] as Map<String, dynamic>);
    }

    final List<AvailableShippingMethodModel> methods = [];
    if (json['availableMethods'] is List) {
      for (final m in json['availableMethods'] as List) {
        if (m is Map<String, dynamic>) {
          methods.add(AvailableShippingMethodModel.fromJson(m));
        }
      }
    }

    DeliveryWindowModel? deliveryEstimate;
    if (json['deliveryEstimate'] is Map<String, dynamic>) {
      deliveryEstimate = DeliveryWindowModel.fromJson(json['deliveryEstimate'] as Map<String, dynamic>);
    }

    return ShippingQuoteModel(
      currency: json['currency']?.toString() ?? 'INR',
      currencySymbol: json['currencySymbol']?.toString() ?? '₹',
      serviceable: json['serviceable'] == true,
      pinCode: json['pinCode']?.toString() ?? '',
      city: json['city']?.toString(),
      district: json['district']?.toString(),
      state: json['state']?.toString(),
      stateCode: json['stateCode']?.toString(),
      shippingZone: json['shippingZone']?.toString(),
      selectedMethod: selectedMethod,
      availableMethods: methods,
      shippingAmount: (json['shippingAmount'] as num?)?.toDouble() ?? 0.0,
      freeShipping: json['freeShipping'] == true,
      freeShippingThreshold: (json['freeShippingThreshold'] as num?)?.toDouble() ?? 999.0,
      amountNeededForFreeShipping: (json['amountNeededForFreeShipping'] as num?)?.toDouble() ?? 0.0,
      deliveryEstimate: deliveryEstimate,
      message: json['message']?.toString(),
    );
  }
}
