// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flash_sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlashSaleItemModel {
  String get id;
  String get productId;
  String get productName;
  String get productImage;
  String get sellerName;
  double get regularPrice;
  double get salePrice;
  double get mrp;
  String get discountType;
  double get discountValue;
  int get discountPercentage;
  int get maximumQuantityPerOrder;
  int get stockAllocated;
  int get stockSold;
  int? get remainingStock;
  bool get isSoldOut;
  DateTime? get endAt;
  DateTime? get serverTime;

  /// Create a copy of FlashSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlashSaleItemModelCopyWith<FlashSaleItemModel> get copyWith =>
      _$FlashSaleItemModelCopyWithImpl<FlashSaleItemModel>(
          this as FlashSaleItemModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlashSaleItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(
                    other.maximumQuantityPerOrder, maximumQuantityPerOrder) ||
                other.maximumQuantityPerOrder == maximumQuantityPerOrder) &&
            (identical(other.stockAllocated, stockAllocated) ||
                other.stockAllocated == stockAllocated) &&
            (identical(other.stockSold, stockSold) ||
                other.stockSold == stockSold) &&
            (identical(other.remainingStock, remainingStock) ||
                other.remainingStock == remainingStock) &&
            (identical(other.isSoldOut, isSoldOut) ||
                other.isSoldOut == isSoldOut) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      productName,
      productImage,
      sellerName,
      regularPrice,
      salePrice,
      mrp,
      discountType,
      discountValue,
      discountPercentage,
      maximumQuantityPerOrder,
      stockAllocated,
      stockSold,
      remainingStock,
      isSoldOut,
      endAt,
      serverTime);

  @override
  String toString() {
    return 'FlashSaleItemModel(id: $id, productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, regularPrice: $regularPrice, salePrice: $salePrice, mrp: $mrp, discountType: $discountType, discountValue: $discountValue, discountPercentage: $discountPercentage, maximumQuantityPerOrder: $maximumQuantityPerOrder, stockAllocated: $stockAllocated, stockSold: $stockSold, remainingStock: $remainingStock, isSoldOut: $isSoldOut, endAt: $endAt, serverTime: $serverTime)';
  }
}

/// @nodoc
abstract mixin class $FlashSaleItemModelCopyWith<$Res> {
  factory $FlashSaleItemModelCopyWith(
          FlashSaleItemModel value, $Res Function(FlashSaleItemModel) _then) =
      _$FlashSaleItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String productImage,
      String sellerName,
      double regularPrice,
      double salePrice,
      double mrp,
      String discountType,
      double discountValue,
      int discountPercentage,
      int maximumQuantityPerOrder,
      int stockAllocated,
      int stockSold,
      int? remainingStock,
      bool isSoldOut,
      DateTime? endAt,
      DateTime? serverTime});
}

/// @nodoc
class _$FlashSaleItemModelCopyWithImpl<$Res>
    implements $FlashSaleItemModelCopyWith<$Res> {
  _$FlashSaleItemModelCopyWithImpl(this._self, this._then);

  final FlashSaleItemModel _self;
  final $Res Function(FlashSaleItemModel) _then;

  /// Create a copy of FlashSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? sellerName = null,
    Object? regularPrice = null,
    Object? salePrice = null,
    Object? mrp = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? discountPercentage = null,
    Object? maximumQuantityPerOrder = null,
    Object? stockAllocated = null,
    Object? stockSold = null,
    Object? remainingStock = freezed,
    Object? isSoldOut = null,
    Object? endAt = freezed,
    Object? serverTime = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      regularPrice: null == regularPrice
          ? _self.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _self.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercentage: null == discountPercentage
          ? _self.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      maximumQuantityPerOrder: null == maximumQuantityPerOrder
          ? _self.maximumQuantityPerOrder
          : maximumQuantityPerOrder // ignore: cast_nullable_to_non_nullable
              as int,
      stockAllocated: null == stockAllocated
          ? _self.stockAllocated
          : stockAllocated // ignore: cast_nullable_to_non_nullable
              as int,
      stockSold: null == stockSold
          ? _self.stockSold
          : stockSold // ignore: cast_nullable_to_non_nullable
              as int,
      remainingStock: freezed == remainingStock
          ? _self.remainingStock
          : remainingStock // ignore: cast_nullable_to_non_nullable
              as int?,
      isSoldOut: null == isSoldOut
          ? _self.isSoldOut
          : isSoldOut // ignore: cast_nullable_to_non_nullable
              as bool,
      endAt: freezed == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverTime: freezed == serverTime
          ? _self.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FlashSaleItemModel].
