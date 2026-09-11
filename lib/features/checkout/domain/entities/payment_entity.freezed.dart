// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentEntity {
  String get id;
  String get orderId;
  String get transactionId;
  String get provider;
  String get paymentMethod;
  double get amount;
  String get currency;
  String get status;

  /// Create a copy of PaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentEntityCopyWith<PaymentEntity> get copyWith =>
      _$PaymentEntityCopyWithImpl<PaymentEntity>(
          this as PaymentEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, transactionId,
      provider, paymentMethod, amount, currency, status);

  @override
  String toString() {
    return 'PaymentEntity(id: $id, orderId: $orderId, transactionId: $transactionId, provider: $provider, paymentMethod: $paymentMethod, amount: $amount, currency: $currency, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PaymentEntityCopyWith<$Res> {
  factory $PaymentEntityCopyWith(
          PaymentEntity value, $Res Function(PaymentEntity) _then) =
      _$PaymentEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String transactionId,
      String provider,
      String paymentMethod,
      double amount,
      String currency,
      String status});
}

/// @nodoc
class _$PaymentEntityCopyWithImpl<$Res>
    implements $PaymentEntityCopyWith<$Res> {
  _$PaymentEntityCopyWithImpl(this._self, this._then);

  final PaymentEntity _self;
  final $Res Function(PaymentEntity) _then;

  /// Create a copy of PaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? transactionId = null,
    Object? provider = null,
    Object? paymentMethod = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentEntity].
extension PaymentEntityPatterns on PaymentEntity {
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
    TResult Function(_PaymentEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentEntity() when $default != null:
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
    TResult Function(_PaymentEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentEntity():
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
    TResult? Function(_PaymentEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentEntity() when $default != null:
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
            String orderId,
            String transactionId,
            String provider,
            String paymentMethod,
            double amount,
            String currency,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentEntity() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.transactionId,
            _that.provider,
            _that.paymentMethod,
            _that.amount,
            _that.currency,
            _that.status);
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
            String orderId,
            String transactionId,
            String provider,
            String paymentMethod,
            double amount,
            String currency,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentEntity():
        return $default(
            _that.id,
            _that.orderId,
            _that.transactionId,
            _that.provider,
            _that.paymentMethod,
            _that.amount,
            _that.currency,
            _that.status);
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
            String orderId,
            String transactionId,
            String provider,
            String paymentMethod,
            double amount,
            String currency,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentEntity() when $default != null:
        return $default(
            _that.id,
            _that.orderId,
            _that.transactionId,
            _that.provider,
            _that.paymentMethod,
            _that.amount,
            _that.currency,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaymentEntity implements PaymentEntity {
  const _PaymentEntity(
      {required this.id,
      required this.orderId,
      required this.transactionId,
      this.provider = 'SIMULATED',
      this.paymentMethod = 'CARD',
      required this.amount,
      this.currency = 'USD',
      this.status = 'PENDING'});

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String transactionId;
  @override
  @JsonKey()
  final String provider;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  final double amount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String status;

  /// Create a copy of PaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentEntityCopyWith<_PaymentEntity> get copyWith =>
      __$PaymentEntityCopyWithImpl<_PaymentEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, transactionId,
      provider, paymentMethod, amount, currency, status);

  @override
  String toString() {
    return 'PaymentEntity(id: $id, orderId: $orderId, transactionId: $transactionId, provider: $provider, paymentMethod: $paymentMethod, amount: $amount, currency: $currency, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PaymentEntityCopyWith<$Res>
    implements $PaymentEntityCopyWith<$Res> {
  factory _$PaymentEntityCopyWith(
          _PaymentEntity value, $Res Function(_PaymentEntity) _then) =
      __$PaymentEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String transactionId,
      String provider,
      String paymentMethod,
      double amount,
      String currency,
      String status});
}

/// @nodoc
class __$PaymentEntityCopyWithImpl<$Res>
    implements _$PaymentEntityCopyWith<$Res> {
  __$PaymentEntityCopyWithImpl(this._self, this._then);

  final _PaymentEntity _self;
  final $Res Function(_PaymentEntity) _then;

  /// Create a copy of PaymentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? transactionId = null,
    Object? provider = null,
    Object? paymentMethod = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
  }) {
    return _then(_PaymentEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
