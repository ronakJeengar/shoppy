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
mixin _$PaymentMethodOptionModel {
  String get type;
  String get name;
  bool get available;
  double get fee;
  double get standardFee;
  bool get isFeeFree;
  String? get reasonCode;
  String? get message;
  double? get freeAboveAmount;
  double? get minOrderValue;
  double? get maxOrderValue;

  /// Create a copy of PaymentMethodOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentMethodOptionModelCopyWith<PaymentMethodOptionModel> get copyWith =>
      _$PaymentMethodOptionModelCopyWithImpl<PaymentMethodOptionModel>(
          this as PaymentMethodOptionModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentMethodOptionModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.standardFee, standardFee) ||
                other.standardFee == standardFee) &&
            (identical(other.isFeeFree, isFeeFree) ||
                other.isFeeFree == isFeeFree) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.freeAboveAmount, freeAboveAmount) ||
                other.freeAboveAmount == freeAboveAmount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      name,
      available,
      fee,
      standardFee,
      isFeeFree,
      reasonCode,
      message,
      freeAboveAmount,
      minOrderValue,
      maxOrderValue);

  @override
  String toString() {
    return 'PaymentMethodOptionModel(type: $type, name: $name, available: $available, fee: $fee, standardFee: $standardFee, isFeeFree: $isFeeFree, reasonCode: $reasonCode, message: $message, freeAboveAmount: $freeAboveAmount, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue)';
  }
}

/// @nodoc
abstract mixin class $PaymentMethodOptionModelCopyWith<$Res> {
  factory $PaymentMethodOptionModelCopyWith(PaymentMethodOptionModel value,
          $Res Function(PaymentMethodOptionModel) _then) =
      _$PaymentMethodOptionModelCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      String name,
      bool available,
      double fee,
      double standardFee,
      bool isFeeFree,
      String? reasonCode,
      String? message,
      double? freeAboveAmount,
      double? minOrderValue,
      double? maxOrderValue});
}

/// @nodoc
class _$PaymentMethodOptionModelCopyWithImpl<$Res>
    implements $PaymentMethodOptionModelCopyWith<$Res> {
  _$PaymentMethodOptionModelCopyWithImpl(this._self, this._then);

  final PaymentMethodOptionModel _self;
  final $Res Function(PaymentMethodOptionModel) _then;

  /// Create a copy of PaymentMethodOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? available = null,
    Object? fee = null,
    Object? standardFee = null,
    Object? isFeeFree = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? freeAboveAmount = freezed,
    Object? minOrderValue = freezed,
    Object? maxOrderValue = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      standardFee: null == standardFee
          ? _self.standardFee
          : standardFee // ignore: cast_nullable_to_non_nullable
              as double,
      isFeeFree: null == isFeeFree
          ? _self.isFeeFree
          : isFeeFree // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freeAboveAmount: freezed == freeAboveAmount
          ? _self.freeAboveAmount
          : freeAboveAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minOrderValue: freezed == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxOrderValue: freezed == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentMethodOptionModel].
