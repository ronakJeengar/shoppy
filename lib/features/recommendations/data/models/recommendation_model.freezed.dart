// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendedProductModel {
  ProductModel get product;
  String? get recommendationReason;
  double get score;
  String? get source;

  /// Create a copy of RecommendedProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendedProductModelCopyWith<RecommendedProductModel> get copyWith =>
      _$RecommendedProductModelCopyWithImpl<RecommendedProductModel>(
          this as RecommendedProductModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendedProductModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.recommendationReason, recommendationReason) ||
                other.recommendationReason == recommendationReason) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, product, recommendationReason, score, source);

  @override
  String toString() {
    return 'RecommendedProductModel(product: $product, recommendationReason: $recommendationReason, score: $score, source: $source)';
  }
}

/// @nodoc
abstract mixin class $RecommendedProductModelCopyWith<$Res> {
  factory $RecommendedProductModelCopyWith(RecommendedProductModel value,
          $Res Function(RecommendedProductModel) _then) =
      _$RecommendedProductModelCopyWithImpl;
  @useResult
  $Res call(
      {ProductModel product,
      String? recommendationReason,
      double score,
      String? source});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$RecommendedProductModelCopyWithImpl<$Res>
    implements $RecommendedProductModelCopyWith<$Res> {
  _$RecommendedProductModelCopyWithImpl(this._self, this._then);

  final RecommendedProductModel _self;
  final $Res Function(RecommendedProductModel) _then;

  /// Create a copy of RecommendedProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? recommendationReason = freezed,
    Object? score = null,
    Object? source = freezed,
  }) {
    return _then(_self.copyWith(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      recommendationReason: freezed == recommendationReason
          ? _self.recommendationReason
          : recommendationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RecommendedProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RecommendedProductModel].
extension RecommendedProductModelPatterns on RecommendedProductModel {
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
    TResult Function(_RecommendedProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecommendedProductModel() when $default != null:
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
    TResult Function(_RecommendedProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendedProductModel():
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
    TResult? Function(_RecommendedProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendedProductModel() when $default != null:
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
    TResult Function(ProductModel product, String? recommendationReason,
            double score, String? source)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecommendedProductModel() when $default != null:
        return $default(_that.product, _that.recommendationReason, _that.score,
            _that.source);
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
    TResult Function(ProductModel product, String? recommendationReason,
            double score, String? source)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendedProductModel():
        return $default(_that.product, _that.recommendationReason, _that.score,
            _that.source);
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
    TResult? Function(ProductModel product, String? recommendationReason,
            double score, String? source)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendedProductModel() when $default != null:
        return $default(_that.product, _that.recommendationReason, _that.score,
            _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecommendedProductModel implements RecommendedProductModel {
  const _RecommendedProductModel(
      {required this.product,
      this.recommendationReason,
      this.score = 0.0,
      this.source});

  @override
  final ProductModel product;
  @override
  final String? recommendationReason;
  @override
  @JsonKey()
  final double score;
  @override
  final String? source;

  /// Create a copy of RecommendedProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecommendedProductModelCopyWith<_RecommendedProductModel> get copyWith =>
      __$RecommendedProductModelCopyWithImpl<_RecommendedProductModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecommendedProductModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.recommendationReason, recommendationReason) ||
                other.recommendationReason == recommendationReason) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, product, recommendationReason, score, source);

  @override
  String toString() {
    return 'RecommendedProductModel(product: $product, recommendationReason: $recommendationReason, score: $score, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$RecommendedProductModelCopyWith<$Res>
    implements $RecommendedProductModelCopyWith<$Res> {
  factory _$RecommendedProductModelCopyWith(_RecommendedProductModel value,
          $Res Function(_RecommendedProductModel) _then) =
      __$RecommendedProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ProductModel product,
      String? recommendationReason,
      double score,
      String? source});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$RecommendedProductModelCopyWithImpl<$Res>
    implements _$RecommendedProductModelCopyWith<$Res> {
  __$RecommendedProductModelCopyWithImpl(this._self, this._then);

  final _RecommendedProductModel _self;
  final $Res Function(_RecommendedProductModel) _then;

  /// Create a copy of RecommendedProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? recommendationReason = freezed,
    Object? score = null,
    Object? source = freezed,
  }) {
    return _then(_RecommendedProductModel(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      recommendationReason: freezed == recommendationReason
          ? _self.recommendationReason
          : recommendationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RecommendedProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc
mixin _$RecommendationResponseModel {
  String get recommendationType;
  String get reason;
  int get count;
  List<RecommendedProductModel> get items;
  Map<String, dynamic>? get metadata;

  /// Create a copy of RecommendationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendationResponseModelCopyWith<RecommendationResponseModel>
      get copyWith => _$RecommendationResponseModelCopyWithImpl<
              RecommendationResponseModel>(
          this as RecommendationResponseModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendationResponseModel &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recommendationType,
      reason,
      count,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(metadata));

  @override
  String toString() {
    return 'RecommendationResponseModel(recommendationType: $recommendationType, reason: $reason, count: $count, items: $items, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $RecommendationResponseModelCopyWith<$Res> {
  factory $RecommendationResponseModelCopyWith(
          RecommendationResponseModel value,
          $Res Function(RecommendationResponseModel) _then) =
      _$RecommendationResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {String recommendationType,
      String reason,
      int count,
      List<RecommendedProductModel> items,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$RecommendationResponseModelCopyWithImpl<$Res>
    implements $RecommendationResponseModelCopyWith<$Res> {
  _$RecommendationResponseModelCopyWithImpl(this._self, this._then);

  final RecommendationResponseModel _self;
  final $Res Function(RecommendationResponseModel) _then;

  /// Create a copy of RecommendationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationType = null,
    Object? reason = null,
    Object? count = null,
    Object? items = null,
    Object? metadata = freezed,
  }) {
    return _then(_self.copyWith(
      recommendationType: null == recommendationType
          ? _self.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecommendedProductModel>,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RecommendationResponseModel].
extension RecommendationResponseModelPatterns on RecommendationResponseModel {
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
    TResult Function(_RecommendationResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecommendationResponseModel() when $default != null:
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
    TResult Function(_RecommendationResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendationResponseModel():
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
    TResult? Function(_RecommendationResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendationResponseModel() when $default != null:
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
            String recommendationType,
            String reason,
            int count,
            List<RecommendedProductModel> items,
            Map<String, dynamic>? metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecommendationResponseModel() when $default != null:
        return $default(_that.recommendationType, _that.reason, _that.count,
            _that.items, _that.metadata);
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
    TResult Function(String recommendationType, String reason, int count,
            List<RecommendedProductModel> items, Map<String, dynamic>? metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendationResponseModel():
        return $default(_that.recommendationType, _that.reason, _that.count,
            _that.items, _that.metadata);
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
            String recommendationType,
            String reason,
            int count,
            List<RecommendedProductModel> items,
            Map<String, dynamic>? metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecommendationResponseModel() when $default != null:
        return $default(_that.recommendationType, _that.reason, _that.count,
            _that.items, _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecommendationResponseModel extends RecommendationResponseModel {
  const _RecommendationResponseModel(
      {this.recommendationType = 'TRENDING',
      this.reason = '',
      this.count = 0,
      final List<RecommendedProductModel> items = const [],
      final Map<String, dynamic>? metadata})
      : _items = items,
        _metadata = metadata,
        super._();

  @override
  @JsonKey()
  final String recommendationType;
  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey()
  final int count;
  final List<RecommendedProductModel> _items;
  @override
  @JsonKey()
  List<RecommendedProductModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of RecommendationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecommendationResponseModelCopyWith<_RecommendationResponseModel>
      get copyWith => __$RecommendationResponseModelCopyWithImpl<
          _RecommendationResponseModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecommendationResponseModel &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recommendationType,
      reason,
      count,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_metadata));

  @override
  String toString() {
    return 'RecommendationResponseModel(recommendationType: $recommendationType, reason: $reason, count: $count, items: $items, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$RecommendationResponseModelCopyWith<$Res>
    implements $RecommendationResponseModelCopyWith<$Res> {
  factory _$RecommendationResponseModelCopyWith(
          _RecommendationResponseModel value,
          $Res Function(_RecommendationResponseModel) _then) =
      __$RecommendationResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String recommendationType,
      String reason,
      int count,
      List<RecommendedProductModel> items,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$RecommendationResponseModelCopyWithImpl<$Res>
    implements _$RecommendationResponseModelCopyWith<$Res> {
  __$RecommendationResponseModelCopyWithImpl(this._self, this._then);

  final _RecommendationResponseModel _self;
  final $Res Function(_RecommendationResponseModel) _then;

  /// Create a copy of RecommendationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recommendationType = null,
    Object? reason = null,
    Object? count = null,
    Object? items = null,
    Object? metadata = freezed,
  }) {
    return _then(_RecommendationResponseModel(
      recommendationType: null == recommendationType
          ? _self.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecommendedProductModel>,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
