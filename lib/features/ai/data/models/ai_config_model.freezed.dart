// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiFeaturesModel {
  bool get assistantEnabled;
  bool get semanticSearchEnabled;
  bool get toolCallingEnabled;

  /// Create a copy of AiFeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiFeaturesModelCopyWith<AiFeaturesModel> get copyWith =>
      _$AiFeaturesModelCopyWithImpl<AiFeaturesModel>(
          this as AiFeaturesModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiFeaturesModel &&
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
    return 'AiFeaturesModel(assistantEnabled: $assistantEnabled, semanticSearchEnabled: $semanticSearchEnabled, toolCallingEnabled: $toolCallingEnabled)';
  }
}

/// @nodoc
abstract mixin class $AiFeaturesModelCopyWith<$Res> {
  factory $AiFeaturesModelCopyWith(
          AiFeaturesModel value, $Res Function(AiFeaturesModel) _then) =
      _$AiFeaturesModelCopyWithImpl;
  @useResult
  $Res call(
      {bool assistantEnabled,
      bool semanticSearchEnabled,
      bool toolCallingEnabled});
}

/// @nodoc
class _$AiFeaturesModelCopyWithImpl<$Res>
    implements $AiFeaturesModelCopyWith<$Res> {
  _$AiFeaturesModelCopyWithImpl(this._self, this._then);

  final AiFeaturesModel _self;
  final $Res Function(AiFeaturesModel) _then;

  /// Create a copy of AiFeaturesModel
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

/// Adds pattern-matching-related methods to [AiFeaturesModel].
extension AiFeaturesModelPatterns on AiFeaturesModel {
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
    TResult Function(_AiFeaturesModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesModel() when $default != null:
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
    TResult Function(_AiFeaturesModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesModel():
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
    TResult? Function(_AiFeaturesModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiFeaturesModel() when $default != null:
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
      case _AiFeaturesModel() when $default != null:
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
      case _AiFeaturesModel():
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
      case _AiFeaturesModel() when $default != null:
        return $default(_that.assistantEnabled, _that.semanticSearchEnabled,
            _that.toolCallingEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AiFeaturesModel implements AiFeaturesModel {
  const _AiFeaturesModel(
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

  /// Create a copy of AiFeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiFeaturesModelCopyWith<_AiFeaturesModel> get copyWith =>
      __$AiFeaturesModelCopyWithImpl<_AiFeaturesModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiFeaturesModel &&
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
    return 'AiFeaturesModel(assistantEnabled: $assistantEnabled, semanticSearchEnabled: $semanticSearchEnabled, toolCallingEnabled: $toolCallingEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AiFeaturesModelCopyWith<$Res>
    implements $AiFeaturesModelCopyWith<$Res> {
  factory _$AiFeaturesModelCopyWith(
          _AiFeaturesModel value, $Res Function(_AiFeaturesModel) _then) =
      __$AiFeaturesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool assistantEnabled,
      bool semanticSearchEnabled,
      bool toolCallingEnabled});
}

/// @nodoc
class __$AiFeaturesModelCopyWithImpl<$Res>
    implements _$AiFeaturesModelCopyWith<$Res> {
  __$AiFeaturesModelCopyWithImpl(this._self, this._then);

  final _AiFeaturesModel _self;
  final $Res Function(_AiFeaturesModel) _then;

  /// Create a copy of AiFeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? assistantEnabled = null,
    Object? semanticSearchEnabled = null,
    Object? toolCallingEnabled = null,
  }) {
    return _then(_AiFeaturesModel(
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
mixin _$AiHealthModel {
  bool get enabled;
  String get provider;
  String get model;
  bool get healthy;
  AiFeaturesModel get features;
  List<String> get allowlistedTools;
  bool get vectorStoreReady;

  /// Create a copy of AiHealthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiHealthModelCopyWith<AiHealthModel> get copyWith =>
      _$AiHealthModelCopyWithImpl<AiHealthModel>(
          this as AiHealthModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiHealthModel &&
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
    return 'AiHealthModel(enabled: $enabled, provider: $provider, model: $model, healthy: $healthy, features: $features, allowlistedTools: $allowlistedTools, vectorStoreReady: $vectorStoreReady)';
  }
}

/// @nodoc
abstract mixin class $AiHealthModelCopyWith<$Res> {
  factory $AiHealthModelCopyWith(
          AiHealthModel value, $Res Function(AiHealthModel) _then) =
      _$AiHealthModelCopyWithImpl;
  @useResult
  $Res call(
      {bool enabled,
      String provider,
      String model,
      bool healthy,
      AiFeaturesModel features,
      List<String> allowlistedTools,
      bool vectorStoreReady});

  $AiFeaturesModelCopyWith<$Res> get features;
}

/// @nodoc
class _$AiHealthModelCopyWithImpl<$Res>
    implements $AiHealthModelCopyWith<$Res> {
  _$AiHealthModelCopyWithImpl(this._self, this._then);

  final AiHealthModel _self;
  final $Res Function(AiHealthModel) _then;

  /// Create a copy of AiHealthModel
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
              as AiFeaturesModel,
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

  /// Create a copy of AiHealthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiFeaturesModelCopyWith<$Res> get features {
    return $AiFeaturesModelCopyWith<$Res>(_self.features, (value) {
      return _then(_self.copyWith(features: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AiHealthModel].
extension AiHealthModelPatterns on AiHealthModel {
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
    TResult Function(_AiHealthModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiHealthModel() when $default != null:
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
    TResult Function(_AiHealthModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthModel():
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
    TResult? Function(_AiHealthModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthModel() when $default != null:
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
            AiFeaturesModel features,
            List<String> allowlistedTools,
            bool vectorStoreReady)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiHealthModel() when $default != null:
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
            AiFeaturesModel features,
            List<String> allowlistedTools,
            bool vectorStoreReady)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthModel():
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
            AiFeaturesModel features,
            List<String> allowlistedTools,
            bool vectorStoreReady)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiHealthModel() when $default != null:
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

class _AiHealthModel implements AiHealthModel {
  const _AiHealthModel(
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
  final AiFeaturesModel features;
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

  /// Create a copy of AiHealthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiHealthModelCopyWith<_AiHealthModel> get copyWith =>
      __$AiHealthModelCopyWithImpl<_AiHealthModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiHealthModel &&
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
    return 'AiHealthModel(enabled: $enabled, provider: $provider, model: $model, healthy: $healthy, features: $features, allowlistedTools: $allowlistedTools, vectorStoreReady: $vectorStoreReady)';
  }
}

/// @nodoc
abstract mixin class _$AiHealthModelCopyWith<$Res>
    implements $AiHealthModelCopyWith<$Res> {
  factory _$AiHealthModelCopyWith(
          _AiHealthModel value, $Res Function(_AiHealthModel) _then) =
      __$AiHealthModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool enabled,
      String provider,
      String model,
      bool healthy,
      AiFeaturesModel features,
      List<String> allowlistedTools,
      bool vectorStoreReady});

  @override
  $AiFeaturesModelCopyWith<$Res> get features;
}

/// @nodoc
class __$AiHealthModelCopyWithImpl<$Res>
    implements _$AiHealthModelCopyWith<$Res> {
  __$AiHealthModelCopyWithImpl(this._self, this._then);

  final _AiHealthModel _self;
  final $Res Function(_AiHealthModel) _then;

  /// Create a copy of AiHealthModel
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
    return _then(_AiHealthModel(
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
              as AiFeaturesModel,
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

  /// Create a copy of AiHealthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiFeaturesModelCopyWith<$Res> get features {
    return $AiFeaturesModelCopyWith<$Res>(_self.features, (value) {
      return _then(_self.copyWith(features: value));
    });
  }
}

/// @nodoc
mixin _$AiQueryResultModel {
  String get requestId;
  String get answer;
  List<Map<String, dynamic>> get toolResults;
  String get provider;
  String get model;
  int get durationMs;

  /// Create a copy of AiQueryResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiQueryResultModelCopyWith<AiQueryResultModel> get copyWith =>
      _$AiQueryResultModelCopyWithImpl<AiQueryResultModel>(
          this as AiQueryResultModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiQueryResultModel &&
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
    return 'AiQueryResultModel(requestId: $requestId, answer: $answer, toolResults: $toolResults, provider: $provider, model: $model, durationMs: $durationMs)';
  }
}

/// @nodoc
abstract mixin class $AiQueryResultModelCopyWith<$Res> {
  factory $AiQueryResultModelCopyWith(
          AiQueryResultModel value, $Res Function(AiQueryResultModel) _then) =
      _$AiQueryResultModelCopyWithImpl;
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
class _$AiQueryResultModelCopyWithImpl<$Res>
    implements $AiQueryResultModelCopyWith<$Res> {
  _$AiQueryResultModelCopyWithImpl(this._self, this._then);

  final AiQueryResultModel _self;
  final $Res Function(AiQueryResultModel) _then;

  /// Create a copy of AiQueryResultModel
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

/// Adds pattern-matching-related methods to [AiQueryResultModel].
extension AiQueryResultModelPatterns on AiQueryResultModel {
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
    TResult Function(_AiQueryResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultModel() when $default != null:
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
    TResult Function(_AiQueryResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultModel():
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
    TResult? Function(_AiQueryResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiQueryResultModel() when $default != null:
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
      case _AiQueryResultModel() when $default != null:
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
      case _AiQueryResultModel():
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
      case _AiQueryResultModel() when $default != null:
        return $default(_that.requestId, _that.answer, _that.toolResults,
            _that.provider, _that.model, _that.durationMs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AiQueryResultModel implements AiQueryResultModel {
  const _AiQueryResultModel(
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

  /// Create a copy of AiQueryResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiQueryResultModelCopyWith<_AiQueryResultModel> get copyWith =>
      __$AiQueryResultModelCopyWithImpl<_AiQueryResultModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiQueryResultModel &&
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
    return 'AiQueryResultModel(requestId: $requestId, answer: $answer, toolResults: $toolResults, provider: $provider, model: $model, durationMs: $durationMs)';
  }
}

/// @nodoc
abstract mixin class _$AiQueryResultModelCopyWith<$Res>
    implements $AiQueryResultModelCopyWith<$Res> {
  factory _$AiQueryResultModelCopyWith(
          _AiQueryResultModel value, $Res Function(_AiQueryResultModel) _then) =
      __$AiQueryResultModelCopyWithImpl;
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
class __$AiQueryResultModelCopyWithImpl<$Res>
    implements _$AiQueryResultModelCopyWith<$Res> {
  __$AiQueryResultModelCopyWithImpl(this._self, this._then);

  final _AiQueryResultModel _self;
  final $Res Function(_AiQueryResultModel) _then;

  /// Create a copy of AiQueryResultModel
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
    return _then(_AiQueryResultModel(
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
