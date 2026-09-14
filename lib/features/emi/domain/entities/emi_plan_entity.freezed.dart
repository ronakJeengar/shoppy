// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emi_plan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmiTenureEntity {
  String get tenureId;
  int get months;
  double get interestRate;
  bool get isNoCost;
  double get processingFee;
  String get processingFeeType;
  double get monthlyInstallment;
  double get totalInterest;
  double get totalRepaid;
  double get totalPayable;

  /// Create a copy of EmiTenureEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiTenureEntityCopyWith<EmiTenureEntity> get copyWith =>
      _$EmiTenureEntityCopyWithImpl<EmiTenureEntity>(
          this as EmiTenureEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiTenureEntity &&
            (identical(other.tenureId, tenureId) ||
                other.tenureId == tenureId) &&
            (identical(other.months, months) || other.months == months) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.isNoCost, isNoCost) ||
                other.isNoCost == isNoCost) &&
            (identical(other.processingFee, processingFee) ||
                other.processingFee == processingFee) &&
            (identical(other.processingFeeType, processingFeeType) ||
                other.processingFeeType == processingFeeType) &&
            (identical(other.monthlyInstallment, monthlyInstallment) ||
                other.monthlyInstallment == monthlyInstallment) &&
            (identical(other.totalInterest, totalInterest) ||
                other.totalInterest == totalInterest) &&
            (identical(other.totalRepaid, totalRepaid) ||
                other.totalRepaid == totalRepaid) &&
            (identical(other.totalPayable, totalPayable) ||
                other.totalPayable == totalPayable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      tenureId,
      months,
      interestRate,
      isNoCost,
      processingFee,
      processingFeeType,
      monthlyInstallment,
      totalInterest,
      totalRepaid,
      totalPayable);

  @override
  String toString() {
    return 'EmiTenureEntity(tenureId: $tenureId, months: $months, interestRate: $interestRate, isNoCost: $isNoCost, processingFee: $processingFee, processingFeeType: $processingFeeType, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalRepaid: $totalRepaid, totalPayable: $totalPayable)';
  }
}

/// @nodoc
abstract mixin class $EmiTenureEntityCopyWith<$Res> {
  factory $EmiTenureEntityCopyWith(
          EmiTenureEntity value, $Res Function(EmiTenureEntity) _then) =
      _$EmiTenureEntityCopyWithImpl;
  @useResult
  $Res call(
      {String tenureId,
      int months,
      double interestRate,
      bool isNoCost,
      double processingFee,
      String processingFeeType,
      double monthlyInstallment,
      double totalInterest,
      double totalRepaid,
      double totalPayable});
}

