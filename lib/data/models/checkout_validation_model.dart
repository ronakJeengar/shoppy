import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/models/order_model.dart';

class CheckoutValidationModel {
  final bool valid;
  final List<OrderItemModel> items;
  final AddressModel? shippingAddress;
  final String shippingMethod;
  final double subtotal;
  final double shippingFee;
  final double tax;
  final double grandTotal;

  CheckoutValidationModel({
    required this.valid,
    required this.items,
    this.shippingAddress,
    this.shippingMethod = 'STANDARD',
    required this.subtotal,
    required this.shippingFee,
    required this.tax,
    required this.grandTotal,
  });

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
    );
  }
}
