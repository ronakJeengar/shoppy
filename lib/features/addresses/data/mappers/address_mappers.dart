import '../models/address_model.dart';
import '../../domain/entities/address_entity.dart';

extension AddressModelMapper on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      fullName: fullName,
      phone: phone,
      streetAddress: streetAddress,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
      isDefault: isDefault,
    );
  }
}

extension AddressEntityMapper on AddressEntity {
  AddressModel toModel() {
    return AddressModel(
      id: id,
      fullName: fullName,
      phone: phone,
      streetAddress: streetAddress,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
      isDefault: isDefault,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phone': phone,
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'isDefault': isDefault,
    };
  }
}
