// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceSellerEntity {
  String get legalName;
  String get tradeName;
  String get address;
  String get city;
  String get district;
  String get state;
  String get stateCode;
  String get pinCode;
  String get country;
  String get gstin;
  String get pan;
  String get phone;
  String get email;
  String get cin;

  /// Create a copy of InvoiceSellerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceSellerEntityCopyWith<InvoiceSellerEntity> get copyWith =>
      _$InvoiceSellerEntityCopyWithImpl<InvoiceSellerEntity>(
          this as InvoiceSellerEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceSellerEntity &&
            (identical(other.legalName, legalName) ||
                other.legalName == legalName) &&
            (identical(other.tradeName, tradeName) ||
                other.tradeName == tradeName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gstin, gstin) || other.gstin == gstin) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cin, cin) || other.cin == cin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      legalName,
      tradeName,
      address,
      city,
      district,
      state,
      stateCode,
      pinCode,
      country,
      gstin,
      pan,
      phone,
      email,
      cin);

  @override
  String toString() {
    return 'InvoiceSellerEntity(legalName: $legalName, tradeName: $tradeName, address: $address, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin, pan: $pan, phone: $phone, email: $email, cin: $cin)';
  }
}

/// @nodoc
abstract mixin class $InvoiceSellerEntityCopyWith<$Res> {
  factory $InvoiceSellerEntityCopyWith(
          InvoiceSellerEntity value, $Res Function(InvoiceSellerEntity) _then) =
      _$InvoiceSellerEntityCopyWithImpl;
  @useResult
  $Res call(
      {String legalName,
      String tradeName,
      String address,
      String city,
      String district,
      String state,
      String stateCode,
      String pinCode,
      String country,
      String gstin,
      String pan,
      String phone,
      String email,
      String cin});
}

/// @nodoc
class _$InvoiceSellerEntityCopyWithImpl<$Res>
    implements $InvoiceSellerEntityCopyWith<$Res> {
  _$InvoiceSellerEntityCopyWithImpl(this._self, this._then);

  final InvoiceSellerEntity _self;
  final $Res Function(InvoiceSellerEntity) _then;

  /// Create a copy of InvoiceSellerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legalName = null,
    Object? tradeName = null,
    Object? address = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? pinCode = null,
    Object? country = null,
    Object? gstin = null,
    Object? pan = null,
    Object? phone = null,
    Object? email = null,
    Object? cin = null,
  }) {
    return _then(_self.copyWith(
      legalName: null == legalName
          ? _self.legalName
          : legalName // ignore: cast_nullable_to_non_nullable
              as String,
      tradeName: null == tradeName
          ? _self.tradeName
          : tradeName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: null == gstin
          ? _self.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String,
      pan: null == pan
          ? _self.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _self.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceSellerEntity].
extension InvoiceSellerEntityPatterns on InvoiceSellerEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceSellerEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceSellerEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceSellerEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String legalName,
            String tradeName,
            String address,
            String city,
            String district,
            String state,
            String stateCode,
            String pinCode,
            String country,
            String gstin,
            String pan,
            String phone,
            String email,
            String cin)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerEntity() when $default != null:
        return $default(
            _that.legalName,
            _that.tradeName,
            _that.address,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.pinCode,
            _that.country,
            _that.gstin,
            _that.pan,
            _that.phone,
            _that.email,
            _that.cin);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String legalName,
            String tradeName,
            String address,
            String city,
            String district,
            String state,
            String stateCode,
            String pinCode,
            String country,
            String gstin,
            String pan,
            String phone,
            String email,
            String cin)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerEntity():
        return $default(
            _that.legalName,
            _that.tradeName,
            _that.address,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.pinCode,
            _that.country,
            _that.gstin,
            _that.pan,
            _that.phone,
            _that.email,
            _that.cin);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String legalName,
            String tradeName,
            String address,
            String city,
            String district,
            String state,
            String stateCode,
            String pinCode,
            String country,
            String gstin,
            String pan,
            String phone,
            String email,
            String cin)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerEntity() when $default != null:
        return $default(
            _that.legalName,
            _that.tradeName,
            _that.address,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.pinCode,
            _that.country,
            _that.gstin,
            _that.pan,
            _that.phone,
            _that.email,
            _that.cin);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceSellerEntity implements InvoiceSellerEntity {
  const _InvoiceSellerEntity(
      {required this.legalName,
      required this.tradeName,
      required this.address,
      required this.city,
      this.district = '',
      required this.state,
      this.stateCode = '',
      required this.pinCode,
      this.country = 'India',
      required this.gstin,
      this.pan = '',
      this.phone = '',
      this.email = '',
      this.cin = ''});

  @override
  final String legalName;
  @override
  final String tradeName;
  @override
  final String address;
  @override
  final String city;
  @override
  @JsonKey()
  final String district;
  @override
  final String state;
  @override
  @JsonKey()
  final String stateCode;
  @override
  final String pinCode;
  @override
  @JsonKey()
  final String country;
  @override
  final String gstin;
  @override
  @JsonKey()
  final String pan;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String cin;

  /// Create a copy of InvoiceSellerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceSellerEntityCopyWith<_InvoiceSellerEntity> get copyWith =>
      __$InvoiceSellerEntityCopyWithImpl<_InvoiceSellerEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceSellerEntity &&
            (identical(other.legalName, legalName) ||
                other.legalName == legalName) &&
            (identical(other.tradeName, tradeName) ||
                other.tradeName == tradeName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gstin, gstin) || other.gstin == gstin) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cin, cin) || other.cin == cin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      legalName,
      tradeName,
      address,
      city,
      district,
      state,
      stateCode,
      pinCode,
      country,
      gstin,
      pan,
      phone,
      email,
      cin);

  @override
  String toString() {
    return 'InvoiceSellerEntity(legalName: $legalName, tradeName: $tradeName, address: $address, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin, pan: $pan, phone: $phone, email: $email, cin: $cin)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceSellerEntityCopyWith<$Res>
    implements $InvoiceSellerEntityCopyWith<$Res> {
  factory _$InvoiceSellerEntityCopyWith(_InvoiceSellerEntity value,
          $Res Function(_InvoiceSellerEntity) _then) =
      __$InvoiceSellerEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String legalName,
      String tradeName,
      String address,
      String city,
      String district,
      String state,
      String stateCode,
      String pinCode,
      String country,
      String gstin,
      String pan,
      String phone,
      String email,
      String cin});
}

