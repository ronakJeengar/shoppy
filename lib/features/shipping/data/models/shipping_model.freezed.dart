// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryWindowModel {
  int get minDays;
  int get maxDays;
  String get formattedWindow;
  bool get available;

  /// Create a copy of DeliveryWindowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<DeliveryWindowModel> get copyWith =>
      _$DeliveryWindowModelCopyWithImpl<DeliveryWindowModel>(
          this as DeliveryWindowModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryWindowModel &&
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
    return 'DeliveryWindowModel(minDays: $minDays, maxDays: $maxDays, formattedWindow: $formattedWindow, available: $available)';
  }
}

/// @nodoc
abstract mixin class $DeliveryWindowModelCopyWith<$Res> {
  factory $DeliveryWindowModelCopyWith(
          DeliveryWindowModel value, $Res Function(DeliveryWindowModel) _then) =
      _$DeliveryWindowModelCopyWithImpl;
  @useResult
  $Res call({int minDays, int maxDays, String formattedWindow, bool available});
}

/// @nodoc
class _$DeliveryWindowModelCopyWithImpl<$Res>
    implements $DeliveryWindowModelCopyWith<$Res> {
  _$DeliveryWindowModelCopyWithImpl(this._self, this._then);

  final DeliveryWindowModel _self;
  final $Res Function(DeliveryWindowModel) _then;

  /// Create a copy of DeliveryWindowModel
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

/// Adds pattern-matching-related methods to [DeliveryWindowModel].
extension DeliveryWindowModelPatterns on DeliveryWindowModel {
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
    TResult Function(_DeliveryWindowModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowModel() when $default != null:
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
    TResult Function(_DeliveryWindowModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowModel():
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
    TResult? Function(_DeliveryWindowModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryWindowModel() when $default != null:
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
      case _DeliveryWindowModel() when $default != null:
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
      case _DeliveryWindowModel():
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
      case _DeliveryWindowModel() when $default != null:
        return $default(_that.minDays, _that.maxDays, _that.formattedWindow,
            _that.available);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeliveryWindowModel implements DeliveryWindowModel {
  const _DeliveryWindowModel(
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

  /// Create a copy of DeliveryWindowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryWindowModelCopyWith<_DeliveryWindowModel> get copyWith =>
      __$DeliveryWindowModelCopyWithImpl<_DeliveryWindowModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryWindowModel &&
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
    return 'DeliveryWindowModel(minDays: $minDays, maxDays: $maxDays, formattedWindow: $formattedWindow, available: $available)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryWindowModelCopyWith<$Res>
    implements $DeliveryWindowModelCopyWith<$Res> {
  factory _$DeliveryWindowModelCopyWith(_DeliveryWindowModel value,
          $Res Function(_DeliveryWindowModel) _then) =
      __$DeliveryWindowModelCopyWithImpl;
  @override
  @useResult
  $Res call({int minDays, int maxDays, String formattedWindow, bool available});
}

/// @nodoc
class __$DeliveryWindowModelCopyWithImpl<$Res>
    implements _$DeliveryWindowModelCopyWith<$Res> {
  __$DeliveryWindowModelCopyWithImpl(this._self, this._then);

  final _DeliveryWindowModel _self;
  final $Res Function(_DeliveryWindowModel) _then;

  /// Create a copy of DeliveryWindowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? minDays = null,
    Object? maxDays = null,
    Object? formattedWindow = null,
    Object? available = null,
  }) {
    return _then(_DeliveryWindowModel(
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
mixin _$DeliveryOptionsModel {
  DeliveryWindowModel? get standard;
  DeliveryWindowModel? get express;

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeliveryOptionsModelCopyWith<DeliveryOptionsModel> get copyWith =>
      _$DeliveryOptionsModelCopyWithImpl<DeliveryOptionsModel>(
          this as DeliveryOptionsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeliveryOptionsModel &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.express, express) || other.express == express));
  }

  @override
  int get hashCode => Object.hash(runtimeType, standard, express);

  @override
  String toString() {
    return 'DeliveryOptionsModel(standard: $standard, express: $express)';
  }
}

/// @nodoc
abstract mixin class $DeliveryOptionsModelCopyWith<$Res> {
  factory $DeliveryOptionsModelCopyWith(DeliveryOptionsModel value,
          $Res Function(DeliveryOptionsModel) _then) =
      _$DeliveryOptionsModelCopyWithImpl;
  @useResult
  $Res call({DeliveryWindowModel? standard, DeliveryWindowModel? express});

  $DeliveryWindowModelCopyWith<$Res>? get standard;
  $DeliveryWindowModelCopyWith<$Res>? get express;
}

/// @nodoc
class _$DeliveryOptionsModelCopyWithImpl<$Res>
    implements $DeliveryOptionsModelCopyWith<$Res> {
  _$DeliveryOptionsModelCopyWithImpl(this._self, this._then);

  final DeliveryOptionsModel _self;
  final $Res Function(DeliveryOptionsModel) _then;

  /// Create a copy of DeliveryOptionsModel
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
              as DeliveryWindowModel?,
      express: freezed == express
          ? _self.express
          : express // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowModel?,
    ));
  }

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<$Res>? get standard {
    if (_self.standard == null) {
      return null;
    }

    return $DeliveryWindowModelCopyWith<$Res>(_self.standard!, (value) {
      return _then(_self.copyWith(standard: value));
    });
  }

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<$Res>? get express {
    if (_self.express == null) {
      return null;
    }

    return $DeliveryWindowModelCopyWith<$Res>(_self.express!, (value) {
      return _then(_self.copyWith(express: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeliveryOptionsModel].
extension DeliveryOptionsModelPatterns on DeliveryOptionsModel {
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
    TResult Function(_DeliveryOptionsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsModel() when $default != null:
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
    TResult Function(_DeliveryOptionsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsModel():
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
    TResult? Function(_DeliveryOptionsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsModel() when $default != null:
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
            DeliveryWindowModel? standard, DeliveryWindowModel? express)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsModel() when $default != null:
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
            DeliveryWindowModel? standard, DeliveryWindowModel? express)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsModel():
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
            DeliveryWindowModel? standard, DeliveryWindowModel? express)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeliveryOptionsModel() when $default != null:
        return $default(_that.standard, _that.express);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DeliveryOptionsModel implements DeliveryOptionsModel {
  const _DeliveryOptionsModel({this.standard, this.express});

  @override
  final DeliveryWindowModel? standard;
  @override
  final DeliveryWindowModel? express;

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeliveryOptionsModelCopyWith<_DeliveryOptionsModel> get copyWith =>
      __$DeliveryOptionsModelCopyWithImpl<_DeliveryOptionsModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeliveryOptionsModel &&
            (identical(other.standard, standard) ||
                other.standard == standard) &&
            (identical(other.express, express) || other.express == express));
  }

  @override
  int get hashCode => Object.hash(runtimeType, standard, express);

  @override
  String toString() {
    return 'DeliveryOptionsModel(standard: $standard, express: $express)';
  }
}

/// @nodoc
abstract mixin class _$DeliveryOptionsModelCopyWith<$Res>
    implements $DeliveryOptionsModelCopyWith<$Res> {
  factory _$DeliveryOptionsModelCopyWith(_DeliveryOptionsModel value,
          $Res Function(_DeliveryOptionsModel) _then) =
      __$DeliveryOptionsModelCopyWithImpl;
  @override
  @useResult
  $Res call({DeliveryWindowModel? standard, DeliveryWindowModel? express});

  @override
  $DeliveryWindowModelCopyWith<$Res>? get standard;
  @override
  $DeliveryWindowModelCopyWith<$Res>? get express;
}

/// @nodoc
class __$DeliveryOptionsModelCopyWithImpl<$Res>
    implements _$DeliveryOptionsModelCopyWith<$Res> {
  __$DeliveryOptionsModelCopyWithImpl(this._self, this._then);

  final _DeliveryOptionsModel _self;
  final $Res Function(_DeliveryOptionsModel) _then;

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? standard = freezed,
    Object? express = freezed,
  }) {
    return _then(_DeliveryOptionsModel(
      standard: freezed == standard
          ? _self.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowModel?,
      express: freezed == express
          ? _self.express
          : express // ignore: cast_nullable_to_non_nullable
              as DeliveryWindowModel?,
    ));
  }

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<$Res>? get standard {
    if (_self.standard == null) {
      return null;
    }

    return $DeliveryWindowModelCopyWith<$Res>(_self.standard!, (value) {
      return _then(_self.copyWith(standard: value));
    });
  }

  /// Create a copy of DeliveryOptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<$Res>? get express {
    if (_self.express == null) {
      return null;
    }

    return $DeliveryWindowModelCopyWith<$Res>(_self.express!, (value) {
      return _then(_self.copyWith(express: value));
    });
  }
}

/// @nodoc
mixin _$PinServiceabilityModel {
  bool get serviceable;
  String get pinCode;
  String get city;
  String get district;
  String get state;
  String get stateCode;
  String get shippingZone;
  bool get codAvailable;
  DeliveryOptionsModel? get delivery;
  String? get message;

  /// Create a copy of PinServiceabilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PinServiceabilityModelCopyWith<PinServiceabilityModel> get copyWith =>
      _$PinServiceabilityModelCopyWithImpl<PinServiceabilityModel>(
          this as PinServiceabilityModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PinServiceabilityModel &&
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
    return 'PinServiceabilityModel(serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, codAvailable: $codAvailable, delivery: $delivery, message: $message)';
  }
}

/// @nodoc
abstract mixin class $PinServiceabilityModelCopyWith<$Res> {
  factory $PinServiceabilityModelCopyWith(PinServiceabilityModel value,
          $Res Function(PinServiceabilityModel) _then) =
      _$PinServiceabilityModelCopyWithImpl;
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
      DeliveryOptionsModel? delivery,
      String? message});

  $DeliveryOptionsModelCopyWith<$Res>? get delivery;
}

/// @nodoc
class _$PinServiceabilityModelCopyWithImpl<$Res>
    implements $PinServiceabilityModelCopyWith<$Res> {
  _$PinServiceabilityModelCopyWithImpl(this._self, this._then);

  final PinServiceabilityModel _self;
  final $Res Function(PinServiceabilityModel) _then;

  /// Create a copy of PinServiceabilityModel
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
              as DeliveryOptionsModel?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PinServiceabilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOptionsModelCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
      return null;
    }

    return $DeliveryOptionsModelCopyWith<$Res>(_self.delivery!, (value) {
      return _then(_self.copyWith(delivery: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PinServiceabilityModel].
extension PinServiceabilityModelPatterns on PinServiceabilityModel {
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
    TResult Function(_PinServiceabilityModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityModel() when $default != null:
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
    TResult Function(_PinServiceabilityModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityModel():
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
    TResult? Function(_PinServiceabilityModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityModel() when $default != null:
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
            DeliveryOptionsModel? delivery,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityModel() when $default != null:
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
            DeliveryOptionsModel? delivery,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityModel():
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
            DeliveryOptionsModel? delivery,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PinServiceabilityModel() when $default != null:
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

class _PinServiceabilityModel implements PinServiceabilityModel {
  const _PinServiceabilityModel(
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
  final DeliveryOptionsModel? delivery;
  @override
  final String? message;

  /// Create a copy of PinServiceabilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PinServiceabilityModelCopyWith<_PinServiceabilityModel> get copyWith =>
      __$PinServiceabilityModelCopyWithImpl<_PinServiceabilityModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PinServiceabilityModel &&
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
    return 'PinServiceabilityModel(serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, codAvailable: $codAvailable, delivery: $delivery, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$PinServiceabilityModelCopyWith<$Res>
    implements $PinServiceabilityModelCopyWith<$Res> {
  factory _$PinServiceabilityModelCopyWith(_PinServiceabilityModel value,
          $Res Function(_PinServiceabilityModel) _then) =
      __$PinServiceabilityModelCopyWithImpl;
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
      DeliveryOptionsModel? delivery,
      String? message});

  @override
  $DeliveryOptionsModelCopyWith<$Res>? get delivery;
}

/// @nodoc
class __$PinServiceabilityModelCopyWithImpl<$Res>
    implements _$PinServiceabilityModelCopyWith<$Res> {
  __$PinServiceabilityModelCopyWithImpl(this._self, this._then);

  final _PinServiceabilityModel _self;
  final $Res Function(_PinServiceabilityModel) _then;

  /// Create a copy of PinServiceabilityModel
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
    return _then(_PinServiceabilityModel(
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
              as DeliveryOptionsModel?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PinServiceabilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOptionsModelCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
      return null;
    }

    return $DeliveryOptionsModelCopyWith<$Res>(_self.delivery!, (value) {
      return _then(_self.copyWith(delivery: value));
    });
  }
}

/// @nodoc
mixin _$AvailableShippingMethodModel {
  String get code;
  String get name;
  int get minDays;
  int get maxDays;
  double get baseCharge;
  String get formattedWindow;

  /// Create a copy of AvailableShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AvailableShippingMethodModelCopyWith<AvailableShippingMethodModel>
      get copyWith => _$AvailableShippingMethodModelCopyWithImpl<
              AvailableShippingMethodModel>(
          this as AvailableShippingMethodModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvailableShippingMethodModel &&
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
    return 'AvailableShippingMethodModel(code: $code, name: $name, minDays: $minDays, maxDays: $maxDays, baseCharge: $baseCharge, formattedWindow: $formattedWindow)';
  }
}

/// @nodoc
abstract mixin class $AvailableShippingMethodModelCopyWith<$Res> {
  factory $AvailableShippingMethodModelCopyWith(
          AvailableShippingMethodModel value,
          $Res Function(AvailableShippingMethodModel) _then) =
      _$AvailableShippingMethodModelCopyWithImpl;
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
class _$AvailableShippingMethodModelCopyWithImpl<$Res>
    implements $AvailableShippingMethodModelCopyWith<$Res> {
  _$AvailableShippingMethodModelCopyWithImpl(this._self, this._then);

  final AvailableShippingMethodModel _self;
  final $Res Function(AvailableShippingMethodModel) _then;

  /// Create a copy of AvailableShippingMethodModel
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

/// Adds pattern-matching-related methods to [AvailableShippingMethodModel].
extension AvailableShippingMethodModelPatterns on AvailableShippingMethodModel {
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
    TResult Function(_AvailableShippingMethodModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodModel() when $default != null:
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
    TResult Function(_AvailableShippingMethodModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodModel():
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
    TResult? Function(_AvailableShippingMethodModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AvailableShippingMethodModel() when $default != null:
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
      case _AvailableShippingMethodModel() when $default != null:
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
      case _AvailableShippingMethodModel():
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
      case _AvailableShippingMethodModel() when $default != null:
        return $default(_that.code, _that.name, _that.minDays, _that.maxDays,
            _that.baseCharge, _that.formattedWindow);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AvailableShippingMethodModel implements AvailableShippingMethodModel {
  const _AvailableShippingMethodModel(
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

  /// Create a copy of AvailableShippingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AvailableShippingMethodModelCopyWith<_AvailableShippingMethodModel>
      get copyWith => __$AvailableShippingMethodModelCopyWithImpl<
          _AvailableShippingMethodModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvailableShippingMethodModel &&
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
    return 'AvailableShippingMethodModel(code: $code, name: $name, minDays: $minDays, maxDays: $maxDays, baseCharge: $baseCharge, formattedWindow: $formattedWindow)';
  }
}

/// @nodoc
abstract mixin class _$AvailableShippingMethodModelCopyWith<$Res>
    implements $AvailableShippingMethodModelCopyWith<$Res> {
  factory _$AvailableShippingMethodModelCopyWith(
          _AvailableShippingMethodModel value,
          $Res Function(_AvailableShippingMethodModel) _then) =
      __$AvailableShippingMethodModelCopyWithImpl;
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
class __$AvailableShippingMethodModelCopyWithImpl<$Res>
    implements _$AvailableShippingMethodModelCopyWith<$Res> {
  __$AvailableShippingMethodModelCopyWithImpl(this._self, this._then);

  final _AvailableShippingMethodModel _self;
  final $Res Function(_AvailableShippingMethodModel) _then;

  /// Create a copy of AvailableShippingMethodModel
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
    return _then(_AvailableShippingMethodModel(
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
mixin _$ShippingQuoteModel {
  String get currency;
  String get currencySymbol;
  bool get serviceable;
  String get pinCode;
  String? get city;
  String? get district;
  String? get state;
  String? get stateCode;
  String? get shippingZone;
  AvailableShippingMethodModel? get selectedMethod;
  List<AvailableShippingMethodModel> get availableMethods;
  double get shippingAmount;
  bool get freeShipping;
  double get freeShippingThreshold;
  double get amountNeededForFreeShipping;
  DeliveryWindowModel? get deliveryEstimate;
  String? get message;

  /// Create a copy of ShippingQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShippingQuoteModelCopyWith<ShippingQuoteModel> get copyWith =>
      _$ShippingQuoteModelCopyWithImpl<ShippingQuoteModel>(
          this as ShippingQuoteModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShippingQuoteModel &&
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
    return 'ShippingQuoteModel(currency: $currency, currencySymbol: $currencySymbol, serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, selectedMethod: $selectedMethod, availableMethods: $availableMethods, shippingAmount: $shippingAmount, freeShipping: $freeShipping, freeShippingThreshold: $freeShippingThreshold, amountNeededForFreeShipping: $amountNeededForFreeShipping, deliveryEstimate: $deliveryEstimate, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ShippingQuoteModelCopyWith<$Res> {
  factory $ShippingQuoteModelCopyWith(
          ShippingQuoteModel value, $Res Function(ShippingQuoteModel) _then) =
      _$ShippingQuoteModelCopyWithImpl;
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
      AvailableShippingMethodModel? selectedMethod,
      List<AvailableShippingMethodModel> availableMethods,
      double shippingAmount,
      bool freeShipping,
      double freeShippingThreshold,
      double amountNeededForFreeShipping,
      DeliveryWindowModel? deliveryEstimate,
      String? message});

  $AvailableShippingMethodModelCopyWith<$Res>? get selectedMethod;
  $DeliveryWindowModelCopyWith<$Res>? get deliveryEstimate;
}

/// @nodoc
class _$ShippingQuoteModelCopyWithImpl<$Res>
    implements $ShippingQuoteModelCopyWith<$Res> {
  _$ShippingQuoteModelCopyWithImpl(this._self, this._then);

  final ShippingQuoteModel _self;
  final $Res Function(ShippingQuoteModel) _then;

  /// Create a copy of ShippingQuoteModel
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
              as AvailableShippingMethodModel?,
      availableMethods: null == availableMethods
          ? _self.availableMethods
          : availableMethods // ignore: cast_nullable_to_non_nullable
              as List<AvailableShippingMethodModel>,
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
              as DeliveryWindowModel?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ShippingQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailableShippingMethodModelCopyWith<$Res>? get selectedMethod {
    if (_self.selectedMethod == null) {
      return null;
    }

    return $AvailableShippingMethodModelCopyWith<$Res>(_self.selectedMethod!,
        (value) {
      return _then(_self.copyWith(selectedMethod: value));
    });
  }

  /// Create a copy of ShippingQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<$Res>? get deliveryEstimate {
    if (_self.deliveryEstimate == null) {
      return null;
    }

    return $DeliveryWindowModelCopyWith<$Res>(_self.deliveryEstimate!, (value) {
      return _then(_self.copyWith(deliveryEstimate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ShippingQuoteModel].
extension ShippingQuoteModelPatterns on ShippingQuoteModel {
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
    TResult Function(_ShippingQuoteModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteModel() when $default != null:
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
    TResult Function(_ShippingQuoteModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteModel():
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
    TResult? Function(_ShippingQuoteModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteModel() when $default != null:
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
            AvailableShippingMethodModel? selectedMethod,
            List<AvailableShippingMethodModel> availableMethods,
            double shippingAmount,
            bool freeShipping,
            double freeShippingThreshold,
            double amountNeededForFreeShipping,
            DeliveryWindowModel? deliveryEstimate,
            String? message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteModel() when $default != null:
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
            AvailableShippingMethodModel? selectedMethod,
            List<AvailableShippingMethodModel> availableMethods,
            double shippingAmount,
            bool freeShipping,
            double freeShippingThreshold,
            double amountNeededForFreeShipping,
            DeliveryWindowModel? deliveryEstimate,
            String? message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteModel():
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
            AvailableShippingMethodModel? selectedMethod,
            List<AvailableShippingMethodModel> availableMethods,
            double shippingAmount,
            bool freeShipping,
            double freeShippingThreshold,
            double amountNeededForFreeShipping,
            DeliveryWindowModel? deliveryEstimate,
            String? message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingQuoteModel() when $default != null:
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

class _ShippingQuoteModel implements ShippingQuoteModel {
  const _ShippingQuoteModel(
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
      final List<AvailableShippingMethodModel> availableMethods = const [],
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
  final AvailableShippingMethodModel? selectedMethod;
  final List<AvailableShippingMethodModel> _availableMethods;
  @override
  @JsonKey()
  List<AvailableShippingMethodModel> get availableMethods {
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
  final DeliveryWindowModel? deliveryEstimate;
  @override
  final String? message;

  /// Create a copy of ShippingQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShippingQuoteModelCopyWith<_ShippingQuoteModel> get copyWith =>
      __$ShippingQuoteModelCopyWithImpl<_ShippingQuoteModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShippingQuoteModel &&
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
    return 'ShippingQuoteModel(currency: $currency, currencySymbol: $currencySymbol, serviceable: $serviceable, pinCode: $pinCode, city: $city, district: $district, state: $state, stateCode: $stateCode, shippingZone: $shippingZone, selectedMethod: $selectedMethod, availableMethods: $availableMethods, shippingAmount: $shippingAmount, freeShipping: $freeShipping, freeShippingThreshold: $freeShippingThreshold, amountNeededForFreeShipping: $amountNeededForFreeShipping, deliveryEstimate: $deliveryEstimate, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ShippingQuoteModelCopyWith<$Res>
    implements $ShippingQuoteModelCopyWith<$Res> {
  factory _$ShippingQuoteModelCopyWith(
          _ShippingQuoteModel value, $Res Function(_ShippingQuoteModel) _then) =
      __$ShippingQuoteModelCopyWithImpl;
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
      AvailableShippingMethodModel? selectedMethod,
      List<AvailableShippingMethodModel> availableMethods,
      double shippingAmount,
      bool freeShipping,
      double freeShippingThreshold,
      double amountNeededForFreeShipping,
      DeliveryWindowModel? deliveryEstimate,
      String? message});

  @override
  $AvailableShippingMethodModelCopyWith<$Res>? get selectedMethod;
  @override
  $DeliveryWindowModelCopyWith<$Res>? get deliveryEstimate;
}

/// @nodoc
class __$ShippingQuoteModelCopyWithImpl<$Res>
    implements _$ShippingQuoteModelCopyWith<$Res> {
  __$ShippingQuoteModelCopyWithImpl(this._self, this._then);

  final _ShippingQuoteModel _self;
  final $Res Function(_ShippingQuoteModel) _then;

  /// Create a copy of ShippingQuoteModel
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
    return _then(_ShippingQuoteModel(
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
              as AvailableShippingMethodModel?,
      availableMethods: null == availableMethods
          ? _self._availableMethods
          : availableMethods // ignore: cast_nullable_to_non_nullable
              as List<AvailableShippingMethodModel>,
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
              as DeliveryWindowModel?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ShippingQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailableShippingMethodModelCopyWith<$Res>? get selectedMethod {
    if (_self.selectedMethod == null) {
      return null;
    }

    return $AvailableShippingMethodModelCopyWith<$Res>(_self.selectedMethod!,
        (value) {
      return _then(_self.copyWith(selectedMethod: value));
    });
  }

  /// Create a copy of ShippingQuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryWindowModelCopyWith<$Res>? get deliveryEstimate {
    if (_self.deliveryEstimate == null) {
      return null;
    }

    return $DeliveryWindowModelCopyWith<$Res>(_self.deliveryEstimate!, (value) {
      return _then(_self.copyWith(deliveryEstimate: value));
    });
  }
}

// dart format on