extension PaymentMethodOptionModelPatterns on PaymentMethodOptionModel {
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
    TResult Function(_PaymentMethodOptionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentMethodOptionModel() when $default != null:
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
    TResult Function(_PaymentMethodOptionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethodOptionModel():
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
    TResult? Function(_PaymentMethodOptionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethodOptionModel() when $default != null:
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
            String type,
            String name,
            bool available,
            double fee,
            double standardFee,
            bool isFeeFree,
            String? reasonCode,
            String? message,
            double? freeAboveAmount,
            double? minOrderValue,
            double? maxOrderValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentMethodOptionModel() when $default != null:
        return $default(
            _that.type,
            _that.name,
            _that.available,
            _that.fee,
            _that.standardFee,
            _that.isFeeFree,
            _that.reasonCode,
            _that.message,
            _that.freeAboveAmount,
            _that.minOrderValue,
            _that.maxOrderValue);
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
            String type,
            String name,
            bool available,
            double fee,
            double standardFee,
            bool isFeeFree,
            String? reasonCode,
            String? message,
            double? freeAboveAmount,
            double? minOrderValue,
            double? maxOrderValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethodOptionModel():
        return $default(
            _that.type,
            _that.name,
            _that.available,
            _that.fee,
            _that.standardFee,
            _that.isFeeFree,
            _that.reasonCode,
            _that.message,
            _that.freeAboveAmount,
            _that.minOrderValue,
            _that.maxOrderValue);
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
            String type,
            String name,
            bool available,
            double fee,
            double standardFee,
            bool isFeeFree,
            String? reasonCode,
            String? message,
            double? freeAboveAmount,
            double? minOrderValue,
            double? maxOrderValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMethodOptionModel() when $default != null:
        return $default(
            _that.type,
            _that.name,
            _that.available,
            _that.fee,
            _that.standardFee,
            _that.isFeeFree,
            _that.reasonCode,
            _that.message,
            _that.freeAboveAmount,
            _that.minOrderValue,
            _that.maxOrderValue);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaymentMethodOptionModel implements PaymentMethodOptionModel {
  const _PaymentMethodOptionModel(
      {required this.type,
      required this.name,
      required this.available,
      this.fee = 0.0,
      this.standardFee = 0.0,
      this.isFeeFree = false,
      this.reasonCode,
      this.message,
      this.freeAboveAmount,
      this.minOrderValue,
      this.maxOrderValue});

  @override
  final String type;
  @override
  final String name;
  @override
  final bool available;
  @override
  @JsonKey()
  final double fee;
  @override
  @JsonKey()
  final double standardFee;
  @override
  @JsonKey()
  final bool isFeeFree;
  @override
  final String? reasonCode;
  @override
  final String? message;
  @override
  final double? freeAboveAmount;
  @override
  final double? minOrderValue;
  @override
  final double? maxOrderValue;

  /// Create a copy of PaymentMethodOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentMethodOptionModelCopyWith<_PaymentMethodOptionModel> get copyWith =>
      __$PaymentMethodOptionModelCopyWithImpl<_PaymentMethodOptionModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentMethodOptionModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.standardFee, standardFee) ||
                other.standardFee == standardFee) &&
            (identical(other.isFeeFree, isFeeFree) ||
                other.isFeeFree == isFeeFree) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.freeAboveAmount, freeAboveAmount) ||
                other.freeAboveAmount == freeAboveAmount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      name,
      available,
      fee,
      standardFee,
      isFeeFree,
      reasonCode,
      message,
      freeAboveAmount,
      minOrderValue,
      maxOrderValue);

  @override
  String toString() {
    return 'PaymentMethodOptionModel(type: $type, name: $name, available: $available, fee: $fee, standardFee: $standardFee, isFeeFree: $isFeeFree, reasonCode: $reasonCode, message: $message, freeAboveAmount: $freeAboveAmount, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue)';
  }
}

/// @nodoc
abstract mixin class _$PaymentMethodOptionModelCopyWith<$Res>
    implements $PaymentMethodOptionModelCopyWith<$Res> {
  factory _$PaymentMethodOptionModelCopyWith(_PaymentMethodOptionModel value,
          $Res Function(_PaymentMethodOptionModel) _then) =
      __$PaymentMethodOptionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      String name,
      bool available,
      double fee,
      double standardFee,
      bool isFeeFree,
      String? reasonCode,
      String? message,
      double? freeAboveAmount,
      double? minOrderValue,
      double? maxOrderValue});
}