/// @nodoc
class __$InvoiceSellerEntityCopyWithImpl<$Res>
    implements _$InvoiceSellerEntityCopyWith<$Res> {
  __$InvoiceSellerEntityCopyWithImpl(this._self, this._then);

  final _InvoiceSellerEntity _self;
  final $Res Function(_InvoiceSellerEntity) _then;

  /// Create a copy of InvoiceSellerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? legalName = null,
    Object? tradeName = null,
    Object? address = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? pinCode = null,
    Object? country = null,
    Object? gstin = null,
    Object? pan = null,
    Object? phone = null,
    Object? email = null,
    Object? cin = null,
  }) {
    return _then(_InvoiceSellerEntity(
      legalName: null == legalName
          ? _self.legalName
          : legalName // ignore: cast_nullable_to_non_nullable
              as String,
      tradeName: null == tradeName
          ? _self.tradeName
          : tradeName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: null == gstin
          ? _self.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String,
      pan: null == pan
          ? _self.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _self.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InvoiceAddressEntity {
  String get fullName;
  String get phone;
  String get addressLine1;
  String get addressLine2;
  String get landmark;
  String get city;
  String get district;
  String get state;
  String get stateCode;
  String get pinCode;
  String get country;
  String get gstin;

  /// Create a copy of InvoiceAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceAddressEntityCopyWith<InvoiceAddressEntity> get copyWith =>
      _$InvoiceAddressEntityCopyWithImpl<InvoiceAddressEntity>(
          this as InvoiceAddressEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceAddressEntity &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gstin, gstin) || other.gstin == gstin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      phone,
      addressLine1,
      addressLine2,
      landmark,
      city,
      district,
      state,
      stateCode,
      pinCode,
      country,
      gstin);

  @override
  String toString() {
    return 'InvoiceAddressEntity(fullName: $fullName, phone: $phone, addressLine1: $addressLine1, addressLine2: $addressLine2, landmark: $landmark, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin)';
  }
}

/// @nodoc
abstract mixin class $InvoiceAddressEntityCopyWith<$Res> {
  factory $InvoiceAddressEntityCopyWith(InvoiceAddressEntity value,
          $Res Function(InvoiceAddressEntity) _then) =
      _$InvoiceAddressEntityCopyWithImpl;
  @useResult
  $Res call(
      {String fullName,
      String phone,
      String addressLine1,
      String addressLine2,
      String landmark,
      String city,
      String district,
      String state,
      String stateCode,
      String pinCode,
      String country,
      String gstin});
}

/// @nodoc
class _$InvoiceAddressEntityCopyWithImpl<$Res>
    implements $InvoiceAddressEntityCopyWith<$Res> {
  _$InvoiceAddressEntityCopyWithImpl(this._self, this._then);

  final InvoiceAddressEntity _self;
  final $Res Function(InvoiceAddressEntity) _then;

  /// Create a copy of InvoiceAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? phone = null,
    Object? addressLine1 = null,
    Object? addressLine2 = null,
    Object? landmark = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? pinCode = null,
    Object? country = null,
    Object? gstin = null,
  }) {
    return _then(_self.copyWith(
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine1: null == addressLine1
          ? _self.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine2: null == addressLine2
          ? _self.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String,
      landmark: null == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: null == gstin
          ? _self.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceAddressEntity].
extension InvoiceAddressEntityPatterns on InvoiceAddressEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceAddressEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceAddressEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceAddressEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String fullName,
            String phone,
            String addressLine1,
            String addressLine2,
            String landmark,
            String city,
            String district,
            String state,
            String stateCode,
            String pinCode,
            String country,
            String gstin)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressEntity() when $default != null:
        return $default(
            _that.fullName,
            _that.phone,
            _that.addressLine1,
            _that.addressLine2,
            _that.landmark,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.pinCode,
            _that.country,
            _that.gstin);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String fullName,
            String phone,
            String addressLine1,
            String addressLine2,
            String landmark,
            String city,
            String district,
            String state,
            String stateCode,
            String pinCode,
            String country,
            String gstin)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressEntity():
        return $default(
            _that.fullName,
            _that.phone,
            _that.addressLine1,
            _that.addressLine2,
            _that.landmark,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.pinCode,
            _that.country,
            _that.gstin);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String fullName,
            String phone,
            String addressLine1,
            String addressLine2,
            String landmark,
            String city,
            String district,
            String state,
            String stateCode,
            String pinCode,
            String country,
            String gstin)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressEntity() when $default != null:
        return $default(
            _that.fullName,
            _that.phone,
            _that.addressLine1,
            _that.addressLine2,
            _that.landmark,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.pinCode,
            _that.country,
            _that.gstin);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceAddressEntity implements InvoiceAddressEntity {
  const _InvoiceAddressEntity(
      {required this.fullName,
      required this.phone,
      required this.addressLine1,
      this.addressLine2 = '',
      this.landmark = '',
      required this.city,
      this.district = '',
      required this.state,
      this.stateCode = '',
      required this.pinCode,
      this.country = 'IN',
      this.gstin = ''});

  @override
  final String fullName;
  @override
  final String phone;
  @override
  final String addressLine1;
  @override
  @JsonKey()
  final String addressLine2;
  @override
  @JsonKey()
  final String landmark;
  @override
  final String city;
  @override
  @JsonKey()
  final String district;
  @override
  final String state;
  @override
  @JsonKey()
  final String stateCode;
  @override
  final String pinCode;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String gstin;

  /// Create a copy of InvoiceAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceAddressEntityCopyWith<_InvoiceAddressEntity> get copyWith =>
      __$InvoiceAddressEntityCopyWithImpl<_InvoiceAddressEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceAddressEntity &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gstin, gstin) || other.gstin == gstin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      phone,
      addressLine1,
      addressLine2,
      landmark,
      city,
      district,
      state,
      stateCode,
      pinCode,
      country,
      gstin);

  @override
  String toString() {
    return 'InvoiceAddressEntity(fullName: $fullName, phone: $phone, addressLine1: $addressLine1, addressLine2: $addressLine2, landmark: $landmark, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceAddressEntityCopyWith<$Res>
    implements $InvoiceAddressEntityCopyWith<$Res> {
  factory _$InvoiceAddressEntityCopyWith(_InvoiceAddressEntity value,
          $Res Function(_InvoiceAddressEntity) _then) =
      __$InvoiceAddressEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String fullName,
      String phone,
      String addressLine1,
      String addressLine2,
      String landmark,
      String city,
      String district,
      String state,
      String stateCode,
      String pinCode,
      String country,
      String gstin});
}

/// @nodoc
class __$InvoiceAddressEntityCopyWithImpl<$Res>
    implements _$InvoiceAddressEntityCopyWith<$Res> {
  __$InvoiceAddressEntityCopyWithImpl(this._self, this._then);

  final _InvoiceAddressEntity _self;
  final $Res Function(_InvoiceAddressEntity) _then;

  /// Create a copy of InvoiceAddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fullName = null,
    Object? phone = null,
    Object? addressLine1 = null,
    Object? addressLine2 = null,
    Object? landmark = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? pinCode = null,
    Object? country = null,
    Object? gstin = null,
  }) {
    return _then(_InvoiceAddressEntity(
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine1: null == addressLine1
          ? _self.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine2: null == addressLine2
          ? _self.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String,
      landmark: null == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: null == gstin
          ? _self.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InvoiceItemEntity {
  String get productId;
  String get productName;
  String get productImage;
  String get sellerName;
  String get sku;
  String get hsnCode;
  int get quantity;
  double get mrp;
  double get unitPrice;
  double get discount;
  double get effectiveAmount;
  double get taxableAmount;
  double get gstRate;
  bool get isTaxInclusive;
  double get cgstRate;
  double get cgst;
  double get sgstRate;
  double get sgst;
  double get igstRate;
  double get igst;
  double get totalTax;
  double get lineTotal;

  /// Create a copy of InvoiceItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceItemEntityCopyWith<InvoiceItemEntity> get copyWith =>
      _$InvoiceItemEntityCopyWithImpl<InvoiceItemEntity>(
          this as InvoiceItemEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceItemEntity &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.effectiveAmount, effectiveAmount) ||
                other.effectiveAmount == effectiveAmount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.isTaxInclusive, isTaxInclusive) ||
                other.isTaxInclusive == isTaxInclusive) &&
            (identical(other.cgstRate, cgstRate) ||
                other.cgstRate == cgstRate) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgstRate, sgstRate) ||
                other.sgstRate == sgstRate) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igstRate, igstRate) ||
                other.igstRate == igstRate) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        productName,
        productImage,
        sellerName,
        sku,
        hsnCode,
        quantity,
        mrp,
        unitPrice,
        discount,
        effectiveAmount,
        taxableAmount,
        gstRate,
        isTaxInclusive,
        cgstRate,
        cgst,
        sgstRate,
        sgst,
        igstRate,
        igst,
        totalTax,
        lineTotal
      ]);

  @override
  String toString() {
    return 'InvoiceItemEntity(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, sku: $sku, hsnCode: $hsnCode, quantity: $quantity, mrp: $mrp, unitPrice: $unitPrice, discount: $discount, effectiveAmount: $effectiveAmount, taxableAmount: $taxableAmount, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, cgstRate: $cgstRate, cgst: $cgst, sgstRate: $sgstRate, sgst: $sgst, igstRate: $igstRate, igst: $igst, totalTax: $totalTax, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class $InvoiceItemEntityCopyWith<$Res> {
  factory $InvoiceItemEntityCopyWith(
          InvoiceItemEntity value, $Res Function(InvoiceItemEntity) _then) =
      _$InvoiceItemEntityCopyWithImpl;
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String sellerName,
      String sku,
      String hsnCode,
      int quantity,
      double mrp,
      double unitPrice,
      double discount,
      double effectiveAmount,
      double taxableAmount,
      double gstRate,
      bool isTaxInclusive,
      double cgstRate,
      double cgst,
      double sgstRate,
      double sgst,
      double igstRate,
      double igst,
      double totalTax,
      double lineTotal});
}