extension FlashSaleItemModelPatterns on FlashSaleItemModel {
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
    TResult Function(_FlashSaleItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FlashSaleItemModel() when $default != null:
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
    TResult Function(_FlashSaleItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleItemModel():
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
    TResult? Function(_FlashSaleItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleItemModel() when $default != null:
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
            String productId,
            String productName,
            String productImage,
            String sellerName,
            double regularPrice,
            double salePrice,
            double mrp,
            String discountType,
            double discountValue,
            int discountPercentage,
            int maximumQuantityPerOrder,
            int stockAllocated,
            int stockSold,
            int? remainingStock,
            bool isSoldOut,
            DateTime? endAt,
            DateTime? serverTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FlashSaleItemModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.regularPrice,
            _that.salePrice,
            _that.mrp,
            _that.discountType,
            _that.discountValue,
            _that.discountPercentage,
            _that.maximumQuantityPerOrder,
            _that.stockAllocated,
            _that.stockSold,
            _that.remainingStock,
            _that.isSoldOut,
            _that.endAt,
            _that.serverTime);
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
            String productId,
            String productName,
            String productImage,
            String sellerName,
            double regularPrice,
            double salePrice,
            double mrp,
            String discountType,
            double discountValue,
            int discountPercentage,
            int maximumQuantityPerOrder,
            int stockAllocated,
            int stockSold,
            int? remainingStock,
            bool isSoldOut,
            DateTime? endAt,
            DateTime? serverTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleItemModel():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.regularPrice,
            _that.salePrice,
            _that.mrp,
            _that.discountType,
            _that.discountValue,
            _that.discountPercentage,
            _that.maximumQuantityPerOrder,
            _that.stockAllocated,
            _that.stockSold,
            _that.remainingStock,
            _that.isSoldOut,
            _that.endAt,
            _that.serverTime);
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
            String productId,
            String productName,
            String productImage,
            String sellerName,
            double regularPrice,
            double salePrice,
            double mrp,
            String discountType,
            double discountValue,
            int discountPercentage,
            int maximumQuantityPerOrder,
            int stockAllocated,
            int stockSold,
            int? remainingStock,
            bool isSoldOut,
            DateTime? endAt,
            DateTime? serverTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleItemModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.regularPrice,
            _that.salePrice,
            _that.mrp,
            _that.discountType,
            _that.discountValue,
            _that.discountPercentage,
            _that.maximumQuantityPerOrder,
            _that.stockAllocated,
            _that.stockSold,
            _that.remainingStock,
            _that.isSoldOut,
            _that.endAt,
            _that.serverTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FlashSaleItemModel implements FlashSaleItemModel {
  const _FlashSaleItemModel(
      {required this.id,
      required this.productId,
      required this.productName,
      this.productImage = '',
      this.sellerName = 'Official Seller',
      required this.regularPrice,
      required this.salePrice,
      this.mrp = 0.0,
      this.discountType = 'FIXED_PRICE',
      this.discountValue = 0.0,
      this.discountPercentage = 0,
      this.maximumQuantityPerOrder = 2,
      this.stockAllocated = 0,
      this.stockSold = 0,
      this.remainingStock,
      this.isSoldOut = false,
      this.endAt,
      this.serverTime});

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  @JsonKey()
  final String productImage;
  @override
  @JsonKey()
  final String sellerName;
  @override
  final double regularPrice;
  @override
  final double salePrice;
  @override
  @JsonKey()
  final double mrp;
  @override
  @JsonKey()
  final String discountType;
  @override
  @JsonKey()
  final double discountValue;
  @override
  @JsonKey()
  final int discountPercentage;
  @override
  @JsonKey()
  final int maximumQuantityPerOrder;
  @override
  @JsonKey()
  final int stockAllocated;
  @override
  @JsonKey()
  final int stockSold;
  @override
  final int? remainingStock;
  @override
  @JsonKey()
  final bool isSoldOut;
  @override
  final DateTime? endAt;
  @override
  final DateTime? serverTime;

  /// Create a copy of FlashSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FlashSaleItemModelCopyWith<_FlashSaleItemModel> get copyWith =>
      __$FlashSaleItemModelCopyWithImpl<_FlashSaleItemModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlashSaleItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(
                    other.maximumQuantityPerOrder, maximumQuantityPerOrder) ||
                other.maximumQuantityPerOrder == maximumQuantityPerOrder) &&
            (identical(other.stockAllocated, stockAllocated) ||
                other.stockAllocated == stockAllocated) &&
            (identical(other.stockSold, stockSold) ||
                other.stockSold == stockSold) &&
            (identical(other.remainingStock, remainingStock) ||
                other.remainingStock == remainingStock) &&
            (identical(other.isSoldOut, isSoldOut) ||
                other.isSoldOut == isSoldOut) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      productName,
      productImage,
      sellerName,
      regularPrice,
      salePrice,
      mrp,
      discountType,
      discountValue,
      discountPercentage,
      maximumQuantityPerOrder,
      stockAllocated,
      stockSold,
      remainingStock,
      isSoldOut,
      endAt,
      serverTime);

