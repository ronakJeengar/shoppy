// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryWindowEntity {
  int get minDays;
  int get maxDays;
  String get formattedWindow;
  bool get available;

  /// Create a copy of DeliveryWindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<DeliveryWindowEntity> get copyWith =>
      _$DeliveryWindowEntityCopyWithImpl<DeliveryWindowEntity>(
          this as DeliveryWindowEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryWindowEntity &&
            (identical(other.minDays, minDays) || other.minDays == minDays) &&
            (identical(other.maxDays, maxDays) || other.maxDays == maxDays) &&
            (identical(other.formattedWindow, formattedWindow) ||
                other.formattedWindow == formattedWindow) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, minDays, maxDays, formattedWindow, available);

  @override
  String toString() {
    return 'DeliveryWindowEntity(minDays: $minDays, maxDays: $maxDays, formattedWindow: $formattedWindow, available: $available)';
  }
}

/// @nodoc
abstract mixin class $DeliveryWindowEntityCopyWith<$Res> {
  factory $DeliveryWindowEntityCopyWith(DeliveryWindowEntity value,
          $Res Function(DeliveryWindowEntity) _then) =
      _$DeliveryWindowEntityCopyWithImpl;
  @useResult
  $Res call({int minDays, int maxDays, String formattedWindow, bool available});
}

