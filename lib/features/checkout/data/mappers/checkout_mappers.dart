import 'package:shopp_app/features/addresses/data/mappers/address_mappers.dart';
import '../../domain/entities/checkout_entity.dart';
import '../../domain/entities/payment_entity.dart';
import '../models/checkout_validation_model.dart';
import '../models/payment_model.dart';
import '../models/tax_breakdown_model.dart';

extension PaymentModelMapper on PaymentModel {
  PaymentEntity toEntity() {
    return PaymentEntity(
      id: id,
      orderId: orderId,
      transactionId: transactionId,
      provider: provider,
      paymentMethod: paymentMethod,
      amount: amount,
      currency: currency,
      status: status,
    );
  }
}

extension PaymentEntityMapper on PaymentEntity {
  PaymentModel toModel() {
    return PaymentModel(
      id: id,
      orderId: orderId,
      transactionId: transactionId,
      provider: provider,
      paymentMethod: paymentMethod,
      amount: amount,
      currency: currency,
      status: status,
    );
  }
}

extension PaymentMethodOptionModelMapper on PaymentMethodOptionModel {
  PaymentMethodOptionEntity toEntity() {
    return PaymentMethodOptionEntity(
      type: type,
      name: name,
      available: available,
      fee: fee,
      standardFee: standardFee,
      isFeeFree: isFeeFree,
      reasonCode: reasonCode,
      message: message,
      freeAboveAmount: freeAboveAmount,
      minOrderValue: minOrderValue,
      maxOrderValue: maxOrderValue,
    );
  }
}

extension PaymentMethodOptionEntityMapper on PaymentMethodOptionEntity {
  PaymentMethodOptionModel toModel() {
    return PaymentMethodOptionModel(
      type: type,
      name: name,
      available: available,
      fee: fee,
      standardFee: standardFee,
      isFeeFree: isFeeFree,
      reasonCode: reasonCode,
      message: message,
      freeAboveAmount: freeAboveAmount,
      minOrderValue: minOrderValue,
      maxOrderValue: maxOrderValue,
    );
  }
}

extension CodDetailsModelMapper on CodDetailsModel {
  CodDetailsEntity toEntity() {
    return CodDetailsEntity(
      isCod: isCod,
      fee: fee,
      standardFee: standardFee,
      isFeeFree: isFeeFree,
      freeAboveAmount: freeAboveAmount,
      minOrderValue: minOrderValue,
      maxOrderValue: maxOrderValue,
      isEligible: isEligible,
      reasonCode: reasonCode,
      message: message,
      eligibleShippingZones: eligibleShippingZones,
    );
  }
}

extension CodDetailsEntityMapper on CodDetailsEntity {
  CodDetailsModel toModel() {
    return CodDetailsModel(
      isCod: isCod,
      fee: fee,
      standardFee: standardFee,
      isFeeFree: isFeeFree,
      freeAboveAmount: freeAboveAmount,
      minOrderValue: minOrderValue,
      maxOrderValue: maxOrderValue,
      isEligible: isEligible,
      reasonCode: reasonCode,
      message: message,
      eligibleShippingZones: eligibleShippingZones,
    );
  }
}

extension CheckoutValidationModelMapper on CheckoutValidationModel {
  CheckoutValidationEntity toEntity() {
    return CheckoutValidationEntity(
      valid: valid,
      shippingAddress: shippingAddress?.toEntity(),
      shippingMethod: shippingMethod,
      subtotal: subtotal,
      shippingFee: shippingFee,
      tax: tax,
      grandTotal: grandTotal,
      taxableAmount: taxableAmount,
      discount: discount,
      currency: currency,
      currencySymbol: currencySymbol,
      taxBreakdown: taxBreakdown?.toEntity(),
      customerGstin: customerGstin,
      deliveryWindow: deliveryWindow,
      isFreeShipping: isFreeShipping,
      shippingDetails: shippingDetails,
      codFee: codFee,
      codDetails: codDetails?.toEntity(),
      paymentMethods: paymentMethods.map((p) => p.toEntity()).toList(),
    );
  }
}

extension CheckoutValidationEntityMapper on CheckoutValidationEntity {
  CheckoutValidationModel toModel() {
    return CheckoutValidationModel(
      valid: valid,
      shippingAddress: shippingAddress?.toModel(),
      shippingMethod: shippingMethod,
      subtotal: subtotal,
      shippingFee: shippingFee,
      tax: tax,
      grandTotal: grandTotal,
      taxableAmount: taxableAmount,
      discount: discount,
      currency: currency,
      currencySymbol: currencySymbol,
      taxBreakdown: taxBreakdown != null ? TaxBreakdownModel.fromEntity(taxBreakdown!) : null,
      customerGstin: customerGstin,
      deliveryWindow: deliveryWindow,
      isFreeShipping: isFreeShipping,
      shippingDetails: shippingDetails,
      codFee: codFee,
      codDetails: codDetails?.toModel(),
      paymentMethods: paymentMethods.map((p) => p.toModel()).toList(),
    );
  }
}
