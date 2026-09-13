// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_validation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutValidationModel {
  bool get valid;
  List<OrderItemModel> get items;
  AddressModel? get shippingAddress;
  String get shippingMethod;
  double get subtotal;
  double get shippingFee;
  double get tax;
  double get grandTotal;
  double get taxableAmount;
  double get discount;
  String get currency;
  String get currencySymbol;
  TaxBreakdownModel? get taxBreakdown;
  String? get customerGstin;
  String? get deliveryWindow;
  bool? get isFreeShipping;
  Map<String, dynamic>? get shippingDetails;

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutValidationModelCopyWith<CheckoutValidationModel> get copyWith =>
      _$CheckoutValidationModelCopyWithImpl<CheckoutValidationModel>(
          this as CheckoutValidationModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutValidationModel &&
            (identical(other.valid, valid) || other.valid == valid) &&
            const DeepCollectionEquality().equals(other.items, items) &&
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
                other.customerGstin == customerGstin) &&
            (identical(other.deliveryWindow, deliveryWindow) ||
                other.deliveryWindow == deliveryWindow) &&
            (identical(other.isFreeShipping, isFreeShipping) ||
                other.isFreeShipping == isFreeShipping) &&
            const DeepCollectionEquality()
                .equals(other.shippingDetails, shippingDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      valid,
      const DeepCollectionEquality().hash(items),
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
      customerGstin,
      deliveryWindow,
      isFreeShipping,
      const DeepCollectionEquality().hash(shippingDetails));

  @override
  String toString() {
    return 'CheckoutValidationModel(valid: $valid, items: $items, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal, taxableAmount: $taxableAmount, discount: $discount, currency: $currency, currencySymbol: $currencySymbol, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin, deliveryWindow: $deliveryWindow, isFreeShipping: $isFreeShipping, shippingDetails: $shippingDetails)';
  }
}

/// @nodoc
abstract mixin class $CheckoutValidationModelCopyWith<$Res> {
  factory $CheckoutValidationModelCopyWith(CheckoutValidationModel value,
          $Res Function(CheckoutValidationModel) _then) =
      _$CheckoutValidationModelCopyWithImpl;
  @useResult
  $Res call(
      {bool valid,
      List<OrderItemModel> items,
      AddressModel? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double grandTotal,
      double taxableAmount,
      double discount,
      String currency,
      String currencySymbol,
      TaxBreakdownModel? taxBreakdown,
      String? customerGstin,
      String? deliveryWindow,
      bool? isFreeShipping,
      Map<String, dynamic>? shippingDetails});

  $AddressModelCopyWith<$Res>? get shippingAddress;
  $TaxBreakdownModelCopyWith<$Res>? get taxBreakdown;
}