/// @nodoc
class __$PaymentMethodOptionModelCopyWithImpl<$Res>
    implements _$PaymentMethodOptionModelCopyWith<$Res> {
  __$PaymentMethodOptionModelCopyWithImpl(this._self, this._then);

  final _PaymentMethodOptionModel _self;
  final $Res Function(_PaymentMethodOptionModel) _then;

  /// Create a copy of PaymentMethodOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? available = null,
    Object? fee = null,
    Object? standardFee = null,
    Object? isFeeFree = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? freeAboveAmount = freezed,
    Object? minOrderValue = freezed,
    Object? maxOrderValue = freezed,
  }) {
    return _then(_PaymentMethodOptionModel(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      standardFee: null == standardFee
          ? _self.standardFee
          : standardFee // ignore: cast_nullable_to_non_nullable
              as double,
      isFeeFree: null == isFeeFree
          ? _self.isFeeFree
          : isFeeFree // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freeAboveAmount: freezed == freeAboveAmount
          ? _self.freeAboveAmount
          : freeAboveAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minOrderValue: freezed == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxOrderValue: freezed == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$CodDetailsModel {
  bool get isCod;
  double get fee;
  double get standardFee;
  bool get isFeeFree;
  double get freeAboveAmount;
  double get minOrderValue;
  double get maxOrderValue;
  bool get isEligible;
  String? get reasonCode;
  String? get message;
  List<String> get eligibleShippingZones;

  /// Create a copy of CodDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CodDetailsModelCopyWith<CodDetailsModel> get copyWith =>
      _$CodDetailsModelCopyWithImpl<CodDetailsModel>(
          this as CodDetailsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CodDetailsModel &&
            (identical(other.isCod, isCod) || other.isCod == isCod) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.standardFee, standardFee) ||
                other.standardFee == standardFee) &&
            (identical(other.isFeeFree, isFeeFree) ||
                other.isFeeFree == isFeeFree) &&
            (identical(other.freeAboveAmount, freeAboveAmount) ||
                other.freeAboveAmount == freeAboveAmount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue) &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.eligibleShippingZones, eligibleShippingZones));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isCod,
      fee,
      standardFee,
      isFeeFree,
      freeAboveAmount,
      minOrderValue,
      maxOrderValue,
      isEligible,
      reasonCode,
      message,
      const DeepCollectionEquality().hash(eligibleShippingZones));

  @override
  String toString() {
    return 'CodDetailsModel(isCod: $isCod, fee: $fee, standardFee: $standardFee, isFeeFree: $isFeeFree, freeAboveAmount: $freeAboveAmount, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue, isEligible: $isEligible, reasonCode: $reasonCode, message: $message, eligibleShippingZones: $eligibleShippingZones)';
  }
}

/// @nodoc
abstract mixin class $CodDetailsModelCopyWith<$Res> {
  factory $CodDetailsModelCopyWith(
          CodDetailsModel value, $Res Function(CodDetailsModel) _then) =
      _$CodDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {bool isCod,
      double fee,
      double standardFee,
      bool isFeeFree,
      double freeAboveAmount,
      double minOrderValue,
      double maxOrderValue,
      bool isEligible,
      String? reasonCode,
      String? message,
      List<String> eligibleShippingZones});
}

