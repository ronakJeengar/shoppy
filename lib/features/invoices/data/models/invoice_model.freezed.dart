// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceSellerModel {
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

  /// Create a copy of InvoiceSellerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceSellerModelCopyWith<InvoiceSellerModel> get copyWith =>
      _$InvoiceSellerModelCopyWithImpl<InvoiceSellerModel>(
          this as InvoiceSellerModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceSellerModel &&
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
    return 'InvoiceSellerModel(legalName: $legalName, tradeName: $tradeName, address: $address, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin, pan: $pan, phone: $phone, email: $email, cin: $cin)';
  }
}

/// @nodoc
abstract mixin class $InvoiceSellerModelCopyWith<$Res> {
  factory $InvoiceSellerModelCopyWith(
          InvoiceSellerModel value, $Res Function(InvoiceSellerModel) _then) =
      _$InvoiceSellerModelCopyWithImpl;
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
class _$InvoiceSellerModelCopyWithImpl<$Res>
    implements $InvoiceSellerModelCopyWith<$Res> {
  _$InvoiceSellerModelCopyWithImpl(this._self, this._then);

  final InvoiceSellerModel _self;
  final $Res Function(InvoiceSellerModel) _then;

  /// Create a copy of InvoiceSellerModel
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

/// Adds pattern-matching-related methods to [InvoiceSellerModel].
extension InvoiceSellerModelPatterns on InvoiceSellerModel {
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
    TResult Function(_InvoiceSellerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerModel() when $default != null:
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
    TResult Function(_InvoiceSellerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerModel():
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
    TResult? Function(_InvoiceSellerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceSellerModel() when $default != null:
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
      case _InvoiceSellerModel() when $default != null:
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
      case _InvoiceSellerModel():
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
      case _InvoiceSellerModel() when $default != null:
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

class _InvoiceSellerModel implements InvoiceSellerModel {
  const _InvoiceSellerModel(
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

  /// Create a copy of InvoiceSellerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceSellerModelCopyWith<_InvoiceSellerModel> get copyWith =>
      __$InvoiceSellerModelCopyWithImpl<_InvoiceSellerModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceSellerModel &&
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
    return 'InvoiceSellerModel(legalName: $legalName, tradeName: $tradeName, address: $address, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin, pan: $pan, phone: $phone, email: $email, cin: $cin)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceSellerModelCopyWith<$Res>
    implements $InvoiceSellerModelCopyWith<$Res> {
  factory _$InvoiceSellerModelCopyWith(
          _InvoiceSellerModel value, $Res Function(_InvoiceSellerModel) _then) =
      __$InvoiceSellerModelCopyWithImpl;
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
class __$InvoiceSellerModelCopyWithImpl<$Res>
    implements _$InvoiceSellerModelCopyWith<$Res> {
  __$InvoiceSellerModelCopyWithImpl(this._self, this._then);

  final _InvoiceSellerModel _self;
  final $Res Function(_InvoiceSellerModel) _then;

  /// Create a copy of InvoiceSellerModel
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
    return _then(_InvoiceSellerModel(
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
mixin _$InvoiceAddressModel {
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

  /// Create a copy of InvoiceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceAddressModelCopyWith<InvoiceAddressModel> get copyWith =>
      _$InvoiceAddressModelCopyWithImpl<InvoiceAddressModel>(
          this as InvoiceAddressModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceAddressModel &&
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
    return 'InvoiceAddressModel(fullName: $fullName, phone: $phone, addressLine1: $addressLine1, addressLine2: $addressLine2, landmark: $landmark, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin)';
  }
}

/// @nodoc
abstract mixin class $InvoiceAddressModelCopyWith<$Res> {
  factory $InvoiceAddressModelCopyWith(
          InvoiceAddressModel value, $Res Function(InvoiceAddressModel) _then) =
      _$InvoiceAddressModelCopyWithImpl;
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
class _$InvoiceAddressModelCopyWithImpl<$Res>
    implements $InvoiceAddressModelCopyWith<$Res> {
  _$InvoiceAddressModelCopyWithImpl(this._self, this._then);

  final InvoiceAddressModel _self;
  final $Res Function(InvoiceAddressModel) _then;

  /// Create a copy of InvoiceAddressModel
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

/// Adds pattern-matching-related methods to [InvoiceAddressModel].
extension InvoiceAddressModelPatterns on InvoiceAddressModel {
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
    TResult Function(_InvoiceAddressModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressModel() when $default != null:
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
    TResult Function(_InvoiceAddressModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressModel():
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
    TResult? Function(_InvoiceAddressModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceAddressModel() when $default != null:
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
      case _InvoiceAddressModel() when $default != null:
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
      case _InvoiceAddressModel():
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
      case _InvoiceAddressModel() when $default != null:
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

class _InvoiceAddressModel implements InvoiceAddressModel {
  const _InvoiceAddressModel(
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

  /// Create a copy of InvoiceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceAddressModelCopyWith<_InvoiceAddressModel> get copyWith =>
      __$InvoiceAddressModelCopyWithImpl<_InvoiceAddressModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceAddressModel &&
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
    return 'InvoiceAddressModel(fullName: $fullName, phone: $phone, addressLine1: $addressLine1, addressLine2: $addressLine2, landmark: $landmark, city: $city, district: $district, state: $state, stateCode: $stateCode, pinCode: $pinCode, country: $country, gstin: $gstin)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceAddressModelCopyWith<$Res>
    implements $InvoiceAddressModelCopyWith<$Res> {
  factory _$InvoiceAddressModelCopyWith(_InvoiceAddressModel value,
          $Res Function(_InvoiceAddressModel) _then) =
      __$InvoiceAddressModelCopyWithImpl;
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
class __$InvoiceAddressModelCopyWithImpl<$Res>
    implements _$InvoiceAddressModelCopyWith<$Res> {
  __$InvoiceAddressModelCopyWithImpl(this._self, this._then);

  final _InvoiceAddressModel _self;
  final $Res Function(_InvoiceAddressModel) _then;

  /// Create a copy of InvoiceAddressModel
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
    return _then(_InvoiceAddressModel(
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
mixin _$InvoiceItemModel {
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

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceItemModelCopyWith<InvoiceItemModel> get copyWith =>
      _$InvoiceItemModelCopyWithImpl<InvoiceItemModel>(
          this as InvoiceItemModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceItemModel &&
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
    return 'InvoiceItemModel(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, sku: $sku, hsnCode: $hsnCode, quantity: $quantity, mrp: $mrp, unitPrice: $unitPrice, discount: $discount, effectiveAmount: $effectiveAmount, taxableAmount: $taxableAmount, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, cgstRate: $cgstRate, cgst: $cgst, sgstRate: $sgstRate, sgst: $sgst, igstRate: $igstRate, igst: $igst, totalTax: $totalTax, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class $InvoiceItemModelCopyWith<$Res> {
  factory $InvoiceItemModelCopyWith(
          InvoiceItemModel value, $Res Function(InvoiceItemModel) _then) =
      _$InvoiceItemModelCopyWithImpl;
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
class _$InvoiceItemModelCopyWithImpl<$Res>
    implements $InvoiceItemModelCopyWith<$Res> {
  _$InvoiceItemModelCopyWithImpl(this._self, this._then);

  final InvoiceItemModel _self;
  final $Res Function(InvoiceItemModel) _then;

  /// Create a copy of InvoiceItemModel
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

/// Adds pattern-matching-related methods to [InvoiceItemModel].
extension InvoiceItemModelPatterns on InvoiceItemModel {
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
    TResult Function(_InvoiceItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel() when $default != null:
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
    TResult Function(_InvoiceItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel():
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
    TResult? Function(_InvoiceItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceItemModel() when $default != null:
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
      case _InvoiceItemModel() when $default != null:
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
      case _InvoiceItemModel():
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
      case _InvoiceItemModel() when $default != null:
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

class _InvoiceItemModel implements InvoiceItemModel {
  const _InvoiceItemModel(
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

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceItemModelCopyWith<_InvoiceItemModel> get copyWith =>
      __$InvoiceItemModelCopyWithImpl<_InvoiceItemModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceItemModel &&
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
    return 'InvoiceItemModel(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, sku: $sku, hsnCode: $hsnCode, quantity: $quantity, mrp: $mrp, unitPrice: $unitPrice, discount: $discount, effectiveAmount: $effectiveAmount, taxableAmount: $taxableAmount, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, cgstRate: $cgstRate, cgst: $cgst, sgstRate: $sgstRate, sgst: $sgst, igstRate: $igstRate, igst: $igst, totalTax: $totalTax, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceItemModelCopyWith<$Res>
    implements $InvoiceItemModelCopyWith<$Res> {
  factory _$InvoiceItemModelCopyWith(
          _InvoiceItemModel value, $Res Function(_InvoiceItemModel) _then) =
      __$InvoiceItemModelCopyWithImpl;
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
class __$InvoiceItemModelCopyWithImpl<$Res>
    implements _$InvoiceItemModelCopyWith<$Res> {
  __$InvoiceItemModelCopyWithImpl(this._self, this._then);

  final _InvoiceItemModel _self;
  final $Res Function(_InvoiceItemModel) _then;

  /// Create a copy of InvoiceItemModel
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
    return _then(_InvoiceItemModel(
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
mixin _$InvoiceTaxSummaryModel {
  String get hsnCode;
  double get gstRate;
  double get taxableAmount;
  double get cgst;
  double get sgst;
  double get igst;
  double get totalTax;

  /// Create a copy of InvoiceTaxSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceTaxSummaryModelCopyWith<InvoiceTaxSummaryModel> get copyWith =>
      _$InvoiceTaxSummaryModelCopyWithImpl<InvoiceTaxSummaryModel>(
          this as InvoiceTaxSummaryModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceTaxSummaryModel &&
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
    return 'InvoiceTaxSummaryModel(hsnCode: $hsnCode, gstRate: $gstRate, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax)';
  }
}

/// @nodoc
abstract mixin class $InvoiceTaxSummaryModelCopyWith<$Res> {
  factory $InvoiceTaxSummaryModelCopyWith(InvoiceTaxSummaryModel value,
          $Res Function(InvoiceTaxSummaryModel) _then) =
      _$InvoiceTaxSummaryModelCopyWithImpl;
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
class _$InvoiceTaxSummaryModelCopyWithImpl<$Res>
    implements $InvoiceTaxSummaryModelCopyWith<$Res> {
  _$InvoiceTaxSummaryModelCopyWithImpl(this._self, this._then);

  final InvoiceTaxSummaryModel _self;
  final $Res Function(InvoiceTaxSummaryModel) _then;

  /// Create a copy of InvoiceTaxSummaryModel
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

/// Adds pattern-matching-related methods to [InvoiceTaxSummaryModel].
extension InvoiceTaxSummaryModelPatterns on InvoiceTaxSummaryModel {
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
    TResult Function(_InvoiceTaxSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryModel() when $default != null:
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
    TResult Function(_InvoiceTaxSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryModel():
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
    TResult? Function(_InvoiceTaxSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTaxSummaryModel() when $default != null:
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
      case _InvoiceTaxSummaryModel() when $default != null:
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
      case _InvoiceTaxSummaryModel():
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
      case _InvoiceTaxSummaryModel() when $default != null:
        return $default(_that.hsnCode, _that.gstRate, _that.taxableAmount,
            _that.cgst, _that.sgst, _that.igst, _that.totalTax);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceTaxSummaryModel implements InvoiceTaxSummaryModel {
  const _InvoiceTaxSummaryModel(
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

  /// Create a copy of InvoiceTaxSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceTaxSummaryModelCopyWith<_InvoiceTaxSummaryModel> get copyWith =>
      __$InvoiceTaxSummaryModelCopyWithImpl<_InvoiceTaxSummaryModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceTaxSummaryModel &&
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
    return 'InvoiceTaxSummaryModel(hsnCode: $hsnCode, gstRate: $gstRate, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceTaxSummaryModelCopyWith<$Res>
    implements $InvoiceTaxSummaryModelCopyWith<$Res> {
  factory _$InvoiceTaxSummaryModelCopyWith(_InvoiceTaxSummaryModel value,
          $Res Function(_InvoiceTaxSummaryModel) _then) =
      __$InvoiceTaxSummaryModelCopyWithImpl;
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
class __$InvoiceTaxSummaryModelCopyWithImpl<$Res>
    implements _$InvoiceTaxSummaryModelCopyWith<$Res> {
  __$InvoiceTaxSummaryModelCopyWithImpl(this._self, this._then);

  final _InvoiceTaxSummaryModel _self;
  final $Res Function(_InvoiceTaxSummaryModel) _then;

  /// Create a copy of InvoiceTaxSummaryModel
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
    return _then(_InvoiceTaxSummaryModel(
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
mixin _$InvoiceShippingModel {
  String get method;
  String get methodName;
  double get shippingAmount;
  String get shippingZone;
  String get destinationPinCode;
  bool get isFreeShipping;

  /// Create a copy of InvoiceShippingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceShippingModelCopyWith<InvoiceShippingModel> get copyWith =>
      _$InvoiceShippingModelCopyWithImpl<InvoiceShippingModel>(
          this as InvoiceShippingModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceShippingModel &&
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
    return 'InvoiceShippingModel(method: $method, methodName: $methodName, shippingAmount: $shippingAmount, shippingZone: $shippingZone, destinationPinCode: $destinationPinCode, isFreeShipping: $isFreeShipping)';
  }
}

/// @nodoc
abstract mixin class $InvoiceShippingModelCopyWith<$Res> {
  factory $InvoiceShippingModelCopyWith(InvoiceShippingModel value,
          $Res Function(InvoiceShippingModel) _then) =
      _$InvoiceShippingModelCopyWithImpl;
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
class _$InvoiceShippingModelCopyWithImpl<$Res>
    implements $InvoiceShippingModelCopyWith<$Res> {
  _$InvoiceShippingModelCopyWithImpl(this._self, this._then);

  final InvoiceShippingModel _self;
  final $Res Function(InvoiceShippingModel) _then;

  /// Create a copy of InvoiceShippingModel
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

/// Adds pattern-matching-related methods to [InvoiceShippingModel].
extension InvoiceShippingModelPatterns on InvoiceShippingModel {
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
    TResult Function(_InvoiceShippingModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingModel() when $default != null:
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
    TResult Function(_InvoiceShippingModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingModel():
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
    TResult? Function(_InvoiceShippingModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceShippingModel() when $default != null:
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
      case _InvoiceShippingModel() when $default != null:
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
      case _InvoiceShippingModel():
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
      case _InvoiceShippingModel() when $default != null:
        return $default(_that.method, _that.methodName, _that.shippingAmount,
            _that.shippingZone, _that.destinationPinCode, _that.isFreeShipping);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceShippingModel implements InvoiceShippingModel {
  const _InvoiceShippingModel(
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

  /// Create a copy of InvoiceShippingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceShippingModelCopyWith<_InvoiceShippingModel> get copyWith =>
      __$InvoiceShippingModelCopyWithImpl<_InvoiceShippingModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceShippingModel &&
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
    return 'InvoiceShippingModel(method: $method, methodName: $methodName, shippingAmount: $shippingAmount, shippingZone: $shippingZone, destinationPinCode: $destinationPinCode, isFreeShipping: $isFreeShipping)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceShippingModelCopyWith<$Res>
    implements $InvoiceShippingModelCopyWith<$Res> {
  factory _$InvoiceShippingModelCopyWith(_InvoiceShippingModel value,
          $Res Function(_InvoiceShippingModel) _then) =
      __$InvoiceShippingModelCopyWithImpl;
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
class __$InvoiceShippingModelCopyWithImpl<$Res>
    implements _$InvoiceShippingModelCopyWith<$Res> {
  __$InvoiceShippingModelCopyWithImpl(this._self, this._then);

  final _InvoiceShippingModel _self;
  final $Res Function(_InvoiceShippingModel) _then;

  /// Create a copy of InvoiceShippingModel
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
    return _then(_InvoiceShippingModel(
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
mixin _$InvoiceCodModel {
  bool get isCod;
  double get fee;

  /// Create a copy of InvoiceCodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceCodModelCopyWith<InvoiceCodModel> get copyWith =>
      _$InvoiceCodModelCopyWithImpl<InvoiceCodModel>(
          this as InvoiceCodModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceCodModel &&
            (identical(other.isCod, isCod) || other.isCod == isCod) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCod, fee);

  @override
  String toString() {
    return 'InvoiceCodModel(isCod: $isCod, fee: $fee)';
  }
}

/// @nodoc
abstract mixin class $InvoiceCodModelCopyWith<$Res> {
  factory $InvoiceCodModelCopyWith(
          InvoiceCodModel value, $Res Function(InvoiceCodModel) _then) =
      _$InvoiceCodModelCopyWithImpl;
  @useResult
  $Res call({bool isCod, double fee});
}

/// @nodoc
class _$InvoiceCodModelCopyWithImpl<$Res>
    implements $InvoiceCodModelCopyWith<$Res> {
  _$InvoiceCodModelCopyWithImpl(this._self, this._then);

  final InvoiceCodModel _self;
  final $Res Function(InvoiceCodModel) _then;

  /// Create a copy of InvoiceCodModel
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

/// Adds pattern-matching-related methods to [InvoiceCodModel].
extension InvoiceCodModelPatterns on InvoiceCodModel {
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
    TResult Function(_InvoiceCodModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodModel() when $default != null:
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
    TResult Function(_InvoiceCodModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodModel():
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
    TResult? Function(_InvoiceCodModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceCodModel() when $default != null:
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
      case _InvoiceCodModel() when $default != null:
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
      case _InvoiceCodModel():
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
      case _InvoiceCodModel() when $default != null:
        return $default(_that.isCod, _that.fee);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoiceCodModel implements InvoiceCodModel {
  const _InvoiceCodModel({this.isCod = false, this.fee = 0.0});

  @override
  @JsonKey()
  final bool isCod;
  @override
  @JsonKey()
  final double fee;

  /// Create a copy of InvoiceCodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceCodModelCopyWith<_InvoiceCodModel> get copyWith =>
      __$InvoiceCodModelCopyWithImpl<_InvoiceCodModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceCodModel &&
            (identical(other.isCod, isCod) || other.isCod == isCod) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCod, fee);

  @override
  String toString() {
    return 'InvoiceCodModel(isCod: $isCod, fee: $fee)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceCodModelCopyWith<$Res>
    implements $InvoiceCodModelCopyWith<$Res> {
  factory _$InvoiceCodModelCopyWith(
          _InvoiceCodModel value, $Res Function(_InvoiceCodModel) _then) =
      __$InvoiceCodModelCopyWithImpl;
  @override
  @useResult
  $Res call({bool isCod, double fee});
}

/// @nodoc
class __$InvoiceCodModelCopyWithImpl<$Res>
    implements _$InvoiceCodModelCopyWith<$Res> {
  __$InvoiceCodModelCopyWithImpl(this._self, this._then);

  final _InvoiceCodModel _self;
  final $Res Function(_InvoiceCodModel) _then;

  /// Create a copy of InvoiceCodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isCod = null,
    Object? fee = null,
  }) {
    return _then(_InvoiceCodModel(
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
mixin _$InvoicePaymentModel {
  String get method;
  String get status;
  String get transactionId;
  String get provider;

  /// Create a copy of InvoicePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoicePaymentModelCopyWith<InvoicePaymentModel> get copyWith =>
      _$InvoicePaymentModelCopyWithImpl<InvoicePaymentModel>(
          this as InvoicePaymentModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoicePaymentModel &&
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
    return 'InvoicePaymentModel(method: $method, status: $status, transactionId: $transactionId, provider: $provider)';
  }
}

/// @nodoc
abstract mixin class $InvoicePaymentModelCopyWith<$Res> {
  factory $InvoicePaymentModelCopyWith(
          InvoicePaymentModel value, $Res Function(InvoicePaymentModel) _then) =
      _$InvoicePaymentModelCopyWithImpl;
  @useResult
  $Res call(
      {String method, String status, String transactionId, String provider});
}

/// @nodoc
class _$InvoicePaymentModelCopyWithImpl<$Res>
    implements $InvoicePaymentModelCopyWith<$Res> {
  _$InvoicePaymentModelCopyWithImpl(this._self, this._then);

  final InvoicePaymentModel _self;
  final $Res Function(InvoicePaymentModel) _then;

  /// Create a copy of InvoicePaymentModel
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

/// Adds pattern-matching-related methods to [InvoicePaymentModel].
extension InvoicePaymentModelPatterns on InvoicePaymentModel {
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
    TResult Function(_InvoicePaymentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentModel() when $default != null:
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
    TResult Function(_InvoicePaymentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentModel():
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
    TResult? Function(_InvoicePaymentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoicePaymentModel() when $default != null:
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
      case _InvoicePaymentModel() when $default != null:
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
      case _InvoicePaymentModel():
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
      case _InvoicePaymentModel() when $default != null:
        return $default(
            _that.method, _that.status, _that.transactionId, _that.provider);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvoicePaymentModel implements InvoicePaymentModel {
  const _InvoicePaymentModel(
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

  /// Create a copy of InvoicePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoicePaymentModelCopyWith<_InvoicePaymentModel> get copyWith =>
      __$InvoicePaymentModelCopyWithImpl<_InvoicePaymentModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoicePaymentModel &&
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
    return 'InvoicePaymentModel(method: $method, status: $status, transactionId: $transactionId, provider: $provider)';
  }
}

/// @nodoc
abstract mixin class _$InvoicePaymentModelCopyWith<$Res>
    implements $InvoicePaymentModelCopyWith<$Res> {
  factory _$InvoicePaymentModelCopyWith(_InvoicePaymentModel value,
          $Res Function(_InvoicePaymentModel) _then) =
      __$InvoicePaymentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String method, String status, String transactionId, String provider});
}

/// @nodoc
class __$InvoicePaymentModelCopyWithImpl<$Res>
    implements _$InvoicePaymentModelCopyWith<$Res> {
  __$InvoicePaymentModelCopyWithImpl(this._self, this._then);

  final _InvoicePaymentModel _self;
  final $Res Function(_InvoicePaymentModel) _then;

  /// Create a copy of InvoicePaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = null,
    Object? status = null,
    Object? transactionId = null,
    Object? provider = null,
  }) {
    return _then(_InvoicePaymentModel(
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
mixin _$InvoiceTotalsModel {
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

  /// Create a copy of InvoiceTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceTotalsModelCopyWith<InvoiceTotalsModel> get copyWith =>
      _$InvoiceTotalsModelCopyWithImpl<InvoiceTotalsModel>(
          this as InvoiceTotalsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceTotalsModel &&
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
    return 'InvoiceTotalsModel(subtotal: $subtotal, discount: $discount, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax, shippingFee: $shippingFee, codFee: $codFee, grandTotal: $grandTotal, currency: $currency, currencySymbol: $currencySymbol, amountInWords: $amountInWords)';
  }
}

/// @nodoc
abstract mixin class $InvoiceTotalsModelCopyWith<$Res> {
  factory $InvoiceTotalsModelCopyWith(
          InvoiceTotalsModel value, $Res Function(InvoiceTotalsModel) _then) =
      _$InvoiceTotalsModelCopyWithImpl;
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
class _$InvoiceTotalsModelCopyWithImpl<$Res>
    implements $InvoiceTotalsModelCopyWith<$Res> {
  _$InvoiceTotalsModelCopyWithImpl(this._self, this._then);

  final InvoiceTotalsModel _self;
  final $Res Function(InvoiceTotalsModel) _then;

  /// Create a copy of InvoiceTotalsModel
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

/// Adds pattern-matching-related methods to [InvoiceTotalsModel].
extension InvoiceTotalsModelPatterns on InvoiceTotalsModel {
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
    TResult Function(_InvoiceTotalsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsModel() when $default != null:
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
    TResult Function(_InvoiceTotalsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsModel():
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
    TResult? Function(_InvoiceTotalsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceTotalsModel() when $default != null:
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
      case _InvoiceTotalsModel() when $default != null:
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
      case _InvoiceTotalsModel():
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
      case _InvoiceTotalsModel() when $default != null:
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

class _InvoiceTotalsModel implements InvoiceTotalsModel {
  const _InvoiceTotalsModel(
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

  /// Create a copy of InvoiceTotalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceTotalsModelCopyWith<_InvoiceTotalsModel> get copyWith =>
      __$InvoiceTotalsModelCopyWithImpl<_InvoiceTotalsModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceTotalsModel &&
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
    return 'InvoiceTotalsModel(subtotal: $subtotal, discount: $discount, taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax, shippingFee: $shippingFee, codFee: $codFee, grandTotal: $grandTotal, currency: $currency, currencySymbol: $currencySymbol, amountInWords: $amountInWords)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceTotalsModelCopyWith<$Res>
    implements $InvoiceTotalsModelCopyWith<$Res> {
  factory _$InvoiceTotalsModelCopyWith(
          _InvoiceTotalsModel value, $Res Function(_InvoiceTotalsModel) _then) =
      __$InvoiceTotalsModelCopyWithImpl;
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
class __$InvoiceTotalsModelCopyWithImpl<$Res>
    implements _$InvoiceTotalsModelCopyWith<$Res> {
  __$InvoiceTotalsModelCopyWithImpl(this._self, this._then);

  final _InvoiceTotalsModel _self;
  final $Res Function(_InvoiceTotalsModel) _then;

  /// Create a copy of InvoiceTotalsModel
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
    return _then(_InvoiceTotalsModel(
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
mixin _$InvoiceModel {
  String get invoiceNumber;
  String get invoiceDate;
  String get invoiceStatus;
  String get orderId;
  String get orderNumber;
  String get orderDate;
  InvoiceSellerModel get seller;
  InvoiceAddressModel get billingAddress;
  InvoiceAddressModel get shippingAddress;
  String get customerGstin;
  bool get isInterState;
  List<InvoiceItemModel> get items;
  List<InvoiceTaxSummaryModel> get taxSummary;
  InvoiceShippingModel get shipping;
  InvoiceCodModel get cod;
  InvoicePaymentModel get payment;
  InvoiceTotalsModel get totals;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceModelCopyWith<InvoiceModel> get copyWith =>
      _$InvoiceModelCopyWithImpl<InvoiceModel>(
          this as InvoiceModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceModel &&
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
    return 'InvoiceModel(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceStatus: $invoiceStatus, orderId: $orderId, orderNumber: $orderNumber, orderDate: $orderDate, seller: $seller, billingAddress: $billingAddress, shippingAddress: $shippingAddress, customerGstin: $customerGstin, isInterState: $isInterState, items: $items, taxSummary: $taxSummary, shipping: $shipping, cod: $cod, payment: $payment, totals: $totals)';
  }
}

/// @nodoc
abstract mixin class $InvoiceModelCopyWith<$Res> {
  factory $InvoiceModelCopyWith(
          InvoiceModel value, $Res Function(InvoiceModel) _then) =
      _$InvoiceModelCopyWithImpl;
  @useResult
  $Res call(
      {String invoiceNumber,
      String invoiceDate,
      String invoiceStatus,
      String orderId,
      String orderNumber,
      String orderDate,
      InvoiceSellerModel seller,
      InvoiceAddressModel billingAddress,
      InvoiceAddressModel shippingAddress,
      String customerGstin,
      bool isInterState,
      List<InvoiceItemModel> items,
      List<InvoiceTaxSummaryModel> taxSummary,
      InvoiceShippingModel shipping,
      InvoiceCodModel cod,
      InvoicePaymentModel payment,
      InvoiceTotalsModel totals});

  $InvoiceSellerModelCopyWith<$Res> get seller;
  $InvoiceAddressModelCopyWith<$Res> get billingAddress;
  $InvoiceAddressModelCopyWith<$Res> get shippingAddress;
  $InvoiceShippingModelCopyWith<$Res> get shipping;
  $InvoiceCodModelCopyWith<$Res> get cod;
  $InvoicePaymentModelCopyWith<$Res> get payment;
  $InvoiceTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res> implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._self, this._then);

  final InvoiceModel _self;
  final $Res Function(InvoiceModel) _then;

  /// Create a copy of InvoiceModel
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
              as String,
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
              as String,
      seller: null == seller
          ? _self.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as InvoiceSellerModel,
      billingAddress: null == billingAddress
          ? _self.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressModel,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressModel,
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
              as List<InvoiceItemModel>,
      taxSummary: null == taxSummary
          ? _self.taxSummary
          : taxSummary // ignore: cast_nullable_to_non_nullable
              as List<InvoiceTaxSummaryModel>,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as InvoiceShippingModel,
      cod: null == cod
          ? _self.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as InvoiceCodModel,
      payment: null == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as InvoicePaymentModel,
      totals: null == totals
          ? _self.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as InvoiceTotalsModel,
    ));
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceSellerModelCopyWith<$Res> get seller {
    return $InvoiceSellerModelCopyWith<$Res>(_self.seller, (value) {
      return _then(_self.copyWith(seller: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressModelCopyWith<$Res> get billingAddress {
    return $InvoiceAddressModelCopyWith<$Res>(_self.billingAddress, (value) {
      return _then(_self.copyWith(billingAddress: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressModelCopyWith<$Res> get shippingAddress {
    return $InvoiceAddressModelCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceShippingModelCopyWith<$Res> get shipping {
    return $InvoiceShippingModelCopyWith<$Res>(_self.shipping, (value) {
      return _then(_self.copyWith(shipping: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceCodModelCopyWith<$Res> get cod {
    return $InvoiceCodModelCopyWith<$Res>(_self.cod, (value) {
      return _then(_self.copyWith(cod: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoicePaymentModelCopyWith<$Res> get payment {
    return $InvoicePaymentModelCopyWith<$Res>(_self.payment, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceTotalsModelCopyWith<$Res> get totals {
    return $InvoiceTotalsModelCopyWith<$Res>(_self.totals, (value) {
      return _then(_self.copyWith(totals: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InvoiceModel].
extension InvoiceModelPatterns on InvoiceModel {
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
    TResult Function(_InvoiceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
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
    TResult Function(_InvoiceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel():
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
    TResult? Function(_InvoiceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
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
            String invoiceDate,
            String invoiceStatus,
            String orderId,
            String orderNumber,
            String orderDate,
            InvoiceSellerModel seller,
            InvoiceAddressModel billingAddress,
            InvoiceAddressModel shippingAddress,
            String customerGstin,
            bool isInterState,
            List<InvoiceItemModel> items,
            List<InvoiceTaxSummaryModel> taxSummary,
            InvoiceShippingModel shipping,
            InvoiceCodModel cod,
            InvoicePaymentModel payment,
            InvoiceTotalsModel totals)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
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
            String invoiceDate,
            String invoiceStatus,
            String orderId,
            String orderNumber,
            String orderDate,
            InvoiceSellerModel seller,
            InvoiceAddressModel billingAddress,
            InvoiceAddressModel shippingAddress,
            String customerGstin,
            bool isInterState,
            List<InvoiceItemModel> items,
            List<InvoiceTaxSummaryModel> taxSummary,
            InvoiceShippingModel shipping,
            InvoiceCodModel cod,
            InvoicePaymentModel payment,
            InvoiceTotalsModel totals)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel():
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
            String invoiceDate,
            String invoiceStatus,
            String orderId,
            String orderNumber,
            String orderDate,
            InvoiceSellerModel seller,
            InvoiceAddressModel billingAddress,
            InvoiceAddressModel shippingAddress,
            String customerGstin,
            bool isInterState,
            List<InvoiceItemModel> items,
            List<InvoiceTaxSummaryModel> taxSummary,
            InvoiceShippingModel shipping,
            InvoiceCodModel cod,
            InvoicePaymentModel payment,
            InvoiceTotalsModel totals)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceModel() when $default != null:
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

class _InvoiceModel implements InvoiceModel {
  const _InvoiceModel(
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
      final List<InvoiceItemModel> items = const [],
      final List<InvoiceTaxSummaryModel> taxSummary = const [],
      required this.shipping,
      required this.cod,
      required this.payment,
      required this.totals})
      : _items = items,
        _taxSummary = taxSummary;

  @override
  final String invoiceNumber;
  @override
  final String invoiceDate;
  @override
  final String invoiceStatus;
  @override
  final String orderId;
  @override
  final String orderNumber;
  @override
  final String orderDate;
  @override
  final InvoiceSellerModel seller;
  @override
  final InvoiceAddressModel billingAddress;
  @override
  final InvoiceAddressModel shippingAddress;
  @override
  @JsonKey()
  final String customerGstin;
  @override
  @JsonKey()
  final bool isInterState;
  final List<InvoiceItemModel> _items;
  @override
  @JsonKey()
  List<InvoiceItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<InvoiceTaxSummaryModel> _taxSummary;
  @override
  @JsonKey()
  List<InvoiceTaxSummaryModel> get taxSummary {
    if (_taxSummary is EqualUnmodifiableListView) return _taxSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxSummary);
  }

  @override
  final InvoiceShippingModel shipping;
  @override
  final InvoiceCodModel cod;
  @override
  final InvoicePaymentModel payment;
  @override
  final InvoiceTotalsModel totals;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceModelCopyWith<_InvoiceModel> get copyWith =>
      __$InvoiceModelCopyWithImpl<_InvoiceModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceModel &&
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
    return 'InvoiceModel(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceStatus: $invoiceStatus, orderId: $orderId, orderNumber: $orderNumber, orderDate: $orderDate, seller: $seller, billingAddress: $billingAddress, shippingAddress: $shippingAddress, customerGstin: $customerGstin, isInterState: $isInterState, items: $items, taxSummary: $taxSummary, shipping: $shipping, cod: $cod, payment: $payment, totals: $totals)';
  }
}

/// @nodoc
abstract mixin class _$InvoiceModelCopyWith<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  factory _$InvoiceModelCopyWith(
          _InvoiceModel value, $Res Function(_InvoiceModel) _then) =
      __$InvoiceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String invoiceNumber,
      String invoiceDate,
      String invoiceStatus,
      String orderId,
      String orderNumber,
      String orderDate,
      InvoiceSellerModel seller,
      InvoiceAddressModel billingAddress,
      InvoiceAddressModel shippingAddress,
      String customerGstin,
      bool isInterState,
      List<InvoiceItemModel> items,
      List<InvoiceTaxSummaryModel> taxSummary,
      InvoiceShippingModel shipping,
      InvoiceCodModel cod,
      InvoicePaymentModel payment,
      InvoiceTotalsModel totals});

  @override
  $InvoiceSellerModelCopyWith<$Res> get seller;
  @override
  $InvoiceAddressModelCopyWith<$Res> get billingAddress;
  @override
  $InvoiceAddressModelCopyWith<$Res> get shippingAddress;
  @override
  $InvoiceShippingModelCopyWith<$Res> get shipping;
  @override
  $InvoiceCodModelCopyWith<$Res> get cod;
  @override
  $InvoicePaymentModelCopyWith<$Res> get payment;
  @override
  $InvoiceTotalsModelCopyWith<$Res> get totals;
}

/// @nodoc
class __$InvoiceModelCopyWithImpl<$Res>
    implements _$InvoiceModelCopyWith<$Res> {
  __$InvoiceModelCopyWithImpl(this._self, this._then);

  final _InvoiceModel _self;
  final $Res Function(_InvoiceModel) _then;

  /// Create a copy of InvoiceModel
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
    return _then(_InvoiceModel(
      invoiceNumber: null == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _self.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      seller: null == seller
          ? _self.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as InvoiceSellerModel,
      billingAddress: null == billingAddress
          ? _self.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressModel,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as InvoiceAddressModel,
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
              as List<InvoiceItemModel>,
      taxSummary: null == taxSummary
          ? _self._taxSummary
          : taxSummary // ignore: cast_nullable_to_non_nullable
              as List<InvoiceTaxSummaryModel>,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as InvoiceShippingModel,
      cod: null == cod
          ? _self.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as InvoiceCodModel,
      payment: null == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as InvoicePaymentModel,
      totals: null == totals
          ? _self.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as InvoiceTotalsModel,
    ));
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceSellerModelCopyWith<$Res> get seller {
    return $InvoiceSellerModelCopyWith<$Res>(_self.seller, (value) {
      return _then(_self.copyWith(seller: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressModelCopyWith<$Res> get billingAddress {
    return $InvoiceAddressModelCopyWith<$Res>(_self.billingAddress, (value) {
      return _then(_self.copyWith(billingAddress: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressModelCopyWith<$Res> get shippingAddress {
    return $InvoiceAddressModelCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceShippingModelCopyWith<$Res> get shipping {
    return $InvoiceShippingModelCopyWith<$Res>(_self.shipping, (value) {
      return _then(_self.copyWith(shipping: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceCodModelCopyWith<$Res> get cod {
    return $InvoiceCodModelCopyWith<$Res>(_self.cod, (value) {
      return _then(_self.copyWith(cod: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoicePaymentModelCopyWith<$Res> get payment {
    return $InvoicePaymentModelCopyWith<$Res>(_self.payment, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceTotalsModelCopyWith<$Res> get totals {
    return $InvoiceTotalsModelCopyWith<$Res>(_self.totals, (value) {
      return _then(_self.copyWith(totals: value));
    });
  }
}

// dart format on
