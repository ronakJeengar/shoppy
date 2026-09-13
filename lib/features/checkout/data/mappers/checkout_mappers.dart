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
    );
  }
}
