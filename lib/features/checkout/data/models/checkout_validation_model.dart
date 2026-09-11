import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/addresses/data/models/address_model.dart';
import 'package:shopp_app/features/orders/data/models/order_model.dart';

part 'checkout_validation_model.freezed.dart';

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
