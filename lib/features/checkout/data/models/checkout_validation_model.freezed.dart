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
                other.grandTotal == grandTotal));
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
      grandTotal);

  @override
  String toString() {
    return 'CheckoutValidationModel(valid: $valid, items: $items, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal)';
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
      double grandTotal});

  $AddressModelCopyWith<$Res>? get shippingAddress;
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
            double grandTotal)?
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
            List<OrderItemModel> items,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal)
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
            List<OrderItemModel> items,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double grandTotal)?
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
            _that.grandTotal);
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
      required this.grandTotal})
      : _items = items;

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
                other.grandTotal == grandTotal));
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
      grandTotal);

  @override
  String toString() {
    return 'CheckoutValidationModel(valid: $valid, items: $items, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal)';
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
      double grandTotal});

  @override
  $AddressModelCopyWith<$Res>? get shippingAddress;
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
}

// dart format on
