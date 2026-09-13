import '../../domain/entities/invoice_entity.dart';
import '../models/invoice_model.dart';

extension InvoiceSellerModelMapper on InvoiceSellerModel {
  InvoiceSellerEntity toEntity() {
    return InvoiceSellerEntity(
      legalName: legalName,
      tradeName: tradeName,
      address: address,
      city: city,
      district: district,
      state: state,
      stateCode: stateCode,
      pinCode: pinCode,
      country: country,
      gstin: gstin,
      pan: pan,
      phone: phone,
      email: email,
      cin: cin,
    );
  }
}

extension InvoiceAddressModelMapper on InvoiceAddressModel {
  InvoiceAddressEntity toEntity() {
    return InvoiceAddressEntity(
      fullName: fullName,
      phone: phone,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      landmark: landmark,
      city: city,
      district: district,
      state: state,
      stateCode: stateCode,
      pinCode: pinCode,
      country: country,
      gstin: gstin,
    );
  }
}

extension InvoiceItemModelMapper on InvoiceItemModel {
  InvoiceItemEntity toEntity() {
    return InvoiceItemEntity(
      productId: productId,
      productName: productName,
      productImage: productImage,
      sellerName: sellerName,
      sku: sku,
      hsnCode: hsnCode,
      quantity: quantity,
      mrp: mrp,
      unitPrice: unitPrice,
      discount: discount,
      effectiveAmount: effectiveAmount,
      taxableAmount: taxableAmount,
      gstRate: gstRate,
      isTaxInclusive: isTaxInclusive,
      cgstRate: cgstRate,
      cgst: cgst,
      sgstRate: sgstRate,
      sgst: sgst,
      igstRate: igstRate,
      igst: igst,
      totalTax: totalTax,
      lineTotal: lineTotal,
    );
  }
}

extension InvoiceTaxSummaryModelMapper on InvoiceTaxSummaryModel {
  InvoiceTaxSummaryEntity toEntity() {
    return InvoiceTaxSummaryEntity(
      hsnCode: hsnCode,
      gstRate: gstRate,
      taxableAmount: taxableAmount,
      cgst: cgst,
      sgst: sgst,
      igst: igst,
      totalTax: totalTax,
    );
  }
}

extension InvoiceShippingModelMapper on InvoiceShippingModel {
  InvoiceShippingEntity toEntity() {
    return InvoiceShippingEntity(
      method: method,
      methodName: methodName,
      shippingAmount: shippingAmount,
      shippingZone: shippingZone,
      destinationPinCode: destinationPinCode,
      isFreeShipping: isFreeShipping,
    );
  }
}

extension InvoiceCodModelMapper on InvoiceCodModel {
  InvoiceCodEntity toEntity() {
    return InvoiceCodEntity(
      isCod: isCod,
      fee: fee,
    );
  }
}

extension InvoicePaymentModelMapper on InvoicePaymentModel {
  InvoicePaymentEntity toEntity() {
    return InvoicePaymentEntity(
      method: method,
      status: status,
      transactionId: transactionId,
      provider: provider,
    );
  }
}

extension InvoiceTotalsModelMapper on InvoiceTotalsModel {
  InvoiceTotalsEntity toEntity() {
    return InvoiceTotalsEntity(
      subtotal: subtotal,
      discount: discount,
      taxableAmount: taxableAmount,
      cgst: cgst,
      sgst: sgst,
      igst: igst,
      totalTax: totalTax,
      shippingFee: shippingFee,
      codFee: codFee,
      grandTotal: grandTotal,
      currency: currency,
      currencySymbol: currencySymbol,
      amountInWords: amountInWords,
    );
  }
}

extension InvoiceModelMapper on InvoiceModel {
  InvoiceEntity toEntity() {
    return InvoiceEntity(
      invoiceNumber: invoiceNumber,
      invoiceDate: DateTime.tryParse(invoiceDate) ?? DateTime.now(),
      invoiceStatus: invoiceStatus,
      orderId: orderId,
      orderNumber: orderNumber,
      orderDate: DateTime.tryParse(orderDate) ?? DateTime.now(),
      seller: seller.toEntity(),
      billingAddress: billingAddress.toEntity(),
      shippingAddress: shippingAddress.toEntity(),
      customerGstin: customerGstin,
      isInterState: isInterState,
      items: items.map((i) => i.toEntity()).toList(),
      taxSummary: taxSummary.map((t) => t.toEntity()).toList(),
      shipping: shipping.toEntity(),
      cod: cod.toEntity(),
      payment: payment.toEntity(),
      totals: totals.toEntity(),
    );
  }
}