/// @nodoc
class _$EmiTenureEntityCopyWithImpl<$Res>
    implements $EmiTenureEntityCopyWith<$Res> {
  _$EmiTenureEntityCopyWithImpl(this._self, this._then);

  final EmiTenureEntity _self;
  final $Res Function(EmiTenureEntity) _then;

  /// Create a copy of EmiTenureEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenureId = null,
    Object? months = null,
    Object? interestRate = null,
    Object? isNoCost = null,
    Object? processingFee = null,
    Object? processingFeeType = null,
    Object? monthlyInstallment = null,
    Object? totalInterest = null,
    Object? totalRepaid = null,
    Object? totalPayable = null,
  }) {
    return _then(_self.copyWith(
      tenureId: null == tenureId
          ? _self.tenureId
          : tenureId // ignore: cast_nullable_to_non_nullable
              as String,
      months: null == months
          ? _self.months
          : months // ignore: cast_nullable_to_non_nullable
              as int,
      interestRate: null == interestRate
          ? _self.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      isNoCost: null == isNoCost
          ? _self.isNoCost
          : isNoCost // ignore: cast_nullable_to_non_nullable
              as bool,
      processingFee: null == processingFee
          ? _self.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as double,
      processingFeeType: null == processingFeeType
          ? _self.processingFeeType
          : processingFeeType // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyInstallment: null == monthlyInstallment
          ? _self.monthlyInstallment
          : monthlyInstallment // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterest: null == totalInterest
          ? _self.totalInterest
          : totalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      totalRepaid: null == totalRepaid
          ? _self.totalRepaid
          : totalRepaid // ignore: cast_nullable_to_non_nullable
              as double,
      totalPayable: null == totalPayable
          ? _self.totalPayable
          : totalPayable // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiTenureEntity].
extension EmiTenureEntityPatterns on EmiTenureEntity {
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
    TResult Function(_EmiTenureEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiTenureEntity() when $default != null:
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
    TResult Function(_EmiTenureEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiTenureEntity():
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
    TResult? Function(_EmiTenureEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiTenureEntity() when $default != null:
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
            String tenureId,
            int months,
            double interestRate,
            bool isNoCost,
            double processingFee,
            String processingFeeType,
            double monthlyInstallment,
            double totalInterest,
            double totalRepaid,
            double totalPayable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiTenureEntity() when $default != null:
        return $default(
            _that.tenureId,
            _that.months,
            _that.interestRate,
            _that.isNoCost,
            _that.processingFee,
            _that.processingFeeType,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.totalRepaid,
            _that.totalPayable);
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
            String tenureId,
            int months,
            double interestRate,
            bool isNoCost,
            double processingFee,
            String processingFeeType,
            double monthlyInstallment,
            double totalInterest,
            double totalRepaid,
            double totalPayable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiTenureEntity():
        return $default(
            _that.tenureId,
            _that.months,
            _that.interestRate,
            _that.isNoCost,
            _that.processingFee,
            _that.processingFeeType,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.totalRepaid,
            _that.totalPayable);
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
            String tenureId,
            int months,
            double interestRate,
            bool isNoCost,
            double processingFee,
            String processingFeeType,
            double monthlyInstallment,
            double totalInterest,
            double totalRepaid,
            double totalPayable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiTenureEntity() when $default != null:
        return $default(
            _that.tenureId,
            _that.months,
            _that.interestRate,
            _that.isNoCost,
            _that.processingFee,
            _that.processingFeeType,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.totalRepaid,
            _that.totalPayable);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiTenureEntity implements EmiTenureEntity {
  const _EmiTenureEntity(
      {required this.tenureId,
      required this.months,
      required this.interestRate,
      this.isNoCost = false,
      this.processingFee = 0.0,
      this.processingFeeType = 'FIXED',
      this.monthlyInstallment = 0.0,
      this.totalInterest = 0.0,
      this.totalRepaid = 0.0,
      this.totalPayable = 0.0});

  @override
  final String tenureId;
  @override
  final int months;
  @override
  final double interestRate;
  @override
  @JsonKey()
  final bool isNoCost;
  @override
  @JsonKey()
  final double processingFee;
  @override
  @JsonKey()
  final String processingFeeType;
  @override
  @JsonKey()
  final double monthlyInstallment;
  @override
  @JsonKey()
  final double totalInterest;
  @override
  @JsonKey()
  final double totalRepaid;
  @override
  @JsonKey()
  final double totalPayable;

  /// Create a copy of EmiTenureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiTenureEntityCopyWith<_EmiTenureEntity> get copyWith =>
      __$EmiTenureEntityCopyWithImpl<_EmiTenureEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiTenureEntity &&
            (identical(other.tenureId, tenureId) ||
                other.tenureId == tenureId) &&
            (identical(other.months, months) || other.months == months) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.isNoCost, isNoCost) ||
                other.isNoCost == isNoCost) &&
            (identical(other.processingFee, processingFee) ||
                other.processingFee == processingFee) &&
            (identical(other.processingFeeType, processingFeeType) ||
                other.processingFeeType == processingFeeType) &&
            (identical(other.monthlyInstallment, monthlyInstallment) ||
                other.monthlyInstallment == monthlyInstallment) &&
            (identical(other.totalInterest, totalInterest) ||
                other.totalInterest == totalInterest) &&
            (identical(other.totalRepaid, totalRepaid) ||
                other.totalRepaid == totalRepaid) &&
            (identical(other.totalPayable, totalPayable) ||
                other.totalPayable == totalPayable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      tenureId,
      months,
      interestRate,
      isNoCost,
      processingFee,
      processingFeeType,
      monthlyInstallment,
      totalInterest,
      totalRepaid,
      totalPayable);

  @override
  String toString() {
    return 'EmiTenureEntity(tenureId: $tenureId, months: $months, interestRate: $interestRate, isNoCost: $isNoCost, processingFee: $processingFee, processingFeeType: $processingFeeType, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalRepaid: $totalRepaid, totalPayable: $totalPayable)';
  }
}

/// @nodoc
abstract mixin class _$EmiTenureEntityCopyWith<$Res>
    implements $EmiTenureEntityCopyWith<$Res> {
  factory _$EmiTenureEntityCopyWith(
          _EmiTenureEntity value, $Res Function(_EmiTenureEntity) _then) =
      __$EmiTenureEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tenureId,
      int months,
      double interestRate,
      bool isNoCost,
      double processingFee,
      String processingFeeType,
      double monthlyInstallment,
      double totalInterest,
      double totalRepaid,
      double totalPayable});
}

/// @nodoc
class __$EmiTenureEntityCopyWithImpl<$Res>
    implements _$EmiTenureEntityCopyWith<$Res> {
  __$EmiTenureEntityCopyWithImpl(this._self, this._then);

  final _EmiTenureEntity _self;
  final $Res Function(_EmiTenureEntity) _then;

  /// Create a copy of EmiTenureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tenureId = null,
    Object? months = null,
    Object? interestRate = null,
    Object? isNoCost = null,
    Object? processingFee = null,
    Object? processingFeeType = null,
    Object? monthlyInstallment = null,
    Object? totalInterest = null,
    Object? totalRepaid = null,
    Object? totalPayable = null,
  }) {
    return _then(_EmiTenureEntity(
      tenureId: null == tenureId
          ? _self.tenureId
          : tenureId // ignore: cast_nullable_to_non_nullable
              as String,
      months: null == months
          ? _self.months
          : months // ignore: cast_nullable_to_non_nullable
              as int,
      interestRate: null == interestRate
          ? _self.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      isNoCost: null == isNoCost
          ? _self.isNoCost
          : isNoCost // ignore: cast_nullable_to_non_nullable
              as bool,
      processingFee: null == processingFee
          ? _self.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as double,
      processingFeeType: null == processingFeeType
          ? _self.processingFeeType
          : processingFeeType // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyInstallment: null == monthlyInstallment
          ? _self.monthlyInstallment
          : monthlyInstallment // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterest: null == totalInterest
          ? _self.totalInterest
          : totalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      totalRepaid: null == totalRepaid
          ? _self.totalRepaid
          : totalRepaid // ignore: cast_nullable_to_non_nullable
              as double,
      totalPayable: null == totalPayable
          ? _self.totalPayable
          : totalPayable // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$EmiPlanEntity {
  String get id;
  String get planId;
  String get provider;
  String get providerCode;
  String get providerType;
  double get minAmount;
  double get maxAmount;
  bool get isEligible;
  String get description;
  String get termsAndConditions;
  List<EmiTenureEntity> get tenures;

  /// Create a copy of EmiPlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiPlanEntityCopyWith<EmiPlanEntity> get copyWith =>
      _$EmiPlanEntityCopyWithImpl<EmiPlanEntity>(
          this as EmiPlanEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiPlanEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            const DeepCollectionEquality().equals(other.tenures, tenures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      planId,
      provider,
      providerCode,
      providerType,
      minAmount,
      maxAmount,
      isEligible,
      description,
      termsAndConditions,
      const DeepCollectionEquality().hash(tenures));

  @override
  String toString() {
    return 'EmiPlanEntity(id: $id, planId: $planId, provider: $provider, providerCode: $providerCode, providerType: $providerType, minAmount: $minAmount, maxAmount: $maxAmount, isEligible: $isEligible, description: $description, termsAndConditions: $termsAndConditions, tenures: $tenures)';
  }
}

/// @nodoc
abstract mixin class $EmiPlanEntityCopyWith<$Res> {
  factory $EmiPlanEntityCopyWith(
          EmiPlanEntity value, $Res Function(EmiPlanEntity) _then) =
      _$EmiPlanEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String planId,
      String provider,
      String providerCode,
      String providerType,
      double minAmount,
      double maxAmount,
      bool isEligible,
      String description,
      String termsAndConditions,
      List<EmiTenureEntity> tenures});
}

/// @nodoc
class _$EmiPlanEntityCopyWithImpl<$Res>
    implements $EmiPlanEntityCopyWith<$Res> {
  _$EmiPlanEntityCopyWithImpl(this._self, this._then);

  final EmiPlanEntity _self;
  final $Res Function(EmiPlanEntity) _then;

  /// Create a copy of EmiPlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? provider = null,
    Object? providerCode = null,
    Object? providerType = null,
    Object? minAmount = null,
    Object? maxAmount = null,
    Object? isEligible = null,
    Object? description = null,
    Object? termsAndConditions = null,
    Object? tenures = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerCode: null == providerCode
          ? _self.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String,
      providerType: null == providerType
          ? _self.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as String,
      minAmount: null == minAmount
          ? _self.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxAmount: null == maxAmount
          ? _self.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isEligible: null == isEligible
          ? _self.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      termsAndConditions: null == termsAndConditions
          ? _self.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      tenures: null == tenures
          ? _self.tenures
          : tenures // ignore: cast_nullable_to_non_nullable
              as List<EmiTenureEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiPlanEntity].
extension EmiPlanEntityPatterns on EmiPlanEntity {
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
    TResult Function(_EmiPlanEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlanEntity() when $default != null:
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
    TResult Function(_EmiPlanEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanEntity():
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
    TResult? Function(_EmiPlanEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanEntity() when $default != null:
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
            String planId,
            String provider,
            String providerCode,
            String providerType,
            double minAmount,
            double maxAmount,
            bool isEligible,
            String description,
            String termsAndConditions,
            List<EmiTenureEntity> tenures)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlanEntity() when $default != null:
        return $default(
            _that.id,
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.providerType,
            _that.minAmount,
            _that.maxAmount,
            _that.isEligible,
            _that.description,
            _that.termsAndConditions,
            _that.tenures);
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
            String planId,
            String provider,
            String providerCode,
            String providerType,
            double minAmount,
            double maxAmount,
            bool isEligible,
            String description,
            String termsAndConditions,
            List<EmiTenureEntity> tenures)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanEntity():
        return $default(
            _that.id,
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.providerType,
            _that.minAmount,
            _that.maxAmount,
            _that.isEligible,
            _that.description,
            _that.termsAndConditions,
            _that.tenures);
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
            String planId,
            String provider,
            String providerCode,
            String providerType,
            double minAmount,
            double maxAmount,
            bool isEligible,
            String description,
            String termsAndConditions,
            List<EmiTenureEntity> tenures)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanEntity() when $default != null:
        return $default(
            _that.id,
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.providerType,
            _that.minAmount,
            _that.maxAmount,
            _that.isEligible,
            _that.description,
            _that.termsAndConditions,
            _that.tenures);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiPlanEntity implements EmiPlanEntity {
  const _EmiPlanEntity(
      {required this.id,
      required this.planId,
      required this.provider,
      required this.providerCode,
      this.providerType = 'BANK',
      this.minAmount = 3000.0,
      this.maxAmount = 500000.0,
      this.isEligible = true,
      this.description = '',
      this.termsAndConditions = '',
      final List<EmiTenureEntity> tenures = const []})
      : _tenures = tenures;

  @override
  final String id;
  @override
  final String planId;
  @override
  final String provider;
  @override
  final String providerCode;
  @override
  @JsonKey()
  final String providerType;
  @override
  @JsonKey()
  final double minAmount;
  @override
  @JsonKey()
  final double maxAmount;
  @override
  @JsonKey()
  final bool isEligible;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String termsAndConditions;
  final List<EmiTenureEntity> _tenures;
  @override
  @JsonKey()
  List<EmiTenureEntity> get tenures {
    if (_tenures is EqualUnmodifiableListView) return _tenures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenures);
  }

  /// Create a copy of EmiPlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiPlanEntityCopyWith<_EmiPlanEntity> get copyWith =>
      __$EmiPlanEntityCopyWithImpl<_EmiPlanEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiPlanEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            const DeepCollectionEquality().equals(other._tenures, _tenures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      planId,
      provider,
      providerCode,
      providerType,
      minAmount,
      maxAmount,
      isEligible,
      description,
      termsAndConditions,
      const DeepCollectionEquality().hash(_tenures));

  @override
  String toString() {
    return 'EmiPlanEntity(id: $id, planId: $planId, provider: $provider, providerCode: $providerCode, providerType: $providerType, minAmount: $minAmount, maxAmount: $maxAmount, isEligible: $isEligible, description: $description, termsAndConditions: $termsAndConditions, tenures: $tenures)';
  }
}

/// @nodoc
abstract mixin class _$EmiPlanEntityCopyWith<$Res>
    implements $EmiPlanEntityCopyWith<$Res> {
  factory _$EmiPlanEntityCopyWith(
          _EmiPlanEntity value, $Res Function(_EmiPlanEntity) _then) =
      __$EmiPlanEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String planId,
      String provider,
      String providerCode,
      String providerType,
      double minAmount,
      double maxAmount,
      bool isEligible,
      String description,
      String termsAndConditions,
      List<EmiTenureEntity> tenures});
}

/// @nodoc
class __$EmiPlanEntityCopyWithImpl<$Res>
    implements _$EmiPlanEntityCopyWith<$Res> {
  __$EmiPlanEntityCopyWithImpl(this._self, this._then);

  final _EmiPlanEntity _self;
  final $Res Function(_EmiPlanEntity) _then;

  /// Create a copy of EmiPlanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? provider = null,
    Object? providerCode = null,
    Object? providerType = null,
    Object? minAmount = null,
    Object? maxAmount = null,
    Object? isEligible = null,
    Object? description = null,
    Object? termsAndConditions = null,
    Object? tenures = null,
  }) {
    return _then(_EmiPlanEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerCode: null == providerCode
          ? _self.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String,
      providerType: null == providerType
          ? _self.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as String,
      minAmount: null == minAmount
          ? _self.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxAmount: null == maxAmount
          ? _self.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isEligible: null == isEligible
          ? _self.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      termsAndConditions: null == termsAndConditions
          ? _self.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      tenures: null == tenures
          ? _self._tenures
          : tenures // ignore: cast_nullable_to_non_nullable
              as List<EmiTenureEntity>,
    ));
  }
}