/// @nodoc
class _$InvoiceItemEntityCopyWithImpl<$Res>
    implements $InvoiceItemEntityCopyWith<$Res> {
  _$InvoiceItemEntityCopyWithImpl(this._self, this._then);

  final InvoiceItemEntity _self;
  final $Res Function(InvoiceItemEntity) _then;

  /// Create a copy of InvoiceItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? sellerName = null,
    Object? sku = null,
    Object? hsnCode = null,
    Object? quantity = null,
    Object? mrp = null,
    Object? unitPrice = null,
    Object? discount = null,
    Object? effectiveAmount = null,
    Object? taxableAmount = null,
    Object? gstRate = null,
    Object? isTaxInclusive = null,
    Object? cgstRate = null,
    Object? cgst = null,
    Object? sgstRate = null,
    Object? sgst = null,
    Object? igstRate = null,
    Object? igst = null,
    Object? totalTax = null,
    Object? lineTotal = null,
  }) {
    return _then(_self.copyWith(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      hsnCode: null == hsnCode
          ? _self.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      mrp: null == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      effectiveAmount: null == effectiveAmount
          ? _self.effectiveAmount
          : effectiveAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      gstRate: null == gstRate
          ? _self.gstRate
          : gstRate // ignore: cast_nullable_to_non_nullable
              as double,
      isTaxInclusive: null == isTaxInclusive
          ? _self.isTaxInclusive
          : isTaxInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
      cgstRate: null == cgstRate
          ? _self.cgstRate
          : cgstRate // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _self.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgstRate: null == sgstRate
          ? _self.sgstRate
          : sgstRate // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _self.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      igstRate: null == igstRate
          ? _self.igstRate
          : igstRate // ignore: cast_nullable_to_non_nullable
              as double,
      igst: null == igst
          ? _self.igst
          : igst // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _self.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      lineTotal: null == lineTotal
          ? _self.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceItemEntity].
extension InvoiceItemEntityPatterns on InvoiceItemEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceItemEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceItemEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceItemEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String productId,
            String productName,
            String productImage,
            String sellerName,
            String sku,
            String hsnCode,
            int quantity,
            double mrp,
            double unitPrice,
            double discount,
            double effectiveAmount,
            double taxableAmount,
            double gstRate,
            bool isTaxInclusive,
            double cgstRate,
            double cgst,
            double sgstRate,
            double sgst,
            double igstRate,
            double igst,
            double totalTax,
            double lineTotal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemEntity() when $default != null:
        return $default(
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.sku,
            _that.hsnCode,
            _that.quantity,
            _that.mrp,
            _that.unitPrice,
            _that.discount,
            _that.effectiveAmount,
            _that.taxableAmount,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.cgstRate,
            _that.cgst,
            _that.sgstRate,
            _that.sgst,
            _that.igstRate,
            _that.igst,
            _that.totalTax,
            _that.lineTotal);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String productId,
            String productName,
            String productImage,
            String sellerName,
            String sku,
            String hsnCode,
            int quantity,
            double mrp,
            double unitPrice,
            double discount,
            double effectiveAmount,
            double taxableAmount,
            double gstRate,
            bool isTaxInclusive,
            double cgstRate,
            double cgst,
            double sgstRate,
            double sgst,
            double igstRate,
            double igst,
            double totalTax,
            double lineTotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemEntity():
        return $default(
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.sku,
            _that.hsnCode,
            _that.quantity,
            _that.mrp,
            _that.unitPrice,
            _that.discount,
            _that.effectiveAmount,
            _that.taxableAmount,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.cgstRate,
            _that.cgst,
            _that.sgstRate,
            _that.sgst,
            _that.igstRate,
            _that.igst,
            _that.totalTax,
            _that.lineTotal);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String productId,
            String productName,
            String productImage,
            String sellerName,
            String sku,
            String hsnCode,
            int quantity,
            double mrp,
            double unitPrice,
            double discount,
            double effectiveAmount,
            double taxableAmount,
            double gstRate,
            bool isTaxInclusive,
            double cgstRate,
            double cgst,
            double sgstRate,
            double sgst,
            double igstRate,
            double igst,
            double totalTax,
            double lineTotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemEntity() when $default != null:
        return $default(
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.sku,
            _that.hsnCode,
            _that.quantity,
            _that.mrp,
            _that.unitPrice,
            _that.discount,
            _that.effectiveAmount,
            _that.taxableAmount,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.cgstRate,
            _that.cgst,
            _that.sgstRate,
            _that.sgst,
            _that.igstRate,
            _that.igst,
            _that.totalTax,
            _that.lineTotal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceItemEntity implements InvoiceItemEntity {
  const _InvoiceItemEntity(
      {required this.productId,
      required this.productName,
      this.productImage = '',
      required this.sellerName,
      required this.sku,
      required this.hsnCode,
      required this.quantity,
      required this.mrp,
      required this.unitPrice,
      this.discount = 0.0,
      required this.effectiveAmount,
      required this.taxableAmount,
      required this.gstRate,
      this.isTaxInclusive = true,
      this.cgstRate = 0.0,
      this.cgst = 0.0,
      this.sgstRate = 0.0,
      this.sgst = 0.0,
      this.igstRate = 0.0,
      this.igst = 0.0,
      required this.totalTax,
      required this.lineTotal});

  @override
  final String productId;
  @override
  final String productName;
  @override
  @JsonKey()
  final String productImage;
  @override
  final String sellerName;
  @override
  final String sku;
  @override
  final String hsnCode;
  @override
  final int quantity;
  @override
  final double mrp;
  @override
  final double unitPrice;
  @override
  @JsonKey()
  final double discount;
  @override
  final double effectiveAmount;
  @override
  final double taxableAmount;
  @override
  final double gstRate;
  @override
  @JsonKey()
  final bool isTaxInclusive;
  @override
  @JsonKey()
  final double cgstRate;
  @override
  @JsonKey()
  final double cgst;
  @override
  @JsonKey()
  final double sgstRate;
  @override
  @JsonKey()
  final double sgst;
  @override
  @JsonKey()
  final double igstRate;
  @override
  @JsonKey()
  final double igst;
  @override
  final double totalTax;
  @override
  final double lineTotal;

  /// Create a copy of InvoiceItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceItemEntityCopyWith<_InvoiceItemEntity> get copyWith =>
      __$InvoiceItemEntityCopyWithImpl<_InvoiceItemEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceItemEntity &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.effectiveAmount, effectiveAmount) ||
                other.effectiveAmount == effectiveAmount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.isTaxInclusive, isTaxInclusive) ||
                other.isTaxInclusive == isTaxInclusive) &&
            (identical(other.cgstRate, cgstRate) ||
                other.cgstRate == cgstRate) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgstRate, sgstRate) ||
                other.sgstRate == sgstRate) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igstRate, igstRate) ||
                other.igstRate == igstRate) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        productName,
        productImage,
        sellerName,
        sku,
        hsnCode,
        quantity,
        mrp,
        unitPrice,
        discount,
        effectiveAmount,
        taxableAmount,
        gstRate,
        isTaxInclusive,
        cgstRate,
        cgst,
        sgstRate,
        sgst,
        igstRate,
        igst,
        totalTax,
        lineTotal
      ]);

  @override
  String toString() {
    return 'InvoiceItemEntity(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, sku: $sku, hsnCode: $hsnCode, quantity: $quantity, mrp: $mrp, unitPrice: $unitPrice, discount: $discount, effectiveAmount: $effectiveAmount, taxableAmount: $taxableAmount, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, cgstRate: $cgstRate, cgst: $cgst, sgstRate: $sgstRate, sgst: $sgst, igstRate: $igstRate, igst: $igst, totalTax: $totalTax, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceItemEntityCopyWith<$Res>
    implements $InvoiceItemEntityCopyWith<$Res> {
  factory _$InvoiceItemEntityCopyWith(
          _InvoiceItemEntity value, $Res Function(_InvoiceItemEntity) _then) =
      __$InvoiceItemEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String sellerName,
      String sku,
      String hsnCode,
      int quantity,
      double mrp,
      double unitPrice,
      double discount,
      double effectiveAmount,
      double taxableAmount,
      double gstRate,
      bool isTaxInclusive,
      double cgstRate,
      double cgst,
      double sgstRate,
      double sgst,
      double igstRate,
      double igst,
      double totalTax,
      double lineTotal});
}

