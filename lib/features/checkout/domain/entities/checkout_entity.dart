import 'package:shopp_app/features/addresses/domain/entities/address_entity.dart';

class CheckoutValidationEntity {
  final bool valid;
  final AddressEntity? shippingAddress;
  final String shippingMethod;
  final double subtotal;
  final double shippingFee;
  final double tax;
  final double grandTotal;

  const CheckoutValidationEntity({
    required this.valid,
    this.shippingAddress,
    this.shippingMethod = 'STANDARD',
    required this.subtotal,
    required this.shippingFee,
    required this.tax,
    required this.grandTotal,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckoutValidationEntity &&
          other.valid == valid &&
          other.grandTotal == grandTotal &&
          other.shippingMethod == shippingMethod);

  @override
  int get hashCode => Object.hash(valid, grandTotal, shippingMethod);
}
