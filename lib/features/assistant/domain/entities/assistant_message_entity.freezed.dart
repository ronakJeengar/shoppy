// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistant_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssistantProductCardEntity {
  String get id;
  String get name;
  double get price;
  bool get inStock;
  int get stockCount;
  double get rating;
  String get seller;
  String get productImage;
  String get description;

  /// Create a copy of AssistantProductCardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantProductCardEntityCopyWith<AssistantProductCardEntity>
      get copyWith =>
          _$AssistantProductCardEntityCopyWithImpl<AssistantProductCardEntity>(
              this as AssistantProductCardEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantProductCardEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.stockCount, stockCount) ||
                other.stockCount == stockCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, inStock,
      stockCount, rating, seller, productImage, description);

  @override
  String toString() {
    return 'AssistantProductCardEntity(id: $id, name: $name, price: $price, inStock: $inStock, stockCount: $stockCount, rating: $rating, seller: $seller, productImage: $productImage, description: $description)';
  }
}

/// @nodoc
abstract mixin class $AssistantProductCardEntityCopyWith<$Res> {
  factory $AssistantProductCardEntityCopyWith(AssistantProductCardEntity value,
          $Res Function(AssistantProductCardEntity) _then) =
      _$AssistantProductCardEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      bool inStock,
      int stockCount,
      double rating,
      String seller,
      String productImage,
      String description});
}

/// @nodoc
class _$AssistantProductCardEntityCopyWithImpl<$Res>
    implements $AssistantProductCardEntityCopyWith<$Res> {
  _$AssistantProductCardEntityCopyWithImpl(this._self, this._then);

  final AssistantProductCardEntity _self;
  final $Res Function(AssistantProductCardEntity) _then;

  /// Create a copy of AssistantProductCardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? inStock = null,
    Object? stockCount = null,
    Object? rating = null,
    Object? seller = null,
    Object? productImage = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      inStock: null == inStock
          ? _self.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockCount: null == stockCount
          ? _self.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      seller: null == seller
          ? _self.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssistantProductCardEntity].
extension AssistantProductCardEntityPatterns on AssistantProductCardEntity {
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
    TResult Function(_AssistantProductCardEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardEntity() when $default != null:
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
    TResult Function(_AssistantProductCardEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardEntity():
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
    TResult? Function(_AssistantProductCardEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardEntity() when $default != null:
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
            String name,
            double price,
            bool inStock,
            int stockCount,
            double rating,
            String seller,
            String productImage,
            String description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardEntity() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.price,
            _that.inStock,
            _that.stockCount,
            _that.rating,
            _that.seller,
            _that.productImage,
            _that.description);
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
            String name,
            double price,
            bool inStock,
            int stockCount,
            double rating,
            String seller,
            String productImage,
            String description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardEntity():
        return $default(
            _that.id,
            _that.name,
            _that.price,
            _that.inStock,
            _that.stockCount,
            _that.rating,
            _that.seller,
            _that.productImage,
            _that.description);
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
            String name,
            double price,
            bool inStock,
            int stockCount,
            double rating,
            String seller,
            String productImage,
            String description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardEntity() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.price,
            _that.inStock,
            _that.stockCount,
            _that.rating,
            _that.seller,
            _that.productImage,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantProductCardEntity implements AssistantProductCardEntity {
  const _AssistantProductCardEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.inStock,
      this.stockCount = 0,
      this.rating = 0.0,
      this.seller = 'Shoppy Verified',
      this.productImage = '',
      this.description = ''});

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final bool inStock;
  @override
  @JsonKey()
  final int stockCount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String seller;
  @override
  @JsonKey()
  final String productImage;
  @override
  @JsonKey()
  final String description;

  /// Create a copy of AssistantProductCardEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantProductCardEntityCopyWith<_AssistantProductCardEntity>
      get copyWith => __$AssistantProductCardEntityCopyWithImpl<
          _AssistantProductCardEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantProductCardEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.stockCount, stockCount) ||
                other.stockCount == stockCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, inStock,
      stockCount, rating, seller, productImage, description);

  @override
  String toString() {
    return 'AssistantProductCardEntity(id: $id, name: $name, price: $price, inStock: $inStock, stockCount: $stockCount, rating: $rating, seller: $seller, productImage: $productImage, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$AssistantProductCardEntityCopyWith<$Res>
    implements $AssistantProductCardEntityCopyWith<$Res> {
  factory _$AssistantProductCardEntityCopyWith(
          _AssistantProductCardEntity value,
          $Res Function(_AssistantProductCardEntity) _then) =
      __$AssistantProductCardEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      bool inStock,
      int stockCount,
      double rating,
      String seller,
      String productImage,
      String description});
}

