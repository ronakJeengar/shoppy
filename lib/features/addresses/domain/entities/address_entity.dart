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
    @Default('') String pinCode,
    @Default('') String district,
    @Default('') String landmark,
    @Default('IN') String country,
    @Default(false) bool isDefault,
  }) = _AddressEntity;

  String get formattedAddress {
    final code = pinCode.isNotEmpty ? pinCode : postalCode;
    final parts = [
      streetAddress,
      if (landmark.trim().isNotEmpty) landmark.trim(),
      if (district.trim().isNotEmpty && district.trim() != city.trim()) district.trim(),
      city.trim(),
      '${state.trim()} $code'.trim(),
      country.trim(),
    ];
    return parts.where((p) => p.isNotEmpty).join(', ');
  }
}
