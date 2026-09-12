// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemModel {
  String get id;
  String get productId;
  String get productName;
  String get sellerName;
  String get productImage;
  double get price;
  int get quantity;
  int get stock;
  bool get isAvailable;
  double get lineTotal;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartItemModelCopyWith<CartItemModel> get copyWith =>
      _$CartItemModelCopyWithImpl<CartItemModel>(
          this as CartItemModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      sellerName, productImage, price, quantity, stock, isAvailable, lineTotal);

  @override
  String toString() {
    return 'CartItemModel(id: $id, productId: $productId, productName: $productName, sellerName: $sellerName, productImage: $productImage, price: $price, quantity: $quantity, stock: $stock, isAvailable: $isAvailable, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class $CartItemModelCopyWith<$Res> {
  factory $CartItemModelCopyWith(
          CartItemModel value, $Res Function(CartItemModel) _then) =
      _$CartItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String sellerName,
      String productImage,
      double price,
      int quantity,
      int stock,
      bool isAvailable,
      double lineTotal});
}

/// @nodoc
class _$CartItemModelCopyWithImpl<$Res>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._self, this._then);

  final CartItemModel _self;
  final $Res Function(CartItemModel) _then;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? sellerName = null,
    Object? productImage = null,
    Object? price = null,
    Object? quantity = null,
    Object? stock = null,
    Object? isAvailable = null,
    Object? lineTotal = null,
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
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      lineTotal: null == lineTotal
          ? _self.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartItemModel].
extension CartItemModelPatterns on CartItemModel {
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
    TResult Function(_CartItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
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
    TResult Function(_CartItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel():
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
    TResult? Function(_CartItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
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
            String sellerName,
            String productImage,
            double price,
            int quantity,
            int stock,
            bool isAvailable,
            double lineTotal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.sellerName,
            _that.productImage,
            _that.price,
            _that.quantity,
            _that.stock,
            _that.isAvailable,
            _that.lineTotal);
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
            String sellerName,
            String productImage,
            double price,
            int quantity,
            int stock,
            bool isAvailable,
            double lineTotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.sellerName,
            _that.productImage,
            _that.price,
            _that.quantity,
            _that.stock,
            _that.isAvailable,
            _that.lineTotal);
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
            String sellerName,
            String productImage,
            double price,
            int quantity,
            int stock,
            bool isAvailable,
            double lineTotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemModel() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.sellerName,
            _that.productImage,
            _that.price,
            _that.quantity,
            _that.stock,
            _that.isAvailable,
            _that.lineTotal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CartItemModel implements CartItemModel {
  const _CartItemModel(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.sellerName,
      required this.productImage,
      required this.price,
      required this.quantity,
      required this.stock,
      required this.isAvailable,
      required this.lineTotal});

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  final String sellerName;
  @override
  final String productImage;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final int stock;
  @override
  final bool isAvailable;
  @override
  final double lineTotal;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartItemModelCopyWith<_CartItemModel> get copyWith =>
      __$CartItemModelCopyWithImpl<_CartItemModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      sellerName, productImage, price, quantity, stock, isAvailable, lineTotal);

  @override
  String toString() {
    return 'CartItemModel(id: $id, productId: $productId, productName: $productName, sellerName: $sellerName, productImage: $productImage, price: $price, quantity: $quantity, stock: $stock, isAvailable: $isAvailable, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class _$CartItemModelCopyWith<$Res>
    implements $CartItemModelCopyWith<$Res> {
  factory _$CartItemModelCopyWith(
          _CartItemModel value, $Res Function(_CartItemModel) _then) =
      __$CartItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String sellerName,
      String productImage,
      double price,
      int quantity,
      int stock,
      bool isAvailable,
      double lineTotal});
}

