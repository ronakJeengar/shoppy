// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_config_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiFeaturesEntity {
  bool get assistantEnabled;
  bool get semanticSearchEnabled;
  bool get toolCallingEnabled;

  /// Create a copy of AiFeaturesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiFeaturesEntityCopyWith<AiFeaturesEntity> get copyWith =>
      _$AiFeaturesEntityCopyWithImpl<AiFeaturesEntity>(
          this as AiFeaturesEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiFeaturesEntity &&
            (identical(other.assistantEnabled, assistantEnabled) ||
                other.assistantEnabled == assistantEnabled) &&
            (identical(other.semanticSearchEnabled, semanticSearchEnabled) ||
                other.semanticSearchEnabled == semanticSearchEnabled) &&
            (identical(other.toolCallingEnabled, toolCallingEnabled) ||
                other.toolCallingEnabled == toolCallingEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, assistantEnabled, semanticSearchEnabled, toolCallingEnabled);

  @override
  String toString() {
    return 'AiFeaturesEntity(assistantEnabled: $assistantEnabled, semanticSearchEnabled: $semanticSearchEnabled, toolCallingEnabled: $toolCallingEnabled)';
  }
}

/// @nodoc
abstract mixin class $AiFeaturesEntityCopyWith<$Res> {
  factory $AiFeaturesEntityCopyWith(
          AiFeaturesEntity value, $Res Function(AiFeaturesEntity) _then) =
      _$AiFeaturesEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool assistantEnabled,
      bool semanticSearchEnabled,
      bool toolCallingEnabled});
}

