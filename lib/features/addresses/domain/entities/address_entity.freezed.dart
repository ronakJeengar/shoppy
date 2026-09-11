// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressEntity {
  String get id;
  String get fullName;
  String get phone;
  String get streetAddress;
  String get city;
  String get state;
  String get postalCode;
  String get country;
  bool get isDefault;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<AddressEntity> get copyWith =>
      _$AddressEntityCopyWithImpl<AddressEntity>(
          this as AddressEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, phone,
      streetAddress, city, state, postalCode, country, isDefault);

  @override
  String toString() {
    return 'AddressEntity(id: $id, fullName: $fullName, phone: $phone, streetAddress: $streetAddress, city: $city, state: $state, postalCode: $postalCode, country: $country, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class $AddressEntityCopyWith<$Res> {
  factory $AddressEntityCopyWith(
          AddressEntity value, $Res Function(AddressEntity) _then) =
      _$AddressEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String fullName,
      String phone,
      String streetAddress,
      String city,
      String state,
      String postalCode,
      String country,
      bool isDefault});
}

/// @nodoc
class _$AddressEntityCopyWithImpl<$Res>
    implements $AddressEntityCopyWith<$Res> {
  _$AddressEntityCopyWithImpl(this._self, this._then);

  final AddressEntity _self;
  final $Res Function(AddressEntity) _then;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? phone = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = null,
    Object? isDefault = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      streetAddress: null == streetAddress
          ? _self.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddressEntity].
extension AddressEntityPatterns on AddressEntity {
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
    TResult Function(_AddressEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressEntity() when $default != null:
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
    TResult Function(_AddressEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressEntity():
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
    TResult? Function(_AddressEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressEntity() when $default != null:
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
            String id,
            String fullName,
            String phone,
            String streetAddress,
            String city,
            String state,
            String postalCode,
            String country,
            bool isDefault)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddressEntity() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.phone,
            _that.streetAddress,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.isDefault);
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
            String id,
            String fullName,
            String phone,
            String streetAddress,
            String city,
            String state,
            String postalCode,
            String country,
            bool isDefault)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressEntity():
        return $default(
            _that.id,
            _that.fullName,
            _that.phone,
            _that.streetAddress,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.isDefault);
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
            String id,
            String fullName,
            String phone,
            String streetAddress,
            String city,
            String state,
            String postalCode,
            String country,
            bool isDefault)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddressEntity() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.phone,
            _that.streetAddress,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.isDefault);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddressEntity extends AddressEntity {
  const _AddressEntity(
      {required this.id,
      required this.fullName,
      required this.phone,
      required this.streetAddress,
      required this.city,
      required this.state,
      required this.postalCode,
      this.country = 'US',
      this.isDefault = false})
      : super._();

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String phone;
  @override
  final String streetAddress;
  @override
  final String city;
  @override
  final String state;
  @override
  final String postalCode;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final bool isDefault;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressEntityCopyWith<_AddressEntity> get copyWith =>
      __$AddressEntityCopyWithImpl<_AddressEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, phone,
      streetAddress, city, state, postalCode, country, isDefault);

  @override
  String toString() {
    return 'AddressEntity(id: $id, fullName: $fullName, phone: $phone, streetAddress: $streetAddress, city: $city, state: $state, postalCode: $postalCode, country: $country, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class _$AddressEntityCopyWith<$Res>
    implements $AddressEntityCopyWith<$Res> {
  factory _$AddressEntityCopyWith(
          _AddressEntity value, $Res Function(_AddressEntity) _then) =
      __$AddressEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String phone,
      String streetAddress,
      String city,
      String state,
      String postalCode,
      String country,
      bool isDefault});
}

/// @nodoc
class __$AddressEntityCopyWithImpl<$Res>
    implements _$AddressEntityCopyWith<$Res> {
  __$AddressEntityCopyWithImpl(this._self, this._then);

  final _AddressEntity _self;
  final $Res Function(_AddressEntity) _then;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? phone = null,
    Object? streetAddress = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = null,
    Object? isDefault = null,
  }) {
    return _then(_AddressEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      streetAddress: null == streetAddress
          ? _self.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