/// @nodoc
class _$DeliveryWindowEntityCopyWithImpl<$Res>
    implements $DeliveryWindowEntityCopyWith<$Res> {
  _$DeliveryWindowEntityCopyWithImpl(this._self, this._then);

  final DeliveryWindowEntity _self;
  final $Res Function(DeliveryWindowEntity) _then;

  /// Create a copy of DeliveryWindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minDays = null,
    Object? maxDays = null,
    Object? formattedWindow = null,
    Object? available = null,
  }) {
    return _then(_self.copyWith(
      minDays: null == minDays
          ? _self.minDays
          : minDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _self.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
      formattedWindow: null == formattedWindow
          ? _self.formattedWindow
          : formattedWindow // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeliveryWindowEntity].
extension DeliveryWindowEntityPatterns on DeliveryWindowEntity {
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
    TResult Function(_DeliveryWindowEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowEntity() when $default != null:
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
    TResult Function(_DeliveryWindowEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowEntity():
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
    TResult? Function(_DeliveryWindowEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowEntity() when $default != null:
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
            int minDays, int maxDays, String formattedWindow, bool available)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowEntity() when $default != null:
        return $default(_that.minDays, _that.maxDays, _that.formattedWindow,
            _that.available);
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
            int minDays, int maxDays, String formattedWindow, bool available)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowEntity():
        return $default(_that.minDays, _that.maxDays, _that.formattedWindow,
            _that.available);
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
            int minDays, int maxDays, String formattedWindow, bool available)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowEntity() when $default != null:
        return $default(_that.minDays, _that.maxDays, _that.formattedWindow,
            _that.available);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeliveryWindowEntity implements DeliveryWindowEntity {
  const _DeliveryWindowEntity(
      {this.minDays = 0,
      this.maxDays = 0,
      this.formattedWindow = '',
      this.available = true});

  @override
  @JsonKey()
  final int minDays;
  @override
  @JsonKey()
  final int maxDays;
  @override
  @JsonKey()
  final String formattedWindow;
  @override
  @JsonKey()
  final bool available;

  /// Create a copy of DeliveryWindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryWindowEntityCopyWith<_DeliveryWindowEntity> get copyWith =>
      __$DeliveryWindowEntityCopyWithImpl<_DeliveryWindowEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryWindowEntity &&
            (identical(other.minDays, minDays) || other.minDays == minDays) &&
            (identical(other.maxDays, maxDays) || other.maxDays == maxDays) &&
            (identical(other.formattedWindow, formattedWindow) ||
                other.formattedWindow == formattedWindow) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, minDays, maxDays, formattedWindow, available);

  @override
  String toString() {
    return 'DeliveryWindowEntity(minDays: $minDays, maxDays: $maxDays, formattedWindow: $formattedWindow, available: $available)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryWindowEntityCopyWith<$Res>
    implements $DeliveryWindowEntityCopyWith<$Res> {
  factory _$DeliveryWindowEntityCopyWith(_DeliveryWindowEntity value,
          $Res Function(_DeliveryWindowEntity) _then) =
      __$DeliveryWindowEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int minDays, int maxDays, String formattedWindow, bool available});
}

/// @nodoc
class __$DeliveryWindowEntityCopyWithImpl<$Res>
    implements _$DeliveryWindowEntityCopyWith<$Res> {
  __$DeliveryWindowEntityCopyWithImpl(this._self, this._then);

  final _DeliveryWindowEntity _self;
  final $Res Function(_DeliveryWindowEntity) _then;

  /// Create a copy of DeliveryWindowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? minDays = null,
    Object? maxDays = null,
    Object? formattedWindow = null,
    Object? available = null,
  }) {
    return _then(_DeliveryWindowEntity(
      minDays: null == minDays
          ? _self.minDays
          : minDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _self.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
      formattedWindow: null == formattedWindow
          ? _self.formattedWindow
          : formattedWindow // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$DeliveryOptionsEntity {
  DeliveryWindowEntity? get standard;
  DeliveryWindowEntity? get express;

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryOptionsEntityCopyWith<DeliveryOptionsEntity> get copyWith =>
      _$DeliveryOptionsEntityCopyWithImpl<DeliveryOptionsEntity>(
          this as DeliveryOptionsEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryOptionsEntity &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.express, express) || other.express == express));
  }

  @override
  int get hashCode => Object.hash(runtimeType, standard, express);

  @override
  String toString() {
    return 'DeliveryOptionsEntity(standard: $standard, express: $express)';
  }
}

/// @nodoc
abstract mixin class $DeliveryOptionsEntityCopyWith<$Res> {
  factory $DeliveryOptionsEntityCopyWith(DeliveryOptionsEntity value,
          $Res Function(DeliveryOptionsEntity) _then) =
      _$DeliveryOptionsEntityCopyWithImpl;
  @useResult
  $Res call({DeliveryWindowEntity? standard, DeliveryWindowEntity? express});

  $DeliveryWindowEntityCopyWith<$Res>? get standard;
  $DeliveryWindowEntityCopyWith<$Res>? get express;
}

/// @nodoc
class _$DeliveryOptionsEntityCopyWithImpl<$Res>
    implements $DeliveryOptionsEntityCopyWith<$Res> {
  _$DeliveryOptionsEntityCopyWithImpl(this._self, this._then);

  final DeliveryOptionsEntity _self;
  final $Res Function(DeliveryOptionsEntity) _then;

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standard = freezed,
    Object? express = freezed,
  }) {
    return _then(_self.copyWith(
      standard: freezed == standard
          ? _self.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowEntity?,
      express: freezed == express
          ? _self.express
          : express // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowEntity?,
    ));
  }

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<$Res>? get standard {
    if (_self.standard == null) {
      return null;
    }

    return $DeliveryWindowEntityCopyWith<$Res>(_self.standard!, (value) {
      return _then(_self.copyWith(standard: value));
    });
  }

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<$Res>? get express {
    if (_self.express == null) {
      return null;
    }

    return $DeliveryWindowEntityCopyWith<$Res>(_self.express!, (value) {
      return _then(_self.copyWith(express: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeliveryOptionsEntity].
extension DeliveryOptionsEntityPatterns on DeliveryOptionsEntity {
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
    TResult Function(_DeliveryOptionsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsEntity() when $default != null:
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
    TResult Function(_DeliveryOptionsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsEntity():
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
    TResult? Function(_DeliveryOptionsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsEntity() when $default != null:
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
            DeliveryWindowEntity? standard, DeliveryWindowEntity? express)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsEntity() when $default != null:
        return $default(_that.standard, _that.express);
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
            DeliveryWindowEntity? standard, DeliveryWindowEntity? express)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsEntity():
        return $default(_that.standard, _that.express);
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
            DeliveryWindowEntity? standard, DeliveryWindowEntity? express)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsEntity() when $default != null:
        return $default(_that.standard, _that.express);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeliveryOptionsEntity implements DeliveryOptionsEntity {
  const _DeliveryOptionsEntity({this.standard, this.express});

  @override
  final DeliveryWindowEntity? standard;
  @override
  final DeliveryWindowEntity? express;

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryOptionsEntityCopyWith<_DeliveryOptionsEntity> get copyWith =>
      __$DeliveryOptionsEntityCopyWithImpl<_DeliveryOptionsEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryOptionsEntity &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.express, express) || other.express == express));
  }

  @override
  int get hashCode => Object.hash(runtimeType, standard, express);

  @override
  String toString() {
    return 'DeliveryOptionsEntity(standard: $standard, express: $express)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryOptionsEntityCopyWith<$Res>
    implements $DeliveryOptionsEntityCopyWith<$Res> {
  factory _$DeliveryOptionsEntityCopyWith(_DeliveryOptionsEntity value,
          $Res Function(_DeliveryOptionsEntity) _then) =
      __$DeliveryOptionsEntityCopyWithImpl;
  @override
  @useResult
  $Res call({DeliveryWindowEntity? standard, DeliveryWindowEntity? express});

  @override
  $DeliveryWindowEntityCopyWith<$Res>? get standard;
  @override
  $DeliveryWindowEntityCopyWith<$Res>? get express;
}

/// @nodoc
class __$DeliveryOptionsEntityCopyWithImpl<$Res>
    implements _$DeliveryOptionsEntityCopyWith<$Res> {
  __$DeliveryOptionsEntityCopyWithImpl(this._self, this._then);

  final _DeliveryOptionsEntity _self;
  final $Res Function(_DeliveryOptionsEntity) _then;

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? standard = freezed,
    Object? express = freezed,
  }) {
    return _then(_DeliveryOptionsEntity(
      standard: freezed == standard
          ? _self.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowEntity?,
      express: freezed == express
          ? _self.express
          : express // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowEntity?,
    ));
  }

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<$Res>? get standard {
    if (_self.standard == null) {
      return null;
    }

    return $DeliveryWindowEntityCopyWith<$Res>(_self.standard!, (value) {
      return _then(_self.copyWith(standard: value));
    });
  }

  /// Create a copy of DeliveryOptionsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<$Res>? get express {
    if (_self.express == null) {
      return null;
    }

    return $DeliveryWindowEntityCopyWith<$Res>(_self.express!, (value) {
      return _then(_self.copyWith(express: value));
    });
  }
}