/// @nodoc
class __$AssistantProductCardEntityCopyWithImpl<$Res>
    implements _$AssistantProductCardEntityCopyWith<$Res> {
  __$AssistantProductCardEntityCopyWithImpl(this._self, this._then);

  final _AssistantProductCardEntity _self;
  final $Res Function(_AssistantProductCardEntity) _then;

  /// Create a copy of AssistantProductCardEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? inStock = null,
    Object? stockCount = null,
    Object? rating = null,
    Object? seller = null,
    Object? productImage = null,
    Object? description = null,
  }) {
    return _then(_AssistantProductCardEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      inStock: null == inStock
          ? _self.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockCount: null == stockCount
          ? _self.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      seller: null == seller
          ? _self.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AssistantSourceEntity {
  String get chunkId;
  String get title;
  String get section;
  String get sourceType;
  String get content;
  Map<String, dynamic>? get citation;

  /// Create a copy of AssistantSourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantSourceEntityCopyWith<AssistantSourceEntity> get copyWith =>
      _$AssistantSourceEntityCopyWithImpl<AssistantSourceEntity>(
          this as AssistantSourceEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantSourceEntity &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.citation, citation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chunkId, title, section,
      sourceType, content, const DeepCollectionEquality().hash(citation));

  @override
  String toString() {
    return 'AssistantSourceEntity(chunkId: $chunkId, title: $title, section: $section, sourceType: $sourceType, content: $content, citation: $citation)';
  }
}

/// @nodoc
abstract mixin class $AssistantSourceEntityCopyWith<$Res> {
  factory $AssistantSourceEntityCopyWith(AssistantSourceEntity value,
          $Res Function(AssistantSourceEntity) _then) =
      _$AssistantSourceEntityCopyWithImpl;
  @useResult
  $Res call(
      {String chunkId,
      String title,
      String section,
      String sourceType,
      String content,
      Map<String, dynamic>? citation});
}

/// @nodoc
class _$AssistantSourceEntityCopyWithImpl<$Res>
    implements $AssistantSourceEntityCopyWith<$Res> {
  _$AssistantSourceEntityCopyWithImpl(this._self, this._then);

  final AssistantSourceEntity _self;
  final $Res Function(AssistantSourceEntity) _then;

  /// Create a copy of AssistantSourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chunkId = null,
    Object? title = null,
    Object? section = null,
    Object? sourceType = null,
    Object? content = null,
    Object? citation = freezed,
  }) {
    return _then(_self.copyWith(
      chunkId: null == chunkId
          ? _self.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _self.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      sourceType: null == sourceType
          ? _self.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      citation: freezed == citation
          ? _self.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssistantSourceEntity].
extension AssistantSourceEntityPatterns on AssistantSourceEntity {
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
    TResult Function(_AssistantSourceEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceEntity() when $default != null:
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
    TResult Function(_AssistantSourceEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceEntity():
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
    TResult? Function(_AssistantSourceEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceEntity() when $default != null:
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
    TResult Function(String chunkId, String title, String section,
            String sourceType, String content, Map<String, dynamic>? citation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceEntity() when $default != null:
        return $default(_that.chunkId, _that.title, _that.section,
            _that.sourceType, _that.content, _that.citation);
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
    TResult Function(String chunkId, String title, String section,
            String sourceType, String content, Map<String, dynamic>? citation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceEntity():
        return $default(_that.chunkId, _that.title, _that.section,
            _that.sourceType, _that.content, _that.citation);
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
    TResult? Function(String chunkId, String title, String section,
            String sourceType, String content, Map<String, dynamic>? citation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceEntity() when $default != null:
        return $default(_that.chunkId, _that.title, _that.section,
            _that.sourceType, _that.content, _that.citation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantSourceEntity implements AssistantSourceEntity {
  const _AssistantSourceEntity(
      {required this.chunkId,
      required this.title,
      this.section = '',
      this.sourceType = 'POLICY',
      this.content = '',
      final Map<String, dynamic>? citation})
      : _citation = citation;

  @override
  final String chunkId;
  @override
  final String title;
  @override
  @JsonKey()
  final String section;
  @override
  @JsonKey()
  final String sourceType;
  @override
  @JsonKey()
  final String content;
  final Map<String, dynamic>? _citation;
  @override
  Map<String, dynamic>? get citation {
    final value = _citation;
    if (value == null) return null;
    if (_citation is EqualUnmodifiableMapView) return _citation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of AssistantSourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantSourceEntityCopyWith<_AssistantSourceEntity> get copyWith =>
      __$AssistantSourceEntityCopyWithImpl<_AssistantSourceEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantSourceEntity &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._citation, _citation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chunkId, title, section,
      sourceType, content, const DeepCollectionEquality().hash(_citation));

  @override
  String toString() {
    return 'AssistantSourceEntity(chunkId: $chunkId, title: $title, section: $section, sourceType: $sourceType, content: $content, citation: $citation)';
  }
}

/// @nodoc
abstract mixin class _$AssistantSourceEntityCopyWith<$Res>
    implements $AssistantSourceEntityCopyWith<$Res> {
  factory _$AssistantSourceEntityCopyWith(_AssistantSourceEntity value,
          $Res Function(_AssistantSourceEntity) _then) =
      __$AssistantSourceEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String chunkId,
      String title,
      String section,
      String sourceType,
      String content,
      Map<String, dynamic>? citation});
}

/// @nodoc
class __$AssistantSourceEntityCopyWithImpl<$Res>
    implements _$AssistantSourceEntityCopyWith<$Res> {
  __$AssistantSourceEntityCopyWithImpl(this._self, this._then);

  final _AssistantSourceEntity _self;
  final $Res Function(_AssistantSourceEntity) _then;

  /// Create a copy of AssistantSourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chunkId = null,
    Object? title = null,
    Object? section = null,
    Object? sourceType = null,
    Object? content = null,
    Object? citation = freezed,
  }) {
    return _then(_AssistantSourceEntity(
      chunkId: null == chunkId
          ? _self.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _self.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      sourceType: null == sourceType
          ? _self.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      citation: freezed == citation
          ? _self._citation
          : citation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
mixin _$AssistantActionEntity {
  String get type;
  String get label;
  Map<String, dynamic> get payload;

  /// Create a copy of AssistantActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantActionEntityCopyWith<AssistantActionEntity> get copyWith =>
      _$AssistantActionEntityCopyWithImpl<AssistantActionEntity>(
          this as AssistantActionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantActionEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, label, const DeepCollectionEquality().hash(payload));

  @override
  String toString() {
    return 'AssistantActionEntity(type: $type, label: $label, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class $AssistantActionEntityCopyWith<$Res> {
  factory $AssistantActionEntityCopyWith(AssistantActionEntity value,
          $Res Function(AssistantActionEntity) _then) =
      _$AssistantActionEntityCopyWithImpl;
  @useResult
  $Res call({String type, String label, Map<String, dynamic> payload});
}

/// @nodoc
class _$AssistantActionEntityCopyWithImpl<$Res>
    implements $AssistantActionEntityCopyWith<$Res> {
  _$AssistantActionEntityCopyWithImpl(this._self, this._then);

  final AssistantActionEntity _self;
  final $Res Function(AssistantActionEntity) _then;

  /// Create a copy of AssistantActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? payload = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssistantActionEntity].
extension AssistantActionEntityPatterns on AssistantActionEntity {
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
    TResult Function(_AssistantActionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantActionEntity() when $default != null:
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
    TResult Function(_AssistantActionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantActionEntity():
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
    TResult? Function(_AssistantActionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantActionEntity() when $default != null:
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
    TResult Function(String type, String label, Map<String, dynamic> payload)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantActionEntity() when $default != null:
        return $default(_that.type, _that.label, _that.payload);
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
    TResult Function(String type, String label, Map<String, dynamic> payload)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantActionEntity():
        return $default(_that.type, _that.label, _that.payload);
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
    TResult? Function(String type, String label, Map<String, dynamic> payload)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantActionEntity() when $default != null:
        return $default(_that.type, _that.label, _that.payload);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantActionEntity implements AssistantActionEntity {
  const _AssistantActionEntity(
      {required this.type,
      required this.label,
      final Map<String, dynamic> payload = const {}})
      : _payload = payload;

  @override
  final String type;
  @override
  final String label;
  final Map<String, dynamic> _payload;
  @override
  @JsonKey()
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  /// Create a copy of AssistantActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantActionEntityCopyWith<_AssistantActionEntity> get copyWith =>
      __$AssistantActionEntityCopyWithImpl<_AssistantActionEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantActionEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, label, const DeepCollectionEquality().hash(_payload));

  @override
  String toString() {
    return 'AssistantActionEntity(type: $type, label: $label, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class _$AssistantActionEntityCopyWith<$Res>
    implements $AssistantActionEntityCopyWith<$Res> {
  factory _$AssistantActionEntityCopyWith(_AssistantActionEntity value,
          $Res Function(_AssistantActionEntity) _then) =
      __$AssistantActionEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String label, Map<String, dynamic> payload});
}

/// @nodoc
class __$AssistantActionEntityCopyWithImpl<$Res>
    implements _$AssistantActionEntityCopyWith<$Res> {
  __$AssistantActionEntityCopyWithImpl(this._self, this._then);

  final _AssistantActionEntity _self;
  final $Res Function(_AssistantActionEntity) _then;

  /// Create a copy of AssistantActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? payload = null,
  }) {
    return _then(_AssistantActionEntity(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _self._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
mixin _$AssistantConfirmationEntity {
  String get confirmationId;
  String get action;
  String get summary;
  String? get orderId;
  String? get orderNumber;
  double? get totalAmount;
  String get currency;
  Map<String, dynamic> get details;

  /// Create a copy of AssistantConfirmationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantConfirmationEntityCopyWith<AssistantConfirmationEntity>
      get copyWith => _$AssistantConfirmationEntityCopyWithImpl<
              AssistantConfirmationEntity>(
          this as AssistantConfirmationEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantConfirmationEntity &&
            (identical(other.confirmationId, confirmationId) ||
                other.confirmationId == confirmationId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      confirmationId,
      action,
      summary,
      orderId,
      orderNumber,
      totalAmount,
      currency,
      const DeepCollectionEquality().hash(details));

  @override
  String toString() {
    return 'AssistantConfirmationEntity(confirmationId: $confirmationId, action: $action, summary: $summary, orderId: $orderId, orderNumber: $orderNumber, totalAmount: $totalAmount, currency: $currency, details: $details)';
  }
}

/// @nodoc
abstract mixin class $AssistantConfirmationEntityCopyWith<$Res> {
  factory $AssistantConfirmationEntityCopyWith(
          AssistantConfirmationEntity value,
          $Res Function(AssistantConfirmationEntity) _then) =
      _$AssistantConfirmationEntityCopyWithImpl;
  @useResult
  $Res call(
      {String confirmationId,
      String action,
      String summary,
      String? orderId,
      String? orderNumber,
      double? totalAmount,
      String currency,
      Map<String, dynamic> details});
}

/// @nodoc
class _$AssistantConfirmationEntityCopyWithImpl<$Res>
    implements $AssistantConfirmationEntityCopyWith<$Res> {
  _$AssistantConfirmationEntityCopyWithImpl(this._self, this._then);

  final AssistantConfirmationEntity _self;
  final $Res Function(AssistantConfirmationEntity) _then;

  /// Create a copy of AssistantConfirmationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmationId = null,
    Object? action = null,
    Object? summary = null,
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? totalAmount = freezed,
    Object? currency = null,
    Object? details = null,
  }) {
    return _then(_self.copyWith(
      confirmationId: null == confirmationId
          ? _self.confirmationId
          : confirmationId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssistantConfirmationEntity].
extension AssistantConfirmationEntityPatterns on AssistantConfirmationEntity {
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
    TResult Function(_AssistantConfirmationEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationEntity() when $default != null:
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
    TResult Function(_AssistantConfirmationEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationEntity():
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
    TResult? Function(_AssistantConfirmationEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationEntity() when $default != null:
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
            String confirmationId,
            String action,
            String summary,
            String? orderId,
            String? orderNumber,
            double? totalAmount,
            String currency,
            Map<String, dynamic> details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationEntity() when $default != null:
        return $default(
            _that.confirmationId,
            _that.action,
            _that.summary,
            _that.orderId,
            _that.orderNumber,
            _that.totalAmount,
            _that.currency,
            _that.details);
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
            String confirmationId,
            String action,
            String summary,
            String? orderId,
            String? orderNumber,
            double? totalAmount,
            String currency,
            Map<String, dynamic> details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationEntity():
        return $default(
            _that.confirmationId,
            _that.action,
            _that.summary,
            _that.orderId,
            _that.orderNumber,
            _that.totalAmount,
            _that.currency,
            _that.details);
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
            String confirmationId,
            String action,
            String summary,
            String? orderId,
            String? orderNumber,
            double? totalAmount,
            String currency,
            Map<String, dynamic> details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationEntity() when $default != null:
        return $default(
            _that.confirmationId,
            _that.action,
            _that.summary,
            _that.orderId,
            _that.orderNumber,
            _that.totalAmount,
            _that.currency,
            _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantConfirmationEntity implements AssistantConfirmationEntity {
  const _AssistantConfirmationEntity(
      {required this.confirmationId,
      required this.action,
      required this.summary,
      this.orderId,
      this.orderNumber,
      this.totalAmount,
      this.currency = 'USD',
      final Map<String, dynamic> details = const {}})
      : _details = details;

  @override
  final String confirmationId;
  @override
  final String action;
  @override
  final String summary;
  @override
  final String? orderId;
  @override
  final String? orderNumber;
  @override
  final double? totalAmount;
  @override
  @JsonKey()
  final String currency;
  final Map<String, dynamic> _details;
  @override
  @JsonKey()
  Map<String, dynamic> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  /// Create a copy of AssistantConfirmationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantConfirmationEntityCopyWith<_AssistantConfirmationEntity>
      get copyWith => __$AssistantConfirmationEntityCopyWithImpl<
          _AssistantConfirmationEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantConfirmationEntity &&
            (identical(other.confirmationId, confirmationId) ||
                other.confirmationId == confirmationId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      confirmationId,
      action,
      summary,
      orderId,
      orderNumber,
      totalAmount,
      currency,
      const DeepCollectionEquality().hash(_details));

  @override
  String toString() {
    return 'AssistantConfirmationEntity(confirmationId: $confirmationId, action: $action, summary: $summary, orderId: $orderId, orderNumber: $orderNumber, totalAmount: $totalAmount, currency: $currency, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$AssistantConfirmationEntityCopyWith<$Res>
    implements $AssistantConfirmationEntityCopyWith<$Res> {
  factory _$AssistantConfirmationEntityCopyWith(
          _AssistantConfirmationEntity value,
          $Res Function(_AssistantConfirmationEntity) _then) =
      __$AssistantConfirmationEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String confirmationId,
      String action,
      String summary,
      String? orderId,
      String? orderNumber,
      double? totalAmount,
      String currency,
      Map<String, dynamic> details});
}

/// @nodoc
class __$AssistantConfirmationEntityCopyWithImpl<$Res>
    implements _$AssistantConfirmationEntityCopyWith<$Res> {
  __$AssistantConfirmationEntityCopyWithImpl(this._self, this._then);

  final _AssistantConfirmationEntity _self;
  final $Res Function(_AssistantConfirmationEntity) _then;

  /// Create a copy of AssistantConfirmationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? confirmationId = null,
    Object? action = null,
    Object? summary = null,
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? totalAmount = freezed,
    Object? currency = null,
    Object? details = null,
  }) {
    return _then(_AssistantConfirmationEntity(
      confirmationId: null == confirmationId
          ? _self.confirmationId
          : confirmationId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
mixin _$AssistantMessageEntity {
  String get id;
  String get role;
  String get content;
  AssistantConfirmationEntity? get pendingConfirmation;
  List<AssistantProductCardEntity> get products;
  List<AssistantSourceEntity> get sources;
  List<AssistantActionEntity> get actions;
  DateTime? get timestamp;

  /// Create a copy of AssistantMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantMessageEntityCopyWith<AssistantMessageEntity> get copyWith =>
      _$AssistantMessageEntityCopyWithImpl<AssistantMessageEntity>(
          this as AssistantMessageEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantMessageEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.pendingConfirmation, pendingConfirmation) ||
                other.pendingConfirmation == pendingConfirmation) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality().equals(other.sources, sources) &&
            const DeepCollectionEquality().equals(other.actions, actions) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      role,
      content,
      pendingConfirmation,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(sources),
      const DeepCollectionEquality().hash(actions),
      timestamp);

  @override
  String toString() {
    return 'AssistantMessageEntity(id: $id, role: $role, content: $content, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $AssistantMessageEntityCopyWith<$Res> {
  factory $AssistantMessageEntityCopyWith(AssistantMessageEntity value,
          $Res Function(AssistantMessageEntity) _then) =
      _$AssistantMessageEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String role,
      String content,
      AssistantConfirmationEntity? pendingConfirmation,
      List<AssistantProductCardEntity> products,
      List<AssistantSourceEntity> sources,
      List<AssistantActionEntity> actions,
      DateTime? timestamp});

  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class _$AssistantMessageEntityCopyWithImpl<$Res>
    implements $AssistantMessageEntityCopyWith<$Res> {
  _$AssistantMessageEntityCopyWithImpl(this._self, this._then);

  final AssistantMessageEntity _self;
  final $Res Function(AssistantMessageEntity) _then;

  /// Create a copy of AssistantMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? pendingConfirmation = freezed,
    Object? products = null,
    Object? sources = null,
    Object? actions = null,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      pendingConfirmation: freezed == pendingConfirmation
          ? _self.pendingConfirmation
          : pendingConfirmation // ignore: cast_nullable_to_non_nullable
              as AssistantConfirmationEntity?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardEntity>,
      sources: null == sources
          ? _self.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceEntity>,
      actions: null == actions
          ? _self.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionEntity>,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of AssistantMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationEntityCopyWith<$Res>(
        _self.pendingConfirmation!, (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AssistantMessageEntity].
extension AssistantMessageEntityPatterns on AssistantMessageEntity {
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
    TResult Function(_AssistantMessageEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageEntity() when $default != null:
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
    TResult Function(_AssistantMessageEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageEntity():
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
    TResult? Function(_AssistantMessageEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageEntity() when $default != null:
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
            String role,
            String content,
            AssistantConfirmationEntity? pendingConfirmation,
            List<AssistantProductCardEntity> products,
            List<AssistantSourceEntity> sources,
            List<AssistantActionEntity> actions,
            DateTime? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageEntity() when $default != null:
        return $default(
            _that.id,
            _that.role,
            _that.content,
            _that.pendingConfirmation,
            _that.products,
            _that.sources,
            _that.actions,
            _that.timestamp);
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
            String role,
            String content,
            AssistantConfirmationEntity? pendingConfirmation,
            List<AssistantProductCardEntity> products,
            List<AssistantSourceEntity> sources,
            List<AssistantActionEntity> actions,
            DateTime? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageEntity():
        return $default(
            _that.id,
            _that.role,
            _that.content,
            _that.pendingConfirmation,
            _that.products,
            _that.sources,
            _that.actions,
            _that.timestamp);
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
            String role,
            String content,
            AssistantConfirmationEntity? pendingConfirmation,
            List<AssistantProductCardEntity> products,
            List<AssistantSourceEntity> sources,
            List<AssistantActionEntity> actions,
            DateTime? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageEntity() when $default != null:
        return $default(
            _that.id,
            _that.role,
            _that.content,
            _that.pendingConfirmation,
            _that.products,
            _that.sources,
            _that.actions,
            _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantMessageEntity extends AssistantMessageEntity {
  const _AssistantMessageEntity(
      {required this.id,
      required this.role,
      required this.content,
      this.pendingConfirmation,
      final List<AssistantProductCardEntity> products = const [],
      final List<AssistantSourceEntity> sources = const [],
      final List<AssistantActionEntity> actions = const [],
      this.timestamp})
      : _products = products,
        _sources = sources,
        _actions = actions,
        super._();

  @override
  final String id;
  @override
  final String role;
  @override
  final String content;
  @override
  final AssistantConfirmationEntity? pendingConfirmation;
  final List<AssistantProductCardEntity> _products;
  @override
  @JsonKey()
  List<AssistantProductCardEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<AssistantSourceEntity> _sources;
  @override
  @JsonKey()
  List<AssistantSourceEntity> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<AssistantActionEntity> _actions;
  @override
  @JsonKey()
  List<AssistantActionEntity> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final DateTime? timestamp;

  /// Create a copy of AssistantMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantMessageEntityCopyWith<_AssistantMessageEntity> get copyWith =>
      __$AssistantMessageEntityCopyWithImpl<_AssistantMessageEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantMessageEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.pendingConfirmation, pendingConfirmation) ||
                other.pendingConfirmation == pendingConfirmation) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      role,
      content,
      pendingConfirmation,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_actions),
      timestamp);

  @override
  String toString() {
    return 'AssistantMessageEntity(id: $id, role: $role, content: $content, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$AssistantMessageEntityCopyWith<$Res>
    implements $AssistantMessageEntityCopyWith<$Res> {
  factory _$AssistantMessageEntityCopyWith(_AssistantMessageEntity value,
          $Res Function(_AssistantMessageEntity) _then) =
      __$AssistantMessageEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String role,
      String content,
      AssistantConfirmationEntity? pendingConfirmation,
      List<AssistantProductCardEntity> products,
      List<AssistantSourceEntity> sources,
      List<AssistantActionEntity> actions,
      DateTime? timestamp});

  @override
  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class __$AssistantMessageEntityCopyWithImpl<$Res>
    implements _$AssistantMessageEntityCopyWith<$Res> {
  __$AssistantMessageEntityCopyWithImpl(this._self, this._then);

  final _AssistantMessageEntity _self;
  final $Res Function(_AssistantMessageEntity) _then;

  /// Create a copy of AssistantMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? pendingConfirmation = freezed,
    Object? products = null,
    Object? sources = null,
    Object? actions = null,
    Object? timestamp = freezed,
  }) {
    return _then(_AssistantMessageEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      pendingConfirmation: freezed == pendingConfirmation
          ? _self.pendingConfirmation
          : pendingConfirmation // ignore: cast_nullable_to_non_nullable
              as AssistantConfirmationEntity?,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardEntity>,
      sources: null == sources
          ? _self._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceEntity>,
      actions: null == actions
          ? _self._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionEntity>,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of AssistantMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationEntityCopyWith<$Res>(
        _self.pendingConfirmation!, (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// @nodoc
mixin _$AssistantChatResponseEntity {
  String get conversationId;
  String get message;
  String get answer;
  AssistantConfirmationEntity? get pendingConfirmation;
  List<AssistantProductCardEntity> get products;
  List<AssistantSourceEntity> get sources;
  List<AssistantActionEntity> get actions;
  String get requestId;

  /// Create a copy of AssistantChatResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantChatResponseEntityCopyWith<AssistantChatResponseEntity>
      get copyWith => _$AssistantChatResponseEntityCopyWithImpl<
              AssistantChatResponseEntity>(
          this as AssistantChatResponseEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantChatResponseEntity &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.pendingConfirmation, pendingConfirmation) ||
                other.pendingConfirmation == pendingConfirmation) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality().equals(other.sources, sources) &&
            const DeepCollectionEquality().equals(other.actions, actions) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      conversationId,
      message,
      answer,
      pendingConfirmation,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(sources),
      const DeepCollectionEquality().hash(actions),
      requestId);

  @override
  String toString() {
    return 'AssistantChatResponseEntity(conversationId: $conversationId, message: $message, answer: $answer, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, requestId: $requestId)';
  }
}

/// @nodoc
abstract mixin class $AssistantChatResponseEntityCopyWith<$Res> {
  factory $AssistantChatResponseEntityCopyWith(
          AssistantChatResponseEntity value,
          $Res Function(AssistantChatResponseEntity) _then) =
      _$AssistantChatResponseEntityCopyWithImpl;
  @useResult
  $Res call(
      {String conversationId,
      String message,
      String answer,
      AssistantConfirmationEntity? pendingConfirmation,
      List<AssistantProductCardEntity> products,
      List<AssistantSourceEntity> sources,
      List<AssistantActionEntity> actions,
      String requestId});

  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class _$AssistantChatResponseEntityCopyWithImpl<$Res>
    implements $AssistantChatResponseEntityCopyWith<$Res> {
  _$AssistantChatResponseEntityCopyWithImpl(this._self, this._then);

  final AssistantChatResponseEntity _self;
  final $Res Function(AssistantChatResponseEntity) _then;

  /// Create a copy of AssistantChatResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? message = null,
    Object? answer = null,
    Object? pendingConfirmation = freezed,
    Object? products = null,
    Object? sources = null,
    Object? actions = null,
    Object? requestId = null,
  }) {
    return _then(_self.copyWith(
      conversationId: null == conversationId
          ? _self.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      pendingConfirmation: freezed == pendingConfirmation
          ? _self.pendingConfirmation
          : pendingConfirmation // ignore: cast_nullable_to_non_nullable
              as AssistantConfirmationEntity?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardEntity>,
      sources: null == sources
          ? _self.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceEntity>,
      actions: null == actions
          ? _self.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionEntity>,
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AssistantChatResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationEntityCopyWith<$Res>(
        _self.pendingConfirmation!, (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AssistantChatResponseEntity].
extension AssistantChatResponseEntityPatterns on AssistantChatResponseEntity {
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
    TResult Function(_AssistantChatResponseEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseEntity() when $default != null:
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
    TResult Function(_AssistantChatResponseEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseEntity():
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
    TResult? Function(_AssistantChatResponseEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseEntity() when $default != null:
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
            String conversationId,
            String message,
            String answer,
            AssistantConfirmationEntity? pendingConfirmation,
            List<AssistantProductCardEntity> products,
            List<AssistantSourceEntity> sources,
            List<AssistantActionEntity> actions,
            String requestId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseEntity() when $default != null:
        return $default(
            _that.conversationId,
            _that.message,
            _that.answer,
            _that.pendingConfirmation,
            _that.products,
            _that.sources,
            _that.actions,
            _that.requestId);
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
            String conversationId,
            String message,
            String answer,
            AssistantConfirmationEntity? pendingConfirmation,
            List<AssistantProductCardEntity> products,
            List<AssistantSourceEntity> sources,
            List<AssistantActionEntity> actions,
            String requestId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseEntity():
        return $default(
            _that.conversationId,
            _that.message,
            _that.answer,
            _that.pendingConfirmation,
            _that.products,
            _that.sources,
            _that.actions,
            _that.requestId);
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
            String conversationId,
            String message,
            String answer,
            AssistantConfirmationEntity? pendingConfirmation,
            List<AssistantProductCardEntity> products,
            List<AssistantSourceEntity> sources,
            List<AssistantActionEntity> actions,
            String requestId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseEntity() when $default != null:
        return $default(
            _that.conversationId,
            _that.message,
            _that.answer,
            _that.pendingConfirmation,
            _that.products,
            _that.sources,
            _that.actions,
            _that.requestId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantChatResponseEntity implements AssistantChatResponseEntity {
  const _AssistantChatResponseEntity(
      {required this.conversationId,
      required this.message,
      required this.answer,
      this.pendingConfirmation,
      final List<AssistantProductCardEntity> products = const [],
      final List<AssistantSourceEntity> sources = const [],
      final List<AssistantActionEntity> actions = const [],
      required this.requestId})
      : _products = products,
        _sources = sources,
        _actions = actions;

  @override
  final String conversationId;
  @override
  final String message;
  @override
  final String answer;
  @override
  final AssistantConfirmationEntity? pendingConfirmation;
  final List<AssistantProductCardEntity> _products;
  @override
  @JsonKey()
  List<AssistantProductCardEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<AssistantSourceEntity> _sources;
  @override
  @JsonKey()
  List<AssistantSourceEntity> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<AssistantActionEntity> _actions;
  @override
  @JsonKey()
  List<AssistantActionEntity> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final String requestId;

  /// Create a copy of AssistantChatResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantChatResponseEntityCopyWith<_AssistantChatResponseEntity>
      get copyWith => __$AssistantChatResponseEntityCopyWithImpl<
          _AssistantChatResponseEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantChatResponseEntity &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.pendingConfirmation, pendingConfirmation) ||
                other.pendingConfirmation == pendingConfirmation) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      conversationId,
      message,
      answer,
      pendingConfirmation,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_actions),
      requestId);

  @override
  String toString() {
    return 'AssistantChatResponseEntity(conversationId: $conversationId, message: $message, answer: $answer, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, requestId: $requestId)';
  }
}

/// @nodoc
abstract mixin class _$AssistantChatResponseEntityCopyWith<$Res>
    implements $AssistantChatResponseEntityCopyWith<$Res> {
  factory _$AssistantChatResponseEntityCopyWith(
          _AssistantChatResponseEntity value,
          $Res Function(_AssistantChatResponseEntity) _then) =
      __$AssistantChatResponseEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String conversationId,
      String message,
      String answer,
      AssistantConfirmationEntity? pendingConfirmation,
      List<AssistantProductCardEntity> products,
      List<AssistantSourceEntity> sources,
      List<AssistantActionEntity> actions,
      String requestId});

  @override
  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class __$AssistantChatResponseEntityCopyWithImpl<$Res>
    implements _$AssistantChatResponseEntityCopyWith<$Res> {
  __$AssistantChatResponseEntityCopyWithImpl(this._self, this._then);

  final _AssistantChatResponseEntity _self;
  final $Res Function(_AssistantChatResponseEntity) _then;

  /// Create a copy of AssistantChatResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? conversationId = null,
    Object? message = null,
    Object? answer = null,
    Object? pendingConfirmation = freezed,
    Object? products = null,
    Object? sources = null,
    Object? actions = null,
    Object? requestId = null,
  }) {
    return _then(_AssistantChatResponseEntity(
      conversationId: null == conversationId
          ? _self.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      pendingConfirmation: freezed == pendingConfirmation
          ? _self.pendingConfirmation
          : pendingConfirmation // ignore: cast_nullable_to_non_nullable
              as AssistantConfirmationEntity?,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardEntity>,
      sources: null == sources
          ? _self._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceEntity>,
      actions: null == actions
          ? _self._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionEntity>,
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AssistantChatResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationEntityCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationEntityCopyWith<$Res>(
        _self.pendingConfirmation!, (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// @nodoc
mixin _$AssistantConversationSummaryEntity {
  String get id;
  String get title;
  String get status;
  int get messageCount;
  String get lastMessage;
  DateTime? get updatedAt;

  /// Create a copy of AssistantConversationSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantConversationSummaryEntityCopyWith<
          AssistantConversationSummaryEntity>
      get copyWith => _$AssistantConversationSummaryEntityCopyWithImpl<
              AssistantConversationSummaryEntity>(
          this as AssistantConversationSummaryEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantConversationSummaryEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, status, messageCount, lastMessage, updatedAt);

  @override
  String toString() {
    return 'AssistantConversationSummaryEntity(id: $id, title: $title, status: $status, messageCount: $messageCount, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AssistantConversationSummaryEntityCopyWith<$Res> {
  factory $AssistantConversationSummaryEntityCopyWith(
          AssistantConversationSummaryEntity value,
          $Res Function(AssistantConversationSummaryEntity) _then) =
      _$AssistantConversationSummaryEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String status,
      int messageCount,
      String lastMessage,
      DateTime? updatedAt});
}

/// @nodoc
class _$AssistantConversationSummaryEntityCopyWithImpl<$Res>
    implements $AssistantConversationSummaryEntityCopyWith<$Res> {
  _$AssistantConversationSummaryEntityCopyWithImpl(this._self, this._then);

  final AssistantConversationSummaryEntity _self;
  final $Res Function(AssistantConversationSummaryEntity) _then;

  /// Create a copy of AssistantConversationSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
    Object? messageCount = null,
    Object? lastMessage = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssistantConversationSummaryEntity].
extension AssistantConversationSummaryEntityPatterns
    on AssistantConversationSummaryEntity {
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
    TResult Function(_AssistantConversationSummaryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryEntity() when $default != null:
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
    TResult Function(_AssistantConversationSummaryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryEntity():
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
    TResult? Function(_AssistantConversationSummaryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryEntity() when $default != null:
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
    TResult Function(String id, String title, String status, int messageCount,
            String lastMessage, DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryEntity() when $default != null:
        return $default(_that.id, _that.title, _that.status, _that.messageCount,
            _that.lastMessage, _that.updatedAt);
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
    TResult Function(String id, String title, String status, int messageCount,
            String lastMessage, DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryEntity():
        return $default(_that.id, _that.title, _that.status, _that.messageCount,
            _that.lastMessage, _that.updatedAt);
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
    TResult? Function(String id, String title, String status, int messageCount,
            String lastMessage, DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryEntity() when $default != null:
        return $default(_that.id, _that.title, _that.status, _that.messageCount,
            _that.lastMessage, _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantConversationSummaryEntity
    implements AssistantConversationSummaryEntity {
  const _AssistantConversationSummaryEntity(
      {required this.id,
      required this.title,
      required this.status,
      required this.messageCount,
      required this.lastMessage,
      this.updatedAt});

  @override
  final String id;
  @override
  final String title;
  @override
  final String status;
  @override
  final int messageCount;
  @override
  final String lastMessage;
  @override
  final DateTime? updatedAt;

  /// Create a copy of AssistantConversationSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantConversationSummaryEntityCopyWith<
          _AssistantConversationSummaryEntity>
      get copyWith => __$AssistantConversationSummaryEntityCopyWithImpl<
          _AssistantConversationSummaryEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantConversationSummaryEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, status, messageCount, lastMessage, updatedAt);

  @override
  String toString() {
    return 'AssistantConversationSummaryEntity(id: $id, title: $title, status: $status, messageCount: $messageCount, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AssistantConversationSummaryEntityCopyWith<$Res>
    implements $AssistantConversationSummaryEntityCopyWith<$Res> {
  factory _$AssistantConversationSummaryEntityCopyWith(
          _AssistantConversationSummaryEntity value,
          $Res Function(_AssistantConversationSummaryEntity) _then) =
      __$AssistantConversationSummaryEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String status,
      int messageCount,
      String lastMessage,
      DateTime? updatedAt});
}

/// @nodoc
class __$AssistantConversationSummaryEntityCopyWithImpl<$Res>
    implements _$AssistantConversationSummaryEntityCopyWith<$Res> {
  __$AssistantConversationSummaryEntityCopyWithImpl(this._self, this._then);

  final _AssistantConversationSummaryEntity _self;
  final $Res Function(_AssistantConversationSummaryEntity) _then;

  /// Create a copy of AssistantConversationSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
    Object? messageCount = null,
    Object? lastMessage = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_AssistantConversationSummaryEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
