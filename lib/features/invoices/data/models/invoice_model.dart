import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';

@freezed
abstract class InvoiceSellerModel with _$InvoiceSellerModel {
  const factory InvoiceSellerModel({
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
  }) = _InvoiceSellerModel;

  factory InvoiceSellerModel.fromJson(Map<String, dynamic> json) {
    return InvoiceSellerModel(
      legalName: json['legalName']?.toString() ?? 'Shoppy E-Commerce Private Limited',
      tradeName: json['tradeName']?.toString() ?? 'Shoppy India',
      address: json['address']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      district: json['district']?.toString() ?? '',
      state: json['state']?.toString() ?? 'Karnataka',
      stateCode: json['stateCode']?.toString() ?? 'KA',
      pinCode: json['pinCode']?.toString() ?? '',
      country: json['country']?.toString() ?? 'India',
      gstin: json['gstin']?.toString() ?? '',
      pan: json['pan']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      cin: json['cin']?.toString() ?? '',
    );
  }
}

@freezed
abstract class InvoiceAddressModel with _$InvoiceAddressModel {
  const factory InvoiceAddressModel({
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
  }) = _InvoiceAddressModel;

  factory InvoiceAddressModel.fromJson(Map<String, dynamic> json) {
    return InvoiceAddressModel(
      fullName: json['fullName']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      addressLine1: json['addressLine1']?.toString() ?? json['streetAddress']?.toString() ?? '',
      addressLine2: json['addressLine2']?.toString() ?? '',
      landmark: json['landmark']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      district: json['district']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      stateCode: json['stateCode']?.toString() ?? '',
      pinCode: json['pinCode']?.toString() ?? json['postalCode']?.toString() ?? '',
      country: json['country']?.toString() ?? 'IN',
      gstin: json['gstin']?.toString() ?? '',
    );
  }
}

@freezed
abstract class InvoiceItemModel with _$InvoiceItemModel {
  const factory InvoiceItemModel({
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
  }) = _InvoiceItemModel;

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) {
    return InvoiceItemModel(
      productId: json['productId']?.toString() ?? json['_id']?.toString() ?? '',
      productName: json['productName']?.toString() ?? 'Product',
      productImage: json['productImage']?.toString() ?? '',
      sellerName: json['sellerName']?.toString() ?? 'Official Store',
      sku: json['sku']?.toString() ?? '',
      hsnCode: json['hsnCode']?.toString() ?? '8518',
      quantity: (json['quantity'] is num) ? (json['quantity'] as num).toInt() : 1,
      mrp: (json['mrp'] is num) ? (json['mrp'] as num).toDouble() : ((json['unitPrice'] is num) ? (json['unitPrice'] as num).toDouble() : 0.0),
      unitPrice: (json['unitPrice'] is num) ? (json['unitPrice'] as num).toDouble() : 0.0,
      discount: (json['discount'] is num) ? (json['discount'] as num).toDouble() : 0.0,
      effectiveAmount: (json['effectiveAmount'] is num) ? (json['effectiveAmount'] as num).toDouble() : 0.0,
      taxableAmount: (json['taxableAmount'] is num) ? (json['taxableAmount'] as num).toDouble() : 0.0,
      gstRate: (json['gstRate'] is num) ? (json['gstRate'] as num).toDouble() : 18.0,
      isTaxInclusive: json['isTaxInclusive'] != false,
      cgstRate: (json['cgstRate'] is num) ? (json['cgstRate'] as num).toDouble() : 0.0,
      cgst: (json['cgst'] is num) ? (json['cgst'] as num).toDouble() : 0.0,
      sgstRate: (json['sgstRate'] is num) ? (json['sgstRate'] as num).toDouble() : 0.0,
      sgst: (json['sgst'] is num) ? (json['sgst'] as num).toDouble() : 0.0,
      igstRate: (json['igstRate'] is num) ? (json['igstRate'] as num).toDouble() : 0.0,
      igst: (json['igst'] is num) ? (json['igst'] as num).toDouble() : 0.0,
      totalTax: (json['totalTax'] is num) ? (json['totalTax'] as num).toDouble() : 0.0,
      lineTotal: (json['lineTotal'] is num) ? (json['lineTotal'] as num).toDouble() : 0.0,
    );
  }
}