/// @nodoc
class __$InvoiceItemEntityCopyWithImpl<$Res>
    implements _$InvoiceItemEntityCopyWith<$Res> {
  __$InvoiceItemEntityCopyWithImpl(this._self, this._then);

  final _InvoiceItemEntity _self;
  final $Res Function(_InvoiceItemEntity) _then;

  /// Create a copy of InvoiceItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? sellerName = null,
    Object? sku = null,
    Object? hsnCode = null,
    Object? quantity = null,
    Object? mrp = null,
    Object? unitPrice = null,
    Object? discount = null,
    Object? effectiveAmount = null,
    Object? taxableAmount = null,
    Object? gstRate = null,
    Object? isTaxInclusive = null,
    Object? cgstRate = null,
    Object? cgst = null,
    Object? sgstRate = null,
    Object? sgst = null,
    Object? igstRate = null,
    Object? igst = null,
    Object? totalTax = null,
    Object? lineTotal = null,
  }) {
    return _then(_InvoiceItemEntity(
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      hsnCode: null == hsnCode
          ? _self.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      mrp: null == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      effectiveAmount: null == effectiveAmount
          ? _self.effectiveAmount
          : effectiveAmount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      gstRate: null == gstRate
          ? _self.gstRate
          : gstRate // ignore: cast_nullable_to_non_nullable
              as double,
      isTaxInclusive: null == isTaxInclusive
          ? _self.isTaxInclusive
          : isTaxInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
      cgstRate: null == cgstRate
          ? _self.cgstRate
          : cgstRate // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _self.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgstRate: null == sgstRate
          ? _self.sgstRate
          : sgstRate // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _self.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      igstRate: null == igstRate
          ? _self.igstRate
          : igstRate // ignore: cast_nullable_to_non_nullable
              as double,
      igst: null == igst
          ? _self.igst
          : igst // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _self.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      lineTotal: null == lineTotal
          ? _self.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$InvoiceTaxSummaryEntity {
  String get hsnCode;
  double get gstRate;
  double get taxableAmount;
  double get cgst;
  double get sgst;
  double get igst;
  double get totalTax;

  /// Create a copy of InvoiceTaxSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceTaxSummaryEntityCopyWith<InvoiceTaxSummaryEntity> get copyWith =>
      _$InvoiceTaxSummaryEntityCopyWithImpl<InvoiceTaxSummaryEntity>(
          this as InvoiceTaxSummaryEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceTaxSummaryEntity &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hsnCode, gstRate, taxableAmount, cgst, sgst, igst, totalTax);

  @override
  String toString() {
    return 'InvoiceTaxSummaryEntity(hsnCode: $hsnCode, gstRate: $gstRate, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax)';
  }
}

/// @nodoc
abstract mixin class $InvoiceTaxSummaryEntityCopyWith<$Res> {
  factory $InvoiceTaxSummaryEntityCopyWith(InvoiceTaxSummaryEntity value,
          $Res Function(InvoiceTaxSummaryEntity) _then) =
      _$InvoiceTaxSummaryEntityCopyWithImpl;
  @useResult
  $Res call(
      {String hsnCode,
      double gstRate,
      double taxableAmount,
      double cgst,
      double sgst,
      double igst,
      double totalTax});
}

/// @nodoc
class _$InvoiceTaxSummaryEntityCopyWithImpl<$Res>
    implements $InvoiceTaxSummaryEntityCopyWith<$Res> {
  _$InvoiceTaxSummaryEntityCopyWithImpl(this._self, this._then);

  final InvoiceTaxSummaryEntity _self;
  final $Res Function(InvoiceTaxSummaryEntity) _then;

  /// Create a copy of InvoiceTaxSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hsnCode = null,
    Object? gstRate = null,
    Object? taxableAmount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? igst = null,
    Object? totalTax = null,
  }) {
    return _then(_self.copyWith(
      hsnCode: null == hsnCode
          ? _self.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String,
      gstRate: null == gstRate
          ? _self.gstRate
          : gstRate // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _self.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _self.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      igst: null == igst
          ? _self.igst
          : igst // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _self.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceTaxSummaryEntity].
extension InvoiceTaxSummaryEntityPatterns on InvoiceTaxSummaryEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceTaxSummaryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceTaxSummaryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceTaxSummaryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String hsnCode, double gstRate, double taxableAmount,
            double cgst, double sgst, double igst, double totalTax)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryEntity() when $default != null:
        return $default(_that.hsnCode, _that.gstRate, _that.taxableAmount,
            _that.cgst, _that.sgst, _that.igst, _that.totalTax);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String hsnCode, double gstRate, double taxableAmount,
            double cgst, double sgst, double igst, double totalTax)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryEntity():
        return $default(_that.hsnCode, _that.gstRate, _that.taxableAmount,
            _that.cgst, _that.sgst, _that.igst, _that.totalTax);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String hsnCode, double gstRate, double taxableAmount,
            double cgst, double sgst, double igst, double totalTax)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryEntity() when $default != null:
        return $default(_that.hsnCode, _that.gstRate, _that.taxableAmount,
            _that.cgst, _that.sgst, _that.igst, _that.totalTax);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceTaxSummaryEntity implements InvoiceTaxSummaryEntity {
  const _InvoiceTaxSummaryEntity(
      {required this.hsnCode,
      required this.gstRate,
      required this.taxableAmount,
      this.cgst = 0.0,
      this.sgst = 0.0,
      this.igst = 0.0,
      required this.totalTax});

  @override
  final String hsnCode;
  @override
  final double gstRate;
  @override
  final double taxableAmount;
  @override
  @JsonKey()
  final double cgst;
  @override
  @JsonKey()
  final double sgst;
  @override
  @JsonKey()
  final double igst;
  @override
  final double totalTax;

  /// Create a copy of InvoiceTaxSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceTaxSummaryEntityCopyWith<_InvoiceTaxSummaryEntity> get copyWith =>
      __$InvoiceTaxSummaryEntityCopyWithImpl<_InvoiceTaxSummaryEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceTaxSummaryEntity &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hsnCode, gstRate, taxableAmount, cgst, sgst, igst, totalTax);

  @override
  String toString() {
    return 'InvoiceTaxSummaryEntity(hsnCode: $hsnCode, gstRate: $gstRate, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceTaxSummaryEntityCopyWith<$Res>
    implements $InvoiceTaxSummaryEntityCopyWith<$Res> {
  factory _$InvoiceTaxSummaryEntityCopyWith(_InvoiceTaxSummaryEntity value,
          $Res Function(_InvoiceTaxSummaryEntity) _then) =
      __$InvoiceTaxSummaryEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String hsnCode,
      double gstRate,
      double taxableAmount,
      double cgst,
      double sgst,
      double igst,
      double totalTax});
}

/// @nodoc
class __$InvoiceTaxSummaryEntityCopyWithImpl<$Res>
    implements _$InvoiceTaxSummaryEntityCopyWith<$Res> {
  __$InvoiceTaxSummaryEntityCopyWithImpl(this._self, this._then);

  final _InvoiceTaxSummaryEntity _self;
  final $Res Function(_InvoiceTaxSummaryEntity) _then;

  /// Create a copy of InvoiceTaxSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hsnCode = null,
    Object? gstRate = null,
    Object? taxableAmount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? igst = null,
    Object? totalTax = null,
  }) {
    return _then(_InvoiceTaxSummaryEntity(
      hsnCode: null == hsnCode
          ? _self.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String,
      gstRate: null == gstRate
          ? _self.gstRate
          : gstRate // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _self.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _self.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      igst: null == igst
          ? _self.igst
          : igst // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _self.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$InvoiceShippingEntity {
  String get method;
  String get methodName;
  double get shippingAmount;
  String get shippingZone;
  String get destinationPinCode;
  bool get isFreeShipping;

  /// Create a copy of InvoiceShippingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceShippingEntityCopyWith<InvoiceShippingEntity> get copyWith =>
      _$InvoiceShippingEntityCopyWithImpl<InvoiceShippingEntity>(
          this as InvoiceShippingEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceShippingEntity &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.methodName, methodName) ||
                other.methodName == methodName) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.shippingZone, shippingZone) ||
                other.shippingZone == shippingZone) &&
            (identical(other.destinationPinCode, destinationPinCode) ||
                other.destinationPinCode == destinationPinCode) &&
            (identical(other.isFreeShipping, isFreeShipping) ||
                other.isFreeShipping == isFreeShipping));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method, methodName,
      shippingAmount, shippingZone, destinationPinCode, isFreeShipping);

  @override
  String toString() {
    return 'InvoiceShippingEntity(method: $method, methodName: $methodName, shippingAmount: $shippingAmount, shippingZone: $shippingZone, destinationPinCode: $destinationPinCode, isFreeShipping: $isFreeShipping)';
  }
}

/// @nodoc
abstract mixin class $InvoiceShippingEntityCopyWith<$Res> {
  factory $InvoiceShippingEntityCopyWith(InvoiceShippingEntity value,
          $Res Function(InvoiceShippingEntity) _then) =
      _$InvoiceShippingEntityCopyWithImpl;
  @useResult
  $Res call(
      {String method,
      String methodName,
      double shippingAmount,
      String shippingZone,
      String destinationPinCode,
      bool isFreeShipping});
}