/// @nodoc
class __$CartItemModelCopyWithImpl<$Res>
    implements _$CartItemModelCopyWith<$Res> {
  __$CartItemModelCopyWithImpl(this._self, this._then);

  final _CartItemModel _self;
  final $Res Function(_CartItemModel) _then;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? sellerName = null,
    Object? productImage = null,
    Object? price = null,
    Object? quantity = null,
    Object? stock = null,
    Object? isAvailable = null,
    Object? lineTotal = null,
  }) {
    return _then(_CartItemModel(
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
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      lineTotal: null == lineTotal
          ? _self.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$CartModel {
  String get id;
  List<CartItemModel> get items;
  int get itemCount;
  double get subtotal;
  double get shipping;
  double get tax;
  double get total;
  double get discount;
  double get taxableAmount;
  String? get couponCode;
  AppliedCouponModel? get appliedCoupon;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartModelCopyWith<CartModel> get copyWith =>
      _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.appliedCoupon, appliedCoupon) ||
                other.appliedCoupon == appliedCoupon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(items),
      itemCount,
      subtotal,
      shipping,
      tax,
      total,
      discount,
      taxableAmount,
      couponCode,
      appliedCoupon);

  @override
  String toString() {
    return 'CartModel(id: $id, items: $items, itemCount: $itemCount, subtotal: $subtotal, shipping: $shipping, tax: $tax, total: $total, discount: $discount, taxableAmount: $taxableAmount, couponCode: $couponCode, appliedCoupon: $appliedCoupon)';
  }
}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) =
      _$CartModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      List<CartItemModel> items,
      int itemCount,
      double subtotal,
      double shipping,
      double tax,
      double total,
      double discount,
      double taxableAmount,
      String? couponCode,
      AppliedCouponModel? appliedCoupon});

  $AppliedCouponModelCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res> implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? itemCount = null,
    Object? subtotal = null,
    Object? shipping = null,
    Object? tax = null,
    Object? total = null,
    Object? discount = null,
    Object? taxableAmount = null,
    Object? couponCode = freezed,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedCoupon: freezed == appliedCoupon
          ? _self.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as AppliedCouponModel?,
    ));
  }

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppliedCouponModelCopyWith<$Res>? get appliedCoupon {
    if (_self.appliedCoupon == null) {
      return null;
    }

    return $AppliedCouponModelCopyWith<$Res>(_self.appliedCoupon!, (value) {
      return _then(_self.copyWith(appliedCoupon: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CartModel].
extension CartModelPatterns on CartModel {
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
    TResult Function(_CartModel value)? $default, {
    TResult Function(_CartModelEmpty value)? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
        return $default(_that);
      case _CartModelEmpty() when empty != null:
        return empty(_that);
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
    TResult Function(_CartModel value) $default, {
    required TResult Function(_CartModelEmpty value) empty,
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel():
        return $default(_that);
      case _CartModelEmpty():
        return empty(_that);
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
    TResult? Function(_CartModel value)? $default, {
    TResult? Function(_CartModelEmpty value)? empty,
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
        return $default(_that);
      case _CartModelEmpty() when empty != null:
        return empty(_that);
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
            List<CartItemModel> items,
            int itemCount,
            double subtotal,
            double shipping,
            double tax,
            double total,
            double discount,
            double taxableAmount,
            String? couponCode,
            AppliedCouponModel? appliedCoupon)?
        $default, {
    TResult Function(
            String id,
            List<CartItemModel> items,
            int itemCount,
            double subtotal,
            double shipping,
            double tax,
            double total,
            double discount,
            double taxableAmount,
            String? couponCode,
            AppliedCouponModel? appliedCoupon)?
        empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
        return $default(
            _that.id,
            _that.items,
            _that.itemCount,
            _that.subtotal,
            _that.shipping,
            _that.tax,
            _that.total,
            _that.discount,
            _that.taxableAmount,
            _that.couponCode,
            _that.appliedCoupon);
      case _CartModelEmpty() when empty != null:
        return empty(
            _that.id,
            _that.items,
            _that.itemCount,
            _that.subtotal,
            _that.shipping,
            _that.tax,
            _that.total,
            _that.discount,
            _that.taxableAmount,
            _that.couponCode,
            _that.appliedCoupon);
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
            List<CartItemModel> items,
            int itemCount,
            double subtotal,
            double shipping,
            double tax,
            double total,
            double discount,
            double taxableAmount,
            String? couponCode,
            AppliedCouponModel? appliedCoupon)
        $default, {
    required TResult Function(
            String id,
            List<CartItemModel> items,
            int itemCount,
            double subtotal,
            double shipping,
            double tax,
            double total,
            double discount,
            double taxableAmount,
            String? couponCode,
            AppliedCouponModel? appliedCoupon)
        empty,
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel():
        return $default(
            _that.id,
            _that.items,
            _that.itemCount,
            _that.subtotal,
            _that.shipping,
            _that.tax,
            _that.total,
            _that.discount,
            _that.taxableAmount,
            _that.couponCode,
            _that.appliedCoupon);
      case _CartModelEmpty():
        return empty(
            _that.id,
            _that.items,
            _that.itemCount,
            _that.subtotal,
            _that.shipping,
            _that.tax,
            _that.total,
            _that.discount,
            _that.taxableAmount,
            _that.couponCode,
            _that.appliedCoupon);
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
            List<CartItemModel> items,
            int itemCount,
            double subtotal,
            double shipping,
            double tax,
            double total,
            double discount,
            double taxableAmount,
            String? couponCode,
            AppliedCouponModel? appliedCoupon)?
        $default, {
    TResult? Function(
            String id,
            List<CartItemModel> items,
            int itemCount,
            double subtotal,
            double shipping,
            double tax,
            double total,
            double discount,
            double taxableAmount,
            String? couponCode,
            AppliedCouponModel? appliedCoupon)?
        empty,
  }) {
    final _that = this;
    switch (_that) {
      case _CartModel() when $default != null:
        return $default(
            _that.id,
            _that.items,
            _that.itemCount,
            _that.subtotal,
            _that.shipping,
            _that.tax,
            _that.total,
            _that.discount,
            _that.taxableAmount,
            _that.couponCode,
            _that.appliedCoupon);
      case _CartModelEmpty() when empty != null:
        return empty(
            _that.id,
            _that.items,
            _that.itemCount,
            _that.subtotal,
            _that.shipping,
            _that.tax,
            _that.total,
            _that.discount,
            _that.taxableAmount,
            _that.couponCode,
            _that.appliedCoupon);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CartModel extends CartModel {
  const _CartModel(
      {this.id = '',
      final List<CartItemModel> items = const [],
      this.itemCount = 0,
      this.subtotal = 0.0,
      this.shipping = 0.0,
      this.tax = 0.0,
      this.total = 0.0,
      this.discount = 0.0,
      this.taxableAmount = 0.0,
      this.couponCode,
      this.appliedCoupon})
      : _items = items,
        super._();

  @override
  @JsonKey()
  final String id;
  final List<CartItemModel> _items;
  @override
  @JsonKey()
  List<CartItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int itemCount;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double shipping;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double taxableAmount;
  @override
  final String? couponCode;
  @override
  final AppliedCouponModel? appliedCoupon;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartModelCopyWith<_CartModel> get copyWith =>
      __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.appliedCoupon, appliedCoupon) ||
                other.appliedCoupon == appliedCoupon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      itemCount,
      subtotal,
      shipping,
      tax,
      total,
      discount,
      taxableAmount,
      couponCode,
      appliedCoupon);

  @override
  String toString() {
    return 'CartModel(id: $id, items: $items, itemCount: $itemCount, subtotal: $subtotal, shipping: $shipping, tax: $tax, total: $total, discount: $discount, taxableAmount: $taxableAmount, couponCode: $couponCode, appliedCoupon: $appliedCoupon)';
  }
}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(
          _CartModel value, $Res Function(_CartModel) _then) =
      __$CartModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<CartItemModel> items,
      int itemCount,
      double subtotal,
      double shipping,
      double tax,
      double total,
      double discount,
      double taxableAmount,
      String? couponCode,
      AppliedCouponModel? appliedCoupon});

  @override
  $AppliedCouponModelCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class __$CartModelCopyWithImpl<$Res> implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? itemCount = null,
    Object? subtotal = null,
    Object? shipping = null,
    Object? tax = null,
    Object? total = null,
    Object? discount = null,
    Object? taxableAmount = null,
    Object? couponCode = freezed,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_CartModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedCoupon: freezed == appliedCoupon
          ? _self.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as AppliedCouponModel?,
    ));
  }

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppliedCouponModelCopyWith<$Res>? get appliedCoupon {
    if (_self.appliedCoupon == null) {
      return null;
    }

    return $AppliedCouponModelCopyWith<$Res>(_self.appliedCoupon!, (value) {
      return _then(_self.copyWith(appliedCoupon: value));
    });
  }
}