@freezed
abstract class InvoiceTaxSummaryModel with _$InvoiceTaxSummaryModel {
  const factory InvoiceTaxSummaryModel({
    required String hsnCode,
    required double gstRate,
    required double taxableAmount,
    @Default(0.0) double cgst,
    @Default(0.0) double sgst,
    @Default(0.0) double igst,
    required double totalTax,
  }) = _InvoiceTaxSummaryModel;

  factory InvoiceTaxSummaryModel.fromJson(Map<String, dynamic> json) {
    return InvoiceTaxSummaryModel(
      hsnCode: json['hsnCode']?.toString() ?? '8518',
      gstRate: (json['gstRate'] is num) ? (json['gstRate'] as num).toDouble() : 18.0,
      taxableAmount: (json['taxableAmount'] is num) ? (json['taxableAmount'] as num).toDouble() : 0.0,
      cgst: (json['cgst'] is num) ? (json['cgst'] as num).toDouble() : 0.0,
      sgst: (json['sgst'] is num) ? (json['sgst'] as num).toDouble() : 0.0,
      igst: (json['igst'] is num) ? (json['igst'] as num).toDouble() : 0.0,
      totalTax: (json['totalTax'] is num) ? (json['totalTax'] as num).toDouble() : 0.0,
    );
  }
}

@freezed
abstract class InvoiceShippingModel with _$InvoiceShippingModel {
  const factory InvoiceShippingModel({
    required String method,
    required String methodName,
    required double shippingAmount,
    @Default('NATIONAL') String shippingZone,
    @Default('') String destinationPinCode,
    @Default(false) bool isFreeShipping,
  }) = _InvoiceShippingModel;

  factory InvoiceShippingModel.fromJson(Map<String, dynamic> json) {
    return InvoiceShippingModel(
      method: json['method']?.toString() ?? 'STANDARD',
      methodName: json['methodName']?.toString() ?? 'Standard Delivery',
      shippingAmount: (json['shippingAmount'] is num) ? (json['shippingAmount'] as num).toDouble() : 0.0,
      shippingZone: json['shippingZone']?.toString() ?? 'NATIONAL',
      destinationPinCode: json['destinationPinCode']?.toString() ?? '',
      isFreeShipping: json['isFreeShipping'] == true,
    );
  }
}

@freezed
abstract class InvoiceCodModel with _$InvoiceCodModel {
  const factory InvoiceCodModel({
    @Default(false) bool isCod,
    @Default(0.0) double fee,
  }) = _InvoiceCodModel;

  factory InvoiceCodModel.fromJson(Map<String, dynamic> json) {
    return InvoiceCodModel(
      isCod: json['isCod'] == true,
      fee: (json['fee'] is num) ? (json['fee'] as num).toDouble() : 0.0,
    );
  }
}

@freezed
abstract class InvoicePaymentModel with _$InvoicePaymentModel {
  const factory InvoicePaymentModel({
    required String method,
    required String status,
    @Default('') String transactionId,
    @Default('') String provider,
  }) = _InvoicePaymentModel;

  factory InvoicePaymentModel.fromJson(Map<String, dynamic> json) {
    return InvoicePaymentModel(
      method: json['method']?.toString() ?? 'CARD',
      status: json['status']?.toString() ?? 'PENDING',
      transactionId: json['transactionId']?.toString() ?? '',
      provider: json['provider']?.toString() ?? 'SIMULATED',
    );
  }
}

@freezed
abstract class InvoiceTotalsModel with _$InvoiceTotalsModel {
  const factory InvoiceTotalsModel({
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
  }) = _InvoiceTotalsModel;