  @override
  String toString() {
    return 'FlashSaleItemModel(id: $id, productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, regularPrice: $regularPrice, salePrice: $salePrice, mrp: $mrp, discountType: $discountType, discountValue: $discountValue, discountPercentage: $discountPercentage, maximumQuantityPerOrder: $maximumQuantityPerOrder, stockAllocated: $stockAllocated, stockSold: $stockSold, remainingStock: $remainingStock, isSoldOut: $isSoldOut, endAt: $endAt, serverTime: $serverTime)';
  }
}

/// @nodoc
abstract mixin class _$FlashSaleItemModelCopyWith<$Res>
    implements $FlashSaleItemModelCopyWith<$Res> {
  factory _$FlashSaleItemModelCopyWith(
          _FlashSaleItemModel value, $Res Function(_FlashSaleItemModel) _then) =
      __$FlashSaleItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String productImage,
      String sellerName,
      double regularPrice,
      double salePrice,
      double mrp,
      String discountType,
      double discountValue,
      int discountPercentage,
      int maximumQuantityPerOrder,
      int stockAllocated,
      int stockSold,
      int? remainingStock,
      bool isSoldOut,
      DateTime? endAt,
      DateTime? serverTime});
}

/// @nodoc
class __$FlashSaleItemModelCopyWithImpl<$Res>
    implements _$FlashSaleItemModelCopyWith<$Res> {
  __$FlashSaleItemModelCopyWithImpl(this._self, this._then);

  final _FlashSaleItemModel _self;
  final $Res Function(_FlashSaleItemModel) _then;

  /// Create a copy of FlashSaleItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? sellerName = null,
    Object? regularPrice = null,
    Object? salePrice = null,
    Object? mrp = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? discountPercentage = null,
    Object? maximumQuantityPerOrder = null,
    Object? stockAllocated = null,
    Object? stockSold = null,
    Object? remainingStock = freezed,
    Object? isSoldOut = null,
    Object? endAt = freezed,
    Object? serverTime = freezed,
  }) {
    return _then(_FlashSaleItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      regularPrice: null == regularPrice
          ? _self.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: null == salePrice
          ? _self.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _self.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercentage: null == discountPercentage
          ? _self.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      maximumQuantityPerOrder: null == maximumQuantityPerOrder
          ? _self.maximumQuantityPerOrder
          : maximumQuantityPerOrder // ignore: cast_nullable_to_non_nullable
              as int,
      stockAllocated: null == stockAllocated
          ? _self.stockAllocated
          : stockAllocated // ignore: cast_nullable_to_non_nullable
              as int,
      stockSold: null == stockSold
          ? _self.stockSold
          : stockSold // ignore: cast_nullable_to_non_nullable
              as int,
      remainingStock: freezed == remainingStock
          ? _self.remainingStock
          : remainingStock // ignore: cast_nullable_to_non_nullable
              as int?,
      isSoldOut: null == isSoldOut
          ? _self.isSoldOut
          : isSoldOut // ignore: cast_nullable_to_non_nullable
              as bool,
      endAt: freezed == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverTime: freezed == serverTime
          ? _self.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$FlashSaleModel {
  String get id;
  String get name;
  String get title;
  String get description;
  String get saleType;
  String get bannerImage;
  DateTime get startAt;
  DateTime get endAt;
  bool get isActive;
  int get priority;
  List<FlashSaleItemModel> get items;
  int get itemCount;
  DateTime? get serverTime;

  /// Create a copy of FlashSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlashSaleModelCopyWith<FlashSaleModel> get copyWith =>
      _$FlashSaleModelCopyWithImpl<FlashSaleModel>(
          this as FlashSaleModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlashSaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      title,
      description,
      saleType,
      bannerImage,
      startAt,
      endAt,
      isActive,
      priority,
      const DeepCollectionEquality().hash(items),
      itemCount,
      serverTime);

  @override
  String toString() {
    return 'FlashSaleModel(id: $id, name: $name, title: $title, description: $description, saleType: $saleType, bannerImage: $bannerImage, startAt: $startAt, endAt: $endAt, isActive: $isActive, priority: $priority, items: $items, itemCount: $itemCount, serverTime: $serverTime)';
  }
}

/// @nodoc
abstract mixin class $FlashSaleModelCopyWith<$Res> {
  factory $FlashSaleModelCopyWith(
          FlashSaleModel value, $Res Function(FlashSaleModel) _then) =
      _$FlashSaleModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String title,
      String description,
      String saleType,
      String bannerImage,
      DateTime startAt,
      DateTime endAt,
      bool isActive,
      int priority,
      List<FlashSaleItemModel> items,
      int itemCount,
      DateTime? serverTime});
}

