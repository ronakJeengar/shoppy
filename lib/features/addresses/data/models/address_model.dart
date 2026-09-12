import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const AddressModel._();

  const factory AddressModel({
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
  }) = _AddressModel;

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

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    final rawPostal = json['postalCode']?.toString() ?? '';
    final rawPin = json['pinCode']?.toString() ?? '';
    final effectivePin = rawPin.isNotEmpty ? rawPin : rawPostal;

    return AddressModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      streetAddress: json['streetAddress']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      postalCode: effectivePin,
      pinCode: effectivePin,
      district: json['district']?.toString() ?? '',
      landmark: json['landmark']?.toString() ?? '',
      country: json['country']?.toString() ?? 'IN',
      isDefault: json['isDefault'] == true,
    );
  }
}

extension AddressModelX on AddressModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phone': phone,
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'pinCode': pinCode.isNotEmpty ? pinCode : postalCode,
      'district': district,
      'landmark': landmark,
      'country': country,
      'isDefault': isDefault,
    };
  }
}