/// @nodoc
mixin _$PinServiceabilityEntity {
  bool get serviceable;
  String get pinCode;
  String get city;
  String get district;
  String get state;
  String get stateCode;
  String get shippingZone;
  bool get codAvailable;
  DeliveryOptionsEntity? get delivery;
  String? get message;

  /// Create a copy of PinServiceabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PinServiceabilityEntityCopyWith<PinServiceabilityEntity> get copyWith =>
      _$PinServiceabilityEntityCopyWithImpl<PinServiceabilityEntity>(
          this as PinServiceabilityEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PinServiceabilityEntity &&
            (identical(other.serviceable, serviceable) ||
                other.serviceable == serviceable) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.shippingZone, shippingZone) ||
                other.shippingZone == shippingZone) &&
            (identical(other.codAvailable, codAvailable) ||
                other.codAvailable == codAvailable) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceable,
      pinCode,
      city,
      district,
      state,
      stateCode,
      shippingZone,
      codAvailable,
      delivery,
      message);

  @override
  String toString() {
    return 'PinServiceabilityEntity(serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, codAvailable: $codAvailable, delivery: $delivery, message: $message)';
  }
}

/// @nodoc
abstract mixin class $PinServiceabilityEntityCopyWith<$Res> {
  factory $PinServiceabilityEntityCopyWith(PinServiceabilityEntity value,
          $Res Function(PinServiceabilityEntity) _then) =
      _$PinServiceabilityEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool serviceable,
      String pinCode,
      String city,
      String district,
      String state,
      String stateCode,
      String shippingZone,
      bool codAvailable,
      DeliveryOptionsEntity? delivery,
      String? message});

  $DeliveryOptionsEntityCopyWith<$Res>? get delivery;
}