/// @nodoc
class _$CodDetailsModelCopyWithImpl<$Res>
    implements $CodDetailsModelCopyWith<$Res> {
  _$CodDetailsModelCopyWithImpl(this._self, this._then);

  final CodDetailsModel _self;
  final $Res Function(CodDetailsModel) _then;

  /// Create a copy of CodDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCod = null,
    Object? fee = null,
    Object? standardFee = null,
    Object? isFeeFree = null,
    Object? freeAboveAmount = null,
    Object? minOrderValue = null,
    Object? maxOrderValue = null,
    Object? isEligible = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? eligibleShippingZones = null,
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
      standardFee: null == standardFee
          ? _self.standardFee
          : standardFee // ignore: cast_nullable_to_non_nullable
              as double,
      isFeeFree: null == isFeeFree
          ? _self.isFeeFree
          : isFeeFree // ignore: cast_nullable_to_non_nullable
              as bool,
      freeAboveAmount: null == freeAboveAmount
          ? _self.freeAboveAmount
          : freeAboveAmount // ignore: cast_nullable_to_non_nullable
              as double,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxOrderValue: null == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      isEligible: null == isEligible
          ? _self.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      eligibleShippingZones: null == eligibleShippingZones
          ? _self.eligibleShippingZones
          : eligibleShippingZones // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CodDetailsModel].
extension CodDetailsModelPatterns on CodDetailsModel {
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
    TResult Function(_CodDetailsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CodDetailsModel() when $default != null:
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
    TResult Function(_CodDetailsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodDetailsModel():
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
    TResult? Function(_CodDetailsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodDetailsModel() when $default != null:
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
            bool isCod,
            double fee,
            double standardFee,
            bool isFeeFree,
            double freeAboveAmount,
            double minOrderValue,
            double maxOrderValue,
            bool isEligible,
            String? reasonCode,
            String? message,
            List<String> eligibleShippingZones)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CodDetailsModel() when $default != null:
        return $default(
            _that.isCod,
            _that.fee,
            _that.standardFee,
            _that.isFeeFree,
            _that.freeAboveAmount,
            _that.minOrderValue,
            _that.maxOrderValue,
            _that.isEligible,
            _that.reasonCode,
            _that.message,
            _that.eligibleShippingZones);
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
            bool isCod,
            double fee,
            double standardFee,
            bool isFeeFree,
            double freeAboveAmount,
            double minOrderValue,
            double maxOrderValue,
            bool isEligible,
            String? reasonCode,
            String? message,
            List<String> eligibleShippingZones)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodDetailsModel():
        return $default(
            _that.isCod,
            _that.fee,
            _that.standardFee,
            _that.isFeeFree,
            _that.freeAboveAmount,
            _that.minOrderValue,
            _that.maxOrderValue,
            _that.isEligible,
            _that.reasonCode,
            _that.message,
            _that.eligibleShippingZones);
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
            bool isCod,
            double fee,
            double standardFee,
            bool isFeeFree,
            double freeAboveAmount,
            double minOrderValue,
            double maxOrderValue,
            bool isEligible,
            String? reasonCode,
            String? message,
            List<String> eligibleShippingZones)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodDetailsModel() when $default != null:
        return $default(
            _that.isCod,
            _that.fee,
            _that.standardFee,
            _that.isFeeFree,
            _that.freeAboveAmount,
            _that.minOrderValue,
            _that.maxOrderValue,
            _that.isEligible,
            _that.reasonCode,
            _that.message,
            _that.eligibleShippingZones);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CodDetailsModel implements CodDetailsModel {
  const _CodDetailsModel(
      {this.isCod = false,
      this.fee = 0.0,
      this.standardFee = 0.0,
      this.isFeeFree = false,
      this.freeAboveAmount = 1499.0,
      this.minOrderValue = 299.0,
      this.maxOrderValue = 50000.0,
      this.isEligible = true,
      this.reasonCode,
      this.message,
      final List<String> eligibleShippingZones = const []})
      : _eligibleShippingZones = eligibleShippingZones;

  @override
  @JsonKey()
  final bool isCod;
  @override
  @JsonKey()
  final double fee;
  @override
  @JsonKey()
  final double standardFee;
  @override
  @JsonKey()
  final bool isFeeFree;
  @override
  @JsonKey()
  final double freeAboveAmount;
  @override
  @JsonKey()
  final double minOrderValue;
  @override
  @JsonKey()
  final double maxOrderValue;
  @override
  @JsonKey()
  final bool isEligible;
  @override
  final String? reasonCode;
  @override
  final String? message;
  final List<String> _eligibleShippingZones;
  @override
  @JsonKey()
  List<String> get eligibleShippingZones {
    if (_eligibleShippingZones is EqualUnmodifiableListView)
      return _eligibleShippingZones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eligibleShippingZones);
  }

  /// Create a copy of CodDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CodDetailsModelCopyWith<_CodDetailsModel> get copyWith =>
      __$CodDetailsModelCopyWithImpl<_CodDetailsModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CodDetailsModel &&
            (identical(other.isCod, isCod) || other.isCod == isCod) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.standardFee, standardFee) ||
                other.standardFee == standardFee) &&
            (identical(other.isFeeFree, isFeeFree) ||
                other.isFeeFree == isFeeFree) &&
            (identical(other.freeAboveAmount, freeAboveAmount) ||
                other.freeAboveAmount == freeAboveAmount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue) &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._eligibleShippingZones, _eligibleShippingZones));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isCod,
      fee,
      standardFee,
      isFeeFree,
      freeAboveAmount,
      minOrderValue,
      maxOrderValue,
      isEligible,
      reasonCode,
      message,
      const DeepCollectionEquality().hash(_eligibleShippingZones));

  @override
  String toString() {
    return 'CodDetailsModel(isCod: $isCod, fee: $fee, standardFee: $standardFee, isFeeFree: $isFeeFree, freeAboveAmount: $freeAboveAmount, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue, isEligible: $isEligible, reasonCode: $reasonCode, message: $message, eligibleShippingZones: $eligibleShippingZones)';
  }
}