/// @nodoc
class _$InvoiceShippingEntityCopyWithImpl<$Res>
    implements $InvoiceShippingEntityCopyWith<$Res> {
  _$InvoiceShippingEntityCopyWithImpl(this._self, this._then);

  final InvoiceShippingEntity _self;
  final $Res Function(InvoiceShippingEntity) _then;

  /// Create a copy of InvoiceShippingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? methodName = null,
    Object? shippingAmount = null,
    Object? shippingZone = null,
    Object? destinationPinCode = null,
    Object? isFreeShipping = null,
  }) {
    return _then(_self.copyWith(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      methodName: null == methodName
          ? _self.methodName
          : methodName // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAmount: null == shippingAmount
          ? _self.shippingAmount
          : shippingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shippingZone: null == shippingZone
          ? _self.shippingZone
          : shippingZone // ignore: cast_nullable_to_non_nullable
              as String,
      destinationPinCode: null == destinationPinCode
          ? _self.destinationPinCode
          : destinationPinCode // ignore: cast_nullable_to_non_nullable
              as String,
      isFreeShipping: null == isFreeShipping
          ? _self.isFreeShipping
          : isFreeShipping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceShippingEntity].
extension InvoiceShippingEntityPatterns on InvoiceShippingEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceShippingEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceShippingEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceShippingEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String method,
            String methodName,
            double shippingAmount,
            String shippingZone,
            String destinationPinCode,
            bool isFreeShipping)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingEntity() when $default != null:
        return $default(_that.method, _that.methodName, _that.shippingAmount,
            _that.shippingZone, _that.destinationPinCode, _that.isFreeShipping);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String method, String methodName, double shippingAmount,
            String shippingZone, String destinationPinCode, bool isFreeShipping)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingEntity():
        return $default(_that.method, _that.methodName, _that.shippingAmount,
            _that.shippingZone, _that.destinationPinCode, _that.isFreeShipping);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String method,
            String methodName,
            double shippingAmount,
            String shippingZone,
            String destinationPinCode,
            bool isFreeShipping)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingEntity() when $default != null:
        return $default(_that.method, _that.methodName, _that.shippingAmount,
            _that.shippingZone, _that.destinationPinCode, _that.isFreeShipping);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceShippingEntity implements InvoiceShippingEntity {
  const _InvoiceShippingEntity(
      {required this.method,
      required this.methodName,
      required this.shippingAmount,
      this.shippingZone = 'NATIONAL',
      this.destinationPinCode = '',
      this.isFreeShipping = false});

  @override
  final String method;
  @override
  final String methodName;
  @override
  final double shippingAmount;
  @override
  @JsonKey()
  final String shippingZone;
  @override
  @JsonKey()
  final String destinationPinCode;
  @override
  @JsonKey()
  final bool isFreeShipping;

  /// Create a copy of InvoiceShippingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceShippingEntityCopyWith<_InvoiceShippingEntity> get copyWith =>
      __$InvoiceShippingEntityCopyWithImpl<_InvoiceShippingEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceShippingEntity &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.methodName, methodName) ||
                other.methodName == methodName) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.shippingZone, shippingZone) ||
                other.shippingZone == shippingZone) &&
            (identical(other.destinationPinCode, destinationPinCode) ||
                other.destinationPinCode == destinationPinCode) &&
            (identical(other.isFreeShipping, isFreeShipping) ||
                other.isFreeShipping == isFreeShipping));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method, methodName,
      shippingAmount, shippingZone, destinationPinCode, isFreeShipping);

  @override
  String toString() {
    return 'InvoiceShippingEntity(method: $method, methodName: $methodName, shippingAmount: $shippingAmount, shippingZone: $shippingZone, destinationPinCode: $destinationPinCode, isFreeShipping: $isFreeShipping)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceShippingEntityCopyWith<$Res>
    implements $InvoiceShippingEntityCopyWith<$Res> {
  factory _$InvoiceShippingEntityCopyWith(_InvoiceShippingEntity value,
          $Res Function(_InvoiceShippingEntity) _then) =
      __$InvoiceShippingEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String method,
      String methodName,
      double shippingAmount,
      String shippingZone,
      String destinationPinCode,
      bool isFreeShipping});
}

/// @nodoc
class __$InvoiceShippingEntityCopyWithImpl<$Res>
    implements _$InvoiceShippingEntityCopyWith<$Res> {
  __$InvoiceShippingEntityCopyWithImpl(this._self, this._then);

  final _InvoiceShippingEntity _self;
  final $Res Function(_InvoiceShippingEntity) _then;

  /// Create a copy of InvoiceShippingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = null,
    Object? methodName = null,
    Object? shippingAmount = null,
    Object? shippingZone = null,
    Object? destinationPinCode = null,
    Object? isFreeShipping = null,
  }) {
    return _then(_InvoiceShippingEntity(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      methodName: null == methodName
          ? _self.methodName
          : methodName // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAmount: null == shippingAmount
          ? _self.shippingAmount
          : shippingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shippingZone: null == shippingZone
          ? _self.shippingZone
          : shippingZone // ignore: cast_nullable_to_non_nullable
              as String,
      destinationPinCode: null == destinationPinCode
          ? _self.destinationPinCode
          : destinationPinCode // ignore: cast_nullable_to_non_nullable
              as String,
      isFreeShipping: null == isFreeShipping
          ? _self.isFreeShipping
          : isFreeShipping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$InvoiceCodEntity {
  bool get isCod;
  double get fee;

  /// Create a copy of InvoiceCodEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceCodEntityCopyWith<InvoiceCodEntity> get copyWith =>
      _$InvoiceCodEntityCopyWithImpl<InvoiceCodEntity>(
          this as InvoiceCodEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceCodEntity &&
            (identical(other.isCod, isCod) || other.isCod == isCod) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCod, fee);

  @override
  String toString() {
    return 'InvoiceCodEntity(isCod: $isCod, fee: $fee)';
  }
}

/// @nodoc
abstract mixin class $InvoiceCodEntityCopyWith<$Res> {
  factory $InvoiceCodEntityCopyWith(
          InvoiceCodEntity value, $Res Function(InvoiceCodEntity) _then) =
      _$InvoiceCodEntityCopyWithImpl;
  @useResult
  $Res call({bool isCod, double fee});
}

/// @nodoc
class _$InvoiceCodEntityCopyWithImpl<$Res>
    implements $InvoiceCodEntityCopyWith<$Res> {
  _$InvoiceCodEntityCopyWithImpl(this._self, this._then);

  final InvoiceCodEntity _self;
  final $Res Function(InvoiceCodEntity) _then;

  /// Create a copy of InvoiceCodEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCod = null,
    Object? fee = null,
  }) {
    return _then(_self.copyWith(
      isCod: null == isCod
          ? _self.isCod
          : isCod // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceCodEntity].
extension InvoiceCodEntityPatterns on InvoiceCodEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceCodEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceCodEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceCodEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isCod, double fee)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodEntity() when $default != null:
        return $default(_that.isCod, _that.fee);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isCod, double fee) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodEntity():
        return $default(_that.isCod, _that.fee);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isCod, double fee)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodEntity() when $default != null:
        return $default(_that.isCod, _that.fee);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceCodEntity implements InvoiceCodEntity {
  const _InvoiceCodEntity({this.isCod = false, this.fee = 0.0});

  @override
  @JsonKey()
  final bool isCod;
  @override
  @JsonKey()
  final double fee;

  /// Create a copy of InvoiceCodEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceCodEntityCopyWith<_InvoiceCodEntity> get copyWith =>
      __$InvoiceCodEntityCopyWithImpl<_InvoiceCodEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceCodEntity &&
            (identical(other.isCod, isCod) || other.isCod == isCod) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCod, fee);

  @override
  String toString() {
    return 'InvoiceCodEntity(isCod: $isCod, fee: $fee)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceCodEntityCopyWith<$Res>
    implements $InvoiceCodEntityCopyWith<$Res> {
  factory _$InvoiceCodEntityCopyWith(
          _InvoiceCodEntity value, $Res Function(_InvoiceCodEntity) _then) =
      __$InvoiceCodEntityCopyWithImpl;
  @override
  @useResult
  $Res call({bool isCod, double fee});
}

/// @nodoc
class __$InvoiceCodEntityCopyWithImpl<$Res>
    implements _$InvoiceCodEntityCopyWith<$Res> {
  __$InvoiceCodEntityCopyWithImpl(this._self, this._then);

  final _InvoiceCodEntity _self;
  final $Res Function(_InvoiceCodEntity) _then;

  /// Create a copy of InvoiceCodEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isCod = null,
    Object? fee = null,
  }) {
    return _then(_InvoiceCodEntity(
      isCod: null == isCod
          ? _self.isCod
          : isCod // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$InvoicePaymentEntity {
  String get method;
  String get status;
  String get transactionId;
  String get provider;

  /// Create a copy of InvoicePaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoicePaymentEntityCopyWith<InvoicePaymentEntity> get copyWith =>
      _$InvoicePaymentEntityCopyWithImpl<InvoicePaymentEntity>(
          this as InvoicePaymentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoicePaymentEntity &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, method, status, transactionId, provider);

  @override
  String toString() {
    return 'InvoicePaymentEntity(method: $method, status: $status, transactionId: $transactionId, provider: $provider)';
  }
}

/// @nodoc
abstract mixin class $InvoicePaymentEntityCopyWith<$Res> {
  factory $InvoicePaymentEntityCopyWith(InvoicePaymentEntity value,
          $Res Function(InvoicePaymentEntity) _then) =
      _$InvoicePaymentEntityCopyWithImpl;
  @useResult
  $Res call(
      {String method, String status, String transactionId, String provider});
}

/// @nodoc
class _$InvoicePaymentEntityCopyWithImpl<$Res>
    implements $InvoicePaymentEntityCopyWith<$Res> {
  _$InvoicePaymentEntityCopyWithImpl(this._self, this._then);

  final InvoicePaymentEntity _self;
  final $Res Function(InvoicePaymentEntity) _then;

  /// Create a copy of InvoicePaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? status = null,
    Object? transactionId = null,
    Object? provider = null,
  }) {
    return _then(_self.copyWith(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoicePaymentEntity].
extension InvoicePaymentEntityPatterns on InvoicePaymentEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoicePaymentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoicePaymentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoicePaymentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String method, String status, String transactionId,
            String provider)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentEntity() when $default != null:
        return $default(
            _that.method, _that.status, _that.transactionId, _that.provider);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String method, String status, String transactionId, String provider)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentEntity():
        return $default(
            _that.method, _that.status, _that.transactionId, _that.provider);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String method, String status, String transactionId,
            String provider)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentEntity() when $default != null:
        return $default(
            _that.method, _that.status, _that.transactionId, _that.provider);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoicePaymentEntity implements InvoicePaymentEntity {
  const _InvoicePaymentEntity(
      {required this.method,
      required this.status,
      this.transactionId = '',
      this.provider = ''});

  @override
  final String method;
  @override
  final String status;
  @override
  @JsonKey()
  final String transactionId;
  @override
  @JsonKey()
  final String provider;

  /// Create a copy of InvoicePaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoicePaymentEntityCopyWith<_InvoicePaymentEntity> get copyWith =>
      __$InvoicePaymentEntityCopyWithImpl<_InvoicePaymentEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoicePaymentEntity &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, method, status, transactionId, provider);

  @override
  String toString() {
    return 'InvoicePaymentEntity(method: $method, status: $status, transactionId: $transactionId, provider: $provider)';
  }
}

/// @nodoc
abstract mixin class _$InvoicePaymentEntityCopyWith<$Res>
    implements $InvoicePaymentEntityCopyWith<$Res> {
  factory _$InvoicePaymentEntityCopyWith(_InvoicePaymentEntity value,
          $Res Function(_InvoicePaymentEntity) _then) =
      __$InvoicePaymentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String method, String status, String transactionId, String provider});
}

