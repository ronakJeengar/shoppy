import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';

@freezed
abstract class AddressEntity with _$AddressEntity {
  const AddressEntity._();

  const factory AddressEntity({
    required String id,
    required String fullName,
    required String phone,
    required String streetAddress,
    required String city,
    required String state,
    required String postalCode,
    @Default('US') String country,
    @Default(false) bool isDefault,
  }) = _AddressEntity;

  String get formattedAddress =>
      '$streetAddress, $city, $state $postalCode, $country';
}