/// @nodoc
class _$CheckoutValidationModelCopyWithImpl<$Res>
    implements $CheckoutValidationModelCopyWith<$Res> {
  _$CheckoutValidationModelCopyWithImpl(this._self, this._then);

  final CheckoutValidationModel _self;
  final $Res Function(CheckoutValidationModel) _then;

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? items = null,
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
    Object? deliveryWindow = freezed,
    Object? isFreeShipping = freezed,
    Object? shippingDetails = freezed,
  }) {
    return _then(_self.copyWith(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
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
              as TaxBreakdownModel?,
      customerGstin: freezed == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryWindow: freezed == deliveryWindow
          ? _self.deliveryWindow
          : deliveryWindow // ignore: cast_nullable_to_non_nullable
              as String?,
      isFreeShipping: freezed == isFreeShipping
          ? _self.isFreeShipping
          : isFreeShipping // ignore: cast_nullable_to_non_nullable
              as bool?,
      shippingDetails: freezed == shippingDetails
          ? _self.shippingDetails
          : shippingDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownModelCopyWith<$Res>? get taxBreakdown {
    if (_self.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownModelCopyWith<$Res>(_self.taxBreakdown!, (value) {
      return _then(_self.copyWith(taxBreakdown: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CheckoutValidationModel].
extension CheckoutValidationModelPatterns on CheckoutValidationModel {
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
    TResult Function(_CheckoutValidationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationModel() when $default != null:
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
    TResult Function(_CheckoutValidationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationModel():
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
    TResult? Function(_CheckoutValidationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationModel() when $default != null:
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
            List<OrderItemModel> items,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal,
            double taxableAmount,
            double discount,
            String currency,
            String currencySymbol,
            TaxBreakdownModel? taxBreakdown,
            String? customerGstin,
            String? deliveryWindow,
            bool? isFreeShipping,
            Map<String, dynamic>? shippingDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationModel() when $default != null:
        return $default(
            _that.valid,
            _that.items,
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
            _that.customerGstin,
            _that.deliveryWindow,
            _that.isFreeShipping,
            _that.shippingDetails);
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
            List<OrderItemModel> items,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal,
            double taxableAmount,
            double discount,
            String currency,
            String currencySymbol,
            TaxBreakdownModel? taxBreakdown,
            String? customerGstin,
            String? deliveryWindow,
            bool? isFreeShipping,
            Map<String, dynamic>? shippingDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationModel():
        return $default(
            _that.valid,
            _that.items,
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
            _that.customerGstin,
            _that.deliveryWindow,
            _that.isFreeShipping,
            _that.shippingDetails);
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
            List<OrderItemModel> items,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal,
            double taxableAmount,
            double discount,
            String currency,
            String currencySymbol,
            TaxBreakdownModel? taxBreakdown,
            String? customerGstin,
            String? deliveryWindow,
            bool? isFreeShipping,
            Map<String, dynamic>? shippingDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckoutValidationModel() when $default != null:
        return $default(
            _that.valid,
            _that.items,
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
            _that.customerGstin,
            _that.deliveryWindow,
            _that.isFreeShipping,
            _that.shippingDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckoutValidationModel implements CheckoutValidationModel {
  const _CheckoutValidationModel(
      {required this.valid,
      final List<OrderItemModel> items = const [],
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
      this.customerGstin,
      this.deliveryWindow,
      this.isFreeShipping,
      final Map<String, dynamic>? shippingDetails})
      : _items = items,
        _shippingDetails = shippingDetails;

  @override
  final bool valid;
  final List<OrderItemModel> _items;
  @override
  @JsonKey()
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final AddressModel? shippingAddress;
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
  final TaxBreakdownModel? taxBreakdown;
  @override
  final String? customerGstin;
  @override
  final String? deliveryWindow;
  @override
  final bool? isFreeShipping;
  final Map<String, dynamic>? _shippingDetails;
  @override
  Map<String, dynamic>? get shippingDetails {
    final value = _shippingDetails;
    if (value == null) return null;
    if (_shippingDetails is EqualUnmodifiableMapView) return _shippingDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckoutValidationModelCopyWith<_CheckoutValidationModel> get copyWith =>
      __$CheckoutValidationModelCopyWithImpl<_CheckoutValidationModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckoutValidationModel &&
            (identical(other.valid, valid) || other.valid == valid) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
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
                other.customerGstin == customerGstin) &&
            (identical(other.deliveryWindow, deliveryWindow) ||
                other.deliveryWindow == deliveryWindow) &&
            (identical(other.isFreeShipping, isFreeShipping) ||
                other.isFreeShipping == isFreeShipping) &&
            const DeepCollectionEquality()
                .equals(other._shippingDetails, _shippingDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      valid,
      const DeepCollectionEquality().hash(_items),
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
      customerGstin,
      deliveryWindow,
      isFreeShipping,
      const DeepCollectionEquality().hash(_shippingDetails));

  @override
  String toString() {
    return 'CheckoutValidationModel(valid: $valid, items: $items, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal, taxableAmount: $taxableAmount, discount: $discount, currency: $currency, currencySymbol: $currencySymbol, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin, deliveryWindow: $deliveryWindow, isFreeShipping: $isFreeShipping, shippingDetails: $shippingDetails)';
  }
}

/// @nodoc
abstract mixin class _$CheckoutValidationModelCopyWith<$Res>
    implements $CheckoutValidationModelCopyWith<$Res> {
  factory _$CheckoutValidationModelCopyWith(_CheckoutValidationModel value,
          $Res Function(_CheckoutValidationModel) _then) =
      __$CheckoutValidationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool valid,
      List<OrderItemModel> items,
      AddressModel? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double grandTotal,
      double taxableAmount,
      double discount,
      String currency,
      String currencySymbol,
      TaxBreakdownModel? taxBreakdown,
      String? customerGstin,
      String? deliveryWindow,
      bool? isFreeShipping,
      Map<String, dynamic>? shippingDetails});

  @override
  $AddressModelCopyWith<$Res>? get shippingAddress;
  @override
  $TaxBreakdownModelCopyWith<$Res>? get taxBreakdown;
}

/// @nodoc
class __$CheckoutValidationModelCopyWithImpl<$Res>
    implements _$CheckoutValidationModelCopyWith<$Res> {
  __$CheckoutValidationModelCopyWithImpl(this._self, this._then);

  final _CheckoutValidationModel _self;
  final $Res Function(_CheckoutValidationModel) _then;

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valid = null,
    Object? items = null,
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
    Object? deliveryWindow = freezed,
    Object? isFreeShipping = freezed,
    Object? shippingDetails = freezed,
  }) {
    return _then(_CheckoutValidationModel(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
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
              as TaxBreakdownModel?,
      customerGstin: freezed == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryWindow: freezed == deliveryWindow
          ? _self.deliveryWindow
          : deliveryWindow // ignore: cast_nullable_to_non_nullable
              as String?,
      isFreeShipping: freezed == isFreeShipping
          ? _self.isFreeShipping
          : isFreeShipping // ignore: cast_nullable_to_non_nullable
              as bool?,
      shippingDetails: freezed == shippingDetails
          ? _self._shippingDetails
          : shippingDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownModelCopyWith<$Res>? get taxBreakdown {
    if (_self.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownModelCopyWith<$Res>(_self.taxBreakdown!, (value) {
      return _then(_self.copyWith(taxBreakdown: value));
    });
  }
}

// dart format on