/// @nodoc
mixin _$EmiEligibilityEntity {
  bool get eligible;
  String? get reasonCode;
  String? get message;
  double get minOrderValue;
  double get maxOrderValue;

  /// Create a copy of EmiEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiEligibilityEntityCopyWith<EmiEligibilityEntity> get copyWith =>
      _$EmiEligibilityEntityCopyWithImpl<EmiEligibilityEntity>(
          this as EmiEligibilityEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiEligibilityEntity &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, eligible, reasonCode, message, minOrderValue, maxOrderValue);

  @override
  String toString() {
    return 'EmiEligibilityEntity(eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue)';
  }
}

/// @nodoc
abstract mixin class $EmiEligibilityEntityCopyWith<$Res> {
  factory $EmiEligibilityEntityCopyWith(EmiEligibilityEntity value,
          $Res Function(EmiEligibilityEntity) _then) =
      _$EmiEligibilityEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool eligible,
      String? reasonCode,
      String? message,
      double minOrderValue,
      double maxOrderValue});
}

/// @nodoc
class _$EmiEligibilityEntityCopyWithImpl<$Res>
    implements $EmiEligibilityEntityCopyWith<$Res> {
  _$EmiEligibilityEntityCopyWithImpl(this._self, this._then);

  final EmiEligibilityEntity _self;
  final $Res Function(EmiEligibilityEntity) _then;

  /// Create a copy of EmiEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eligible = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? minOrderValue = null,
    Object? maxOrderValue = null,
  }) {
    return _then(_self.copyWith(
      eligible: null == eligible
          ? _self.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxOrderValue: null == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiEligibilityEntity].
extension EmiEligibilityEntityPatterns on EmiEligibilityEntity {
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
    TResult Function(_EmiEligibilityEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityEntity() when $default != null:
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
    TResult Function(_EmiEligibilityEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityEntity():
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
    TResult? Function(_EmiEligibilityEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityEntity() when $default != null:
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
    TResult Function(bool eligible, String? reasonCode, String? message,
            double minOrderValue, double maxOrderValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityEntity() when $default != null:
        return $default(_that.eligible, _that.reasonCode, _that.message,
            _that.minOrderValue, _that.maxOrderValue);
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
    TResult Function(bool eligible, String? reasonCode, String? message,
            double minOrderValue, double maxOrderValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityEntity():
        return $default(_that.eligible, _that.reasonCode, _that.message,
            _that.minOrderValue, _that.maxOrderValue);
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
    TResult? Function(bool eligible, String? reasonCode, String? message,
            double minOrderValue, double maxOrderValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityEntity() when $default != null:
        return $default(_that.eligible, _that.reasonCode, _that.message,
            _that.minOrderValue, _that.maxOrderValue);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiEligibilityEntity implements EmiEligibilityEntity {
  const _EmiEligibilityEntity(
      {required this.eligible,
      this.reasonCode,
      this.message,
      this.minOrderValue = 3000.0,
      this.maxOrderValue = 500000.0});

  @override
  final bool eligible;
  @override
  final String? reasonCode;
  @override
  final String? message;
  @override
  @JsonKey()
  final double minOrderValue;
  @override
  @JsonKey()
  final double maxOrderValue;

  /// Create a copy of EmiEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiEligibilityEntityCopyWith<_EmiEligibilityEntity> get copyWith =>
      __$EmiEligibilityEntityCopyWithImpl<_EmiEligibilityEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiEligibilityEntity &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, eligible, reasonCode, message, minOrderValue, maxOrderValue);

  @override
  String toString() {
    return 'EmiEligibilityEntity(eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue)';
  }
}

/// @nodoc
abstract mixin class _$EmiEligibilityEntityCopyWith<$Res>
    implements $EmiEligibilityEntityCopyWith<$Res> {
  factory _$EmiEligibilityEntityCopyWith(_EmiEligibilityEntity value,
          $Res Function(_EmiEligibilityEntity) _then) =
      __$EmiEligibilityEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool eligible,
      String? reasonCode,
      String? message,
      double minOrderValue,
      double maxOrderValue});
}

/// @nodoc
class __$EmiEligibilityEntityCopyWithImpl<$Res>
    implements _$EmiEligibilityEntityCopyWith<$Res> {
  __$EmiEligibilityEntityCopyWithImpl(this._self, this._then);

  final _EmiEligibilityEntity _self;
  final $Res Function(_EmiEligibilityEntity) _then;

  /// Create a copy of EmiEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eligible = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? minOrderValue = null,
    Object? maxOrderValue = null,
  }) {
    return _then(_EmiEligibilityEntity(
      eligible: null == eligible
          ? _self.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxOrderValue: null == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$EmiPlansResponseEntity {
  String get currency;
  String get currencySymbol;
  double get amount;
  bool get eligible;
  String? get reasonCode;
  String? get message;
  double get minOrderValue;
  double get maxOrderValue;
  List<EmiPlanEntity> get plans;

  /// Create a copy of EmiPlansResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiPlansResponseEntityCopyWith<EmiPlansResponseEntity> get copyWith =>
      _$EmiPlansResponseEntityCopyWithImpl<EmiPlansResponseEntity>(
          this as EmiPlansResponseEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiPlansResponseEntity &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue) &&
            const DeepCollectionEquality().equals(other.plans, plans));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      currencySymbol,
      amount,
      eligible,
      reasonCode,
      message,
      minOrderValue,
      maxOrderValue,
      const DeepCollectionEquality().hash(plans));

  @override
  String toString() {
    return 'EmiPlansResponseEntity(currency: $currency, currencySymbol: $currencySymbol, amount: $amount, eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue, plans: $plans)';
  }
}

/// @nodoc
abstract mixin class $EmiPlansResponseEntityCopyWith<$Res> {
  factory $EmiPlansResponseEntityCopyWith(EmiPlansResponseEntity value,
          $Res Function(EmiPlansResponseEntity) _then) =
      _$EmiPlansResponseEntityCopyWithImpl;
  @useResult
  $Res call(
      {String currency,
      String currencySymbol,
      double amount,
      bool eligible,
      String? reasonCode,
      String? message,
      double minOrderValue,
      double maxOrderValue,
      List<EmiPlanEntity> plans});
}

/// @nodoc
class _$EmiPlansResponseEntityCopyWithImpl<$Res>
    implements $EmiPlansResponseEntityCopyWith<$Res> {
  _$EmiPlansResponseEntityCopyWithImpl(this._self, this._then);

  final EmiPlansResponseEntity _self;
  final $Res Function(EmiPlansResponseEntity) _then;

  /// Create a copy of EmiPlansResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? currencySymbol = null,
    Object? amount = null,
    Object? eligible = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? minOrderValue = null,
    Object? maxOrderValue = null,
    Object? plans = null,
  }) {
    return _then(_self.copyWith(
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      eligible: null == eligible
          ? _self.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxOrderValue: null == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      plans: null == plans
          ? _self.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<EmiPlanEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiPlansResponseEntity].
extension EmiPlansResponseEntityPatterns on EmiPlansResponseEntity {
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
    TResult Function(_EmiPlansResponseEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseEntity() when $default != null:
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
    TResult Function(_EmiPlansResponseEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseEntity():
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
    TResult? Function(_EmiPlansResponseEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseEntity() when $default != null:
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
            String currency,
            String currencySymbol,
            double amount,
            bool eligible,
            String? reasonCode,
            String? message,
            double minOrderValue,
            double maxOrderValue,
            List<EmiPlanEntity> plans)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseEntity() when $default != null:
        return $default(
            _that.currency,
            _that.currencySymbol,
            _that.amount,
            _that.eligible,
            _that.reasonCode,
            _that.message,
            _that.minOrderValue,
            _that.maxOrderValue,
            _that.plans);
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
            String currency,
            String currencySymbol,
            double amount,
            bool eligible,
            String? reasonCode,
            String? message,
            double minOrderValue,
            double maxOrderValue,
            List<EmiPlanEntity> plans)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseEntity():
        return $default(
            _that.currency,
            _that.currencySymbol,
            _that.amount,
            _that.eligible,
            _that.reasonCode,
            _that.message,
            _that.minOrderValue,
            _that.maxOrderValue,
            _that.plans);
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
            String currency,
            String currencySymbol,
            double amount,
            bool eligible,
            String? reasonCode,
            String? message,
            double minOrderValue,
            double maxOrderValue,
            List<EmiPlanEntity> plans)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseEntity() when $default != null:
        return $default(
            _that.currency,
            _that.currencySymbol,
            _that.amount,
            _that.eligible,
            _that.reasonCode,
            _that.message,
            _that.minOrderValue,
            _that.maxOrderValue,
            _that.plans);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiPlansResponseEntity implements EmiPlansResponseEntity {
  const _EmiPlansResponseEntity(
      {this.currency = 'INR',
      this.currencySymbol = '₹',
      this.amount = 0.0,
      required this.eligible,
      this.reasonCode,
      this.message,
      this.minOrderValue = 3000.0,
      this.maxOrderValue = 500000.0,
      final List<EmiPlanEntity> plans = const []})
      : _plans = plans;

  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String currencySymbol;
  @override
  @JsonKey()
  final double amount;
  @override
  final bool eligible;
  @override
  final String? reasonCode;
  @override
  final String? message;
  @override
  @JsonKey()
  final double minOrderValue;
  @override
  @JsonKey()
  final double maxOrderValue;
  final List<EmiPlanEntity> _plans;
  @override
  @JsonKey()
  List<EmiPlanEntity> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  /// Create a copy of EmiPlansResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiPlansResponseEntityCopyWith<_EmiPlansResponseEntity> get copyWith =>
      __$EmiPlansResponseEntityCopyWithImpl<_EmiPlansResponseEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiPlansResponseEntity &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.maxOrderValue, maxOrderValue) ||
                other.maxOrderValue == maxOrderValue) &&
            const DeepCollectionEquality().equals(other._plans, _plans));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      currencySymbol,
      amount,
      eligible,
      reasonCode,
      message,
      minOrderValue,
      maxOrderValue,
      const DeepCollectionEquality().hash(_plans));

  @override
  String toString() {
    return 'EmiPlansResponseEntity(currency: $currency, currencySymbol: $currencySymbol, amount: $amount, eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue, plans: $plans)';
  }
}

/// @nodoc
abstract mixin class _$EmiPlansResponseEntityCopyWith<$Res>
    implements $EmiPlansResponseEntityCopyWith<$Res> {
  factory _$EmiPlansResponseEntityCopyWith(_EmiPlansResponseEntity value,
          $Res Function(_EmiPlansResponseEntity) _then) =
      __$EmiPlansResponseEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String currency,
      String currencySymbol,
      double amount,
      bool eligible,
      String? reasonCode,
      String? message,
      double minOrderValue,
      double maxOrderValue,
      List<EmiPlanEntity> plans});
}

/// @nodoc
class __$EmiPlansResponseEntityCopyWithImpl<$Res>
    implements _$EmiPlansResponseEntityCopyWith<$Res> {
  __$EmiPlansResponseEntityCopyWithImpl(this._self, this._then);

  final _EmiPlansResponseEntity _self;
  final $Res Function(_EmiPlansResponseEntity) _then;

  /// Create a copy of EmiPlansResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currency = null,
    Object? currencySymbol = null,
    Object? amount = null,
    Object? eligible = null,
    Object? reasonCode = freezed,
    Object? message = freezed,
    Object? minOrderValue = null,
    Object? maxOrderValue = null,
    Object? plans = null,
  }) {
    return _then(_EmiPlansResponseEntity(
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      eligible: null == eligible
          ? _self.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool,
      reasonCode: freezed == reasonCode
          ? _self.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxOrderValue: null == maxOrderValue
          ? _self.maxOrderValue
          : maxOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      plans: null == plans
          ? _self._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<EmiPlanEntity>,
    ));
  }
}