/// @nodoc
class _$PinServiceabilityEntityCopyWithImpl<$Res>
    implements $PinServiceabilityEntityCopyWith<$Res> {
  _$PinServiceabilityEntityCopyWithImpl(this._self, this._then);

  final PinServiceabilityEntity _self;
  final $Res Function(PinServiceabilityEntity) _then;

  /// Create a copy of PinServiceabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceable = null,
    Object? pinCode = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? shippingZone = null,
    Object? codAvailable = null,
    Object? delivery = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      serviceable: null == serviceable
          ? _self.serviceable
          : serviceable // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      shippingZone: null == shippingZone
          ? _self.shippingZone
          : shippingZone // ignore: cast_nullable_to_non_nullable
              as String,
      codAvailable: null == codAvailable
          ? _self.codAvailable
          : codAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      delivery: freezed == delivery
          ? _self.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as DeliveryOptionsEntity?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PinServiceabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOptionsEntityCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
      return null;
    }

    return $DeliveryOptionsEntityCopyWith<$Res>(_self.delivery!, (value) {
      return _then(_self.copyWith(delivery: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PinServiceabilityEntity].
extension PinServiceabilityEntityPatterns on PinServiceabilityEntity {
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
    TResult Function(_PinServiceabilityEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityEntity() when $default != null:
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
    TResult Function(_PinServiceabilityEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityEntity():
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
    TResult? Function(_PinServiceabilityEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityEntity() when $default != null:
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
            bool serviceable,
            String pinCode,
            String city,
            String district,
            String state,
            String stateCode,
            String shippingZone,
            bool codAvailable,
            DeliveryOptionsEntity? delivery,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityEntity() when $default != null:
        return $default(
            _that.serviceable,
            _that.pinCode,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.shippingZone,
            _that.codAvailable,
            _that.delivery,
            _that.message);
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
            bool serviceable,
            String pinCode,
            String city,
            String district,
            String state,
            String stateCode,
            String shippingZone,
            bool codAvailable,
            DeliveryOptionsEntity? delivery,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityEntity():
        return $default(
            _that.serviceable,
            _that.pinCode,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.shippingZone,
            _that.codAvailable,
            _that.delivery,
            _that.message);
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
            bool serviceable,
            String pinCode,
            String city,
            String district,
            String state,
            String stateCode,
            String shippingZone,
            bool codAvailable,
            DeliveryOptionsEntity? delivery,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityEntity() when $default != null:
        return $default(
            _that.serviceable,
            _that.pinCode,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.shippingZone,
            _that.codAvailable,
            _that.delivery,
            _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PinServiceabilityEntity implements PinServiceabilityEntity {
  const _PinServiceabilityEntity(
      {required this.serviceable,
      required this.pinCode,
      this.city = '',
      this.district = '',
      this.state = '',
      this.stateCode = '',
      this.shippingZone = '',
      this.codAvailable = false,
      this.delivery,
      this.message});

  @override
  final bool serviceable;
  @override
  final String pinCode;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String district;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String stateCode;
  @override
  @JsonKey()
  final String shippingZone;
  @override
  @JsonKey()
  final bool codAvailable;
  @override
  final DeliveryOptionsEntity? delivery;
  @override
  final String? message;

  /// Create a copy of PinServiceabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PinServiceabilityEntityCopyWith<_PinServiceabilityEntity> get copyWith =>
      __$PinServiceabilityEntityCopyWithImpl<_PinServiceabilityEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PinServiceabilityEntity &&
            (identical(other.serviceable, serviceable) ||
                other.serviceable == serviceable) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.shippingZone, shippingZone) ||
                other.shippingZone == shippingZone) &&
            (identical(other.codAvailable, codAvailable) ||
                other.codAvailable == codAvailable) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceable,
      pinCode,
      city,
      district,
      state,
      stateCode,
      shippingZone,
      codAvailable,
      delivery,
      message);

  @override
  String toString() {
    return 'PinServiceabilityEntity(serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, codAvailable: $codAvailable, delivery: $delivery, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$PinServiceabilityEntityCopyWith<$Res>
    implements $PinServiceabilityEntityCopyWith<$Res> {
  factory _$PinServiceabilityEntityCopyWith(_PinServiceabilityEntity value,
          $Res Function(_PinServiceabilityEntity) _then) =
      __$PinServiceabilityEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool serviceable,
      String pinCode,
      String city,
      String district,
      String state,
      String stateCode,
      String shippingZone,
      bool codAvailable,
      DeliveryOptionsEntity? delivery,
      String? message});

  @override
  $DeliveryOptionsEntityCopyWith<$Res>? get delivery;
}

/// @nodoc
class __$PinServiceabilityEntityCopyWithImpl<$Res>
    implements _$PinServiceabilityEntityCopyWith<$Res> {
  __$PinServiceabilityEntityCopyWithImpl(this._self, this._then);

  final _PinServiceabilityEntity _self;
  final $Res Function(_PinServiceabilityEntity) _then;

  /// Create a copy of PinServiceabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceable = null,
    Object? pinCode = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? shippingZone = null,
    Object? codAvailable = null,
    Object? delivery = freezed,
    Object? message = freezed,
  }) {
    return _then(_PinServiceabilityEntity(
      serviceable: null == serviceable
          ? _self.serviceable
          : serviceable // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      shippingZone: null == shippingZone
          ? _self.shippingZone
          : shippingZone // ignore: cast_nullable_to_non_nullable
              as String,
      codAvailable: null == codAvailable
          ? _self.codAvailable
          : codAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      delivery: freezed == delivery
          ? _self.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as DeliveryOptionsEntity?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PinServiceabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOptionsEntityCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
      return null;
    }

    return $DeliveryOptionsEntityCopyWith<$Res>(_self.delivery!, (value) {
      return _then(_self.copyWith(delivery: value));
    });
  }
}

/// @nodoc
mixin _$AvailableShippingMethodEntity {
  String get code;
  String get name;
  int get minDays;
  int get maxDays;
  double get baseCharge;
  String get formattedWindow;

  /// Create a copy of AvailableShippingMethodEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AvailableShippingMethodEntityCopyWith<AvailableShippingMethodEntity>
      get copyWith => _$AvailableShippingMethodEntityCopyWithImpl<
              AvailableShippingMethodEntity>(
          this as AvailableShippingMethodEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvailableShippingMethodEntity &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minDays, minDays) || other.minDays == minDays) &&
            (identical(other.maxDays, maxDays) || other.maxDays == maxDays) &&
            (identical(other.baseCharge, baseCharge) ||
                other.baseCharge == baseCharge) &&
            (identical(other.formattedWindow, formattedWindow) ||
                other.formattedWindow == formattedWindow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, minDays, maxDays, baseCharge, formattedWindow);

  @override
  String toString() {
    return 'AvailableShippingMethodEntity(code: $code, name: $name, minDays: $minDays, maxDays: $maxDays, baseCharge: $baseCharge, formattedWindow: $formattedWindow)';
  }
}

/// @nodoc
abstract mixin class $AvailableShippingMethodEntityCopyWith<$Res> {
  factory $AvailableShippingMethodEntityCopyWith(
          AvailableShippingMethodEntity value,
          $Res Function(AvailableShippingMethodEntity) _then) =
      _$AvailableShippingMethodEntityCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      String name,
      int minDays,
      int maxDays,
      double baseCharge,
      String formattedWindow});
}

/// @nodoc
class _$AvailableShippingMethodEntityCopyWithImpl<$Res>
    implements $AvailableShippingMethodEntityCopyWith<$Res> {
  _$AvailableShippingMethodEntityCopyWithImpl(this._self, this._then);

  final AvailableShippingMethodEntity _self;
  final $Res Function(AvailableShippingMethodEntity) _then;

  /// Create a copy of AvailableShippingMethodEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? minDays = null,
    Object? maxDays = null,
    Object? baseCharge = null,
    Object? formattedWindow = null,
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
      minDays: null == minDays
          ? _self.minDays
          : minDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _self.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
      baseCharge: null == baseCharge
          ? _self.baseCharge
          : baseCharge // ignore: cast_nullable_to_non_nullable
              as double,
      formattedWindow: null == formattedWindow
          ? _self.formattedWindow
          : formattedWindow // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AvailableShippingMethodEntity].
extension AvailableShippingMethodEntityPatterns
    on AvailableShippingMethodEntity {
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
    TResult Function(_AvailableShippingMethodEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodEntity() when $default != null:
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
    TResult Function(_AvailableShippingMethodEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodEntity():
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
    TResult? Function(_AvailableShippingMethodEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodEntity() when $default != null:
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
    TResult Function(String code, String name, int minDays, int maxDays,
            double baseCharge, String formattedWindow)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodEntity() when $default != null:
        return $default(_that.code, _that.name, _that.minDays, _that.maxDays,
            _that.baseCharge, _that.formattedWindow);
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
    TResult Function(String code, String name, int minDays, int maxDays,
            double baseCharge, String formattedWindow)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodEntity():
        return $default(_that.code, _that.name, _that.minDays, _that.maxDays,
            _that.baseCharge, _that.formattedWindow);
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
    TResult? Function(String code, String name, int minDays, int maxDays,
            double baseCharge, String formattedWindow)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodEntity() when $default != null:
        return $default(_that.code, _that.name, _that.minDays, _that.maxDays,
            _that.baseCharge, _that.formattedWindow);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AvailableShippingMethodEntity implements AvailableShippingMethodEntity {
  const _AvailableShippingMethodEntity(
      {required this.code,
      required this.name,
      this.minDays = 0,
      this.maxDays = 0,
      this.baseCharge = 0.0,
      this.formattedWindow = ''});

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey()
  final int minDays;
  @override
  @JsonKey()
  final int maxDays;
  @override
  @JsonKey()
  final double baseCharge;
  @override
  @JsonKey()
  final String formattedWindow;

  /// Create a copy of AvailableShippingMethodEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AvailableShippingMethodEntityCopyWith<_AvailableShippingMethodEntity>
      get copyWith => __$AvailableShippingMethodEntityCopyWithImpl<
          _AvailableShippingMethodEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvailableShippingMethodEntity &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minDays, minDays) || other.minDays == minDays) &&
            (identical(other.maxDays, maxDays) || other.maxDays == maxDays) &&
            (identical(other.baseCharge, baseCharge) ||
                other.baseCharge == baseCharge) &&
            (identical(other.formattedWindow, formattedWindow) ||
                other.formattedWindow == formattedWindow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, minDays, maxDays, baseCharge, formattedWindow);

  @override
  String toString() {
    return 'AvailableShippingMethodEntity(code: $code, name: $name, minDays: $minDays, maxDays: $maxDays, baseCharge: $baseCharge, formattedWindow: $formattedWindow)';
  }
}

/// @nodoc
abstract mixin class _$AvailableShippingMethodEntityCopyWith<$Res>
    implements $AvailableShippingMethodEntityCopyWith<$Res> {
  factory _$AvailableShippingMethodEntityCopyWith(
          _AvailableShippingMethodEntity value,
          $Res Function(_AvailableShippingMethodEntity) _then) =
      __$AvailableShippingMethodEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      int minDays,
      int maxDays,
      double baseCharge,
      String formattedWindow});
}

/// @nodoc
class __$AvailableShippingMethodEntityCopyWithImpl<$Res>
    implements _$AvailableShippingMethodEntityCopyWith<$Res> {
  __$AvailableShippingMethodEntityCopyWithImpl(this._self, this._then);

  final _AvailableShippingMethodEntity _self;
  final $Res Function(_AvailableShippingMethodEntity) _then;

  /// Create a copy of AvailableShippingMethodEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? minDays = null,
    Object? maxDays = null,
    Object? baseCharge = null,
    Object? formattedWindow = null,
  }) {
    return _then(_AvailableShippingMethodEntity(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minDays: null == minDays
          ? _self.minDays
          : minDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _self.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
      baseCharge: null == baseCharge
          ? _self.baseCharge
          : baseCharge // ignore: cast_nullable_to_non_nullable
              as double,
      formattedWindow: null == formattedWindow
          ? _self.formattedWindow
          : formattedWindow // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ShippingQuoteEntity {
  String get currency;
  String get currencySymbol;
  bool get serviceable;
  String get pinCode;
  String? get city;
  String? get district;
  String? get state;
  String? get stateCode;
  String? get shippingZone;
  AvailableShippingMethodEntity? get selectedMethod;
  List<AvailableShippingMethodEntity> get availableMethods;
  double get shippingAmount;
  bool get freeShipping;
  double get freeShippingThreshold;
  double get amountNeededForFreeShipping;
  DeliveryWindowEntity? get deliveryEstimate;
  String? get message;

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShippingQuoteEntityCopyWith<ShippingQuoteEntity> get copyWith =>
      _$ShippingQuoteEntityCopyWithImpl<ShippingQuoteEntity>(
          this as ShippingQuoteEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShippingQuoteEntity &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.serviceable, serviceable) ||
                other.serviceable == serviceable) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.shippingZone, shippingZone) ||
                other.shippingZone == shippingZone) &&
            (identical(other.selectedMethod, selectedMethod) ||
                other.selectedMethod == selectedMethod) &&
            const DeepCollectionEquality()
                .equals(other.availableMethods, availableMethods) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.freeShipping, freeShipping) ||
                other.freeShipping == freeShipping) &&
            (identical(other.freeShippingThreshold, freeShippingThreshold) ||
                other.freeShippingThreshold == freeShippingThreshold) &&
            (identical(other.amountNeededForFreeShipping,
                    amountNeededForFreeShipping) ||
                other.amountNeededForFreeShipping ==
                    amountNeededForFreeShipping) &&
            (identical(other.deliveryEstimate, deliveryEstimate) ||
                other.deliveryEstimate == deliveryEstimate) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      currencySymbol,
      serviceable,
      pinCode,
      city,
      district,
      state,
      stateCode,
      shippingZone,
      selectedMethod,
      const DeepCollectionEquality().hash(availableMethods),
      shippingAmount,
      freeShipping,
      freeShippingThreshold,
      amountNeededForFreeShipping,
      deliveryEstimate,
      message);

  @override
  String toString() {
    return 'ShippingQuoteEntity(currency: $currency, currencySymbol: $currencySymbol, serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, selectedMethod: $selectedMethod, availableMethods: $availableMethods, shippingAmount: $shippingAmount, freeShipping: $freeShipping, freeShippingThreshold: $freeShippingThreshold, amountNeededForFreeShipping: $amountNeededForFreeShipping, deliveryEstimate: $deliveryEstimate, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ShippingQuoteEntityCopyWith<$Res> {
  factory $ShippingQuoteEntityCopyWith(
          ShippingQuoteEntity value, $Res Function(ShippingQuoteEntity) _then) =
      _$ShippingQuoteEntityCopyWithImpl;
  @useResult
  $Res call(
      {String currency,
      String currencySymbol,
      bool serviceable,
      String pinCode,
      String? city,
      String? district,
      String? state,
      String? stateCode,
      String? shippingZone,
      AvailableShippingMethodEntity? selectedMethod,
      List<AvailableShippingMethodEntity> availableMethods,
      double shippingAmount,
      bool freeShipping,
      double freeShippingThreshold,
      double amountNeededForFreeShipping,
      DeliveryWindowEntity? deliveryEstimate,
      String? message});

  $AvailableShippingMethodEntityCopyWith<$Res>? get selectedMethod;
  $DeliveryWindowEntityCopyWith<$Res>? get deliveryEstimate;
}