/// @nodoc
class __$InvoicePaymentEntityCopyWithImpl<$Res>
    implements _$InvoicePaymentEntityCopyWith<$Res> {
  __$InvoicePaymentEntityCopyWithImpl(this._self, this._then);

  final _InvoicePaymentEntity _self;
  final $Res Function(_InvoicePaymentEntity) _then;

  /// Create a copy of InvoicePaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = null,
    Object? status = null,
    Object? transactionId = null,
    Object? provider = null,
  }) {
    return _then(_InvoicePaymentEntity(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InvoiceTotalsEntity {
  double get subtotal;
  double get discount;
  double get taxableAmount;
  double get cgst;
  double get sgst;
  double get igst;
  double get totalTax;
  double get shippingFee;
  double get codFee;
  double get grandTotal;
  String get currency;
  String get currencySymbol;
  String get amountInWords;

  /// Create a copy of InvoiceTotalsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceTotalsEntityCopyWith<InvoiceTotalsEntity> get copyWith =>
      _$InvoiceTotalsEntityCopyWithImpl<InvoiceTotalsEntity>(
          this as InvoiceTotalsEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceTotalsEntity &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.codFee, codFee) || other.codFee == codFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.amountInWords, amountInWords) ||
                other.amountInWords == amountInWords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      subtotal,
      discount,
      taxableAmount,
      cgst,
      sgst,
      igst,
      totalTax,
      shippingFee,
      codFee,
      grandTotal,
      currency,
      currencySymbol,
      amountInWords);

  @override
  String toString() {
    return 'InvoiceTotalsEntity(subtotal: $subtotal, discount: $discount, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax, shippingFee: $shippingFee, codFee: $codFee, grandTotal: $grandTotal, currency: $currency, currencySymbol: $currencySymbol, amountInWords: $amountInWords)';
  }
}

/// @nodoc
abstract mixin class $InvoiceTotalsEntityCopyWith<$Res> {
  factory $InvoiceTotalsEntityCopyWith(
          InvoiceTotalsEntity value, $Res Function(InvoiceTotalsEntity) _then) =
      _$InvoiceTotalsEntityCopyWithImpl;
  @useResult
  $Res call(
      {double subtotal,
      double discount,
      double taxableAmount,
      double cgst,
      double sgst,
      double igst,
      double totalTax,
      double shippingFee,
      double codFee,
      double grandTotal,
      String currency,
      String currencySymbol,
      String amountInWords});
}

/// @nodoc
class _$InvoiceTotalsEntityCopyWithImpl<$Res>
    implements $InvoiceTotalsEntityCopyWith<$Res> {
  _$InvoiceTotalsEntityCopyWithImpl(this._self, this._then);

  final InvoiceTotalsEntity _self;
  final $Res Function(InvoiceTotalsEntity) _then;

  /// Create a copy of InvoiceTotalsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? discount = null,
    Object? taxableAmount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? igst = null,
    Object? totalTax = null,
    Object? shippingFee = null,
    Object? codFee = null,
    Object? grandTotal = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? amountInWords = null,
  }) {
    return _then(_self.copyWith(
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _self.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _self.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      igst: null == igst
          ? _self.igst
          : igst // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _self.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as double,
      codFee: null == codFee
          ? _self.codFee
          : codFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      amountInWords: null == amountInWords
          ? _self.amountInWords
          : amountInWords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceTotalsEntity].
extension InvoiceTotalsEntityPatterns on InvoiceTotalsEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceTotalsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceTotalsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceTotalsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            double subtotal,
            double discount,
            double taxableAmount,
            double cgst,
            double sgst,
            double igst,
            double totalTax,
            double shippingFee,
            double codFee,
            double grandTotal,
            String currency,
            String currencySymbol,
            String amountInWords)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsEntity() when $default != null:
        return $default(
            _that.subtotal,
            _that.discount,
            _that.taxableAmount,
            _that.cgst,
            _that.sgst,
            _that.igst,
            _that.totalTax,
            _that.shippingFee,
            _that.codFee,
            _that.grandTotal,
            _that.currency,
            _that.currencySymbol,
            _that.amountInWords);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            double subtotal,
            double discount,
            double taxableAmount,
            double cgst,
            double sgst,
            double igst,
            double totalTax,
            double shippingFee,
            double codFee,
            double grandTotal,
            String currency,
            String currencySymbol,
            String amountInWords)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsEntity():
        return $default(
            _that.subtotal,
            _that.discount,
            _that.taxableAmount,
            _that.cgst,
            _that.sgst,
            _that.igst,
            _that.totalTax,
            _that.shippingFee,
            _that.codFee,
            _that.grandTotal,
            _that.currency,
            _that.currencySymbol,
            _that.amountInWords);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            double subtotal,
            double discount,
            double taxableAmount,
            double cgst,
            double sgst,
            double igst,
            double totalTax,
            double shippingFee,
            double codFee,
            double grandTotal,
            String currency,
            String currencySymbol,
            String amountInWords)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsEntity() when $default != null:
        return $default(
            _that.subtotal,
            _that.discount,
            _that.taxableAmount,
            _that.cgst,
            _that.sgst,
            _that.igst,
            _that.totalTax,
            _that.shippingFee,
            _that.codFee,
            _that.grandTotal,
            _that.currency,
            _that.currencySymbol,
            _that.amountInWords);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceTotalsEntity implements InvoiceTotalsEntity {
  const _InvoiceTotalsEntity(
      {required this.subtotal,
      this.discount = 0.0,
      required this.taxableAmount,
      this.cgst = 0.0,
      this.sgst = 0.0,
      this.igst = 0.0,
      required this.totalTax,
      this.shippingFee = 0.0,
      this.codFee = 0.0,
      required this.grandTotal,
      this.currency = 'INR',
      this.currencySymbol = '₹',
      this.amountInWords = ''});

  @override
  final double subtotal;
  @override
  @JsonKey()
  final double discount;
  @override
  final double taxableAmount;
  @override
  @JsonKey()
  final double cgst;
  @override
  @JsonKey()
  final double sgst;
  @override
  @JsonKey()
  final double igst;
  @override
  final double totalTax;
  @override
  @JsonKey()
  final double shippingFee;
  @override
  @JsonKey()
  final double codFee;
  @override
  final double grandTotal;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String currencySymbol;
  @override
  @JsonKey()
  final String amountInWords;

  /// Create a copy of InvoiceTotalsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceTotalsEntityCopyWith<_InvoiceTotalsEntity> get copyWith =>
      __$InvoiceTotalsEntityCopyWithImpl<_InvoiceTotalsEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceTotalsEntity &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.codFee, codFee) || other.codFee == codFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.amountInWords, amountInWords) ||
                other.amountInWords == amountInWords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      subtotal,
      discount,
      taxableAmount,
      cgst,
      sgst,
      igst,
      totalTax,
      shippingFee,
      codFee,
      grandTotal,
      currency,
      currencySymbol,
      amountInWords);

  @override
  String toString() {
    return 'InvoiceTotalsEntity(subtotal: $subtotal, discount: $discount, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax, shippingFee: $shippingFee, codFee: $codFee, grandTotal: $grandTotal, currency: $currency, currencySymbol: $currencySymbol, amountInWords: $amountInWords)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceTotalsEntityCopyWith<$Res>
    implements $InvoiceTotalsEntityCopyWith<$Res> {
  factory _$InvoiceTotalsEntityCopyWith(_InvoiceTotalsEntity value,
          $Res Function(_InvoiceTotalsEntity) _then) =
      __$InvoiceTotalsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double subtotal,
      double discount,
      double taxableAmount,
      double cgst,
      double sgst,
      double igst,
      double totalTax,
      double shippingFee,
      double codFee,
      double grandTotal,
      String currency,
      String currencySymbol,
      String amountInWords});
}

