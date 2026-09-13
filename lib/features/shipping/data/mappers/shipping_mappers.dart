import '../../domain/entities/shipping_entity.dart';
import '../models/shipping_model.dart';

extension DeliveryWindowModelMapper on DeliveryWindowModel {
  DeliveryWindowEntity toEntity() {
    return DeliveryWindowEntity(
      minDays: minDays,
      maxDays: maxDays,
      formattedWindow: formattedWindow,
      available: available,
    );
  }
}

extension DeliveryWindowEntityMapper on DeliveryWindowEntity {
  DeliveryWindowModel toModel() {
    return DeliveryWindowModel(
      minDays: minDays,
      maxDays: maxDays,
      formattedWindow: formattedWindow,
      available: available,
    );
  }
}

extension DeliveryOptionsModelMapper on DeliveryOptionsModel {
  DeliveryOptionsEntity toEntity() {
    return DeliveryOptionsEntity(
      standard: standard?.toEntity(),
      express: express?.toEntity(),
    );
  }
}

extension DeliveryOptionsEntityMapper on DeliveryOptionsEntity {
  DeliveryOptionsModel toModel() {
    return DeliveryOptionsModel(
      standard: standard?.toModel(),
      express: express?.toModel(),
    );
  }
}

extension PinServiceabilityModelMapper on PinServiceabilityModel {
  PinServiceabilityEntity toEntity() {
    return PinServiceabilityEntity(
      serviceable: serviceable,
      pinCode: pinCode,
      city: city,
      district: district,
      state: state,
      stateCode: stateCode,
      shippingZone: shippingZone,
      codAvailable: codAvailable,
      delivery: delivery?.toEntity(),
      message: message,
    );
  }
}

extension PinServiceabilityEntityMapper on PinServiceabilityEntity {
  PinServiceabilityModel toModel() {
    return PinServiceabilityModel(
      serviceable: serviceable,
      pinCode: pinCode,
      city: city,
      district: district,
      state: state,
      stateCode: stateCode,
      shippingZone: shippingZone,
      codAvailable: codAvailable,
      delivery: delivery?.toModel(),
      message: message,
    );
  }
}

extension AvailableShippingMethodModelMapper on AvailableShippingMethodModel {
  AvailableShippingMethodEntity toEntity() {
    return AvailableShippingMethodEntity(
      code: code,
      name: name,
      minDays: minDays,
      maxDays: maxDays,
      baseCharge: baseCharge,
      formattedWindow: formattedWindow,
    );
  }
}

extension AvailableShippingMethodEntityMapper on AvailableShippingMethodEntity {
  AvailableShippingMethodModel toModel() {
    return AvailableShippingMethodModel(
      code: code,
      name: name,
      minDays: minDays,
      maxDays: maxDays,
      baseCharge: baseCharge,
      formattedWindow: formattedWindow,
    );
  }
}

extension ShippingQuoteModelMapper on ShippingQuoteModel {
  ShippingQuoteEntity toEntity() {
    return ShippingQuoteEntity(
      currency: currency,
      currencySymbol: currencySymbol,
      serviceable: serviceable,
      pinCode: pinCode,
      city: city,
      district: district,
      state: state,
      stateCode: stateCode,
      shippingZone: shippingZone,
      selectedMethod: selectedMethod?.toEntity(),
      availableMethods: availableMethods.map((m) => m.toEntity()).toList(),
      shippingAmount: shippingAmount,
      freeShipping: freeShipping,
      freeShippingThreshold: freeShippingThreshold,
      amountNeededForFreeShipping: amountNeededForFreeShipping,
      deliveryEstimate: deliveryEstimate?.toEntity(),
      message: message,
    );
  }
}

extension ShippingQuoteEntityMapper on ShippingQuoteEntity {
  ShippingQuoteModel toModel() {
    return ShippingQuoteModel(
      currency: currency,
      currencySymbol: currencySymbol,
      serviceable: serviceable,
      pinCode: pinCode,
      city: city,
      district: district,
      state: state,
      stateCode: stateCode,
      shippingZone: shippingZone,
      selectedMethod: selectedMethod?.toModel(),
      availableMethods: availableMethods.map((m) => m.toModel()).toList(),
      shippingAmount: shippingAmount,
      freeShipping: freeShipping,
      freeShippingThreshold: freeShippingThreshold,
      amountNeededForFreeShipping: amountNeededForFreeShipping,
      deliveryEstimate: deliveryEstimate?.toModel(),
      message: message,
    );
  }
}
