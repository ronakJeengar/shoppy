// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutValidationEntity {
  bool get valid;
  AddressEntity? get shippingAddress;
  String get shippingMethod;
  double get subtotal;
  double get shippingFee;
  double get tax;
  double get grandTotal;

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutValidationEntityCopyWith<CheckoutValidationEntity> get copyWith =>
      _$CheckoutValidationEntityCopyWithImpl<CheckoutValidationEntity>(
          this as CheckoutValidationEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutValidationEntity &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, valid, shippingAddress,
      shippingMethod, subtotal, shippingFee, tax, grandTotal);

  @override
  String toString() {
    return 'CheckoutValidationEntity(valid: $valid, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal)';
  }
}

/// @nodoc
abstract mixin class $CheckoutValidationEntityCopyWith<$Res> {
  factory $CheckoutValidationEntityCopyWith(CheckoutValidationEntity value,
          $Res Function(CheckoutValidationEntity) _then) =
      _$CheckoutValidationEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool valid,
      AddressEntity? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double grandTotal});

  $AddressEntityCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class _$CheckoutValidationEntityCopyWithImpl<$Res>
    implements $CheckoutValidationEntityCopyWith<$Res> {
  _$CheckoutValidationEntityCopyWithImpl(this._self, this._then);

  final CheckoutValidationEntity _self;
  final $Res Function(CheckoutValidationEntity) _then;

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? shippingAddress = freezed,
    Object? shippingMethod = null,
    Object? subtotal = null,
    Object? shippingFee = null,
    Object? tax = null,
    Object? grandTotal = null,
  }) {
    return _then(_self.copyWith(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity?,
      shippingMethod: null == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressEntityCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CheckoutValidationEntity].
extension CheckoutValidationEntityPatterns on CheckoutValidationEntity {
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
    TResult Function(_CheckoutValidationEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationEntity() when $default != null:
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
    TResult Function(_CheckoutValidationEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationEntity():
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
    TResult? Function(_CheckoutValidationEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationEntity() when $default != null:
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
            bool valid,
            AddressEntity? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationEntity() when $default != null:
        return $default(
            _that.valid,
            _that.shippingAddress,
            _that.shippingMethod,
            _that.subtotal,
            _that.shippingFee,
            _that.tax,
            _that.grandTotal);
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
            bool valid,
            AddressEntity? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationEntity():
        return $default(
            _that.valid,
            _that.shippingAddress,
            _that.shippingMethod,
            _that.subtotal,
            _that.shippingFee,
            _that.tax,
            _that.grandTotal);
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
            bool valid,
            AddressEntity? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationEntity() when $default != null:
        return $default(
            _that.valid,
            _that.shippingAddress,
            _that.shippingMethod,
            _that.subtotal,
            _that.shippingFee,
            _that.tax,
            _that.grandTotal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckoutValidationEntity implements CheckoutValidationEntity {
  const _CheckoutValidationEntity(
      {required this.valid,
      this.shippingAddress,
      this.shippingMethod = 'STANDARD',
      required this.subtotal,
      required this.shippingFee,
      required this.tax,
      required this.grandTotal});

  @override
  final bool valid;
  @override
  final AddressEntity? shippingAddress;
  @override
  @JsonKey()
  final String shippingMethod;
  @override
  final double subtotal;
  @override
  final double shippingFee;
  @override
  final double tax;
  @override
  final double grandTotal;

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutValidationEntityCopyWith<_CheckoutValidationEntity> get copyWith =>
      __$CheckoutValidationEntityCopyWithImpl<_CheckoutValidationEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutValidationEntity &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, valid, shippingAddress,
      shippingMethod, subtotal, shippingFee, tax, grandTotal);

  @override
  String toString() {
    return 'CheckoutValidationEntity(valid: $valid, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutValidationEntityCopyWith<$Res>
    implements $CheckoutValidationEntityCopyWith<$Res> {
  factory _$CheckoutValidationEntityCopyWith(_CheckoutValidationEntity value,
          $Res Function(_CheckoutValidationEntity) _then) =
      __$CheckoutValidationEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool valid,
      AddressEntity? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double grandTotal});

  @override
  $AddressEntityCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class __$CheckoutValidationEntityCopyWithImpl<$Res>
    implements _$CheckoutValidationEntityCopyWith<$Res> {
  __$CheckoutValidationEntityCopyWithImpl(this._self, this._then);

  final _CheckoutValidationEntity _self;
  final $Res Function(_CheckoutValidationEntity) _then;

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valid = null,
    Object? shippingAddress = freezed,
    Object? shippingMethod = null,
    Object? subtotal = null,
    Object? shippingFee = null,
    Object? tax = null,
    Object? grandTotal = null,
  }) {
    return _then(_CheckoutValidationEntity(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity?,
      shippingMethod: null == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _self.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressEntityCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }
}

// dart format on