/// @nodoc
mixin _$EmiQuoteEntity {
  String get planId;
  String get provider;
  String get providerCode;
  int get tenureMonths;
  double get interestRate;
  double get principal;
  double get monthlyInstallment;
  double get totalInterest;
  double get processingFee;
  String get processingFeeType;
  double get totalRepaid;
  double get totalPayable;
  bool get isNoCost;

  /// Create a copy of EmiQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiQuoteEntityCopyWith<EmiQuoteEntity> get copyWith =>
      _$EmiQuoteEntityCopyWithImpl<EmiQuoteEntity>(
          this as EmiQuoteEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiQuoteEntity &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.tenureMonths, tenureMonths) ||
                other.tenureMonths == tenureMonths) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.monthlyInstallment, monthlyInstallment) ||
                other.monthlyInstallment == monthlyInstallment) &&
            (identical(other.totalInterest, totalInterest) ||
                other.totalInterest == totalInterest) &&
            (identical(other.processingFee, processingFee) ||
                other.processingFee == processingFee) &&
            (identical(other.processingFeeType, processingFeeType) ||
                other.processingFeeType == processingFeeType) &&
            (identical(other.totalRepaid, totalRepaid) ||
                other.totalRepaid == totalRepaid) &&
            (identical(other.totalPayable, totalPayable) ||
                other.totalPayable == totalPayable) &&
            (identical(other.isNoCost, isNoCost) ||
                other.isNoCost == isNoCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      planId,
      provider,
      providerCode,
      tenureMonths,
      interestRate,
      principal,
      monthlyInstallment,
      totalInterest,
      processingFee,
      processingFeeType,
      totalRepaid,
      totalPayable,
      isNoCost);

  @override
  String toString() {
    return 'EmiQuoteEntity(planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, processingFee: $processingFee, processingFeeType: $processingFeeType, totalRepaid: $totalRepaid, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class $EmiQuoteEntityCopyWith<$Res> {
  factory $EmiQuoteEntityCopyWith(
          EmiQuoteEntity value, $Res Function(EmiQuoteEntity) _then) =
      _$EmiQuoteEntityCopyWithImpl;
  @useResult
  $Res call(
      {String planId,
      String provider,
      String providerCode,
      int tenureMonths,
      double interestRate,
      double principal,
      double monthlyInstallment,
      double totalInterest,
      double processingFee,
      String processingFeeType,
      double totalRepaid,
      double totalPayable,
      bool isNoCost});
}

