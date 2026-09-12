// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppliedCouponModel {
  String get code;
  String get name;
  String get description;
  String get discountType;
  double get discountValue;
  double get discountAmount;
  DateTime? get expiresAt;

  /// Create a copy of AppliedCouponModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppliedCouponModelCopyWith<AppliedCouponModel> get copyWith =>
      _$AppliedCouponModelCopyWithImpl<AppliedCouponModel>(
          this as AppliedCouponModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppliedCouponModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, name, description,
      discountType, discountValue, discountAmount, expiresAt);

  @override
  String toString() {
    return 'AppliedCouponModel(code: $code, name: $name, description: $description, discountType: $discountType, discountValue: $discountValue, discountAmount: $discountAmount, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class $AppliedCouponModelCopyWith<$Res> {
  factory $AppliedCouponModelCopyWith(
          AppliedCouponModel value, $Res Function(AppliedCouponModel) _then) =
      _$AppliedCouponModelCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      String name,
      String description,
      String discountType,
      double discountValue,
      double discountAmount,
      DateTime? expiresAt});
}

/// @nodoc
class _$AppliedCouponModelCopyWithImpl<$Res>
    implements $AppliedCouponModelCopyWith<$Res> {
  _$AppliedCouponModelCopyWithImpl(this._self, this._then);

  final AppliedCouponModel _self;
  final $Res Function(AppliedCouponModel) _then;

  /// Create a copy of AppliedCouponModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? discountAmount = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _self.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppliedCouponModel].
extension AppliedCouponModelPatterns on AppliedCouponModel {
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
    TResult Function(_AppliedCouponModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppliedCouponModel() when $default != null:
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
    TResult Function(_AppliedCouponModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppliedCouponModel():
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
    TResult? Function(_AppliedCouponModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppliedCouponModel() when $default != null:
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
            String code,
            String name,
            String description,
            String discountType,
            double discountValue,
            double discountAmount,
            DateTime? expiresAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppliedCouponModel() when $default != null:
        return $default(
            _that.code,
            _that.name,
            _that.description,
            _that.discountType,
            _that.discountValue,
            _that.discountAmount,
            _that.expiresAt);
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
            String code,
            String name,
            String description,
            String discountType,
            double discountValue,
            double discountAmount,
            DateTime? expiresAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppliedCouponModel():
        return $default(
            _that.code,
            _that.name,
            _that.description,
            _that.discountType,
            _that.discountValue,
            _that.discountAmount,
            _that.expiresAt);
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
            String code,
            String name,
            String description,
            String discountType,
            double discountValue,
            double discountAmount,
            DateTime? expiresAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppliedCouponModel() when $default != null:
        return $default(
            _that.code,
            _that.name,
            _that.description,
            _that.discountType,
            _that.discountValue,
            _that.discountAmount,
            _that.expiresAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppliedCouponModel implements AppliedCouponModel {
  const _AppliedCouponModel(
      {required this.code,
      this.name = '',
      this.description = '',
      this.discountType = 'PERCENTAGE',
      this.discountValue = 0.0,
      this.discountAmount = 0.0,
      this.expiresAt});

  @override
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String discountType;
  @override
  @JsonKey()
  final double discountValue;
  @override
  @JsonKey()
  final double discountAmount;
  @override
  final DateTime? expiresAt;

  /// Create a copy of AppliedCouponModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppliedCouponModelCopyWith<_AppliedCouponModel> get copyWith =>
      __$AppliedCouponModelCopyWithImpl<_AppliedCouponModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppliedCouponModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, name, description,
      discountType, discountValue, discountAmount, expiresAt);

  @override
  String toString() {
    return 'AppliedCouponModel(code: $code, name: $name, description: $description, discountType: $discountType, discountValue: $discountValue, discountAmount: $discountAmount, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class _$AppliedCouponModelCopyWith<$Res>
    implements $AppliedCouponModelCopyWith<$Res> {
  factory _$AppliedCouponModelCopyWith(
          _AppliedCouponModel value, $Res Function(_AppliedCouponModel) _then) =
      __$AppliedCouponModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String description,
      String discountType,
      double discountValue,
      double discountAmount,
      DateTime? expiresAt});
}

/// @nodoc
class __$AppliedCouponModelCopyWithImpl<$Res>
    implements _$AppliedCouponModelCopyWith<$Res> {
  __$AppliedCouponModelCopyWithImpl(this._self, this._then);

  final _AppliedCouponModel _self;
  final $Res Function(_AppliedCouponModel) _then;

  /// Create a copy of AppliedCouponModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? discountAmount = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_AppliedCouponModel(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _self.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$CouponModel {
  String get code;
  String get name;
  String get description;
  String get discountType;
  double get discountValue;
  double get minimumOrderValue;
  double? get maximumDiscountAmount;
  DateTime? get expiresAt;
  bool get isActive;
  bool get firstOrderOnly;

  /// Create a copy of CouponModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CouponModelCopyWith<CouponModel> get copyWith =>
      _$CouponModelCopyWithImpl<CouponModel>(this as CouponModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CouponModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue) &&
            (identical(other.maximumDiscountAmount, maximumDiscountAmount) ||
                other.maximumDiscountAmount == maximumDiscountAmount) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.firstOrderOnly, firstOrderOnly) ||
                other.firstOrderOnly == firstOrderOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      description,
      discountType,
      discountValue,
      minimumOrderValue,
      maximumDiscountAmount,
      expiresAt,
      isActive,
      firstOrderOnly);

  @override
  String toString() {
    return 'CouponModel(code: $code, name: $name, description: $description, discountType: $discountType, discountValue: $discountValue, minimumOrderValue: $minimumOrderValue, maximumDiscountAmount: $maximumDiscountAmount, expiresAt: $expiresAt, isActive: $isActive, firstOrderOnly: $firstOrderOnly)';
  }
}

/// @nodoc
abstract mixin class $CouponModelCopyWith<$Res> {
  factory $CouponModelCopyWith(
          CouponModel value, $Res Function(CouponModel) _then) =
      _$CouponModelCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      String name,
      String description,
      String discountType,
      double discountValue,
      double minimumOrderValue,
      double? maximumDiscountAmount,
      DateTime? expiresAt,
      bool isActive,
      bool firstOrderOnly});
}

/// @nodoc
class _$CouponModelCopyWithImpl<$Res> implements $CouponModelCopyWith<$Res> {
  _$CouponModelCopyWithImpl(this._self, this._then);

  final CouponModel _self;
  final $Res Function(CouponModel) _then;

  /// Create a copy of CouponModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? minimumOrderValue = null,
    Object? maximumDiscountAmount = freezed,
    Object? expiresAt = freezed,
    Object? isActive = null,
    Object? firstOrderOnly = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _self.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      minimumOrderValue: null == minimumOrderValue
          ? _self.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maximumDiscountAmount: freezed == maximumDiscountAmount
          ? _self.maximumDiscountAmount
          : maximumDiscountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      firstOrderOnly: null == firstOrderOnly
          ? _self.firstOrderOnly
          : firstOrderOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CouponModel].
extension CouponModelPatterns on CouponModel {
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
    TResult Function(_CouponModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CouponModel() when $default != null:
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
    TResult Function(_CouponModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CouponModel():
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
    TResult? Function(_CouponModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CouponModel() when $default != null:
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
            String code,
            String name,
            String description,
            String discountType,
            double discountValue,
            double minimumOrderValue,
            double? maximumDiscountAmount,
            DateTime? expiresAt,
            bool isActive,
            bool firstOrderOnly)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CouponModel() when $default != null:
        return $default(
            _that.code,
            _that.name,
            _that.description,
            _that.discountType,
            _that.discountValue,
            _that.minimumOrderValue,
            _that.maximumDiscountAmount,
            _that.expiresAt,
            _that.isActive,
            _that.firstOrderOnly);
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
            String code,
            String name,
            String description,
            String discountType,
            double discountValue,
            double minimumOrderValue,
            double? maximumDiscountAmount,
            DateTime? expiresAt,
            bool isActive,
            bool firstOrderOnly)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CouponModel():
        return $default(
            _that.code,
            _that.name,
            _that.description,
            _that.discountType,
            _that.discountValue,
            _that.minimumOrderValue,
            _that.maximumDiscountAmount,
            _that.expiresAt,
            _that.isActive,
            _that.firstOrderOnly);
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
            String code,
            String name,
            String description,
            String discountType,
            double discountValue,
            double minimumOrderValue,
            double? maximumDiscountAmount,
            DateTime? expiresAt,
            bool isActive,
            bool firstOrderOnly)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CouponModel() when $default != null:
        return $default(
            _that.code,
            _that.name,
            _that.description,
            _that.discountType,
            _that.discountValue,
            _that.minimumOrderValue,
            _that.maximumDiscountAmount,
            _that.expiresAt,
            _that.isActive,
            _that.firstOrderOnly);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CouponModel implements CouponModel {
  const _CouponModel(
      {required this.code,
      required this.name,
      this.description = '',
      required this.discountType,
      required this.discountValue,
      this.minimumOrderValue = 0.0,
      this.maximumDiscountAmount,
      this.expiresAt,
      this.isActive = true,
      this.firstOrderOnly = false});

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final String discountType;
  @override
  final double discountValue;
  @override
  @JsonKey()
  final double minimumOrderValue;
  @override
  final double? maximumDiscountAmount;
  @override
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool firstOrderOnly;

  /// Create a copy of CouponModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CouponModelCopyWith<_CouponModel> get copyWith =>
      __$CouponModelCopyWithImpl<_CouponModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CouponModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue) &&
            (identical(other.maximumDiscountAmount, maximumDiscountAmount) ||
                other.maximumDiscountAmount == maximumDiscountAmount) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.firstOrderOnly, firstOrderOnly) ||
                other.firstOrderOnly == firstOrderOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      description,
      discountType,
      discountValue,
      minimumOrderValue,
      maximumDiscountAmount,
      expiresAt,
      isActive,
      firstOrderOnly);

  @override
  String toString() {
    return 'CouponModel(code: $code, name: $name, description: $description, discountType: $discountType, discountValue: $discountValue, minimumOrderValue: $minimumOrderValue, maximumDiscountAmount: $maximumDiscountAmount, expiresAt: $expiresAt, isActive: $isActive, firstOrderOnly: $firstOrderOnly)';
  }
}

