// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emi_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmiTenureModel {
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

  /// Create a copy of EmiTenureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiTenureModelCopyWith<EmiTenureModel> get copyWith =>
      _$EmiTenureModelCopyWithImpl<EmiTenureModel>(
          this as EmiTenureModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiTenureModel &&
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
    return 'EmiTenureModel(tenureId: $tenureId, months: $months, interestRate: $interestRate, isNoCost: $isNoCost, processingFee: $processingFee, processingFeeType: $processingFeeType, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalRepaid: $totalRepaid, totalPayable: $totalPayable)';
  }
}

/// @nodoc
abstract mixin class $EmiTenureModelCopyWith<$Res> {
  factory $EmiTenureModelCopyWith(
          EmiTenureModel value, $Res Function(EmiTenureModel) _then) =
      _$EmiTenureModelCopyWithImpl;
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
class _$EmiTenureModelCopyWithImpl<$Res>
    implements $EmiTenureModelCopyWith<$Res> {
  _$EmiTenureModelCopyWithImpl(this._self, this._then);

  final EmiTenureModel _self;
  final $Res Function(EmiTenureModel) _then;

  /// Create a copy of EmiTenureModel
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

/// Adds pattern-matching-related methods to [EmiTenureModel].
extension EmiTenureModelPatterns on EmiTenureModel {
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
    TResult Function(_EmiTenureModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiTenureModel() when $default != null:
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
    TResult Function(_EmiTenureModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiTenureModel():
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
    TResult? Function(_EmiTenureModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiTenureModel() when $default != null:
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
      case _EmiTenureModel() when $default != null:
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
      case _EmiTenureModel():
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
      case _EmiTenureModel() when $default != null:
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

class _EmiTenureModel implements EmiTenureModel {
  const _EmiTenureModel(
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

  /// Create a copy of EmiTenureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiTenureModelCopyWith<_EmiTenureModel> get copyWith =>
      __$EmiTenureModelCopyWithImpl<_EmiTenureModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiTenureModel &&
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
    return 'EmiTenureModel(tenureId: $tenureId, months: $months, interestRate: $interestRate, isNoCost: $isNoCost, processingFee: $processingFee, processingFeeType: $processingFeeType, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalRepaid: $totalRepaid, totalPayable: $totalPayable)';
  }
}

/// @nodoc
abstract mixin class _$EmiTenureModelCopyWith<$Res>
    implements $EmiTenureModelCopyWith<$Res> {
  factory _$EmiTenureModelCopyWith(
          _EmiTenureModel value, $Res Function(_EmiTenureModel) _then) =
      __$EmiTenureModelCopyWithImpl;
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
class __$EmiTenureModelCopyWithImpl<$Res>
    implements _$EmiTenureModelCopyWith<$Res> {
  __$EmiTenureModelCopyWithImpl(this._self, this._then);

  final _EmiTenureModel _self;
  final $Res Function(_EmiTenureModel) _then;

  /// Create a copy of EmiTenureModel
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
    return _then(_EmiTenureModel(
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
mixin _$EmiPlanModel {
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
  List<EmiTenureModel> get tenures;

  /// Create a copy of EmiPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiPlanModelCopyWith<EmiPlanModel> get copyWith =>
      _$EmiPlanModelCopyWithImpl<EmiPlanModel>(
          this as EmiPlanModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiPlanModel &&
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
    return 'EmiPlanModel(id: $id, planId: $planId, provider: $provider, providerCode: $providerCode, providerType: $providerType, minAmount: $minAmount, maxAmount: $maxAmount, isEligible: $isEligible, description: $description, termsAndConditions: $termsAndConditions, tenures: $tenures)';
  }
}

/// @nodoc
abstract mixin class $EmiPlanModelCopyWith<$Res> {
  factory $EmiPlanModelCopyWith(
          EmiPlanModel value, $Res Function(EmiPlanModel) _then) =
      _$EmiPlanModelCopyWithImpl;
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
      List<EmiTenureModel> tenures});
}

/// @nodoc
class _$EmiPlanModelCopyWithImpl<$Res> implements $EmiPlanModelCopyWith<$Res> {
  _$EmiPlanModelCopyWithImpl(this._self, this._then);

  final EmiPlanModel _self;
  final $Res Function(EmiPlanModel) _then;

  /// Create a copy of EmiPlanModel
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
              as List<EmiTenureModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiPlanModel].
extension EmiPlanModelPatterns on EmiPlanModel {
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
    TResult Function(_EmiPlanModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlanModel() when $default != null:
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
    TResult Function(_EmiPlanModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanModel():
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
    TResult? Function(_EmiPlanModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanModel() when $default != null:
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
            List<EmiTenureModel> tenures)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlanModel() when $default != null:
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
            List<EmiTenureModel> tenures)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanModel():
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
            List<EmiTenureModel> tenures)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlanModel() when $default != null:
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

class _EmiPlanModel implements EmiPlanModel {
  const _EmiPlanModel(
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
      final List<EmiTenureModel> tenures = const []})
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
  final List<EmiTenureModel> _tenures;
  @override
  @JsonKey()
  List<EmiTenureModel> get tenures {
    if (_tenures is EqualUnmodifiableListView) return _tenures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenures);
  }

  /// Create a copy of EmiPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiPlanModelCopyWith<_EmiPlanModel> get copyWith =>
      __$EmiPlanModelCopyWithImpl<_EmiPlanModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiPlanModel &&
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
    return 'EmiPlanModel(id: $id, planId: $planId, provider: $provider, providerCode: $providerCode, providerType: $providerType, minAmount: $minAmount, maxAmount: $maxAmount, isEligible: $isEligible, description: $description, termsAndConditions: $termsAndConditions, tenures: $tenures)';
  }
}

/// @nodoc
abstract mixin class _$EmiPlanModelCopyWith<$Res>
    implements $EmiPlanModelCopyWith<$Res> {
  factory _$EmiPlanModelCopyWith(
          _EmiPlanModel value, $Res Function(_EmiPlanModel) _then) =
      __$EmiPlanModelCopyWithImpl;
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
      List<EmiTenureModel> tenures});
}

/// @nodoc
class __$EmiPlanModelCopyWithImpl<$Res>
    implements _$EmiPlanModelCopyWith<$Res> {
  __$EmiPlanModelCopyWithImpl(this._self, this._then);

  final _EmiPlanModel _self;
  final $Res Function(_EmiPlanModel) _then;

  /// Create a copy of EmiPlanModel
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
    return _then(_EmiPlanModel(
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
              as List<EmiTenureModel>,
    ));
  }
}

/// @nodoc
mixin _$EmiEligibilityModel {
  bool get eligible;
  String? get reasonCode;
  String? get message;
  double get minOrderValue;
  double get maxOrderValue;

  /// Create a copy of EmiEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiEligibilityModelCopyWith<EmiEligibilityModel> get copyWith =>
      _$EmiEligibilityModelCopyWithImpl<EmiEligibilityModel>(
          this as EmiEligibilityModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiEligibilityModel &&
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
    return 'EmiEligibilityModel(eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue)';
  }
}

/// @nodoc
abstract mixin class $EmiEligibilityModelCopyWith<$Res> {
  factory $EmiEligibilityModelCopyWith(
          EmiEligibilityModel value, $Res Function(EmiEligibilityModel) _then) =
      _$EmiEligibilityModelCopyWithImpl;
  @useResult
  $Res call(
      {bool eligible,
      String? reasonCode,
      String? message,
      double minOrderValue,
      double maxOrderValue});
}

/// @nodoc
class _$EmiEligibilityModelCopyWithImpl<$Res>
    implements $EmiEligibilityModelCopyWith<$Res> {
  _$EmiEligibilityModelCopyWithImpl(this._self, this._then);

  final EmiEligibilityModel _self;
  final $Res Function(EmiEligibilityModel) _then;

  /// Create a copy of EmiEligibilityModel
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

/// Adds pattern-matching-related methods to [EmiEligibilityModel].
extension EmiEligibilityModelPatterns on EmiEligibilityModel {
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
    TResult Function(_EmiEligibilityModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityModel() when $default != null:
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
    TResult Function(_EmiEligibilityModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityModel():
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
    TResult? Function(_EmiEligibilityModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiEligibilityModel() when $default != null:
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
      case _EmiEligibilityModel() when $default != null:
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
      case _EmiEligibilityModel():
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
      case _EmiEligibilityModel() when $default != null:
        return $default(_that.eligible, _that.reasonCode, _that.message,
            _that.minOrderValue, _that.maxOrderValue);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmiEligibilityModel implements EmiEligibilityModel {
  const _EmiEligibilityModel(
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

  /// Create a copy of EmiEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiEligibilityModelCopyWith<_EmiEligibilityModel> get copyWith =>
      __$EmiEligibilityModelCopyWithImpl<_EmiEligibilityModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiEligibilityModel &&
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
    return 'EmiEligibilityModel(eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue)';
  }
}

/// @nodoc
abstract mixin class _$EmiEligibilityModelCopyWith<$Res>
    implements $EmiEligibilityModelCopyWith<$Res> {
  factory _$EmiEligibilityModelCopyWith(_EmiEligibilityModel value,
          $Res Function(_EmiEligibilityModel) _then) =
      __$EmiEligibilityModelCopyWithImpl;
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
class __$EmiEligibilityModelCopyWithImpl<$Res>
    implements _$EmiEligibilityModelCopyWith<$Res> {
  __$EmiEligibilityModelCopyWithImpl(this._self, this._then);

  final _EmiEligibilityModel _self;
  final $Res Function(_EmiEligibilityModel) _then;

  /// Create a copy of EmiEligibilityModel
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
    return _then(_EmiEligibilityModel(
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
mixin _$EmiPlansResponseModel {
  String get currency;
  String get currencySymbol;
  double get amount;
  bool get eligible;
  String? get reasonCode;
  String? get message;
  double get minOrderValue;
  double get maxOrderValue;
  List<EmiPlanModel> get plans;

  /// Create a copy of EmiPlansResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiPlansResponseModelCopyWith<EmiPlansResponseModel> get copyWith =>
      _$EmiPlansResponseModelCopyWithImpl<EmiPlansResponseModel>(
          this as EmiPlansResponseModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiPlansResponseModel &&
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
    return 'EmiPlansResponseModel(currency: $currency, currencySymbol: $currencySymbol, amount: $amount, eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue, plans: $plans)';
  }
}

/// @nodoc
abstract mixin class $EmiPlansResponseModelCopyWith<$Res> {
  factory $EmiPlansResponseModelCopyWith(EmiPlansResponseModel value,
          $Res Function(EmiPlansResponseModel) _then) =
      _$EmiPlansResponseModelCopyWithImpl;
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
      List<EmiPlanModel> plans});
}

/// @nodoc
class _$EmiPlansResponseModelCopyWithImpl<$Res>
    implements $EmiPlansResponseModelCopyWith<$Res> {
  _$EmiPlansResponseModelCopyWithImpl(this._self, this._then);

  final EmiPlansResponseModel _self;
  final $Res Function(EmiPlansResponseModel) _then;

  /// Create a copy of EmiPlansResponseModel
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
              as List<EmiPlanModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmiPlansResponseModel].
extension EmiPlansResponseModelPatterns on EmiPlansResponseModel {
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
    TResult Function(_EmiPlansResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseModel() when $default != null:
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
    TResult Function(_EmiPlansResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseModel():
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
    TResult? Function(_EmiPlansResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseModel() when $default != null:
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
            List<EmiPlanModel> plans)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseModel() when $default != null:
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
            List<EmiPlanModel> plans)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseModel():
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
            List<EmiPlanModel> plans)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiPlansResponseModel() when $default != null:
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

class _EmiPlansResponseModel implements EmiPlansResponseModel {
  const _EmiPlansResponseModel(
      {this.currency = 'INR',
      this.currencySymbol = '₹',
      this.amount = 0.0,
      required this.eligible,
      this.reasonCode,
      this.message,
      this.minOrderValue = 3000.0,
      this.maxOrderValue = 500000.0,
      final List<EmiPlanModel> plans = const []})
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
  final List<EmiPlanModel> _plans;
  @override
  @JsonKey()
  List<EmiPlanModel> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  /// Create a copy of EmiPlansResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiPlansResponseModelCopyWith<_EmiPlansResponseModel> get copyWith =>
      __$EmiPlansResponseModelCopyWithImpl<_EmiPlansResponseModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiPlansResponseModel &&
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
    return 'EmiPlansResponseModel(currency: $currency, currencySymbol: $currencySymbol, amount: $amount, eligible: $eligible, reasonCode: $reasonCode, message: $message, minOrderValue: $minOrderValue, maxOrderValue: $maxOrderValue, plans: $plans)';
  }
}

/// @nodoc
abstract mixin class _$EmiPlansResponseModelCopyWith<$Res>
    implements $EmiPlansResponseModelCopyWith<$Res> {
  factory _$EmiPlansResponseModelCopyWith(_EmiPlansResponseModel value,
          $Res Function(_EmiPlansResponseModel) _then) =
      __$EmiPlansResponseModelCopyWithImpl;
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
      List<EmiPlanModel> plans});
}

/// @nodoc
class __$EmiPlansResponseModelCopyWithImpl<$Res>
    implements _$EmiPlansResponseModelCopyWith<$Res> {
  __$EmiPlansResponseModelCopyWithImpl(this._self, this._then);

  final _EmiPlansResponseModel _self;
  final $Res Function(_EmiPlansResponseModel) _then;

  /// Create a copy of EmiPlansResponseModel
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
    return _then(_EmiPlansResponseModel(
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
              as List<EmiPlanModel>,
    ));
  }
}

/// @nodoc
mixin _$EmiQuoteModel {
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

  /// Create a copy of EmiQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiQuoteModelCopyWith<EmiQuoteModel> get copyWith =>
      _$EmiQuoteModelCopyWithImpl<EmiQuoteModel>(
          this as EmiQuoteModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiQuoteModel &&
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
    return 'EmiQuoteModel(planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, processingFee: $processingFee, processingFeeType: $processingFeeType, totalRepaid: $totalRepaid, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class $EmiQuoteModelCopyWith<$Res> {
  factory $EmiQuoteModelCopyWith(
          EmiQuoteModel value, $Res Function(EmiQuoteModel) _then) =
      _$EmiQuoteModelCopyWithImpl;
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
class _$EmiQuoteModelCopyWithImpl<$Res>
    implements $EmiQuoteModelCopyWith<$Res> {
  _$EmiQuoteModelCopyWithImpl(this._self, this._then);

  final EmiQuoteModel _self;
  final $Res Function(EmiQuoteModel) _then;

  /// Create a copy of EmiQuoteModel
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

/// Adds pattern-matching-related methods to [EmiQuoteModel].
extension EmiQuoteModelPatterns on EmiQuoteModel {
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
    TResult Function(_EmiQuoteModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteModel() when $default != null:
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
    TResult Function(_EmiQuoteModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteModel():
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
    TResult? Function(_EmiQuoteModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiQuoteModel() when $default != null:
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
      case _EmiQuoteModel() when $default != null:
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
      case _EmiQuoteModel():
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
      case _EmiQuoteModel() when $default != null:
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

class _EmiQuoteModel implements EmiQuoteModel {
  const _EmiQuoteModel(
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

  /// Create a copy of EmiQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiQuoteModelCopyWith<_EmiQuoteModel> get copyWith =>
      __$EmiQuoteModelCopyWithImpl<_EmiQuoteModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiQuoteModel &&
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
    return 'EmiQuoteModel(planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, processingFee: $processingFee, processingFeeType: $processingFeeType, totalRepaid: $totalRepaid, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class _$EmiQuoteModelCopyWith<$Res>
    implements $EmiQuoteModelCopyWith<$Res> {
  factory _$EmiQuoteModelCopyWith(
          _EmiQuoteModel value, $Res Function(_EmiQuoteModel) _then) =
      __$EmiQuoteModelCopyWithImpl;
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
class __$EmiQuoteModelCopyWithImpl<$Res>
    implements _$EmiQuoteModelCopyWith<$Res> {
  __$EmiQuoteModelCopyWithImpl(this._self, this._then);

  final _EmiQuoteModel _self;
  final $Res Function(_EmiQuoteModel) _then;

  /// Create a copy of EmiQuoteModel
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
    return _then(_EmiQuoteModel(
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
mixin _$EmiDetailsSnapshotModel {
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

  /// Create a copy of EmiDetailsSnapshotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmiDetailsSnapshotModelCopyWith<EmiDetailsSnapshotModel> get copyWith =>
      _$EmiDetailsSnapshotModelCopyWithImpl<EmiDetailsSnapshotModel>(
          this as EmiDetailsSnapshotModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmiDetailsSnapshotModel &&
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
    return 'EmiDetailsSnapshotModel(isEmi: $isEmi, planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, processingFee: $processingFee, processingFeeType: $processingFeeType, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class $EmiDetailsSnapshotModelCopyWith<$Res> {
  factory $EmiDetailsSnapshotModelCopyWith(EmiDetailsSnapshotModel value,
          $Res Function(EmiDetailsSnapshotModel) _then) =
      _$EmiDetailsSnapshotModelCopyWithImpl;
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
class _$EmiDetailsSnapshotModelCopyWithImpl<$Res>
    implements $EmiDetailsSnapshotModelCopyWith<$Res> {
  _$EmiDetailsSnapshotModelCopyWithImpl(this._self, this._then);

  final EmiDetailsSnapshotModel _self;
  final $Res Function(EmiDetailsSnapshotModel) _then;

  /// Create a copy of EmiDetailsSnapshotModel
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

/// Adds pattern-matching-related methods to [EmiDetailsSnapshotModel].
extension EmiDetailsSnapshotModelPatterns on EmiDetailsSnapshotModel {
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
    TResult Function(_EmiDetailsSnapshotModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotModel() when $default != null:
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
    TResult Function(_EmiDetailsSnapshotModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotModel():
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
    TResult? Function(_EmiDetailsSnapshotModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmiDetailsSnapshotModel() when $default != null:
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
      case _EmiDetailsSnapshotModel() when $default != null:
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
      case _EmiDetailsSnapshotModel():
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
      case _EmiDetailsSnapshotModel() when $default != null:
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

class _EmiDetailsSnapshotModel implements EmiDetailsSnapshotModel {
  const _EmiDetailsSnapshotModel(
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

  /// Create a copy of EmiDetailsSnapshotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmiDetailsSnapshotModelCopyWith<_EmiDetailsSnapshotModel> get copyWith =>
      __$EmiDetailsSnapshotModelCopyWithImpl<_EmiDetailsSnapshotModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmiDetailsSnapshotModel &&
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
    return 'EmiDetailsSnapshotModel(isEmi: $isEmi, planId: $planId, provider: $provider, providerCode: $providerCode, tenureMonths: $tenureMonths, interestRate: $interestRate, processingFee: $processingFee, processingFeeType: $processingFeeType, principal: $principal, monthlyInstallment: $monthlyInstallment, totalInterest: $totalInterest, totalPayable: $totalPayable, isNoCost: $isNoCost)';
  }
}

/// @nodoc
abstract mixin class _$EmiDetailsSnapshotModelCopyWith<$Res>
    implements $EmiDetailsSnapshotModelCopyWith<$Res> {
  factory _$EmiDetailsSnapshotModelCopyWith(_EmiDetailsSnapshotModel value,
          $Res Function(_EmiDetailsSnapshotModel) _then) =
      __$EmiDetailsSnapshotModelCopyWithImpl;
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
class __$EmiDetailsSnapshotModelCopyWithImpl<$Res>
    implements _$EmiDetailsSnapshotModelCopyWith<$Res> {
  __$EmiDetailsSnapshotModelCopyWithImpl(this._self, this._then);

  final _EmiDetailsSnapshotModel _self;
  final $Res Function(_EmiDetailsSnapshotModel) _then;

  /// Create a copy of EmiDetailsSnapshotModel
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
    return _then(_EmiDetailsSnapshotModel(
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
