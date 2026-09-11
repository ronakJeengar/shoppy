// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductMediaModel {
  String get id;
  ProductMediaType get type;
  String get url;
  String? get thumbnailUrl;
  int get sortOrder;

  /// Create a copy of ProductMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductMediaModelCopyWith<ProductMediaModel> get copyWith =>
      _$ProductMediaModelCopyWithImpl<ProductMediaModel>(
          this as ProductMediaModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductMediaModel &&
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
    return 'ProductMediaModel(id: $id, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class $ProductMediaModelCopyWith<$Res> {
  factory $ProductMediaModelCopyWith(
          ProductMediaModel value, $Res Function(ProductMediaModel) _then) =
      _$ProductMediaModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      ProductMediaType type,
      String url,
      String? thumbnailUrl,
      int sortOrder});
}

/// @nodoc
class _$ProductMediaModelCopyWithImpl<$Res>
    implements $ProductMediaModelCopyWith<$Res> {
  _$ProductMediaModelCopyWithImpl(this._self, this._then);

  final ProductMediaModel _self;
  final $Res Function(ProductMediaModel) _then;

  /// Create a copy of ProductMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
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
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductMediaModel].
extension ProductMediaModelPatterns on ProductMediaModel {
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
    TResult Function(_ProductMediaModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductMediaModel() when $default != null:
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
    TResult Function(_ProductMediaModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaModel():
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
    TResult? Function(_ProductMediaModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaModel() when $default != null:
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
            String? thumbnailUrl, int sortOrder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductMediaModel() when $default != null:
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
            String? thumbnailUrl, int sortOrder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaModel():
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
            String? thumbnailUrl, int sortOrder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductMediaModel() when $default != null:
        return $default(_that.id, _that.type, _that.url, _that.thumbnailUrl,
            _that.sortOrder);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductMediaModel extends ProductMediaModel {
  const _ProductMediaModel(
      {required this.id,
      required this.type,
      required this.url,
      this.thumbnailUrl,
      this.sortOrder = 0})
      : super._();

  @override
  final String id;
  @override
  final ProductMediaType type;
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  @JsonKey()
  final int sortOrder;

  /// Create a copy of ProductMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductMediaModelCopyWith<_ProductMediaModel> get copyWith =>
      __$ProductMediaModelCopyWithImpl<_ProductMediaModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductMediaModel &&
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
    return 'ProductMediaModel(id: $id, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, sortOrder: $sortOrder)';
  }
}

/// @nodoc
abstract mixin class _$ProductMediaModelCopyWith<$Res>
    implements $ProductMediaModelCopyWith<$Res> {
  factory _$ProductMediaModelCopyWith(
          _ProductMediaModel value, $Res Function(_ProductMediaModel) _then) =
      __$ProductMediaModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      ProductMediaType type,
      String url,
      String? thumbnailUrl,
      int sortOrder});
}

/// @nodoc
class __$ProductMediaModelCopyWithImpl<$Res>
    implements _$ProductMediaModelCopyWith<$Res> {
  __$ProductMediaModelCopyWithImpl(this._self, this._then);

  final _ProductMediaModel _self;
  final $Res Function(_ProductMediaModel) _then;

  /// Create a copy of ProductMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_ProductMediaModel(
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
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