/// @nodoc

class _CartModelEmpty extends CartModel {
  const _CartModelEmpty(
      {this.id = '',
      final List<CartItemModel> items = const [],
      this.itemCount = 0,
      this.subtotal = 0.0,
      this.shipping = 0.0,
      this.tax = 0.0,
      this.total = 0.0,
      this.discount = 0.0,
      this.taxableAmount = 0.0,
      this.couponCode,
      this.appliedCoupon})
      : _items = items,
        super._();

  @override
  @JsonKey()
  final String id;
  final List<CartItemModel> _items;
  @override
  @JsonKey()
  List<CartItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int itemCount;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double shipping;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double taxableAmount;
  @override
  final String? couponCode;
  @override
  final AppliedCouponModel? appliedCoupon;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartModelEmptyCopyWith<_CartModelEmpty> get copyWith =>
      __$CartModelEmptyCopyWithImpl<_CartModelEmpty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartModelEmpty &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.appliedCoupon, appliedCoupon) ||
                other.appliedCoupon == appliedCoupon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      itemCount,
      subtotal,
      shipping,
      tax,
      total,
      discount,
      taxableAmount,
      couponCode,
      appliedCoupon);

  @override
  String toString() {
    return 'CartModel.empty(id: $id, items: $items, itemCount: $itemCount, subtotal: $subtotal, shipping: $shipping, tax: $tax, total: $total, discount: $discount, taxableAmount: $taxableAmount, couponCode: $couponCode, appliedCoupon: $appliedCoupon)';
  }
}