/// @nodoc
class _$EmiQuoteEntityCopyWithImpl<$Res>
    implements $EmiQuoteEntityCopyWith<$Res> {
  _$EmiQuoteEntityCopyWithImpl(this._self, this._then);

  final EmiQuoteEntity _self;
  final $Res Function(EmiQuoteEntity) _then;

  /// Create a copy of EmiQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? provider = null,
    Object? providerCode = null,
    Object? tenureMonths = null,
    Object? interestRate = null,
    Object? principal = null,
    Object? monthlyInstallment = null,
    Object? totalInterest = null,
    Object? processingFee = null,
    Object? processingFeeType = null,
    Object? totalRepaid = null,
    Object? totalPayable = null,
    Object? isNoCost = null,
  }) {
    return _then(_self.copyWith(
      planId: null == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerCode: null == providerCode
          ? _self.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String,
      tenureMonths: null == tenureMonths
          ? _self.tenureMonths
          : tenureMonths // ignore: cast_nullable_to_non_nullable
              as int,
      interestRate: null == interestRate
          ? _self.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      principal: null == principal
          ? _self.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyInstallment: null == monthlyInstallment
          ? _self.monthlyInstallment
          : monthlyInstallment // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterest: null == totalInterest
          ? _self.totalInterest
          : totalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      processingFee: null == processingFee
          ? _self.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as double,
      processingFeeType: null == processingFeeType
          ? _self.processingFeeType
          : processingFeeType // ignore: cast_nullable_to_non_nullable
              as String,
      totalRepaid: null == totalRepaid
          ? _self.totalRepaid
          : totalRepaid // ignore: cast_nullable_to_non_nullable
              as double,
      totalPayable: null == totalPayable
          ? _self.totalPayable
          : totalPayable // ignore: cast_nullable_to_non_nullable
              as double,
      isNoCost: null == isNoCost
          ? _self.isNoCost
          : isNoCost // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiQuoteEntity].
extension EmiQuoteEntityPatterns on EmiQuoteEntity {
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
    TResult Function(_EmiQuoteEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteEntity() when $default != null:
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
    TResult Function(_EmiQuoteEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteEntity():
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
    TResult? Function(_EmiQuoteEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteEntity() when $default != null:
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
            String planId,
            String provider,
            String providerCode,
            int tenureMonths,
            double interestRate,
            double principal,
            double monthlyInstallment,
            double totalInterest,
            double processingFee,
            String processingFeeType,
            double totalRepaid,
            double totalPayable,
            bool isNoCost)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteEntity() when $default != null:
        return $default(
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.tenureMonths,
            _that.interestRate,
            _that.principal,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.processingFee,
            _that.processingFeeType,
            _that.totalRepaid,
            _that.totalPayable,
            _that.isNoCost);
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
            String planId,
            String provider,
            String providerCode,
            int tenureMonths,
            double interestRate,
            double principal,
            double monthlyInstallment,
            double totalInterest,
            double processingFee,
            String processingFeeType,
            double totalRepaid,
            double totalPayable,
            bool isNoCost)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteEntity():
        return $default(
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.tenureMonths,
            _that.interestRate,
            _that.principal,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.processingFee,
            _that.processingFeeType,
            _that.totalRepaid,
            _that.totalPayable,
            _that.isNoCost);
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
            String planId,
            String provider,
            String providerCode,
            int tenureMonths,
            double interestRate,
            double principal,
            double monthlyInstallment,
            double totalInterest,
            double processingFee,
            String processingFeeType,
            double totalRepaid,
            double totalPayable,
            bool isNoCost)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteEntity() when $default != null:
        return $default(
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.tenureMonths,
            _that.interestRate,
            _that.principal,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.processingFee,
            _that.processingFeeType,
            _that.totalRepaid,
            _that.totalPayable,
            _that.isNoCost);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiQuoteEntity implements EmiQuoteEntity {
  const _EmiQuoteEntity(
      {required this.planId,
      required this.provider,
      required this.providerCode,
      required this.tenureMonths,
      required this.interestRate,
      required this.principal,
      required this.monthlyInstallment,
      required this.totalInterest,
      required this.processingFee,
      this.processingFeeType = 'FIXED',
      required this.totalRepaid,
      required this.totalPayable,
      this.isNoCost = false});

  @override
  final String planId;
  @override
  final String provider;
  @override
  final String providerCode;
  @override
  final int tenureMonths;
  @override
  final double interestRate;
  @override
  final double principal;
  @override
  final double monthlyInstallment;
  @override
  final double totalInterest;
  @override
  final double processingFee;
  @override
  @JsonKey()
  final String processingFeeType;
  @override
  final double totalRepaid;
  @override
  final double totalPayable;
  @override
  @JsonKey()
  final bool isNoCost;

  /// Create a copy of EmiQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiQuoteEntityCopyWith<_EmiQuoteEntity> get copyWith =>
      __$EmiQuoteEntityCopyWithImpl<_EmiQuoteEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiQuoteEntity &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.tenureMonths, tenureMonths) ||
                other.tenureMonths == tenureMonths) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.monthlyInstallment, monthlyInstallment) ||
                other.monthlyInstallment == monthlyInstallment) &&
            (identical(other.totalInterest, totalInterest) ||
                other.totalInterest == totalInterest) &&
            (identical(other.processingFee, processingFee) ||
                other.processingFee == processingFee) &&
            (identical(other.processingFeeType, processingFeeType) ||
                other.processingFeeType == processingFeeType) &&
            (identical(other.totalRepaid, totalRepaid) ||
                other.totalRepaid == totalRepaid) &&
            (identical(other.totalPayable, totalPayable) ||
                other.totalPayable == totalPayable) &&
            (identical(other.isNoCost, isNoCost) ||
                other.isNoCost == isNoCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      planId,
      provider,
      providerCode,
      tenureMonths,
      interestRate,
      principal,
      monthlyInstallment,
      totalInterest,
      processingFee,
      processingFeeType,
      totalRepaid,
      totalPayable,
      isNoCost);

  @override
  String toString() {
    return 'EmiQuoteEntity(planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, processingFee: $processingFee, processingFeeType: $processingFeeType, totalRepaid: $totalRepaid, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class _$EmiQuoteEntityCopyWith<$Res>
    implements $EmiQuoteEntityCopyWith<$Res> {
  factory _$EmiQuoteEntityCopyWith(
          _EmiQuoteEntity value, $Res Function(_EmiQuoteEntity) _then) =
      __$EmiQuoteEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String planId,
      String provider,
      String providerCode,
      int tenureMonths,
      double interestRate,
      double principal,
      double monthlyInstallment,
      double totalInterest,
      double processingFee,
      String processingFeeType,
      double totalRepaid,
      double totalPayable,
      bool isNoCost});
}