/// @nodoc
abstract mixin class _$CouponModelCopyWith<$Res>
    implements $CouponModelCopyWith<$Res> {
  factory _$CouponModelCopyWith(
          _CouponModel value, $Res Function(_CouponModel) _then) =
      __$CouponModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String description,
      String discountType,
      double discountValue,
      double minimumOrderValue,
      double? maximumDiscountAmount,
      DateTime? expiresAt,
      bool isActive,
      bool firstOrderOnly});
}

/// @nodoc
class __$CouponModelCopyWithImpl<$Res> implements _$CouponModelCopyWith<$Res> {
  __$CouponModelCopyWithImpl(this._self, this._then);

  final _CouponModel _self;
  final $Res Function(_CouponModel) _then;

  /// Create a copy of CouponModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? minimumOrderValue = null,
    Object? maximumDiscountAmount = freezed,
    Object? expiresAt = freezed,
    Object? isActive = null,
    Object? firstOrderOnly = null,
  }) {
    return _then(_CouponModel(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _self.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      minimumOrderValue: null == minimumOrderValue
          ? _self.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maximumDiscountAmount: freezed == maximumDiscountAmount
          ? _self.maximumDiscountAmount
          : maximumDiscountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      firstOrderOnly: null == firstOrderOnly
          ? _self.firstOrderOnly
          : firstOrderOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