/// @nodoc
class _$ShippingQuoteEntityCopyWithImpl<$Res>
    implements $ShippingQuoteEntityCopyWith<$Res> {
  _$ShippingQuoteEntityCopyWithImpl(this._self, this._then);

  final ShippingQuoteEntity _self;
  final $Res Function(ShippingQuoteEntity) _then;

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? currencySymbol = null,
    Object? serviceable = null,
    Object? pinCode = null,
    Object? city = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? stateCode = freezed,
    Object? shippingZone = freezed,
    Object? selectedMethod = freezed,
    Object? availableMethods = null,
    Object? shippingAmount = null,
    Object? freeShipping = null,
    Object? freeShippingThreshold = null,
    Object? amountNeededForFreeShipping = null,
    Object? deliveryEstimate = freezed,
    Object? message = freezed,
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
      serviceable: null == serviceable
          ? _self.serviceable
          : serviceable // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingZone: freezed == shippingZone
          ? _self.shippingZone
          : shippingZone // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMethod: freezed == selectedMethod
          ? _self.selectedMethod
          : selectedMethod // ignore: cast_nullable_to_non_nullable
              as AvailableShippingMethodEntity?,
      availableMethods: null == availableMethods
          ? _self.availableMethods
          : availableMethods // ignore: cast_nullable_to_non_nullable
              as List<AvailableShippingMethodEntity>,
      shippingAmount: null == shippingAmount
          ? _self.shippingAmount
          : shippingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      freeShipping: null == freeShipping
          ? _self.freeShipping
          : freeShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      freeShippingThreshold: null == freeShippingThreshold
          ? _self.freeShippingThreshold
          : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      amountNeededForFreeShipping: null == amountNeededForFreeShipping
          ? _self.amountNeededForFreeShipping
          : amountNeededForFreeShipping // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryEstimate: freezed == deliveryEstimate
          ? _self.deliveryEstimate
          : deliveryEstimate // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowEntity?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailableShippingMethodEntityCopyWith<$Res>? get selectedMethod {
    if (_self.selectedMethod == null) {
      return null;
    }

    return $AvailableShippingMethodEntityCopyWith<$Res>(_self.selectedMethod!,
        (value) {
      return _then(_self.copyWith(selectedMethod: value));
    });
  }

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<$Res>? get deliveryEstimate {
    if (_self.deliveryEstimate == null) {
      return null;
    }

    return $DeliveryWindowEntityCopyWith<$Res>(_self.deliveryEstimate!,
        (value) {
      return _then(_self.copyWith(deliveryEstimate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ShippingQuoteEntity].
extension ShippingQuoteEntityPatterns on ShippingQuoteEntity {
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
    TResult Function(_ShippingQuoteEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteEntity() when $default != null:
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
    TResult Function(_ShippingQuoteEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteEntity():
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
    TResult? Function(_ShippingQuoteEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteEntity() when $default != null:
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
            bool serviceable,
            String pinCode,
            String? city,
            String? district,
            String? state,
            String? stateCode,
            String? shippingZone,
            AvailableShippingMethodEntity? selectedMethod,
            List<AvailableShippingMethodEntity> availableMethods,
            double shippingAmount,
            bool freeShipping,
            double freeShippingThreshold,
            double amountNeededForFreeShipping,
            DeliveryWindowEntity? deliveryEstimate,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteEntity() when $default != null:
        return $default(
            _that.currency,
            _that.currencySymbol,
            _that.serviceable,
            _that.pinCode,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.shippingZone,
            _that.selectedMethod,
            _that.availableMethods,
            _that.shippingAmount,
            _that.freeShipping,
            _that.freeShippingThreshold,
            _that.amountNeededForFreeShipping,
            _that.deliveryEstimate,
            _that.message);
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
            bool serviceable,
            String pinCode,
            String? city,
            String? district,
            String? state,
            String? stateCode,
            String? shippingZone,
            AvailableShippingMethodEntity? selectedMethod,
            List<AvailableShippingMethodEntity> availableMethods,
            double shippingAmount,
            bool freeShipping,
            double freeShippingThreshold,
            double amountNeededForFreeShipping,
            DeliveryWindowEntity? deliveryEstimate,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteEntity():
        return $default(
            _that.currency,
            _that.currencySymbol,
            _that.serviceable,
            _that.pinCode,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.shippingZone,
            _that.selectedMethod,
            _that.availableMethods,
            _that.shippingAmount,
            _that.freeShipping,
            _that.freeShippingThreshold,
            _that.amountNeededForFreeShipping,
            _that.deliveryEstimate,
            _that.message);
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
            bool serviceable,
            String pinCode,
            String? city,
            String? district,
            String? state,
            String? stateCode,
            String? shippingZone,
            AvailableShippingMethodEntity? selectedMethod,
            List<AvailableShippingMethodEntity> availableMethods,
            double shippingAmount,
            bool freeShipping,
            double freeShippingThreshold,
            double amountNeededForFreeShipping,
            DeliveryWindowEntity? deliveryEstimate,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteEntity() when $default != null:
        return $default(
            _that.currency,
            _that.currencySymbol,
            _that.serviceable,
            _that.pinCode,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.shippingZone,
            _that.selectedMethod,
            _that.availableMethods,
            _that.shippingAmount,
            _that.freeShipping,
            _that.freeShippingThreshold,
            _that.amountNeededForFreeShipping,
            _that.deliveryEstimate,
            _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShippingQuoteEntity implements ShippingQuoteEntity {
  const _ShippingQuoteEntity(
      {this.currency = 'INR',
      this.currencySymbol = '₹',
      required this.serviceable,
      required this.pinCode,
      this.city,
      this.district,
      this.state,
      this.stateCode,
      this.shippingZone,
      this.selectedMethod,
      final List<AvailableShippingMethodEntity> availableMethods = const [],
      this.shippingAmount = 0.0,
      this.freeShipping = false,
      this.freeShippingThreshold = 999.0,
      this.amountNeededForFreeShipping = 0.0,
      this.deliveryEstimate,
      this.message})
      : _availableMethods = availableMethods;

  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String currencySymbol;
  @override
  final bool serviceable;
  @override
  final String pinCode;
  @override
  final String? city;
  @override
  final String? district;
  @override
  final String? state;
  @override
  final String? stateCode;
  @override
  final String? shippingZone;
  @override
  final AvailableShippingMethodEntity? selectedMethod;
  final List<AvailableShippingMethodEntity> _availableMethods;
  @override
  @JsonKey()
  List<AvailableShippingMethodEntity> get availableMethods {
    if (_availableMethods is EqualUnmodifiableListView)
      return _availableMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableMethods);
  }

  @override
  @JsonKey()
  final double shippingAmount;
  @override
  @JsonKey()
  final bool freeShipping;
  @override
  @JsonKey()
  final double freeShippingThreshold;
  @override
  @JsonKey()
  final double amountNeededForFreeShipping;
  @override
  final DeliveryWindowEntity? deliveryEstimate;
  @override
  final String? message;

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShippingQuoteEntityCopyWith<_ShippingQuoteEntity> get copyWith =>
      __$ShippingQuoteEntityCopyWithImpl<_ShippingQuoteEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShippingQuoteEntity &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.serviceable, serviceable) ||
                other.serviceable == serviceable) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.shippingZone, shippingZone) ||
                other.shippingZone == shippingZone) &&
            (identical(other.selectedMethod, selectedMethod) ||
                other.selectedMethod == selectedMethod) &&
            const DeepCollectionEquality()
                .equals(other._availableMethods, _availableMethods) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.freeShipping, freeShipping) ||
                other.freeShipping == freeShipping) &&
            (identical(other.freeShippingThreshold, freeShippingThreshold) ||
                other.freeShippingThreshold == freeShippingThreshold) &&
            (identical(other.amountNeededForFreeShipping,
                    amountNeededForFreeShipping) ||
                other.amountNeededForFreeShipping ==
                    amountNeededForFreeShipping) &&
            (identical(other.deliveryEstimate, deliveryEstimate) ||
                other.deliveryEstimate == deliveryEstimate) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      currencySymbol,
      serviceable,
      pinCode,
      city,
      district,
      state,
      stateCode,
      shippingZone,
      selectedMethod,
      const DeepCollectionEquality().hash(_availableMethods),
      shippingAmount,
      freeShipping,
      freeShippingThreshold,
      amountNeededForFreeShipping,
      deliveryEstimate,
      message);

  @override
  String toString() {
    return 'ShippingQuoteEntity(currency: $currency, currencySymbol: $currencySymbol, serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, selectedMethod: $selectedMethod, availableMethods: $availableMethods, shippingAmount: $shippingAmount, freeShipping: $freeShipping, freeShippingThreshold: $freeShippingThreshold, amountNeededForFreeShipping: $amountNeededForFreeShipping, deliveryEstimate: $deliveryEstimate, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ShippingQuoteEntityCopyWith<$Res>
    implements $ShippingQuoteEntityCopyWith<$Res> {
  factory _$ShippingQuoteEntityCopyWith(_ShippingQuoteEntity value,
          $Res Function(_ShippingQuoteEntity) _then) =
      __$ShippingQuoteEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String currency,
      String currencySymbol,
      bool serviceable,
      String pinCode,
      String? city,
      String? district,
      String? state,
      String? stateCode,
      String? shippingZone,
      AvailableShippingMethodEntity? selectedMethod,
      List<AvailableShippingMethodEntity> availableMethods,
      double shippingAmount,
      bool freeShipping,
      double freeShippingThreshold,
      double amountNeededForFreeShipping,
      DeliveryWindowEntity? deliveryEstimate,
      String? message});

  @override
  $AvailableShippingMethodEntityCopyWith<$Res>? get selectedMethod;
  @override
  $DeliveryWindowEntityCopyWith<$Res>? get deliveryEstimate;
}

/// @nodoc
class __$ShippingQuoteEntityCopyWithImpl<$Res>
    implements _$ShippingQuoteEntityCopyWith<$Res> {
  __$ShippingQuoteEntityCopyWithImpl(this._self, this._then);

  final _ShippingQuoteEntity _self;
  final $Res Function(_ShippingQuoteEntity) _then;

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currency = null,
    Object? currencySymbol = null,
    Object? serviceable = null,
    Object? pinCode = null,
    Object? city = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? stateCode = freezed,
    Object? shippingZone = freezed,
    Object? selectedMethod = freezed,
    Object? availableMethods = null,
    Object? shippingAmount = null,
    Object? freeShipping = null,
    Object? freeShippingThreshold = null,
    Object? amountNeededForFreeShipping = null,
    Object? deliveryEstimate = freezed,
    Object? message = freezed,
  }) {
    return _then(_ShippingQuoteEntity(
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      serviceable: null == serviceable
          ? _self.serviceable
          : serviceable // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingZone: freezed == shippingZone
          ? _self.shippingZone
          : shippingZone // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMethod: freezed == selectedMethod
          ? _self.selectedMethod
          : selectedMethod // ignore: cast_nullable_to_non_nullable
              as AvailableShippingMethodEntity?,
      availableMethods: null == availableMethods
          ? _self._availableMethods
          : availableMethods // ignore: cast_nullable_to_non_nullable
              as List<AvailableShippingMethodEntity>,
      shippingAmount: null == shippingAmount
          ? _self.shippingAmount
          : shippingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      freeShipping: null == freeShipping
          ? _self.freeShipping
          : freeShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      freeShippingThreshold: null == freeShippingThreshold
          ? _self.freeShippingThreshold
          : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      amountNeededForFreeShipping: null == amountNeededForFreeShipping
          ? _self.amountNeededForFreeShipping
          : amountNeededForFreeShipping // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryEstimate: freezed == deliveryEstimate
          ? _self.deliveryEstimate
          : deliveryEstimate // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowEntity?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailableShippingMethodEntityCopyWith<$Res>? get selectedMethod {
    if (_self.selectedMethod == null) {
      return null;
    }

    return $AvailableShippingMethodEntityCopyWith<$Res>(_self.selectedMethod!,
        (value) {
      return _then(_self.copyWith(selectedMethod: value));
    });
  }

  /// Create a copy of ShippingQuoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowEntityCopyWith<$Res>? get deliveryEstimate {
    if (_self.deliveryEstimate == null) {
      return null;
    }

    return $DeliveryWindowEntityCopyWith<$Res>(_self.deliveryEstimate!,
        (value) {
      return _then(_self.copyWith(deliveryEstimate: value));
    });
  }
}

// dart format on