/// @nodoc
abstract mixin class _$CartModelEmptyCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$CartModelEmptyCopyWith(
          _CartModelEmpty value, $Res Function(_CartModelEmpty) _then) =
      __$CartModelEmptyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<CartItemModel> items,
      int itemCount,
      double subtotal,
      double shipping,
      double tax,
      double total,
      double discount,
      double taxableAmount,
      String? couponCode,
      AppliedCouponModel? appliedCoupon});

  @override
  $AppliedCouponModelCopyWith<$Res>? get appliedCoupon;
}

/// @nodoc
class __$CartModelEmptyCopyWithImpl<$Res>
    implements _$CartModelEmptyCopyWith<$Res> {
  __$CartModelEmptyCopyWithImpl(this._self, this._then);

  final _CartModelEmpty _self;
  final $Res Function(_CartModelEmpty) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? itemCount = null,
    Object? subtotal = null,
    Object? shipping = null,
    Object? tax = null,
    Object? total = null,
    Object? discount = null,
    Object? taxableAmount = null,
    Object? couponCode = freezed,
    Object? appliedCoupon = freezed,
  }) {
    return _then(_CartModelEmpty(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shipping: null == shipping
          ? _self.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedCoupon: freezed == appliedCoupon
          ? _self.appliedCoupon
          : appliedCoupon // ignore: cast_nullable_to_non_nullable
              as AppliedCouponModel?,
    ));
  }

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppliedCouponModelCopyWith<$Res>? get appliedCoupon {
    if (_self.appliedCoupon == null) {
      return null;
    }

    return $AppliedCouponModelCopyWith<$Res>(_self.appliedCoupon!, (value) {
      return _then(_self.copyWith(appliedCoupon: value));
    });
  }
}

// dart format on