/// @nodoc
class __$EmiQuoteEntityCopyWithImpl<$Res>
    implements _$EmiQuoteEntityCopyWith<$Res> {
  __$EmiQuoteEntityCopyWithImpl(this._self, this._then);

  final _EmiQuoteEntity _self;
  final $Res Function(_EmiQuoteEntity) _then;

  /// Create a copy of EmiQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? planId = null,
    Object? provider = null,
    Object? providerCode = null,
    Object? tenureMonths = null,
    Object? interestRate = null,
    Object? principal = null,
    Object? monthlyInstallment = null,
    Object? totalInterest = null,
    Object? processingFee = null,
    Object? processingFeeType = null,
    Object? totalRepaid = null,
    Object? totalPayable = null,
    Object? isNoCost = null,
  }) {
    return _then(_EmiQuoteEntity(
      planId: null == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerCode: null == providerCode
          ? _self.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String,
      tenureMonths: null == tenureMonths
          ? _self.tenureMonths
          : tenureMonths // ignore: cast_nullable_to_non_nullable
              as int,
      interestRate: null == interestRate
          ? _self.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      principal: null == principal
          ? _self.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyInstallment: null == monthlyInstallment
          ? _self.monthlyInstallment
          : monthlyInstallment // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterest: null == totalInterest
          ? _self.totalInterest
          : totalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      processingFee: null == processingFee
          ? _self.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as double,
      processingFeeType: null == processingFeeType
          ? _self.processingFeeType
          : processingFeeType // ignore: cast_nullable_to_non_nullable
              as String,
      totalRepaid: null == totalRepaid
          ? _self.totalRepaid
          : totalRepaid // ignore: cast_nullable_to_non_nullable
              as double,
      totalPayable: null == totalPayable
          ? _self.totalPayable
          : totalPayable // ignore: cast_nullable_to_non_nullable
              as double,
      isNoCost: null == isNoCost
          ? _self.isNoCost
          : isNoCost // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$EmiDetailsSnapshotEntity {
  bool get isEmi;
  String get planId;
  String get provider;
  String get providerCode;
  int get tenureMonths;
  double get interestRate;
  double get processingFee;
  String get processingFeeType;
  double get principal;
  double get monthlyInstallment;
  double get totalInterest;
  double get totalPayable;
  bool get isNoCost;

  /// Create a copy of EmiDetailsSnapshotEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiDetailsSnapshotEntityCopyWith<EmiDetailsSnapshotEntity> get copyWith =>
      _$EmiDetailsSnapshotEntityCopyWithImpl<EmiDetailsSnapshotEntity>(
          this as EmiDetailsSnapshotEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiDetailsSnapshotEntity &&
            (identical(other.isEmi, isEmi) || other.isEmi == isEmi) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.tenureMonths, tenureMonths) ||
                other.tenureMonths == tenureMonths) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.processingFee, processingFee) ||
                other.processingFee == processingFee) &&
            (identical(other.processingFeeType, processingFeeType) ||
                other.processingFeeType == processingFeeType) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.monthlyInstallment, monthlyInstallment) ||
                other.monthlyInstallment == monthlyInstallment) &&
            (identical(other.totalInterest, totalInterest) ||
                other.totalInterest == totalInterest) &&
            (identical(other.totalPayable, totalPayable) ||
                other.totalPayable == totalPayable) &&
            (identical(other.isNoCost, isNoCost) ||
                other.isNoCost == isNoCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEmi,
      planId,
      provider,
      providerCode,
      tenureMonths,
      interestRate,
      processingFee,
      processingFeeType,
      principal,
      monthlyInstallment,
      totalInterest,
      totalPayable,
      isNoCost);

  @override
  String toString() {
    return 'EmiDetailsSnapshotEntity(isEmi: $isEmi, planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, processingFee: $processingFee, processingFeeType: $processingFeeType, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class $EmiDetailsSnapshotEntityCopyWith<$Res> {
  factory $EmiDetailsSnapshotEntityCopyWith(EmiDetailsSnapshotEntity value,
          $Res Function(EmiDetailsSnapshotEntity) _then) =
      _$EmiDetailsSnapshotEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool isEmi,
      String planId,
      String provider,
      String providerCode,
      int tenureMonths,
      double interestRate,
      double processingFee,
      String processingFeeType,
      double principal,
      double monthlyInstallment,
      double totalInterest,
      double totalPayable,
      bool isNoCost});
}

