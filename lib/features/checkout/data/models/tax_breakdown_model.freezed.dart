// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_breakdown_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaxBreakdownModel {
  double get taxableAmount;
  double get cgst;
  double get sgst;
  double get igst;
  double get totalTax;
  bool get isInterState;
  String get originState;
  String get customerState;

  /// Create a copy of TaxBreakdownModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaxBreakdownModelCopyWith<TaxBreakdownModel> get copyWith =>
      _$TaxBreakdownModelCopyWithImpl<TaxBreakdownModel>(
          this as TaxBreakdownModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaxBreakdownModel &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.isInterState, isInterState) ||
                other.isInterState == isInterState) &&
            (identical(other.originState, originState) ||
                other.originState == originState) &&
            (identical(other.customerState, customerState) ||
                other.customerState == customerState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taxableAmount, cgst, sgst, igst,
      totalTax, isInterState, originState, customerState);

  @override
  String toString() {
    return 'TaxBreakdownModel(taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax, isInterState: $isInterState, originState: $originState, customerState: $customerState)';
  }
}

/// @nodoc
abstract mixin class $TaxBreakdownModelCopyWith<$Res> {
  factory $TaxBreakdownModelCopyWith(
          TaxBreakdownModel value, $Res Function(TaxBreakdownModel) _then) =
      _$TaxBreakdownModelCopyWithImpl;
  @useResult
  $Res call(
      {double taxableAmount,
      double cgst,
      double sgst,
      double igst,
      double totalTax,
      bool isInterState,
      String originState,
      String customerState});
}

/// @nodoc
class _$TaxBreakdownModelCopyWithImpl<$Res>
    implements $TaxBreakdownModelCopyWith<$Res> {
  _$TaxBreakdownModelCopyWithImpl(this._self, this._then);

  final TaxBreakdownModel _self;
  final $Res Function(TaxBreakdownModel) _then;

  /// Create a copy of TaxBreakdownModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxableAmount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? igst = null,
    Object? totalTax = null,
    Object? isInterState = null,
    Object? originState = null,
    Object? customerState = null,
  }) {
    return _then(_self.copyWith(
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
      isInterState: null == isInterState
          ? _self.isInterState
          : isInterState // ignore: cast_nullable_to_non_nullable
              as bool,
      originState: null == originState
          ? _self.originState
          : originState // ignore: cast_nullable_to_non_nullable
              as String,
      customerState: null == customerState
          ? _self.customerState
          : customerState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TaxBreakdownModel].
extension TaxBreakdownModelPatterns on TaxBreakdownModel {
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
    TResult Function(_TaxBreakdownModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaxBreakdownModel() when $default != null:
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
    TResult Function(_TaxBreakdownModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaxBreakdownModel():
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
    TResult? Function(_TaxBreakdownModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaxBreakdownModel() when $default != null:
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
            double taxableAmount,
            double cgst,
            double sgst,
            double igst,
            double totalTax,
            bool isInterState,
            String originState,
            String customerState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TaxBreakdownModel() when $default != null:
        return $default(
            _that.taxableAmount,
            _that.cgst,
            _that.sgst,
            _that.igst,
            _that.totalTax,
            _that.isInterState,
            _that.originState,
            _that.customerState);
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
            double taxableAmount,
            double cgst,
            double sgst,
            double igst,
            double totalTax,
            bool isInterState,
            String originState,
            String customerState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaxBreakdownModel():
        return $default(
            _that.taxableAmount,
            _that.cgst,
            _that.sgst,
            _that.igst,
            _that.totalTax,
            _that.isInterState,
            _that.originState,
            _that.customerState);
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
            double taxableAmount,
            double cgst,
            double sgst,
            double igst,
            double totalTax,
            bool isInterState,
            String originState,
            String customerState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TaxBreakdownModel() when $default != null:
        return $default(
            _that.taxableAmount,
            _that.cgst,
            _that.sgst,
            _that.igst,
            _that.totalTax,
            _that.isInterState,
            _that.originState,
            _that.customerState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TaxBreakdownModel extends TaxBreakdownModel {
  const _TaxBreakdownModel(
      {this.taxableAmount = 0.0,
      this.cgst = 0.0,
      this.sgst = 0.0,
      this.igst = 0.0,
      this.totalTax = 0.0,
      this.isInterState = false,
      this.originState = 'KARNATAKA',
      this.customerState = ''})
      : super._();

  @override
  @JsonKey()
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
  @JsonKey()
  final double totalTax;
  @override
  @JsonKey()
  final bool isInterState;
  @override
  @JsonKey()
  final String originState;
  @override
  @JsonKey()
  final String customerState;

  /// Create a copy of TaxBreakdownModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaxBreakdownModelCopyWith<_TaxBreakdownModel> get copyWith =>
      __$TaxBreakdownModelCopyWithImpl<_TaxBreakdownModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaxBreakdownModel &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.igst, igst) || other.igst == igst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.isInterState, isInterState) ||
                other.isInterState == isInterState) &&
            (identical(other.originState, originState) ||
                other.originState == originState) &&
            (identical(other.customerState, customerState) ||
                other.customerState == customerState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taxableAmount, cgst, sgst, igst,
      totalTax, isInterState, originState, customerState);

  @override
  String toString() {
    return 'TaxBreakdownModel(taxableAmount: $taxableAmount, cgst: $cgst, sgst: $sgst, igst: $igst, totalTax: $totalTax, isInterState: $isInterState, originState: $originState, customerState: $customerState)';
  }
}

/// @nodoc
abstract mixin class _$TaxBreakdownModelCopyWith<$Res>
    implements $TaxBreakdownModelCopyWith<$Res> {
  factory _$TaxBreakdownModelCopyWith(
          _TaxBreakdownModel value, $Res Function(_TaxBreakdownModel) _then) =
      __$TaxBreakdownModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double taxableAmount,
      double cgst,
      double sgst,
      double igst,
      double totalTax,
      bool isInterState,
      String originState,
      String customerState});
}

/// @nodoc
class __$TaxBreakdownModelCopyWithImpl<$Res>
    implements _$TaxBreakdownModelCopyWith<$Res> {
  __$TaxBreakdownModelCopyWithImpl(this._self, this._then);

  final _TaxBreakdownModel _self;
  final $Res Function(_TaxBreakdownModel) _then;

  /// Create a copy of TaxBreakdownModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taxableAmount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? igst = null,
    Object? totalTax = null,
    Object? isInterState = null,
    Object? originState = null,
    Object? customerState = null,
  }) {
    return _then(_TaxBreakdownModel(
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
      isInterState: null == isInterState
          ? _self.isInterState
          : isInterState // ignore: cast_nullable_to_non_nullable
              as bool,
      originState: null == originState
          ? _self.originState
          : originState // ignore: cast_nullable_to_non_nullable
              as String,
      customerState: null == customerState
          ? _self.customerState
          : customerState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