  factory InvoiceTotalsModel.fromJson(Map<String, dynamic> json) {
    return InvoiceTotalsModel(
      subtotal: (json['subtotal'] is num) ? (json['subtotal'] as num).toDouble() : 0.0,
      discount: (json['discount'] is num) ? (json['discount'] as num).toDouble() : 0.0,
      taxableAmount: (json['taxableAmount'] is num) ? (json['taxableAmount'] as num).toDouble() : 0.0,
      cgst: (json['cgst'] is num) ? (json['cgst'] as num).toDouble() : 0.0,
      sgst: (json['sgst'] is num) ? (json['sgst'] as num).toDouble() : 0.0,
      igst: (json['igst'] is num) ? (json['igst'] as num).toDouble() : 0.0,
      totalTax: (json['totalTax'] is num) ? (json['totalTax'] as num).toDouble() : 0.0,
      shippingFee: (json['shippingFee'] is num) ? (json['shippingFee'] as num).toDouble() : 0.0,
      codFee: (json['codFee'] is num) ? (json['codFee'] as num).toDouble() : 0.0,
      grandTotal: (json['grandTotal'] is num) ? (json['grandTotal'] as num).toDouble() : 0.0,
      currency: json['currency']?.toString() ?? 'INR',
      currencySymbol: json['currencySymbol']?.toString() ?? '₹',
      amountInWords: json['amountInWords']?.toString() ?? '',
    );
  }
}

@freezed
abstract class InvoiceModel with _$InvoiceModel {
  const factory InvoiceModel({
    required String invoiceNumber,
    required String invoiceDate,
    required String invoiceStatus,
    required String orderId,
    required String orderNumber,
    required String orderDate,
    required InvoiceSellerModel seller,
    required InvoiceAddressModel billingAddress,
    required InvoiceAddressModel shippingAddress,
    @Default('') String customerGstin,
    @Default(false) bool isInterState,
    @Default([]) List<InvoiceItemModel> items,
    @Default([]) List<InvoiceTaxSummaryModel> taxSummary,
    required InvoiceShippingModel shipping,
    required InvoiceCodModel cod,
    required InvoicePaymentModel payment,
    required InvoiceTotalsModel totals,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    final List<InvoiceItemModel> items = [];
    if (rawItems is List) {
      for (final i in rawItems) {
        if (i is Map<String, dynamic>) {
          items.add(InvoiceItemModel.fromJson(i));
        }
      }
    }

    final rawTax = json['taxSummary'];
    final List<InvoiceTaxSummaryModel> taxSummary = [];
    if (rawTax is List) {
      for (final t in rawTax) {
        if (t is Map<String, dynamic>) {
          taxSummary.add(InvoiceTaxSummaryModel.fromJson(t));
        }
      }
    }

    return InvoiceModel(
      invoiceNumber: json['invoiceNumber']?.toString() ?? '',
      invoiceDate: json['invoiceDate']?.toString() ?? DateTime.now().toIso8601String(),
      invoiceStatus: json['invoiceStatus']?.toString() ?? 'ISSUED',
      orderId: json['orderId']?.toString() ?? '',
      orderNumber: json['orderNumber']?.toString() ?? '',
      orderDate: json['orderDate']?.toString() ?? DateTime.now().toIso8601String(),
      seller: json['seller'] is Map<String, dynamic>
          ? InvoiceSellerModel.fromJson(json['seller'] as Map<String, dynamic>)
          : InvoiceSellerModel.fromJson(const {}),
      billingAddress: json['billingAddress'] is Map<String, dynamic>
          ? InvoiceAddressModel.fromJson(json['billingAddress'] as Map<String, dynamic>)
          : InvoiceAddressModel.fromJson(const {}),
      shippingAddress: json['shippingAddress'] is Map<String, dynamic>
          ? InvoiceAddressModel.fromJson(json['shippingAddress'] as Map<String, dynamic>)
          : InvoiceAddressModel.fromJson(const {}),
      customerGstin: json['customerGstin']?.toString() ?? '',
      isInterState: json['isInterState'] == true,
      items: items,
      taxSummary: taxSummary,
      shipping: json['shipping'] is Map<String, dynamic>
          ? InvoiceShippingModel.fromJson(json['shipping'] as Map<String, dynamic>)
          : InvoiceShippingModel.fromJson(const {}),
      cod: json['cod'] is Map<String, dynamic>
          ? InvoiceCodModel.fromJson(json['cod'] as Map<String, dynamic>)
          : InvoiceCodModel.fromJson(const {}),
      payment: json['payment'] is Map<String, dynamic>
          ? InvoicePaymentModel.fromJson(json['payment'] as Map<String, dynamic>)
          : InvoicePaymentModel.fromJson(const {}),
      totals: json['totals'] is Map<String, dynamic>
          ? InvoiceTotalsModel.fromJson(json['totals'] as Map<String, dynamic>)
          : InvoiceTotalsModel.fromJson(const {}),
    );
  }
}