/// @nodoc
class __$InvoiceTotalsEntityCopyWithImpl<$Res>
    implements _$InvoiceTotalsEntityCopyWith<$Res> {
  __$InvoiceTotalsEntityCopyWithImpl(this._self, this._then);

  final _InvoiceTotalsEntity _self;
  final $Res Function(_InvoiceTotalsEntity) _then;

  /// Create a copy of InvoiceTotalsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subtotal = null,
    Object? discount = null,
    Object? taxableAmount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? igst = null,
    Object? totalTax = null,
    Object? shippingFee = null,
    Object? codFee = null,
    Object? grandTotal = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? amountInWords = null,
  }) {
    return _then(_InvoiceTotalsEntity(
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _self.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _self.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      igst: null == igst
          ? _self.igst
          : igst // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _self.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as double,
      codFee: null == codFee
          ? _self.codFee
          : codFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      amountInWords: null == amountInWords
          ? _self.amountInWords
          : amountInWords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InvoiceEntity {
  String get invoiceNumber;
  DateTime get invoiceDate;
  String get invoiceStatus;
  String get orderId;
  String get orderNumber;
  DateTime get orderDate;
  InvoiceSellerEntity get seller;
  InvoiceAddressEntity get billingAddress;
  InvoiceAddressEntity get shippingAddress;
  String get customerGstin;
  bool get isInterState;
  List<InvoiceItemEntity> get items;
  List<InvoiceTaxSummaryEntity> get taxSummary;
  InvoiceShippingEntity get shipping;
  InvoiceCodEntity get cod;
  InvoicePaymentEntity get payment;
  InvoiceTotalsEntity get totals;

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceEntityCopyWith<InvoiceEntity> get copyWith =>
      _$InvoiceEntityCopyWithImpl<InvoiceEntity>(
          this as InvoiceEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceEntity &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.invoiceStatus, invoiceStatus) ||
                other.invoiceStatus == invoiceStatus) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.customerGstin, customerGstin) ||
                other.customerGstin == customerGstin) &&
            (identical(other.isInterState, isInterState) ||
                other.isInterState == isInterState) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.taxSummary, taxSummary) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNumber,
      invoiceDate,
      invoiceStatus,
      orderId,
      orderNumber,
      orderDate,
      seller,
      billingAddress,
      shippingAddress,
      customerGstin,
      isInterState,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(taxSummary),
      shipping,
      cod,
      payment,
      totals);

  @override
  String toString() {
    return 'InvoiceEntity(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceStatus: $invoiceStatus, orderId: $orderId, orderNumber: $orderNumber, orderDate: $orderDate, seller: $seller, billingAddress: $billingAddress, shippingAddress: $shippingAddress, customerGstin: $customerGstin, isInterState: $isInterState, items: $items, taxSummary: $taxSummary, shipping: $shipping, cod: $cod, payment: $payment, totals: $totals)';
  }
}

/// @nodoc
abstract mixin class $InvoiceEntityCopyWith<$Res> {
  factory $InvoiceEntityCopyWith(
          InvoiceEntity value, $Res Function(InvoiceEntity) _then) =
      _$InvoiceEntityCopyWithImpl;
  @useResult
  $Res call(
      {String invoiceNumber,
      DateTime invoiceDate,
      String invoiceStatus,
      String orderId,
      String orderNumber,
      DateTime orderDate,
      InvoiceSellerEntity seller,
      InvoiceAddressEntity billingAddress,
      InvoiceAddressEntity shippingAddress,
      String customerGstin,
      bool isInterState,
      List<InvoiceItemEntity> items,
      List<InvoiceTaxSummaryEntity> taxSummary,
      InvoiceShippingEntity shipping,
      InvoiceCodEntity cod,
      InvoicePaymentEntity payment,
      InvoiceTotalsEntity totals});

  $InvoiceSellerEntityCopyWith<$Res> get seller;
  $InvoiceAddressEntityCopyWith<$Res> get billingAddress;
  $InvoiceAddressEntityCopyWith<$Res> get shippingAddress;
  $InvoiceShippingEntityCopyWith<$Res> get shipping;
  $InvoiceCodEntityCopyWith<$Res> get cod;
  $InvoicePaymentEntityCopyWith<$Res> get payment;
  $InvoiceTotalsEntityCopyWith<$Res> get totals;
}

