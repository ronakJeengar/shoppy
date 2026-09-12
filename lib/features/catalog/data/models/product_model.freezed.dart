// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {
  String get id;
  String get productName;
  String get sellerName;
  String get description;
  double get price;
  double? get mrp;
  String get hsnCode;
  double get gstRate;
  bool get isTaxInclusive;
  bool get isCodEligible;
  int get stock;
  double get productRating;
  int get totalReviews;
  String get productImage;
  String? get categoryId;
  String? get categoryName;
  bool get isActive;
  List<String> get images;
  String? get videoUrl;
  String? get model3dUrl;
  List<ProductMediaModel> get media;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<ProductModel> get copyWith =>
      _$ProductModelCopyWithImpl<ProductModel>(
          this as ProductModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.isTaxInclusive, isTaxInclusive) ||
                other.isTaxInclusive == isTaxInclusive) &&
            (identical(other.isCodEligible, isCodEligible) ||
                other.isCodEligible == isCodEligible) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.productRating, productRating) ||
                other.productRating == productRating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.model3dUrl, model3dUrl) ||
                other.model3dUrl == model3dUrl) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        productName,
        sellerName,
        description,
        price,
        mrp,
        hsnCode,
        gstRate,
        isTaxInclusive,
        isCodEligible,
        stock,
        productRating,
        totalReviews,
        productImage,
        categoryId,
        categoryName,
        isActive,
        const DeepCollectionEquality().hash(images),
        videoUrl,
        model3dUrl,
        const DeepCollectionEquality().hash(media)
      ]);

  @override
  String toString() {
    return 'ProductModel(id: $id, productName: $productName, sellerName: $sellerName, description: $description, price: $price, mrp: $mrp, hsnCode: $hsnCode, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, isCodEligible: $isCodEligible, stock: $stock, productRating: $productRating, totalReviews: $totalReviews, productImage: $productImage, categoryId: $categoryId, categoryName: $categoryName, isActive: $isActive, images: $images, videoUrl: $videoUrl, model3dUrl: $model3dUrl, media: $media)';
  }
}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) _then) =
      _$ProductModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String productName,
      String sellerName,
      String description,
      double price,
      double? mrp,
      String hsnCode,
      double gstRate,
      bool isTaxInclusive,
      bool isCodEligible,
      int stock,
      double productRating,
      int totalReviews,
      String productImage,
      String? categoryId,
      String? categoryName,
      bool isActive,
      List<String> images,
      String? videoUrl,
      String? model3dUrl,
      List<ProductMediaModel> media});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? sellerName = null,
    Object? description = null,
    Object? price = null,
    Object? mrp = freezed,
    Object? hsnCode = null,
    Object? gstRate = null,
    Object? isTaxInclusive = null,
    Object? isCodEligible = null,
    Object? stock = null,
    Object? productRating = null,
    Object? totalReviews = null,
    Object? productImage = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? isActive = null,
    Object? images = null,
    Object? videoUrl = freezed,
    Object? model3dUrl = freezed,
    Object? media = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: freezed == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double?,
      hsnCode: null == hsnCode
          ? _self.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String,
      gstRate: null == gstRate
          ? _self.gstRate
          : gstRate // ignore: cast_nullable_to_non_nullable
              as double,
      isTaxInclusive: null == isTaxInclusive
          ? _self.isTaxInclusive
          : isTaxInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodEligible: null == isCodEligible
          ? _self.isCodEligible
          : isCodEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      productRating: null == productRating
          ? _self.productRating
          : productRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _self.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoUrl: freezed == videoUrl
          ? _self.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      model3dUrl: freezed == model3dUrl
          ? _self.model3dUrl
          : model3dUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<ProductMediaModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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
    TResult Function(_ProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
    TResult Function(_ProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
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
    TResult? Function(_ProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
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
            String productName,
            String sellerName,
            String description,
            double price,
            double? mrp,
            String hsnCode,
            double gstRate,
            bool isTaxInclusive,
            bool isCodEligible,
            int stock,
            double productRating,
            int totalReviews,
            String productImage,
            String? categoryId,
            String? categoryName,
            bool isActive,
            List<String> images,
            String? videoUrl,
            String? model3dUrl,
            List<ProductMediaModel> media)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.id,
            _that.productName,
            _that.sellerName,
            _that.description,
            _that.price,
            _that.mrp,
            _that.hsnCode,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.isCodEligible,
            _that.stock,
            _that.productRating,
            _that.totalReviews,
            _that.productImage,
            _that.categoryId,
            _that.categoryName,
            _that.isActive,
            _that.images,
            _that.videoUrl,
            _that.model3dUrl,
            _that.media);
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
            String productName,
            String sellerName,
            String description,
            double price,
            double? mrp,
            String hsnCode,
            double gstRate,
            bool isTaxInclusive,
            bool isCodEligible,
            int stock,
            double productRating,
            int totalReviews,
            String productImage,
            String? categoryId,
            String? categoryName,
            bool isActive,
            List<String> images,
            String? videoUrl,
            String? model3dUrl,
            List<ProductMediaModel> media)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
        return $default(
            _that.id,
            _that.productName,
            _that.sellerName,
            _that.description,
            _that.price,
            _that.mrp,
            _that.hsnCode,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.isCodEligible,
            _that.stock,
            _that.productRating,
            _that.totalReviews,
            _that.productImage,
            _that.categoryId,
            _that.categoryName,
            _that.isActive,
            _that.images,
            _that.videoUrl,
            _that.model3dUrl,
            _that.media);
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
            String productName,
            String sellerName,
            String description,
            double price,
            double? mrp,
            String hsnCode,
            double gstRate,
            bool isTaxInclusive,
            bool isCodEligible,
            int stock,
            double productRating,
            int totalReviews,
            String productImage,
            String? categoryId,
            String? categoryName,
            bool isActive,
            List<String> images,
            String? videoUrl,
            String? model3dUrl,
            List<ProductMediaModel> media)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(
            _that.id,
            _that.productName,
            _that.sellerName,
            _that.description,
            _that.price,
            _that.mrp,
            _that.hsnCode,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.isCodEligible,
            _that.stock,
            _that.productRating,
            _that.totalReviews,
            _that.productImage,
            _that.categoryId,
            _that.categoryName,
            _that.isActive,
            _that.images,
            _that.videoUrl,
            _that.model3dUrl,
            _that.media);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductModel extends ProductModel {
  const _ProductModel(
      {required this.id,
      required this.productName,
      this.sellerName = 'Shoppy Verified',
      this.description = '',
      required this.price,
      this.mrp,
      this.hsnCode = '8518',
      this.gstRate = 18.0,
      this.isTaxInclusive = true,
      this.isCodEligible = true,
      this.stock = 0,
      this.productRating = 0.0,
      this.totalReviews = 0,
      required this.productImage,
      this.categoryId,
      this.categoryName,
      this.isActive = true,
      final List<String> images = const [],
      this.videoUrl,
      this.model3dUrl,
      final List<ProductMediaModel> media = const []})
      : _images = images,
        _media = media,
        super._();

  @override
  final String id;
  @override
  final String productName;
  @override
  @JsonKey()
  final String sellerName;
  @override
  @JsonKey()
  final String description;
  @override
  final double price;
  @override
  final double? mrp;
  @override
  @JsonKey()
  final String hsnCode;
  @override
  @JsonKey()
  final double gstRate;
  @override
  @JsonKey()
  final bool isTaxInclusive;
  @override
  @JsonKey()
  final bool isCodEligible;
  @override
  @JsonKey()
  final int stock;
  @override
  @JsonKey()
  final double productRating;
  @override
  @JsonKey()
  final int totalReviews;
  @override
  final String productImage;
  @override
  final String? categoryId;
  @override
  final String? categoryName;
  @override
  @JsonKey()
  final bool isActive;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? videoUrl;
  @override
  final String? model3dUrl;
  final List<ProductMediaModel> _media;
  @override
  @JsonKey()
  List<ProductMediaModel> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.isTaxInclusive, isTaxInclusive) ||
                other.isTaxInclusive == isTaxInclusive) &&
            (identical(other.isCodEligible, isCodEligible) ||
                other.isCodEligible == isCodEligible) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.productRating, productRating) ||
                other.productRating == productRating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.model3dUrl, model3dUrl) ||
                other.model3dUrl == model3dUrl) &&
            const DeepCollectionEquality().equals(other._media, _media));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        productName,
        sellerName,
        description,
        price,
        mrp,
        hsnCode,
        gstRate,
        isTaxInclusive,
        isCodEligible,
        stock,
        productRating,
        totalReviews,
        productImage,
        categoryId,
        categoryName,
        isActive,
        const DeepCollectionEquality().hash(_images),
        videoUrl,
        model3dUrl,
        const DeepCollectionEquality().hash(_media)
      ]);

  @override
  String toString() {
    return 'ProductModel(id: $id, productName: $productName, sellerName: $sellerName, description: $description, price: $price, mrp: $mrp, hsnCode: $hsnCode, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, isCodEligible: $isCodEligible, stock: $stock, productRating: $productRating, totalReviews: $totalReviews, productImage: $productImage, categoryId: $categoryId, categoryName: $categoryName, isActive: $isActive, images: $images, videoUrl: $videoUrl, model3dUrl: $model3dUrl, media: $media)';
  }
}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) _then) =
      __$ProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String productName,
      String sellerName,
      String description,
      double price,
      double? mrp,
      String hsnCode,
      double gstRate,
      bool isTaxInclusive,
      bool isCodEligible,
      int stock,
      double productRating,
      int totalReviews,
      String productImage,
      String? categoryId,
      String? categoryName,
      bool isActive,
      List<String> images,
      String? videoUrl,
      String? model3dUrl,
      List<ProductMediaModel> media});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? sellerName = null,
    Object? description = null,
    Object? price = null,
    Object? mrp = freezed,
    Object? hsnCode = null,
    Object? gstRate = null,
    Object? isTaxInclusive = null,
    Object? isCodEligible = null,
    Object? stock = null,
    Object? productRating = null,
    Object? totalReviews = null,
    Object? productImage = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? isActive = null,
    Object? images = null,
    Object? videoUrl = freezed,
    Object? model3dUrl = freezed,
    Object? media = null,
  }) {
    return _then(_ProductModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: freezed == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double?,
      hsnCode: null == hsnCode
          ? _self.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as String,
      gstRate: null == gstRate
          ? _self.gstRate
          : gstRate // ignore: cast_nullable_to_non_nullable
              as double,
      isTaxInclusive: null == isTaxInclusive
          ? _self.isTaxInclusive
          : isTaxInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodEligible: null == isCodEligible
          ? _self.isCodEligible
          : isCodEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      productRating: null == productRating
          ? _self.productRating
          : productRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _self.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoUrl: freezed == videoUrl
          ? _self.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      model3dUrl: freezed == model3dUrl
          ? _self.model3dUrl
          : model3dUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _self._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<ProductMediaModel>,
    ));
  }
}

// dart format on
