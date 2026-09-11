import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/addresses/domain/entities/address_entity.dart';

part 'checkout_entity.freezed.dart';

@freezed
abstract class CheckoutValidationEntity with _$CheckoutValidationEntity {
  const factory CheckoutValidationEntity({
    required bool valid,
    AddressEntity? shippingAddress,
    @Default('STANDARD') String shippingMethod,
    required double subtotal,
    required double shippingFee,
    required double tax,
    required double grandTotal,
  }) = _CheckoutValidationEntity;
}