/// @nodoc
class _$InvoiceEntityCopyWithImpl<$Res>
    implements $InvoiceEntityCopyWith<$Res> {
  _$InvoiceEntityCopyWithImpl(this._self, this._then);

  final InvoiceEntity _self;
  final $Res Function(InvoiceEntity) _then;

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoiceStatus = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? seller = null,
    Object? billingAddress = null,
    Object? shippingAddress = null,
    Object? customerGstin = null,
    Object? isInterState = null,
    Object? items = null,
    Object? taxSummary = null,
    Object? shipping = null,
    Object? cod = null,
    Object? payment = null,
    Object? totals = null,
  }) {
    return _then(_self.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _self.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceStatus: null == invoiceStatus
          ? _self.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seller: null == seller
          ? _self.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as InvoiceSellerEntity,
      billingAddress: null == billingAddress
          ? _self.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressEntity,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressEntity,
      customerGstin: null == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String,
      isInterState: null == isInterState
          ? _self.isInterState
          : isInterState // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItemEntity>,
      taxSummary: null == taxSummary
          ? _self.taxSummary
          : taxSummary // ignore: cast_nullable_to_non_nullable
              as List<InvoiceTaxSummaryEntity>,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as InvoiceShippingEntity,
      cod: null == cod
          ? _self.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as InvoiceCodEntity,
      payment: null == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as InvoicePaymentEntity,
      totals: null == totals
          ? _self.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as InvoiceTotalsEntity,
    ));
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceSellerEntityCopyWith<$Res> get seller {
    return $InvoiceSellerEntityCopyWith<$Res>(_self.seller, (value) {
      return _then(_self.copyWith(seller: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressEntityCopyWith<$Res> get billingAddress {
    return $InvoiceAddressEntityCopyWith<$Res>(_self.billingAddress, (value) {
      return _then(_self.copyWith(billingAddress: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressEntityCopyWith<$Res> get shippingAddress {
    return $InvoiceAddressEntityCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceShippingEntityCopyWith<$Res> get shipping {
    return $InvoiceShippingEntityCopyWith<$Res>(_self.shipping, (value) {
      return _then(_self.copyWith(shipping: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceCodEntityCopyWith<$Res> get cod {
    return $InvoiceCodEntityCopyWith<$Res>(_self.cod, (value) {
      return _then(_self.copyWith(cod: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoicePaymentEntityCopyWith<$Res> get payment {
    return $InvoicePaymentEntityCopyWith<$Res>(_self.payment, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceTotalsEntityCopyWith<$Res> get totals {
    return $InvoiceTotalsEntityCopyWith<$Res>(_self.totals, (value) {
      return _then(_self.copyWith(totals: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InvoiceEntity].
extension InvoiceEntityPatterns on InvoiceEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InvoiceEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InvoiceEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InvoiceEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String invoiceNumber,
            DateTime invoiceDate,
            String invoiceStatus,
            String orderId,
            String orderNumber,
            DateTime orderDate,
            InvoiceSellerEntity seller,
            InvoiceAddressEntity billingAddress,
            InvoiceAddressEntity shippingAddress,
            String customerGstin,
            bool isInterState,
            List<InvoiceItemEntity> items,
            List<InvoiceTaxSummaryEntity> taxSummary,
            InvoiceShippingEntity shipping,
            InvoiceCodEntity cod,
            InvoicePaymentEntity payment,
            InvoiceTotalsEntity totals)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceEntity() when $default != null:
        return $default(
            _that.invoiceNumber,
            _that.invoiceDate,
            _that.invoiceStatus,
            _that.orderId,
            _that.orderNumber,
            _that.orderDate,
            _that.seller,
            _that.billingAddress,
            _that.shippingAddress,
            _that.customerGstin,
            _that.isInterState,
            _that.items,
            _that.taxSummary,
            _that.shipping,
            _that.cod,
            _that.payment,
            _that.totals);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String invoiceNumber,
            DateTime invoiceDate,
            String invoiceStatus,
            String orderId,
            String orderNumber,
            DateTime orderDate,
            InvoiceSellerEntity seller,
            InvoiceAddressEntity billingAddress,
            InvoiceAddressEntity shippingAddress,
            String customerGstin,
            bool isInterState,
            List<InvoiceItemEntity> items,
            List<InvoiceTaxSummaryEntity> taxSummary,
            InvoiceShippingEntity shipping,
            InvoiceCodEntity cod,
            InvoicePaymentEntity payment,
            InvoiceTotalsEntity totals)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceEntity():
        return $default(
            _that.invoiceNumber,
            _that.invoiceDate,
            _that.invoiceStatus,
            _that.orderId,
            _that.orderNumber,
            _that.orderDate,
            _that.seller,
            _that.billingAddress,
            _that.shippingAddress,
            _that.customerGstin,
            _that.isInterState,
            _that.items,
            _that.taxSummary,
            _that.shipping,
            _that.cod,
            _that.payment,
            _that.totals);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String invoiceNumber,
            DateTime invoiceDate,
            String invoiceStatus,
            String orderId,
            String orderNumber,
            DateTime orderDate,
            InvoiceSellerEntity seller,
            InvoiceAddressEntity billingAddress,
            InvoiceAddressEntity shippingAddress,
            String customerGstin,
            bool isInterState,
            List<InvoiceItemEntity> items,
            List<InvoiceTaxSummaryEntity> taxSummary,
            InvoiceShippingEntity shipping,
            InvoiceCodEntity cod,
            InvoicePaymentEntity payment,
            InvoiceTotalsEntity totals)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceEntity() when $default != null:
        return $default(
            _that.invoiceNumber,
            _that.invoiceDate,
            _that.invoiceStatus,
            _that.orderId,
            _that.orderNumber,
            _that.orderDate,
            _that.seller,
            _that.billingAddress,
            _that.shippingAddress,
            _that.customerGstin,
            _that.isInterState,
            _that.items,
            _that.taxSummary,
            _that.shipping,
            _that.cod,
            _that.payment,
            _that.totals);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceEntity extends InvoiceEntity {
  const _InvoiceEntity(
      {required this.invoiceNumber,
      required this.invoiceDate,
      required this.invoiceStatus,
      required this.orderId,
      required this.orderNumber,
      required this.orderDate,
      required this.seller,
      required this.billingAddress,
      required this.shippingAddress,
      this.customerGstin = '',
      this.isInterState = false,
      final List<InvoiceItemEntity> items = const [],
      final List<InvoiceTaxSummaryEntity> taxSummary = const [],
      required this.shipping,
      required this.cod,
      required this.payment,
      required this.totals})
      : _items = items,
        _taxSummary = taxSummary,
        super._();

  @override
  final String invoiceNumber;
  @override
  final DateTime invoiceDate;
  @override
  final String invoiceStatus;
  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final DateTime orderDate;
  @override
  final InvoiceSellerEntity seller;
  @override
  final InvoiceAddressEntity billingAddress;
  @override
  final InvoiceAddressEntity shippingAddress;
  @override
  @JsonKey()
  final String customerGstin;
  @override
  @JsonKey()
  final bool isInterState;
  final List<InvoiceItemEntity> _items;
  @override
  @JsonKey()
  List<InvoiceItemEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<InvoiceTaxSummaryEntity> _taxSummary;
  @override
  @JsonKey()
  List<InvoiceTaxSummaryEntity> get taxSummary {
    if (_taxSummary is EqualUnmodifiableListView) return _taxSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxSummary);
  }

  @override
  final InvoiceShippingEntity shipping;
  @override
  final InvoiceCodEntity cod;
  @override
  final InvoicePaymentEntity payment;
  @override
  final InvoiceTotalsEntity totals;

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceEntityCopyWith<_InvoiceEntity> get copyWith =>
      __$InvoiceEntityCopyWithImpl<_InvoiceEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceEntity &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.invoiceStatus, invoiceStatus) ||
                other.invoiceStatus == invoiceStatus) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.customerGstin, customerGstin) ||
                other.customerGstin == customerGstin) &&
            (identical(other.isInterState, isInterState) ||
                other.isInterState == isInterState) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._taxSummary, _taxSummary) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNumber,
      invoiceDate,
      invoiceStatus,
      orderId,
      orderNumber,
      orderDate,
      seller,
      billingAddress,
      shippingAddress,
      customerGstin,
      isInterState,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_taxSummary),
      shipping,
      cod,
      payment,
      totals);

  @override
  String toString() {
    return 'InvoiceEntity(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceStatus: $invoiceStatus, orderId: $orderId, orderNumber: $orderNumber, orderDate: $orderDate, seller: $seller, billingAddress: $billingAddress, shippingAddress: $shippingAddress, customerGstin: $customerGstin, isInterState: $isInterState, items: $items, taxSummary: $taxSummary, shipping: $shipping, cod: $cod, payment: $payment, totals: $totals)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceEntityCopyWith<$Res>
    implements $InvoiceEntityCopyWith<$Res> {
  factory _$InvoiceEntityCopyWith(
          _InvoiceEntity value, $Res Function(_InvoiceEntity) _then) =
      __$InvoiceEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String invoiceNumber,
      DateTime invoiceDate,
      String invoiceStatus,
      String orderId,
      String orderNumber,
      DateTime orderDate,
      InvoiceSellerEntity seller,
      InvoiceAddressEntity billingAddress,
      InvoiceAddressEntity shippingAddress,
      String customerGstin,
      bool isInterState,
      List<InvoiceItemEntity> items,
      List<InvoiceTaxSummaryEntity> taxSummary,
      InvoiceShippingEntity shipping,
      InvoiceCodEntity cod,
      InvoicePaymentEntity payment,
      InvoiceTotalsEntity totals});

  @override
  $InvoiceSellerEntityCopyWith<$Res> get seller;
  @override
  $InvoiceAddressEntityCopyWith<$Res> get billingAddress;
  @override
  $InvoiceAddressEntityCopyWith<$Res> get shippingAddress;
  @override
  $InvoiceShippingEntityCopyWith<$Res> get shipping;
  @override
  $InvoiceCodEntityCopyWith<$Res> get cod;
  @override
  $InvoicePaymentEntityCopyWith<$Res> get payment;
  @override
  $InvoiceTotalsEntityCopyWith<$Res> get totals;
}

/// @nodoc
class __$InvoiceEntityCopyWithImpl<$Res>
    implements _$InvoiceEntityCopyWith<$Res> {
  __$InvoiceEntityCopyWithImpl(this._self, this._then);

  final _InvoiceEntity _self;
  final $Res Function(_InvoiceEntity) _then;

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoiceStatus = null,
    Object? orderId = null,
    Object? orderNumber = null,
    Object? orderDate = null,
    Object? seller = null,
    Object? billingAddress = null,
    Object? shippingAddress = null,
    Object? customerGstin = null,
    Object? isInterState = null,
    Object? items = null,
    Object? taxSummary = null,
    Object? shipping = null,
    Object? cod = null,
    Object? payment = null,
    Object? totals = null,
  }) {
    return _then(_InvoiceEntity(
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _self.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceStatus: null == invoiceStatus
          ? _self.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seller: null == seller
          ? _self.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as InvoiceSellerEntity,
      billingAddress: null == billingAddress
          ? _self.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressEntity,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressEntity,
      customerGstin: null == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String,
      isInterState: null == isInterState
          ? _self.isInterState
          : isInterState // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItemEntity>,
      taxSummary: null == taxSummary
          ? _self._taxSummary
          : taxSummary // ignore: cast_nullable_to_non_nullable
              as List<InvoiceTaxSummaryEntity>,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as InvoiceShippingEntity,
      cod: null == cod
          ? _self.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as InvoiceCodEntity,
      payment: null == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as InvoicePaymentEntity,
      totals: null == totals
          ? _self.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as InvoiceTotalsEntity,
    ));
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceSellerEntityCopyWith<$Res> get seller {
    return $InvoiceSellerEntityCopyWith<$Res>(_self.seller, (value) {
      return _then(_self.copyWith(seller: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressEntityCopyWith<$Res> get billingAddress {
    return $InvoiceAddressEntityCopyWith<$Res>(_self.billingAddress, (value) {
      return _then(_self.copyWith(billingAddress: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressEntityCopyWith<$Res> get shippingAddress {
    return $InvoiceAddressEntityCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceShippingEntityCopyWith<$Res> get shipping {
    return $InvoiceShippingEntityCopyWith<$Res>(_self.shipping, (value) {
      return _then(_self.copyWith(shipping: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceCodEntityCopyWith<$Res> get cod {
    return $InvoiceCodEntityCopyWith<$Res>(_self.cod, (value) {
      return _then(_self.copyWith(cod: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoicePaymentEntityCopyWith<$Res> get payment {
    return $InvoicePaymentEntityCopyWith<$Res>(_self.payment, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }

  /// Create a copy of InvoiceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceTotalsEntityCopyWith<$Res> get totals {
    return $InvoiceTotalsEntityCopyWith<$Res>(_self.totals, (value) {
      return _then(_self.copyWith(totals: value));
    });
  }
}

// dart format on