/// @nodoc
abstract mixin class _$CodDetailsModelCopyWith<$Res>
    implements $CodDetailsModelCopyWith<$Res> {
  factory _$CodDetailsModelCopyWith(
          _CodDetailsModel value, $Res Function(_CodDetailsModel) _then) =
      __$CodDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isCod,
      double fee,
      double standardFee,
      bool isFeeFree,
      double freeAboveAmount,
      double minOrderValue,
      double maxOrderValue,
      bool isEligible,
      String? reasonCode,
      String? message,
      List<String> eligibleShippingZones});
}

/// @nodoc
class __$CodDetailsModelCopyWithImpl<$Res>
    implements _$CodDetailsModelCopyWith<$Res> {
  __$CodDetailsModelCopyWithImpl(this._self, this._then);

  final _CodDetailsModel _self;
  final $Res Function(_CodDetailsModel) _then;

  /// Create a copy of CodDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isCod = null,
    Object? fee = null,
    Object? standardFee = null,
    Object? isFeeFree = null,
    Object? freeAboveAmount = null,
    Object? minOrderValue = null,
    Object? maxOrderValue = null,
    Object? isEligible = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? eligibleShippingZones = null,
  }) {
    return _then(_CodDetailsModel(
      isCod: null == isCod
          ? _self.isCod
          : isCod // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      standardFee: null == standardFee
          ? _self.standardFee
          : standardFee // ignore: cast_nullable_to_non_nullable
              as double,
      isFeeFree: null == isFeeFree
          ? _self.isFeeFree
          : isFeeFree // ignore: cast_nullable_to_non_nullable
              as bool,
      freeAboveAmount: null == freeAboveAmount
          ? _self.freeAboveAmount
          : freeAboveAmount // ignore: cast_nullable_to_non_nullable
              as double,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxOrderValue: null == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      isEligible: null == isEligible
          ? _self.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      eligibleShippingZones: null == eligibleShippingZones
          ? _self._eligibleShippingZones
          : eligibleShippingZones // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

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
  double get codFee;
  CodDetailsModel? get codDetails;
  List<PaymentMethodOptionModel> get paymentMethods;

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
                .equals(other.shippingDetails, shippingDetails) &&
            (identical(other.codFee, codFee) || other.codFee == codFee) &&
            (identical(other.codDetails, codDetails) ||
                other.codDetails == codDetails) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethods, paymentMethods));
  }

  @override
  int get hashCode => Object.hashAll([
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
        const DeepCollectionEquality().hash(shippingDetails),
        codFee,
        codDetails,
        const DeepCollectionEquality().hash(paymentMethods)
      ]);

  @override
  String toString() {
    return 'CheckoutValidationModel(valid: $valid, items: $items, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal, taxableAmount: $taxableAmount, discount: $discount, currency: $currency, currencySymbol: $currencySymbol, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin, deliveryWindow: $deliveryWindow, isFreeShipping: $isFreeShipping, shippingDetails: $shippingDetails, codFee: $codFee, codDetails: $codDetails, paymentMethods: $paymentMethods)';
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
      Map<String, dynamic>? shippingDetails,
      double codFee,
      CodDetailsModel? codDetails,
      List<PaymentMethodOptionModel> paymentMethods});

  $AddressModelCopyWith<$Res>? get shippingAddress;
  $TaxBreakdownModelCopyWith<$Res>? get taxBreakdown;
  $CodDetailsModelCopyWith<$Res>? get codDetails;
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
    Object? codFee = null,
    Object? codDetails = freezed,
    Object? paymentMethods = null,
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
      codFee: null == codFee
          ? _self.codFee
          : codFee // ignore: cast_nullable_to_non_nullable
              as double,
      codDetails: freezed == codDetails
          ? _self.codDetails
          : codDetails // ignore: cast_nullable_to_non_nullable
              as CodDetailsModel?,
      paymentMethods: null == paymentMethods
          ? _self.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodOptionModel>,
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

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodDetailsModelCopyWith<$Res>? get codDetails {
    if (_self.codDetails == null) {
      return null;
    }

    return $CodDetailsModelCopyWith<$Res>(_self.codDetails!, (value) {
      return _then(_self.copyWith(codDetails: value));
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
            Map<String, dynamic>? shippingDetails,
            double codFee,
            CodDetailsModel? codDetails,
            List<PaymentMethodOptionModel> paymentMethods)?
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
            _that.shippingDetails,
            _that.codFee,
            _that.codDetails,
            _that.paymentMethods);
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
            Map<String, dynamic>? shippingDetails,
            double codFee,
            CodDetailsModel? codDetails,
            List<PaymentMethodOptionModel> paymentMethods)
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
            _that.shippingDetails,
            _that.codFee,
            _that.codDetails,
            _that.paymentMethods);
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
            Map<String, dynamic>? shippingDetails,
            double codFee,
            CodDetailsModel? codDetails,
            List<PaymentMethodOptionModel> paymentMethods)?
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
            _that.shippingDetails,
            _that.codFee,
            _that.codDetails,
            _that.paymentMethods);
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
      final Map<String, dynamic>? shippingDetails,
      this.codFee = 0.0,
      this.codDetails,
      final List<PaymentMethodOptionModel> paymentMethods = const []})
      : _items = items,
        _shippingDetails = shippingDetails,
        _paymentMethods = paymentMethods;

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

  @override
  @JsonKey()
  final double codFee;
  @override
  final CodDetailsModel? codDetails;
  final List<PaymentMethodOptionModel> _paymentMethods;
  @override
  @JsonKey()
  List<PaymentMethodOptionModel> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
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
                .equals(other._shippingDetails, _shippingDetails) &&
            (identical(other.codFee, codFee) || other.codFee == codFee) &&
            (identical(other.codDetails, codDetails) ||
                other.codDetails == codDetails) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods));
  }

  @override
  int get hashCode => Object.hashAll([
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
        const DeepCollectionEquality().hash(_shippingDetails),
        codFee,
        codDetails,
        const DeepCollectionEquality().hash(_paymentMethods)
      ]);

  @override
  String toString() {
    return 'CheckoutValidationModel(valid: $valid, items: $items, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, grandTotal: $grandTotal, taxableAmount: $taxableAmount, discount: $discount, currency: $currency, currencySymbol: $currencySymbol, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin, deliveryWindow: $deliveryWindow, isFreeShipping: $isFreeShipping, shippingDetails: $shippingDetails, codFee: $codFee, codDetails: $codDetails, paymentMethods: $paymentMethods)';
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
      Map<String, dynamic>? shippingDetails,
      double codFee,
      CodDetailsModel? codDetails,
      List<PaymentMethodOptionModel> paymentMethods});

  @override
  $AddressModelCopyWith<$Res>? get shippingAddress;
  @override
  $TaxBreakdownModelCopyWith<$Res>? get taxBreakdown;
  @override
  $CodDetailsModelCopyWith<$Res>? get codDetails;
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
    Object? codFee = null,
    Object? codDetails = freezed,
    Object? paymentMethods = null,
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
      codFee: null == codFee
          ? _self.codFee
          : codFee // ignore: cast_nullable_to_non_nullable
              as double,
      codDetails: freezed == codDetails
          ? _self.codDetails
          : codDetails // ignore: cast_nullable_to_non_nullable
              as CodDetailsModel?,
      paymentMethods: null == paymentMethods
          ? _self._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodOptionModel>,
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

  /// Create a copy of CheckoutValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodDetailsModelCopyWith<$Res>? get codDetails {
    if (_self.codDetails == null) {
      return null;
    }

    return $CodDetailsModelCopyWith<$Res>(_self.codDetails!, (value) {
      return _then(_self.copyWith(codDetails: value));
    });
  }
}

// dart format on