/// @nodoc
class _$EmiDetailsSnapshotEntityCopyWithImpl<$Res>
    implements $EmiDetailsSnapshotEntityCopyWith<$Res> {
  _$EmiDetailsSnapshotEntityCopyWithImpl(this._self, this._then);

  final EmiDetailsSnapshotEntity _self;
  final $Res Function(EmiDetailsSnapshotEntity) _then;

  /// Create a copy of EmiDetailsSnapshotEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmi = null,
    Object? planId = null,
    Object? provider = null,
    Object? providerCode = null,
    Object? tenureMonths = null,
    Object? interestRate = null,
    Object? processingFee = null,
    Object? processingFeeType = null,
    Object? principal = null,
    Object? monthlyInstallment = null,
    Object? totalInterest = null,
    Object? totalPayable = null,
    Object? isNoCost = null,
  }) {
    return _then(_self.copyWith(
      isEmi: null == isEmi
          ? _self.isEmi
          : isEmi // ignore: cast_nullable_to_non_nullable
              as bool,
      planId: null == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerCode: null == providerCode
          ? _self.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String,
      tenureMonths: null == tenureMonths
          ? _self.tenureMonths
          : tenureMonths // ignore: cast_nullable_to_non_nullable
              as int,
      interestRate: null == interestRate
          ? _self.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      processingFee: null == processingFee
          ? _self.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as double,
      processingFeeType: null == processingFeeType
          ? _self.processingFeeType
          : processingFeeType // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _self.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyInstallment: null == monthlyInstallment
          ? _self.monthlyInstallment
          : monthlyInstallment // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterest: null == totalInterest
          ? _self.totalInterest
          : totalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      totalPayable: null == totalPayable
          ? _self.totalPayable
          : totalPayable // ignore: cast_nullable_to_non_nullable
              as double,
      isNoCost: null == isNoCost
          ? _self.isNoCost
          : isNoCost // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiDetailsSnapshotEntity].
extension EmiDetailsSnapshotEntityPatterns on EmiDetailsSnapshotEntity {
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
    TResult Function(_EmiDetailsSnapshotEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotEntity() when $default != null:
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
    TResult Function(_EmiDetailsSnapshotEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotEntity():
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
    TResult? Function(_EmiDetailsSnapshotEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotEntity() when $default != null:
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
            bool isEmi,
            String planId,
            String provider,
            String providerCode,
            int tenureMonths,
            double interestRate,
            double processingFee,
            String processingFeeType,
            double principal,
            double monthlyInstallment,
            double totalInterest,
            double totalPayable,
            bool isNoCost)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotEntity() when $default != null:
        return $default(
            _that.isEmi,
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.tenureMonths,
            _that.interestRate,
            _that.processingFee,
            _that.processingFeeType,
            _that.principal,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.totalPayable,
            _that.isNoCost);
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
            bool isEmi,
            String planId,
            String provider,
            String providerCode,
            int tenureMonths,
            double interestRate,
            double processingFee,
            String processingFeeType,
            double principal,
            double monthlyInstallment,
            double totalInterest,
            double totalPayable,
            bool isNoCost)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotEntity():
        return $default(
            _that.isEmi,
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.tenureMonths,
            _that.interestRate,
            _that.processingFee,
            _that.processingFeeType,
            _that.principal,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.totalPayable,
            _that.isNoCost);
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
            bool isEmi,
            String planId,
            String provider,
            String providerCode,
            int tenureMonths,
            double interestRate,
            double processingFee,
            String processingFeeType,
            double principal,
            double monthlyInstallment,
            double totalInterest,
            double totalPayable,
            bool isNoCost)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotEntity() when $default != null:
        return $default(
            _that.isEmi,
            _that.planId,
            _that.provider,
            _that.providerCode,
            _that.tenureMonths,
            _that.interestRate,
            _that.processingFee,
            _that.processingFeeType,
            _that.principal,
            _that.monthlyInstallment,
            _that.totalInterest,
            _that.totalPayable,
            _that.isNoCost);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiDetailsSnapshotEntity implements EmiDetailsSnapshotEntity {
  const _EmiDetailsSnapshotEntity(
      {this.isEmi = false,
      this.planId = '',
      this.provider = '',
      this.providerCode = '',
      this.tenureMonths = 0,
      this.interestRate = 0.0,
      this.processingFee = 0.0,
      this.processingFeeType = 'FIXED',
      this.principal = 0.0,
      this.monthlyInstallment = 0.0,
      this.totalInterest = 0.0,
      this.totalPayable = 0.0,
      this.isNoCost = false});

  @override
  @JsonKey()
  final bool isEmi;
  @override
  @JsonKey()
  final String planId;
  @override
  @JsonKey()
  final String provider;
  @override
  @JsonKey()
  final String providerCode;
  @override
  @JsonKey()
  final int tenureMonths;
  @override
  @JsonKey()
  final double interestRate;
  @override
  @JsonKey()
  final double processingFee;
  @override
  @JsonKey()
  final String processingFeeType;
  @override
  @JsonKey()
  final double principal;
  @override
  @JsonKey()
  final double monthlyInstallment;
  @override
  @JsonKey()
  final double totalInterest;
  @override
  @JsonKey()
  final double totalPayable;
  @override
  @JsonKey()
  final bool isNoCost;

  /// Create a copy of EmiDetailsSnapshotEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiDetailsSnapshotEntityCopyWith<_EmiDetailsSnapshotEntity> get copyWith =>
      __$EmiDetailsSnapshotEntityCopyWithImpl<_EmiDetailsSnapshotEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiDetailsSnapshotEntity &&
            (identical(other.isEmi, isEmi) || other.isEmi == isEmi) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerCode, providerCode) ||
                other.providerCode == providerCode) &&
            (identical(other.tenureMonths, tenureMonths) ||
                other.tenureMonths == tenureMonths) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.processingFee, processingFee) ||
                other.processingFee == processingFee) &&
            (identical(other.processingFeeType, processingFeeType) ||
                other.processingFeeType == processingFeeType) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.monthlyInstallment, monthlyInstallment) ||
                other.monthlyInstallment == monthlyInstallment) &&
            (identical(other.totalInterest, totalInterest) ||
                other.totalInterest == totalInterest) &&
            (identical(other.totalPayable, totalPayable) ||
                other.totalPayable == totalPayable) &&
            (identical(other.isNoCost, isNoCost) ||
                other.isNoCost == isNoCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEmi,
      planId,
      provider,
      providerCode,
      tenureMonths,
      interestRate,
      processingFee,
      processingFeeType,
      principal,
      monthlyInstallment,
      totalInterest,
      totalPayable,
      isNoCost);

  @override
  String toString() {
    return 'EmiDetailsSnapshotEntity(isEmi: $isEmi, planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, processingFee: $processingFee, processingFeeType: $processingFeeType, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class _$EmiDetailsSnapshotEntityCopyWith<$Res>
    implements $EmiDetailsSnapshotEntityCopyWith<$Res> {
  factory _$EmiDetailsSnapshotEntityCopyWith(_EmiDetailsSnapshotEntity value,
          $Res Function(_EmiDetailsSnapshotEntity) _then) =
      __$EmiDetailsSnapshotEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isEmi,
      String planId,
      String provider,
      String providerCode,
      int tenureMonths,
      double interestRate,
      double processingFee,
      String processingFeeType,
      double principal,
      double monthlyInstallment,
      double totalInterest,
      double totalPayable,
      bool isNoCost});
}

