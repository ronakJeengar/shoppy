// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_media_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductMediaEntity {
  String get id;
  ProductMediaType get type;
  String get url;
  String get thumbnailUrl;
  int get sortOrder;

  /// Create a copy of ProductMediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductMediaEntityCopyWith<ProductMediaEntity> get copyWith =>
      _$ProductMediaEntityCopyWithImpl<ProductMediaEntity>(
          this as ProductMediaEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductMediaEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, url, thumbnailUrl, sortOrder);

  @override
  String toString() {
    return 'ProductMediaEntity(id: $id, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class $ProductMediaEntityCopyWith<$Res> {
  factory $ProductMediaEntityCopyWith(
          ProductMediaEntity value, $Res Function(ProductMediaEntity) _then) =
      _$ProductMediaEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      ProductMediaType type,
      String url,
      String thumbnailUrl,
      int sortOrder});
}

/// @nodoc
class _$ProductMediaEntityCopyWithImpl<$Res>
    implements $ProductMediaEntityCopyWith<$Res> {
  _$ProductMediaEntityCopyWithImpl(this._self, this._then);

  final ProductMediaEntity _self;
  final $Res Function(ProductMediaEntity) _then;

  /// Create a copy of ProductMediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = null,
    Object? sortOrder = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductMediaType,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductMediaEntity].
extension ProductMediaEntityPatterns on ProductMediaEntity {
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
    TResult Function(_ProductMediaEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductMediaEntity() when $default != null:
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
    TResult Function(_ProductMediaEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaEntity():
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
    TResult? Function(_ProductMediaEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaEntity() when $default != null:
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
    TResult Function(String id, ProductMediaType type, String url,
            String thumbnailUrl, int sortOrder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductMediaEntity() when $default != null:
        return $default(_that.id, _that.type, _that.url, _that.thumbnailUrl,
            _that.sortOrder);
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
    TResult Function(String id, ProductMediaType type, String url,
            String thumbnailUrl, int sortOrder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaEntity():
        return $default(_that.id, _that.type, _that.url, _that.thumbnailUrl,
            _that.sortOrder);
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
    TResult? Function(String id, ProductMediaType type, String url,
            String thumbnailUrl, int sortOrder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaEntity() when $default != null:
        return $default(_that.id, _that.type, _that.url, _that.thumbnailUrl,
            _that.sortOrder);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductMediaEntity extends ProductMediaEntity {
  const _ProductMediaEntity(
      {required this.id,
      required this.type,
      required this.url,
      required this.thumbnailUrl,
      this.sortOrder = 0})
      : super._();

  @override
  final String id;
  @override
  final ProductMediaType type;
  @override
  final String url;
  @override
  final String thumbnailUrl;
  @override
  @JsonKey()
  final int sortOrder;

  /// Create a copy of ProductMediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductMediaEntityCopyWith<_ProductMediaEntity> get copyWith =>
      __$ProductMediaEntityCopyWithImpl<_ProductMediaEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductMediaEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, url, thumbnailUrl, sortOrder);

  @override
  String toString() {
    return 'ProductMediaEntity(id: $id, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class _$ProductMediaEntityCopyWith<$Res>
    implements $ProductMediaEntityCopyWith<$Res> {
  factory _$ProductMediaEntityCopyWith(
          _ProductMediaEntity value, $Res Function(_ProductMediaEntity) _then) =
      __$ProductMediaEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      ProductMediaType type,
      String url,
      String thumbnailUrl,
      int sortOrder});
}

/// @nodoc
class __$ProductMediaEntityCopyWithImpl<$Res>
    implements _$ProductMediaEntityCopyWith<$Res> {
  __$ProductMediaEntityCopyWithImpl(this._self, this._then);

  final _ProductMediaEntity _self;
  final $Res Function(_ProductMediaEntity) _then;

  /// Create a copy of ProductMediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = null,
    Object? sortOrder = null,
  }) {
    return _then(_ProductMediaEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductMediaType,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