/// @nodoc
class _$FlashSaleModelCopyWithImpl<$Res>
    implements $FlashSaleModelCopyWith<$Res> {
  _$FlashSaleModelCopyWithImpl(this._self, this._then);

  final FlashSaleModel _self;
  final $Res Function(FlashSaleModel) _then;

  /// Create a copy of FlashSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? description = null,
    Object? saleType = null,
    Object? bannerImage = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? isActive = null,
    Object? priority = null,
    Object? items = null,
    Object? itemCount = null,
    Object? serverTime = freezed,
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
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      saleType: null == saleType
          ? _self.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImage: null == bannerImage
          ? _self.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endAt: null == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FlashSaleItemModel>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      serverTime: freezed == serverTime
          ? _self.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FlashSaleModel].
extension FlashSaleModelPatterns on FlashSaleModel {
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
    TResult Function(_FlashSaleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FlashSaleModel() when $default != null:
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
    TResult Function(_FlashSaleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleModel():
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
    TResult? Function(_FlashSaleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleModel() when $default != null:
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
            String title,
            String description,
            String saleType,
            String bannerImage,
            DateTime startAt,
            DateTime endAt,
            bool isActive,
            int priority,
            List<FlashSaleItemModel> items,
            int itemCount,
            DateTime? serverTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FlashSaleModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.title,
            _that.description,
            _that.saleType,
            _that.bannerImage,
            _that.startAt,
            _that.endAt,
            _that.isActive,
            _that.priority,
            _that.items,
            _that.itemCount,
            _that.serverTime);
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
            String title,
            String description,
            String saleType,
            String bannerImage,
            DateTime startAt,
            DateTime endAt,
            bool isActive,
            int priority,
            List<FlashSaleItemModel> items,
            int itemCount,
            DateTime? serverTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleModel():
        return $default(
            _that.id,
            _that.name,
            _that.title,
            _that.description,
            _that.saleType,
            _that.bannerImage,
            _that.startAt,
            _that.endAt,
            _that.isActive,
            _that.priority,
            _that.items,
            _that.itemCount,
            _that.serverTime);
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
            String title,
            String description,
            String saleType,
            String bannerImage,
            DateTime startAt,
            DateTime endAt,
            bool isActive,
            int priority,
            List<FlashSaleItemModel> items,
            int itemCount,
            DateTime? serverTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlashSaleModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.title,
            _that.description,
            _that.saleType,
            _that.bannerImage,
            _that.startAt,
            _that.endAt,
            _that.isActive,
            _that.priority,
            _that.items,
            _that.itemCount,
            _that.serverTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FlashSaleModel implements FlashSaleModel {
  const _FlashSaleModel(
      {required this.id,
      required this.name,
      required this.title,
      this.description = '',
      this.saleType = 'FLASH_SALE',
      this.bannerImage = '',
      required this.startAt,
      required this.endAt,
      this.isActive = true,
      this.priority = 0,
      final List<FlashSaleItemModel> items = const [],
      this.itemCount = 0,
      this.serverTime})
      : _items = items;

  @override
  final String id;
  @override
  final String name;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String saleType;
  @override
  @JsonKey()
  final String bannerImage;
  @override
  final DateTime startAt;
  @override
  final DateTime endAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int priority;
  final List<FlashSaleItemModel> _items;
  @override
  @JsonKey()
  List<FlashSaleItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int itemCount;
  @override
  final DateTime? serverTime;

  /// Create a copy of FlashSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FlashSaleModelCopyWith<_FlashSaleModel> get copyWith =>
      __$FlashSaleModelCopyWithImpl<_FlashSaleModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlashSaleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      title,
      description,
      saleType,
      bannerImage,
      startAt,
      endAt,
      isActive,
      priority,
      const DeepCollectionEquality().hash(_items),
      itemCount,
      serverTime);

  @override
  String toString() {
    return 'FlashSaleModel(id: $id, name: $name, title: $title, description: $description, saleType: $saleType, bannerImage: $bannerImage, startAt: $startAt, endAt: $endAt, isActive: $isActive, priority: $priority, items: $items, itemCount: $itemCount, serverTime: $serverTime)';
  }
}

/// @nodoc
abstract mixin class _$FlashSaleModelCopyWith<$Res>
    implements $FlashSaleModelCopyWith<$Res> {
  factory _$FlashSaleModelCopyWith(
          _FlashSaleModel value, $Res Function(_FlashSaleModel) _then) =
      __$FlashSaleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String title,
      String description,
      String saleType,
      String bannerImage,
      DateTime startAt,
      DateTime endAt,
      bool isActive,
      int priority,
      List<FlashSaleItemModel> items,
      int itemCount,
      DateTime? serverTime});
}

/// @nodoc
class __$FlashSaleModelCopyWithImpl<$Res>
    implements _$FlashSaleModelCopyWith<$Res> {
  __$FlashSaleModelCopyWithImpl(this._self, this._then);

  final _FlashSaleModel _self;
  final $Res Function(_FlashSaleModel) _then;

  /// Create a copy of FlashSaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? description = null,
    Object? saleType = null,
    Object? bannerImage = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? isActive = null,
    Object? priority = null,
    Object? items = null,
    Object? itemCount = null,
    Object? serverTime = freezed,
  }) {
    return _then(_FlashSaleModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      saleType: null == saleType
          ? _self.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImage: null == bannerImage
          ? _self.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endAt: null == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FlashSaleItemModel>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      serverTime: freezed == serverTime
          ? _self.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