/// @nodoc
class _$AiFeaturesEntityCopyWithImpl<$Res>
    implements $AiFeaturesEntityCopyWith<$Res> {
  _$AiFeaturesEntityCopyWithImpl(this._self, this._then);

  final AiFeaturesEntity _self;
  final $Res Function(AiFeaturesEntity) _then;

  /// Create a copy of AiFeaturesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assistantEnabled = null,
    Object? semanticSearchEnabled = null,
    Object? toolCallingEnabled = null,
  }) {
    return _then(_self.copyWith(
      assistantEnabled: null == assistantEnabled
          ? _self.assistantEnabled
          : assistantEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      semanticSearchEnabled: null == semanticSearchEnabled
          ? _self.semanticSearchEnabled
          : semanticSearchEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      toolCallingEnabled: null == toolCallingEnabled
          ? _self.toolCallingEnabled
          : toolCallingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AiFeaturesEntity].
extension AiFeaturesEntityPatterns on AiFeaturesEntity {
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
    TResult Function(_AiFeaturesEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesEntity() when $default != null:
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
    TResult Function(_AiFeaturesEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesEntity():
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
    TResult? Function(_AiFeaturesEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesEntity() when $default != null:
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
    TResult Function(bool assistantEnabled, bool semanticSearchEnabled,
            bool toolCallingEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesEntity() when $default != null:
        return $default(_that.assistantEnabled, _that.semanticSearchEnabled,
            _that.toolCallingEnabled);
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
    TResult Function(bool assistantEnabled, bool semanticSearchEnabled,
            bool toolCallingEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesEntity():
        return $default(_that.assistantEnabled, _that.semanticSearchEnabled,
            _that.toolCallingEnabled);
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
    TResult? Function(bool assistantEnabled, bool semanticSearchEnabled,
            bool toolCallingEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesEntity() when $default != null:
        return $default(_that.assistantEnabled, _that.semanticSearchEnabled,
            _that.toolCallingEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AiFeaturesEntity implements AiFeaturesEntity {
  const _AiFeaturesEntity(
      {this.assistantEnabled = true,
      this.semanticSearchEnabled = true,
      this.toolCallingEnabled = true});

  @override
  @JsonKey()
  final bool assistantEnabled;
  @override
  @JsonKey()
  final bool semanticSearchEnabled;
  @override
  @JsonKey()
  final bool toolCallingEnabled;

  /// Create a copy of AiFeaturesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiFeaturesEntityCopyWith<_AiFeaturesEntity> get copyWith =>
      __$AiFeaturesEntityCopyWithImpl<_AiFeaturesEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiFeaturesEntity &&
            (identical(other.assistantEnabled, assistantEnabled) ||
                other.assistantEnabled == assistantEnabled) &&
            (identical(other.semanticSearchEnabled, semanticSearchEnabled) ||
                other.semanticSearchEnabled == semanticSearchEnabled) &&
            (identical(other.toolCallingEnabled, toolCallingEnabled) ||
                other.toolCallingEnabled == toolCallingEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, assistantEnabled, semanticSearchEnabled, toolCallingEnabled);

  @override
  String toString() {
    return 'AiFeaturesEntity(assistantEnabled: $assistantEnabled, semanticSearchEnabled: $semanticSearchEnabled, toolCallingEnabled: $toolCallingEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AiFeaturesEntityCopyWith<$Res>
    implements $AiFeaturesEntityCopyWith<$Res> {
  factory _$AiFeaturesEntityCopyWith(
          _AiFeaturesEntity value, $Res Function(_AiFeaturesEntity) _then) =
      __$AiFeaturesEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool assistantEnabled,
      bool semanticSearchEnabled,
      bool toolCallingEnabled});
}

/// @nodoc
class __$AiFeaturesEntityCopyWithImpl<$Res>
    implements _$AiFeaturesEntityCopyWith<$Res> {
  __$AiFeaturesEntityCopyWithImpl(this._self, this._then);

  final _AiFeaturesEntity _self;
  final $Res Function(_AiFeaturesEntity) _then;

  /// Create a copy of AiFeaturesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? assistantEnabled = null,
    Object? semanticSearchEnabled = null,
    Object? toolCallingEnabled = null,
  }) {
    return _then(_AiFeaturesEntity(
      assistantEnabled: null == assistantEnabled
          ? _self.assistantEnabled
          : assistantEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      semanticSearchEnabled: null == semanticSearchEnabled
          ? _self.semanticSearchEnabled
          : semanticSearchEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      toolCallingEnabled: null == toolCallingEnabled
          ? _self.toolCallingEnabled
          : toolCallingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$AiHealthEntity {
  bool get enabled;
  String get provider;
  String get model;
  bool get healthy;
  AiFeaturesEntity get features;
  List<String> get allowlistedTools;
  bool get vectorStoreReady;

  /// Create a copy of AiHealthEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiHealthEntityCopyWith<AiHealthEntity> get copyWith =>
      _$AiHealthEntityCopyWithImpl<AiHealthEntity>(
          this as AiHealthEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiHealthEntity &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.healthy, healthy) || other.healthy == healthy) &&
            (identical(other.features, features) ||
                other.features == features) &&
            const DeepCollectionEquality()
                .equals(other.allowlistedTools, allowlistedTools) &&
            (identical(other.vectorStoreReady, vectorStoreReady) ||
                other.vectorStoreReady == vectorStoreReady));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      enabled,
      provider,
      model,
      healthy,
      features,
      const DeepCollectionEquality().hash(allowlistedTools),
      vectorStoreReady);

  @override
  String toString() {
    return 'AiHealthEntity(enabled: $enabled, provider: $provider, model: $model, healthy: $healthy, features: $features, allowlistedTools: $allowlistedTools, vectorStoreReady: $vectorStoreReady)';
  }
}

/// @nodoc
abstract mixin class $AiHealthEntityCopyWith<$Res> {
  factory $AiHealthEntityCopyWith(
          AiHealthEntity value, $Res Function(AiHealthEntity) _then) =
      _$AiHealthEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool enabled,
      String provider,
      String model,
      bool healthy,
      AiFeaturesEntity features,
      List<String> allowlistedTools,
      bool vectorStoreReady});

  $AiFeaturesEntityCopyWith<$Res> get features;
}

/// @nodoc
class _$AiHealthEntityCopyWithImpl<$Res>
    implements $AiHealthEntityCopyWith<$Res> {
  _$AiHealthEntityCopyWithImpl(this._self, this._then);

  final AiHealthEntity _self;
  final $Res Function(AiHealthEntity) _then;

  /// Create a copy of AiHealthEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? provider = null,
    Object? model = null,
    Object? healthy = null,
    Object? features = null,
    Object? allowlistedTools = null,
    Object? vectorStoreReady = null,
  }) {
    return _then(_self.copyWith(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      healthy: null == healthy
          ? _self.healthy
          : healthy // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _self.features
          : features // ignore: cast_nullable_to_non_nullable
              as AiFeaturesEntity,
      allowlistedTools: null == allowlistedTools
          ? _self.allowlistedTools
          : allowlistedTools // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vectorStoreReady: null == vectorStoreReady
          ? _self.vectorStoreReady
          : vectorStoreReady // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of AiHealthEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiFeaturesEntityCopyWith<$Res> get features {
    return $AiFeaturesEntityCopyWith<$Res>(_self.features, (value) {
      return _then(_self.copyWith(features: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AiHealthEntity].
extension AiHealthEntityPatterns on AiHealthEntity {
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
    TResult Function(_AiHealthEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiHealthEntity() when $default != null:
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
    TResult Function(_AiHealthEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthEntity():
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
    TResult? Function(_AiHealthEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthEntity() when $default != null:
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
            bool enabled,
            String provider,
            String model,
            bool healthy,
            AiFeaturesEntity features,
            List<String> allowlistedTools,
            bool vectorStoreReady)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiHealthEntity() when $default != null:
        return $default(
            _that.enabled,
            _that.provider,
            _that.model,
            _that.healthy,
            _that.features,
            _that.allowlistedTools,
            _that.vectorStoreReady);
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
            bool enabled,
            String provider,
            String model,
            bool healthy,
            AiFeaturesEntity features,
            List<String> allowlistedTools,
            bool vectorStoreReady)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthEntity():
        return $default(
            _that.enabled,
            _that.provider,
            _that.model,
            _that.healthy,
            _that.features,
            _that.allowlistedTools,
            _that.vectorStoreReady);
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
            bool enabled,
            String provider,
            String model,
            bool healthy,
            AiFeaturesEntity features,
            List<String> allowlistedTools,
            bool vectorStoreReady)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthEntity() when $default != null:
        return $default(
            _that.enabled,
            _that.provider,
            _that.model,
            _that.healthy,
            _that.features,
            _that.allowlistedTools,
            _that.vectorStoreReady);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AiHealthEntity implements AiHealthEntity {
  const _AiHealthEntity(
      {required this.enabled,
      required this.provider,
      required this.model,
      required this.healthy,
      required this.features,
      final List<String> allowlistedTools = const [],
      this.vectorStoreReady = true})
      : _allowlistedTools = allowlistedTools;

  @override
  final bool enabled;
  @override
  final String provider;
  @override
  final String model;
  @override
  final bool healthy;
  @override
  final AiFeaturesEntity features;
  final List<String> _allowlistedTools;
  @override
  @JsonKey()
  List<String> get allowlistedTools {
    if (_allowlistedTools is EqualUnmodifiableListView)
      return _allowlistedTools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowlistedTools);
  }

  @override
  @JsonKey()
  final bool vectorStoreReady;

  /// Create a copy of AiHealthEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiHealthEntityCopyWith<_AiHealthEntity> get copyWith =>
      __$AiHealthEntityCopyWithImpl<_AiHealthEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiHealthEntity &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.healthy, healthy) || other.healthy == healthy) &&
            (identical(other.features, features) ||
                other.features == features) &&
            const DeepCollectionEquality()
                .equals(other._allowlistedTools, _allowlistedTools) &&
            (identical(other.vectorStoreReady, vectorStoreReady) ||
                other.vectorStoreReady == vectorStoreReady));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      enabled,
      provider,
      model,
      healthy,
      features,
      const DeepCollectionEquality().hash(_allowlistedTools),
      vectorStoreReady);

  @override
  String toString() {
    return 'AiHealthEntity(enabled: $enabled, provider: $provider, model: $model, healthy: $healthy, features: $features, allowlistedTools: $allowlistedTools, vectorStoreReady: $vectorStoreReady)';
  }
}

/// @nodoc
abstract mixin class _$AiHealthEntityCopyWith<$Res>
    implements $AiHealthEntityCopyWith<$Res> {
  factory _$AiHealthEntityCopyWith(
          _AiHealthEntity value, $Res Function(_AiHealthEntity) _then) =
      __$AiHealthEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool enabled,
      String provider,
      String model,
      bool healthy,
      AiFeaturesEntity features,
      List<String> allowlistedTools,
      bool vectorStoreReady});

  @override
  $AiFeaturesEntityCopyWith<$Res> get features;
}

/// @nodoc
class __$AiHealthEntityCopyWithImpl<$Res>
    implements _$AiHealthEntityCopyWith<$Res> {
  __$AiHealthEntityCopyWithImpl(this._self, this._then);

  final _AiHealthEntity _self;
  final $Res Function(_AiHealthEntity) _then;

  /// Create a copy of AiHealthEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
    Object? provider = null,
    Object? model = null,
    Object? healthy = null,
    Object? features = null,
    Object? allowlistedTools = null,
    Object? vectorStoreReady = null,
  }) {
    return _then(_AiHealthEntity(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      healthy: null == healthy
          ? _self.healthy
          : healthy // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _self.features
          : features // ignore: cast_nullable_to_non_nullable
              as AiFeaturesEntity,
      allowlistedTools: null == allowlistedTools
          ? _self._allowlistedTools
          : allowlistedTools // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vectorStoreReady: null == vectorStoreReady
          ? _self.vectorStoreReady
          : vectorStoreReady // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of AiHealthEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiFeaturesEntityCopyWith<$Res> get features {
    return $AiFeaturesEntityCopyWith<$Res>(_self.features, (value) {
      return _then(_self.copyWith(features: value));
    });
  }
}

/// @nodoc
mixin _$AiQueryResultEntity {
  String get requestId;
  String get answer;
  List<Map<String, dynamic>> get toolResults;
  String get provider;
  String get model;
  int get durationMs;

  /// Create a copy of AiQueryResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiQueryResultEntityCopyWith<AiQueryResultEntity> get copyWith =>
      _$AiQueryResultEntityCopyWithImpl<AiQueryResultEntity>(
          this as AiQueryResultEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiQueryResultEntity &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other.toolResults, toolResults) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      answer,
      const DeepCollectionEquality().hash(toolResults),
      provider,
      model,
      durationMs);

  @override
  String toString() {
    return 'AiQueryResultEntity(requestId: $requestId, answer: $answer, toolResults: $toolResults, provider: $provider, model: $model, durationMs: $durationMs)';
  }
}

/// @nodoc
abstract mixin class $AiQueryResultEntityCopyWith<$Res> {
  factory $AiQueryResultEntityCopyWith(
          AiQueryResultEntity value, $Res Function(AiQueryResultEntity) _then) =
      _$AiQueryResultEntityCopyWithImpl;
  @useResult
  $Res call(
      {String requestId,
      String answer,
      List<Map<String, dynamic>> toolResults,
      String provider,
      String model,
      int durationMs});
}

/// @nodoc
class _$AiQueryResultEntityCopyWithImpl<$Res>
    implements $AiQueryResultEntityCopyWith<$Res> {
  _$AiQueryResultEntityCopyWithImpl(this._self, this._then);

  final AiQueryResultEntity _self;
  final $Res Function(AiQueryResultEntity) _then;

  /// Create a copy of AiQueryResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? answer = null,
    Object? toolResults = null,
    Object? provider = null,
    Object? model = null,
    Object? durationMs = null,
  }) {
    return _then(_self.copyWith(
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      toolResults: null == toolResults
          ? _self.toolResults
          : toolResults // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      durationMs: null == durationMs
          ? _self.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [AiQueryResultEntity].
extension AiQueryResultEntityPatterns on AiQueryResultEntity {
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
    TResult Function(_AiQueryResultEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultEntity() when $default != null:
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
    TResult Function(_AiQueryResultEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultEntity():
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
    TResult? Function(_AiQueryResultEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultEntity() when $default != null:
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
            String requestId,
            String answer,
            List<Map<String, dynamic>> toolResults,
            String provider,
            String model,
            int durationMs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultEntity() when $default != null:
        return $default(_that.requestId, _that.answer, _that.toolResults,
            _that.provider, _that.model, _that.durationMs);
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
            String requestId,
            String answer,
            List<Map<String, dynamic>> toolResults,
            String provider,
            String model,
            int durationMs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultEntity():
        return $default(_that.requestId, _that.answer, _that.toolResults,
            _that.provider, _that.model, _that.durationMs);
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
            String requestId,
            String answer,
            List<Map<String, dynamic>> toolResults,
            String provider,
            String model,
            int durationMs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultEntity() when $default != null:
        return $default(_that.requestId, _that.answer, _that.toolResults,
            _that.provider, _that.model, _that.durationMs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AiQueryResultEntity implements AiQueryResultEntity {
  const _AiQueryResultEntity(
      {required this.requestId,
      required this.answer,
      final List<Map<String, dynamic>> toolResults = const [],
      required this.provider,
      required this.model,
      this.durationMs = 0})
      : _toolResults = toolResults;

  @override
  final String requestId;
  @override
  final String answer;
  final List<Map<String, dynamic>> _toolResults;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get toolResults {
    if (_toolResults is EqualUnmodifiableListView) return _toolResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toolResults);
  }

  @override
  final String provider;
  @override
  final String model;
  @override
  @JsonKey()
  final int durationMs;

  /// Create a copy of AiQueryResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiQueryResultEntityCopyWith<_AiQueryResultEntity> get copyWith =>
      __$AiQueryResultEntityCopyWithImpl<_AiQueryResultEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiQueryResultEntity &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._toolResults, _toolResults) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      answer,
      const DeepCollectionEquality().hash(_toolResults),
      provider,
      model,
      durationMs);

  @override
  String toString() {
    return 'AiQueryResultEntity(requestId: $requestId, answer: $answer, toolResults: $toolResults, provider: $provider, model: $model, durationMs: $durationMs)';
  }
}

/// @nodoc
abstract mixin class _$AiQueryResultEntityCopyWith<$Res>
    implements $AiQueryResultEntityCopyWith<$Res> {
  factory _$AiQueryResultEntityCopyWith(_AiQueryResultEntity value,
          $Res Function(_AiQueryResultEntity) _then) =
      __$AiQueryResultEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String requestId,
      String answer,
      List<Map<String, dynamic>> toolResults,
      String provider,
      String model,
      int durationMs});
}

/// @nodoc
class __$AiQueryResultEntityCopyWithImpl<$Res>
    implements _$AiQueryResultEntityCopyWith<$Res> {
  __$AiQueryResultEntityCopyWithImpl(this._self, this._then);

  final _AiQueryResultEntity _self;
  final $Res Function(_AiQueryResultEntity) _then;

  /// Create a copy of AiQueryResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? requestId = null,
    Object? answer = null,
    Object? toolResults = null,
    Object? provider = null,
    Object? model = null,
    Object? durationMs = null,
  }) {
    return _then(_AiQueryResultEntity(
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      toolResults: null == toolResults
          ? _self._toolResults
          : toolResults // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      durationMs: null == durationMs
          ? _self.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
