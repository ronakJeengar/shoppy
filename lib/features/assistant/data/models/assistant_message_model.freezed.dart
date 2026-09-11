// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistant_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssistantProductCardModel {
  String get id;
  String get name;
  double get price;
  bool get inStock;
  int get stockCount;
  double get rating;
  String get seller;
  String get productImage;
  String get description;

  /// Create a copy of AssistantProductCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantProductCardModelCopyWith<AssistantProductCardModel> get copyWith =>
      _$AssistantProductCardModelCopyWithImpl<AssistantProductCardModel>(
          this as AssistantProductCardModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantProductCardModel &&
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
    return 'AssistantProductCardModel(id: $id, name: $name, price: $price, inStock: $inStock, stockCount: $stockCount, rating: $rating, seller: $seller, productImage: $productImage, description: $description)';
  }
}

/// @nodoc
abstract mixin class $AssistantProductCardModelCopyWith<$Res> {
  factory $AssistantProductCardModelCopyWith(AssistantProductCardModel value,
          $Res Function(AssistantProductCardModel) _then) =
      _$AssistantProductCardModelCopyWithImpl;
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
class _$AssistantProductCardModelCopyWithImpl<$Res>
    implements $AssistantProductCardModelCopyWith<$Res> {
  _$AssistantProductCardModelCopyWithImpl(this._self, this._then);

  final AssistantProductCardModel _self;
  final $Res Function(AssistantProductCardModel) _then;

  /// Create a copy of AssistantProductCardModel
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

/// Adds pattern-matching-related methods to [AssistantProductCardModel].
extension AssistantProductCardModelPatterns on AssistantProductCardModel {
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
    TResult Function(_AssistantProductCardModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardModel() when $default != null:
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
    TResult Function(_AssistantProductCardModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardModel():
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
    TResult? Function(_AssistantProductCardModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantProductCardModel() when $default != null:
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
      case _AssistantProductCardModel() when $default != null:
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
      case _AssistantProductCardModel():
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
      case _AssistantProductCardModel() when $default != null:
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

class _AssistantProductCardModel extends AssistantProductCardModel {
  const _AssistantProductCardModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.inStock,
      this.stockCount = 0,
      this.rating = 0.0,
      this.seller = 'Shoppy Verified',
      this.productImage = '',
      this.description = ''})
      : super._();

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

  /// Create a copy of AssistantProductCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantProductCardModelCopyWith<_AssistantProductCardModel>
      get copyWith =>
          __$AssistantProductCardModelCopyWithImpl<_AssistantProductCardModel>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantProductCardModel &&
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
    return 'AssistantProductCardModel(id: $id, name: $name, price: $price, inStock: $inStock, stockCount: $stockCount, rating: $rating, seller: $seller, productImage: $productImage, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$AssistantProductCardModelCopyWith<$Res>
    implements $AssistantProductCardModelCopyWith<$Res> {
  factory _$AssistantProductCardModelCopyWith(_AssistantProductCardModel value,
          $Res Function(_AssistantProductCardModel) _then) =
      __$AssistantProductCardModelCopyWithImpl;
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
class __$AssistantProductCardModelCopyWithImpl<$Res>
    implements _$AssistantProductCardModelCopyWith<$Res> {
  __$AssistantProductCardModelCopyWithImpl(this._self, this._then);

  final _AssistantProductCardModel _self;
  final $Res Function(_AssistantProductCardModel) _then;

  /// Create a copy of AssistantProductCardModel
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
    return _then(_AssistantProductCardModel(
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
mixin _$AssistantSourceModel {
  String get chunkId;
  String get title;
  String get section;
  String get sourceType;
  String get content;
  Map<String, dynamic>? get citation;

  /// Create a copy of AssistantSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantSourceModelCopyWith<AssistantSourceModel> get copyWith =>
      _$AssistantSourceModelCopyWithImpl<AssistantSourceModel>(
          this as AssistantSourceModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantSourceModel &&
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
    return 'AssistantSourceModel(chunkId: $chunkId, title: $title, section: $section, sourceType: $sourceType, content: $content, citation: $citation)';
  }
}

/// @nodoc
abstract mixin class $AssistantSourceModelCopyWith<$Res> {
  factory $AssistantSourceModelCopyWith(AssistantSourceModel value,
          $Res Function(AssistantSourceModel) _then) =
      _$AssistantSourceModelCopyWithImpl;
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
class _$AssistantSourceModelCopyWithImpl<$Res>
    implements $AssistantSourceModelCopyWith<$Res> {
  _$AssistantSourceModelCopyWithImpl(this._self, this._then);

  final AssistantSourceModel _self;
  final $Res Function(AssistantSourceModel) _then;

  /// Create a copy of AssistantSourceModel
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

/// Adds pattern-matching-related methods to [AssistantSourceModel].
extension AssistantSourceModelPatterns on AssistantSourceModel {
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
    TResult Function(_AssistantSourceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceModel() when $default != null:
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
    TResult Function(_AssistantSourceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceModel():
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
    TResult? Function(_AssistantSourceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantSourceModel() when $default != null:
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
      case _AssistantSourceModel() when $default != null:
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
      case _AssistantSourceModel():
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
      case _AssistantSourceModel() when $default != null:
        return $default(_that.chunkId, _that.title, _that.section,
            _that.sourceType, _that.content, _that.citation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantSourceModel implements AssistantSourceModel {
  const _AssistantSourceModel(
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

  /// Create a copy of AssistantSourceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantSourceModelCopyWith<_AssistantSourceModel> get copyWith =>
      __$AssistantSourceModelCopyWithImpl<_AssistantSourceModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantSourceModel &&
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
    return 'AssistantSourceModel(chunkId: $chunkId, title: $title, section: $section, sourceType: $sourceType, content: $content, citation: $citation)';
  }
}

/// @nodoc
abstract mixin class _$AssistantSourceModelCopyWith<$Res>
    implements $AssistantSourceModelCopyWith<$Res> {
  factory _$AssistantSourceModelCopyWith(_AssistantSourceModel value,
          $Res Function(_AssistantSourceModel) _then) =
      __$AssistantSourceModelCopyWithImpl;
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
class __$AssistantSourceModelCopyWithImpl<$Res>
    implements _$AssistantSourceModelCopyWith<$Res> {
  __$AssistantSourceModelCopyWithImpl(this._self, this._then);

  final _AssistantSourceModel _self;
  final $Res Function(_AssistantSourceModel) _then;

  /// Create a copy of AssistantSourceModel
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
    return _then(_AssistantSourceModel(
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
mixin _$AssistantActionModel {
  String get type;
  String get label;
  Map<String, dynamic> get payload;

  /// Create a copy of AssistantActionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantActionModelCopyWith<AssistantActionModel> get copyWith =>
      _$AssistantActionModelCopyWithImpl<AssistantActionModel>(
          this as AssistantActionModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantActionModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, label, const DeepCollectionEquality().hash(payload));

  @override
  String toString() {
    return 'AssistantActionModel(type: $type, label: $label, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class $AssistantActionModelCopyWith<$Res> {
  factory $AssistantActionModelCopyWith(AssistantActionModel value,
          $Res Function(AssistantActionModel) _then) =
      _$AssistantActionModelCopyWithImpl;
  @useResult
  $Res call({String type, String label, Map<String, dynamic> payload});
}

/// @nodoc
class _$AssistantActionModelCopyWithImpl<$Res>
    implements $AssistantActionModelCopyWith<$Res> {
  _$AssistantActionModelCopyWithImpl(this._self, this._then);

  final AssistantActionModel _self;
  final $Res Function(AssistantActionModel) _then;

  /// Create a copy of AssistantActionModel
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

/// Adds pattern-matching-related methods to [AssistantActionModel].
extension AssistantActionModelPatterns on AssistantActionModel {
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
    TResult Function(_AssistantActionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantActionModel() when $default != null:
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
    TResult Function(_AssistantActionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantActionModel():
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
    TResult? Function(_AssistantActionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantActionModel() when $default != null:
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
      case _AssistantActionModel() when $default != null:
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
      case _AssistantActionModel():
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
      case _AssistantActionModel() when $default != null:
        return $default(_that.type, _that.label, _that.payload);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantActionModel implements AssistantActionModel {
  const _AssistantActionModel(
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

  /// Create a copy of AssistantActionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantActionModelCopyWith<_AssistantActionModel> get copyWith =>
      __$AssistantActionModelCopyWithImpl<_AssistantActionModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantActionModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, label, const DeepCollectionEquality().hash(_payload));

  @override
  String toString() {
    return 'AssistantActionModel(type: $type, label: $label, payload: $payload)';
  }
}

/// @nodoc
abstract mixin class _$AssistantActionModelCopyWith<$Res>
    implements $AssistantActionModelCopyWith<$Res> {
  factory _$AssistantActionModelCopyWith(_AssistantActionModel value,
          $Res Function(_AssistantActionModel) _then) =
      __$AssistantActionModelCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String label, Map<String, dynamic> payload});
}

/// @nodoc
class __$AssistantActionModelCopyWithImpl<$Res>
    implements _$AssistantActionModelCopyWith<$Res> {
  __$AssistantActionModelCopyWithImpl(this._self, this._then);

  final _AssistantActionModel _self;
  final $Res Function(_AssistantActionModel) _then;

  /// Create a copy of AssistantActionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? payload = null,
  }) {
    return _then(_AssistantActionModel(
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
mixin _$AssistantConfirmationModel {
  String get confirmationId;
  String get action;
  String get summary;
  String? get orderId;
  String? get orderNumber;
  double? get totalAmount;
  String get currency;
  Map<String, dynamic> get details;

  /// Create a copy of AssistantConfirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantConfirmationModelCopyWith<AssistantConfirmationModel>
      get copyWith =>
          _$AssistantConfirmationModelCopyWithImpl<AssistantConfirmationModel>(
              this as AssistantConfirmationModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantConfirmationModel &&
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
    return 'AssistantConfirmationModel(confirmationId: $confirmationId, action: $action, summary: $summary, orderId: $orderId, orderNumber: $orderNumber, totalAmount: $totalAmount, currency: $currency, details: $details)';
  }
}

/// @nodoc
abstract mixin class $AssistantConfirmationModelCopyWith<$Res> {
  factory $AssistantConfirmationModelCopyWith(AssistantConfirmationModel value,
          $Res Function(AssistantConfirmationModel) _then) =
      _$AssistantConfirmationModelCopyWithImpl;
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
class _$AssistantConfirmationModelCopyWithImpl<$Res>
    implements $AssistantConfirmationModelCopyWith<$Res> {
  _$AssistantConfirmationModelCopyWithImpl(this._self, this._then);

  final AssistantConfirmationModel _self;
  final $Res Function(AssistantConfirmationModel) _then;

  /// Create a copy of AssistantConfirmationModel
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

/// Adds pattern-matching-related methods to [AssistantConfirmationModel].
extension AssistantConfirmationModelPatterns on AssistantConfirmationModel {
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
    TResult Function(_AssistantConfirmationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationModel() when $default != null:
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
    TResult Function(_AssistantConfirmationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationModel():
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
    TResult? Function(_AssistantConfirmationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConfirmationModel() when $default != null:
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
      case _AssistantConfirmationModel() when $default != null:
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
      case _AssistantConfirmationModel():
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
      case _AssistantConfirmationModel() when $default != null:
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

class _AssistantConfirmationModel implements AssistantConfirmationModel {
  const _AssistantConfirmationModel(
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

  /// Create a copy of AssistantConfirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantConfirmationModelCopyWith<_AssistantConfirmationModel>
      get copyWith => __$AssistantConfirmationModelCopyWithImpl<
          _AssistantConfirmationModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantConfirmationModel &&
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
    return 'AssistantConfirmationModel(confirmationId: $confirmationId, action: $action, summary: $summary, orderId: $orderId, orderNumber: $orderNumber, totalAmount: $totalAmount, currency: $currency, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$AssistantConfirmationModelCopyWith<$Res>
    implements $AssistantConfirmationModelCopyWith<$Res> {
  factory _$AssistantConfirmationModelCopyWith(
          _AssistantConfirmationModel value,
          $Res Function(_AssistantConfirmationModel) _then) =
      __$AssistantConfirmationModelCopyWithImpl;
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
class __$AssistantConfirmationModelCopyWithImpl<$Res>
    implements _$AssistantConfirmationModelCopyWith<$Res> {
  __$AssistantConfirmationModelCopyWithImpl(this._self, this._then);

  final _AssistantConfirmationModel _self;
  final $Res Function(_AssistantConfirmationModel) _then;

  /// Create a copy of AssistantConfirmationModel
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
    return _then(_AssistantConfirmationModel(
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
mixin _$AssistantMessageModel {
  String get id;
  String get role;
  String get content;
  AssistantConfirmationModel? get pendingConfirmation;
  List<AssistantProductCardModel> get products;
  List<AssistantSourceModel> get sources;
  List<AssistantActionModel> get actions;
  DateTime? get timestamp;

  /// Create a copy of AssistantMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantMessageModelCopyWith<AssistantMessageModel> get copyWith =>
      _$AssistantMessageModelCopyWithImpl<AssistantMessageModel>(
          this as AssistantMessageModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantMessageModel &&
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
    return 'AssistantMessageModel(id: $id, role: $role, content: $content, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $AssistantMessageModelCopyWith<$Res> {
  factory $AssistantMessageModelCopyWith(AssistantMessageModel value,
          $Res Function(AssistantMessageModel) _then) =
      _$AssistantMessageModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String role,
      String content,
      AssistantConfirmationModel? pendingConfirmation,
      List<AssistantProductCardModel> products,
      List<AssistantSourceModel> sources,
      List<AssistantActionModel> actions,
      DateTime? timestamp});

  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class _$AssistantMessageModelCopyWithImpl<$Res>
    implements $AssistantMessageModelCopyWith<$Res> {
  _$AssistantMessageModelCopyWithImpl(this._self, this._then);

  final AssistantMessageModel _self;
  final $Res Function(AssistantMessageModel) _then;

  /// Create a copy of AssistantMessageModel
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
              as AssistantConfirmationModel?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardModel>,
      sources: null == sources
          ? _self.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceModel>,
      actions: null == actions
          ? _self.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionModel>,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of AssistantMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationModelCopyWith<$Res>(_self.pendingConfirmation!,
        (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AssistantMessageModel].
extension AssistantMessageModelPatterns on AssistantMessageModel {
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
    TResult Function(_AssistantMessageModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageModel() when $default != null:
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
    TResult Function(_AssistantMessageModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageModel():
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
    TResult? Function(_AssistantMessageModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageModel() when $default != null:
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
            AssistantConfirmationModel? pendingConfirmation,
            List<AssistantProductCardModel> products,
            List<AssistantSourceModel> sources,
            List<AssistantActionModel> actions,
            DateTime? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageModel() when $default != null:
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
            AssistantConfirmationModel? pendingConfirmation,
            List<AssistantProductCardModel> products,
            List<AssistantSourceModel> sources,
            List<AssistantActionModel> actions,
            DateTime? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageModel():
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
            AssistantConfirmationModel? pendingConfirmation,
            List<AssistantProductCardModel> products,
            List<AssistantSourceModel> sources,
            List<AssistantActionModel> actions,
            DateTime? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantMessageModel() when $default != null:
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

class _AssistantMessageModel extends AssistantMessageModel {
  const _AssistantMessageModel(
      {required this.id,
      required this.role,
      required this.content,
      this.pendingConfirmation,
      final List<AssistantProductCardModel> products = const [],
      final List<AssistantSourceModel> sources = const [],
      final List<AssistantActionModel> actions = const [],
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
  final AssistantConfirmationModel? pendingConfirmation;
  final List<AssistantProductCardModel> _products;
  @override
  @JsonKey()
  List<AssistantProductCardModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<AssistantSourceModel> _sources;
  @override
  @JsonKey()
  List<AssistantSourceModel> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<AssistantActionModel> _actions;
  @override
  @JsonKey()
  List<AssistantActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final DateTime? timestamp;

  /// Create a copy of AssistantMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantMessageModelCopyWith<_AssistantMessageModel> get copyWith =>
      __$AssistantMessageModelCopyWithImpl<_AssistantMessageModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantMessageModel &&
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
    return 'AssistantMessageModel(id: $id, role: $role, content: $content, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$AssistantMessageModelCopyWith<$Res>
    implements $AssistantMessageModelCopyWith<$Res> {
  factory _$AssistantMessageModelCopyWith(_AssistantMessageModel value,
          $Res Function(_AssistantMessageModel) _then) =
      __$AssistantMessageModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String role,
      String content,
      AssistantConfirmationModel? pendingConfirmation,
      List<AssistantProductCardModel> products,
      List<AssistantSourceModel> sources,
      List<AssistantActionModel> actions,
      DateTime? timestamp});

  @override
  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class __$AssistantMessageModelCopyWithImpl<$Res>
    implements _$AssistantMessageModelCopyWith<$Res> {
  __$AssistantMessageModelCopyWithImpl(this._self, this._then);

  final _AssistantMessageModel _self;
  final $Res Function(_AssistantMessageModel) _then;

  /// Create a copy of AssistantMessageModel
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
    return _then(_AssistantMessageModel(
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
              as AssistantConfirmationModel?,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardModel>,
      sources: null == sources
          ? _self._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceModel>,
      actions: null == actions
          ? _self._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionModel>,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of AssistantMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationModelCopyWith<$Res>(_self.pendingConfirmation!,
        (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// @nodoc
mixin _$AssistantChatResponseModel {
  String get conversationId;
  String get message;
  String get answer;
  AssistantConfirmationModel? get pendingConfirmation;
  List<AssistantProductCardModel> get products;
  List<AssistantSourceModel> get sources;
  List<AssistantActionModel> get actions;
  String get requestId;

  /// Create a copy of AssistantChatResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantChatResponseModelCopyWith<AssistantChatResponseModel>
      get copyWith =>
          _$AssistantChatResponseModelCopyWithImpl<AssistantChatResponseModel>(
              this as AssistantChatResponseModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantChatResponseModel &&
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
    return 'AssistantChatResponseModel(conversationId: $conversationId, message: $message, answer: $answer, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, requestId: $requestId)';
  }
}

/// @nodoc
abstract mixin class $AssistantChatResponseModelCopyWith<$Res> {
  factory $AssistantChatResponseModelCopyWith(AssistantChatResponseModel value,
          $Res Function(AssistantChatResponseModel) _then) =
      _$AssistantChatResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {String conversationId,
      String message,
      String answer,
      AssistantConfirmationModel? pendingConfirmation,
      List<AssistantProductCardModel> products,
      List<AssistantSourceModel> sources,
      List<AssistantActionModel> actions,
      String requestId});

  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class _$AssistantChatResponseModelCopyWithImpl<$Res>
    implements $AssistantChatResponseModelCopyWith<$Res> {
  _$AssistantChatResponseModelCopyWithImpl(this._self, this._then);

  final AssistantChatResponseModel _self;
  final $Res Function(AssistantChatResponseModel) _then;

  /// Create a copy of AssistantChatResponseModel
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
              as AssistantConfirmationModel?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardModel>,
      sources: null == sources
          ? _self.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceModel>,
      actions: null == actions
          ? _self.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionModel>,
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AssistantChatResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationModelCopyWith<$Res>(_self.pendingConfirmation!,
        (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AssistantChatResponseModel].
extension AssistantChatResponseModelPatterns on AssistantChatResponseModel {
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
    TResult Function(_AssistantChatResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseModel() when $default != null:
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
    TResult Function(_AssistantChatResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseModel():
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
    TResult? Function(_AssistantChatResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseModel() when $default != null:
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
            AssistantConfirmationModel? pendingConfirmation,
            List<AssistantProductCardModel> products,
            List<AssistantSourceModel> sources,
            List<AssistantActionModel> actions,
            String requestId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseModel() when $default != null:
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
            AssistantConfirmationModel? pendingConfirmation,
            List<AssistantProductCardModel> products,
            List<AssistantSourceModel> sources,
            List<AssistantActionModel> actions,
            String requestId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseModel():
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
            AssistantConfirmationModel? pendingConfirmation,
            List<AssistantProductCardModel> products,
            List<AssistantSourceModel> sources,
            List<AssistantActionModel> actions,
            String requestId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantChatResponseModel() when $default != null:
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

class _AssistantChatResponseModel implements AssistantChatResponseModel {
  const _AssistantChatResponseModel(
      {required this.conversationId,
      required this.message,
      required this.answer,
      this.pendingConfirmation,
      final List<AssistantProductCardModel> products = const [],
      final List<AssistantSourceModel> sources = const [],
      final List<AssistantActionModel> actions = const [],
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
  final AssistantConfirmationModel? pendingConfirmation;
  final List<AssistantProductCardModel> _products;
  @override
  @JsonKey()
  List<AssistantProductCardModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<AssistantSourceModel> _sources;
  @override
  @JsonKey()
  List<AssistantSourceModel> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<AssistantActionModel> _actions;
  @override
  @JsonKey()
  List<AssistantActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final String requestId;

  /// Create a copy of AssistantChatResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantChatResponseModelCopyWith<_AssistantChatResponseModel>
      get copyWith => __$AssistantChatResponseModelCopyWithImpl<
          _AssistantChatResponseModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantChatResponseModel &&
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
    return 'AssistantChatResponseModel(conversationId: $conversationId, message: $message, answer: $answer, pendingConfirmation: $pendingConfirmation, products: $products, sources: $sources, actions: $actions, requestId: $requestId)';
  }
}

/// @nodoc
abstract mixin class _$AssistantChatResponseModelCopyWith<$Res>
    implements $AssistantChatResponseModelCopyWith<$Res> {
  factory _$AssistantChatResponseModelCopyWith(
          _AssistantChatResponseModel value,
          $Res Function(_AssistantChatResponseModel) _then) =
      __$AssistantChatResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String conversationId,
      String message,
      String answer,
      AssistantConfirmationModel? pendingConfirmation,
      List<AssistantProductCardModel> products,
      List<AssistantSourceModel> sources,
      List<AssistantActionModel> actions,
      String requestId});

  @override
  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation;
}

/// @nodoc
class __$AssistantChatResponseModelCopyWithImpl<$Res>
    implements _$AssistantChatResponseModelCopyWith<$Res> {
  __$AssistantChatResponseModelCopyWithImpl(this._self, this._then);

  final _AssistantChatResponseModel _self;
  final $Res Function(_AssistantChatResponseModel) _then;

  /// Create a copy of AssistantChatResponseModel
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
    return _then(_AssistantChatResponseModel(
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
              as AssistantConfirmationModel?,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AssistantProductCardModel>,
      sources: null == sources
          ? _self._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssistantSourceModel>,
      actions: null == actions
          ? _self._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AssistantActionModel>,
      requestId: null == requestId
          ? _self.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AssistantChatResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssistantConfirmationModelCopyWith<$Res>? get pendingConfirmation {
    if (_self.pendingConfirmation == null) {
      return null;
    }

    return $AssistantConfirmationModelCopyWith<$Res>(_self.pendingConfirmation!,
        (value) {
      return _then(_self.copyWith(pendingConfirmation: value));
    });
  }
}

/// @nodoc
mixin _$AssistantConversationSummaryModel {
  String get id;
  String get title;
  String get status;
  int get messageCount;
  String get lastMessage;
  DateTime? get updatedAt;

  /// Create a copy of AssistantConversationSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantConversationSummaryModelCopyWith<AssistantConversationSummaryModel>
      get copyWith => _$AssistantConversationSummaryModelCopyWithImpl<
              AssistantConversationSummaryModel>(
          this as AssistantConversationSummaryModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssistantConversationSummaryModel &&
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
    return 'AssistantConversationSummaryModel(id: $id, title: $title, status: $status, messageCount: $messageCount, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AssistantConversationSummaryModelCopyWith<$Res> {
  factory $AssistantConversationSummaryModelCopyWith(
          AssistantConversationSummaryModel value,
          $Res Function(AssistantConversationSummaryModel) _then) =
      _$AssistantConversationSummaryModelCopyWithImpl;
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
class _$AssistantConversationSummaryModelCopyWithImpl<$Res>
    implements $AssistantConversationSummaryModelCopyWith<$Res> {
  _$AssistantConversationSummaryModelCopyWithImpl(this._self, this._then);

  final AssistantConversationSummaryModel _self;
  final $Res Function(AssistantConversationSummaryModel) _then;

  /// Create a copy of AssistantConversationSummaryModel
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

/// Adds pattern-matching-related methods to [AssistantConversationSummaryModel].
extension AssistantConversationSummaryModelPatterns
    on AssistantConversationSummaryModel {
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
    TResult Function(_AssistantConversationSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryModel() when $default != null:
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
    TResult Function(_AssistantConversationSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryModel():
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
    TResult? Function(_AssistantConversationSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssistantConversationSummaryModel() when $default != null:
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
      case _AssistantConversationSummaryModel() when $default != null:
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
      case _AssistantConversationSummaryModel():
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
      case _AssistantConversationSummaryModel() when $default != null:
        return $default(_that.id, _that.title, _that.status, _that.messageCount,
            _that.lastMessage, _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AssistantConversationSummaryModel
    implements AssistantConversationSummaryModel {
  const _AssistantConversationSummaryModel(
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

  /// Create a copy of AssistantConversationSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantConversationSummaryModelCopyWith<
          _AssistantConversationSummaryModel>
      get copyWith => __$AssistantConversationSummaryModelCopyWithImpl<
          _AssistantConversationSummaryModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssistantConversationSummaryModel &&
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
    return 'AssistantConversationSummaryModel(id: $id, title: $title, status: $status, messageCount: $messageCount, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AssistantConversationSummaryModelCopyWith<$Res>
    implements $AssistantConversationSummaryModelCopyWith<$Res> {
  factory _$AssistantConversationSummaryModelCopyWith(
          _AssistantConversationSummaryModel value,
          $Res Function(_AssistantConversationSummaryModel) _then) =
      __$AssistantConversationSummaryModelCopyWithImpl;
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
class __$AssistantConversationSummaryModelCopyWithImpl<$Res>
    implements _$AssistantConversationSummaryModelCopyWith<$Res> {
  __$AssistantConversationSummaryModelCopyWithImpl(this._self, this._then);

  final _AssistantConversationSummaryModel _self;
  final $Res Function(_AssistantConversationSummaryModel) _then;

  /// Create a copy of AssistantConversationSummaryModel
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
    return _then(_AssistantConversationSummaryModel(
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