/// @nodoc
class __$EmiDetailsSnapshotEntityCopyWithImpl<$Res>
    implements _$EmiDetailsSnapshotEntityCopyWith<$Res> {
  __$EmiDetailsSnapshotEntityCopyWithImpl(this._self, this._then);

  final _EmiDetailsSnapshotEntity _self;
  final $Res Function(_EmiDetailsSnapshotEntity) _then;

  /// Create a copy of EmiDetailsSnapshotEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEmi = null,
    Object? planId = null,
    Object? provider = null,
    Object? providerCode = null,
    Object? tenureMonths = null,
    Object? interestRate = null,
    Object? processingFee = null,
    Object? processingFeeType = null,
    Object? principal = null,
    Object? monthlyInstallment = null,
    Object? totalInterest = null,
    Object? totalPayable = null,
    Object? isNoCost = null,
  }) {
    return _then(_EmiDetailsSnapshotEntity(
      isEmi: null == isEmi
          ? _self.isEmi
          : isEmi // ignore: cast_nullable_to_non_nullable
              as bool,
      planId: null == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerCode: null == providerCode
          ? _self.providerCode
          : providerCode // ignore: cast_nullable_to_non_nullable
              as String,
      tenureMonths: null == tenureMonths
          ? _self.tenureMonths
          : tenureMonths // ignore: cast_nullable_to_non_nullable
              as int,
      interestRate: null == interestRate
          ? _self.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      processingFee: null == processingFee
          ? _self.processingFee
          : processingFee // ignore: cast_nullable_to_non_nullable
              as double,
      processingFeeType: null == processingFeeType
          ? _self.processingFeeType
          : processingFeeType // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _self.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyInstallment: null == monthlyInstallment
          ? _self.monthlyInstallment
          : monthlyInstallment // ignore: cast_nullable_to_non_nullable
              as double,
      totalInterest: null == totalInterest
          ? _self.totalInterest
          : totalInterest // ignore: cast_nullable_to_non_nullable
              as double,
      totalPayable: null == totalPayable
          ? _self.totalPayable
          : totalPayable // ignore: cast_nullable_to_non_nullable
              as double,
      isNoCost: null == isNoCost
          ? _self.isNoCost
          : isNoCost // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
