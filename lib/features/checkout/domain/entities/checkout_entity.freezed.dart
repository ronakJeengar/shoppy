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
  double get taxableAmount;
  double get discount;
  String get currency;
  String get currencySymbol;
  TaxBreakdownEntity? get taxBreakdown;
  String? get customerGstin;

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
                other.grandTotal == grandTotal) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.taxBreakdown, taxBreakdown) ||
                other.taxBreakdown == taxBreakdown) &&
            (identical(other.customerGstin, customerGstin) ||
                other.customerGstin == customerGstin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      valid,
      shippingAddress,
      shippingMethod,
      subtotal,
      shippingFee,
      tax,
      grandTotal,
      taxableAmount,
      discount,
      currency,
      currencySymbol,
      taxBreakdown,
      customerGstin);

  @override
  String toString() {
    return 'CheckoutValidationEntity(valid: $valid, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal, taxableAmount: $taxableAmount, discount: $discount, currency: $currency, currencySymbol: $currencySymbol, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin)';
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
      double grandTotal,
      double taxableAmount,
      double discount,
      String currency,
      String currencySymbol,
      TaxBreakdownEntity? taxBreakdown,
      String? customerGstin});

  $AddressEntityCopyWith<$Res>? get shippingAddress;
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown;
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
    Object? taxableAmount = null,
    Object? discount = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? taxBreakdown = freezed,
    Object? customerGstin = freezed,
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
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      taxBreakdown: freezed == taxBreakdown
          ? _self.taxBreakdown
          : taxBreakdown // ignore: cast_nullable_to_non_nullable
              as TaxBreakdownEntity?,
      customerGstin: freezed == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown {
    if (_self.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownEntityCopyWith<$Res>(_self.taxBreakdown!, (value) {
      return _then(_self.copyWith(taxBreakdown: value));
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
            double grandTotal,
            double taxableAmount,
            double discount,
            String currency,
            String currencySymbol,
            TaxBreakdownEntity? taxBreakdown,
            String? customerGstin)?
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
            _that.grandTotal,
            _that.taxableAmount,
            _that.discount,
            _that.currency,
            _that.currencySymbol,
            _that.taxBreakdown,
            _that.customerGstin);
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
            double grandTotal,
            double taxableAmount,
            double discount,
            String currency,
            String currencySymbol,
            TaxBreakdownEntity? taxBreakdown,
            String? customerGstin)
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
            _that.grandTotal,
            _that.taxableAmount,
            _that.discount,
            _that.currency,
            _that.currencySymbol,
            _that.taxBreakdown,
            _that.customerGstin);
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
            double grandTotal,
            double taxableAmount,
            double discount,
            String currency,
            String currencySymbol,
            TaxBreakdownEntity? taxBreakdown,
            String? customerGstin)?
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
            _that.grandTotal,
            _that.taxableAmount,
            _that.discount,
            _that.currency,
            _that.currencySymbol,
            _that.taxBreakdown,
            _that.customerGstin);
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
      required this.grandTotal,
      this.taxableAmount = 0.0,
      this.discount = 0.0,
      this.currency = 'INR',
      this.currencySymbol = '₹',
      this.taxBreakdown,
      this.customerGstin});

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
  @override
  @JsonKey()
  final double taxableAmount;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String currencySymbol;
  @override
  final TaxBreakdownEntity? taxBreakdown;
  @override
  final String? customerGstin;

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
                other.grandTotal == grandTotal) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.taxBreakdown, taxBreakdown) ||
                other.taxBreakdown == taxBreakdown) &&
            (identical(other.customerGstin, customerGstin) ||
                other.customerGstin == customerGstin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      valid,
      shippingAddress,
      shippingMethod,
      subtotal,
      shippingFee,
      tax,
      grandTotal,
      taxableAmount,
      discount,
      currency,
      currencySymbol,
      taxBreakdown,
      customerGstin);

  @override
  String toString() {
    return 'CheckoutValidationEntity(valid: $valid, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal, taxableAmount: $taxableAmount, discount: $discount, currency: $currency, currencySymbol: $currencySymbol, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin)';
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
      double grandTotal,
      double taxableAmount,
      double discount,
      String currency,
      String currencySymbol,
      TaxBreakdownEntity? taxBreakdown,
      String? customerGstin});

  @override
  $AddressEntityCopyWith<$Res>? get shippingAddress;
  @override
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown;
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
    Object? taxableAmount = null,
    Object? discount = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? taxBreakdown = freezed,
    Object? customerGstin = freezed,
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
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      taxBreakdown: freezed == taxBreakdown
          ? _self.taxBreakdown
          : taxBreakdown // ignore: cast_nullable_to_non_nullable
              as TaxBreakdownEntity?,
      customerGstin: freezed == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of CheckoutValidationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown {
    if (_self.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownEntityCopyWith<$Res>(_self.taxBreakdown!, (value) {
      return _then(_self.copyWith(taxBreakdown: value));
    });
  }
}

// dart format on
