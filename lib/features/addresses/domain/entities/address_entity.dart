class AddressEntity {
  final String id;
  final String fullName;
  final String phone;
  final String streetAddress;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool isDefault;

  const AddressEntity({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalCode,
    this.country = 'US',
    this.isDefault = false,
  });

  String get formattedAddress =>
      '$streetAddress, $city, $state $postalCode, $country';

  AddressEntity copyWith({
    String? id,
    String? fullName,
    String? phone,
    String? streetAddress,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    bool? isDefault,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      streetAddress: streetAddress ?? this.streetAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressEntity &&
          other.id == id &&
          other.fullName == fullName &&
          other.streetAddress == streetAddress &&
          other.isDefault == isDefault);

  @override
  int get hashCode => Object.hash(id, fullName, streetAddress, isDefault);
}
