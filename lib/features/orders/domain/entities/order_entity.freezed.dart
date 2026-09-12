// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemEntity {
  String get productId;
  String get productName;
  String get productImage;
  String get sellerName;
  double get unitPrice;
  int get quantity;
  double get lineTotal;
  String get hsnCode;
  double get gstRate;
  bool get isTaxInclusive;
  double get taxableAmount;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderItemEntityCopyWith<OrderItemEntity> get copyWith =>
      _$OrderItemEntityCopyWithImpl<OrderItemEntity>(
          this as OrderItemEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderItemEntity &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.isTaxInclusive, isTaxInclusive) ||
                other.isTaxInclusive == isTaxInclusive) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      productImage,
      sellerName,
      unitPrice,
      quantity,
      lineTotal,
      hsnCode,
      gstRate,
      isTaxInclusive,
      taxableAmount);

  @override
  String toString() {
    return 'OrderItemEntity(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, hsnCode: $hsnCode, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, taxableAmount: $taxableAmount)';
  }
}

/// @nodoc
abstract mixin class $OrderItemEntityCopyWith<$Res> {
  factory $OrderItemEntityCopyWith(
          OrderItemEntity value, $Res Function(OrderItemEntity) _then) =
      _$OrderItemEntityCopyWithImpl;
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String sellerName,
      double unitPrice,
      int quantity,
      double lineTotal,
      String hsnCode,
      double gstRate,
      bool isTaxInclusive,
      double taxableAmount});
}

/// @nodoc
class _$OrderItemEntityCopyWithImpl<$Res>
    implements $OrderItemEntityCopyWith<$Res> {
  _$OrderItemEntityCopyWithImpl(this._self, this._then);

  final OrderItemEntity _self;
  final $Res Function(OrderItemEntity) _then;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? sellerName = null,
    Object? unitPrice = null,
    Object? quantity = null,
    Object? lineTotal = null,
    Object? hsnCode = null,
    Object? gstRate = null,
    Object? isTaxInclusive = null,
    Object? taxableAmount = null,
  }) {
    return _then(_self.copyWith(
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
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineTotal: null == lineTotal
          ? _self.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
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
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderItemEntity].
extension OrderItemEntityPatterns on OrderItemEntity {
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
    TResult Function(_OrderItemEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemEntity() when $default != null:
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
    TResult Function(_OrderItemEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemEntity():
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
    TResult? Function(_OrderItemEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemEntity() when $default != null:
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
            String productId,
            String productName,
            String productImage,
            String sellerName,
            double unitPrice,
            int quantity,
            double lineTotal,
            String hsnCode,
            double gstRate,
            bool isTaxInclusive,
            double taxableAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemEntity() when $default != null:
        return $default(
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.unitPrice,
            _that.quantity,
            _that.lineTotal,
            _that.hsnCode,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.taxableAmount);
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
            String productId,
            String productName,
            String productImage,
            String sellerName,
            double unitPrice,
            int quantity,
            double lineTotal,
            String hsnCode,
            double gstRate,
            bool isTaxInclusive,
            double taxableAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemEntity():
        return $default(
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.unitPrice,
            _that.quantity,
            _that.lineTotal,
            _that.hsnCode,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.taxableAmount);
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
            String productId,
            String productName,
            String productImage,
            String sellerName,
            double unitPrice,
            int quantity,
            double lineTotal,
            String hsnCode,
            double gstRate,
            bool isTaxInclusive,
            double taxableAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemEntity() when $default != null:
        return $default(
            _that.productId,
            _that.productName,
            _that.productImage,
            _that.sellerName,
            _that.unitPrice,
            _that.quantity,
            _that.lineTotal,
            _that.hsnCode,
            _that.gstRate,
            _that.isTaxInclusive,
            _that.taxableAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderItemEntity implements OrderItemEntity {
  const _OrderItemEntity(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.sellerName,
      required this.unitPrice,
      required this.quantity,
      required this.lineTotal,
      this.hsnCode = '8518',
      this.gstRate = 18.0,
      this.isTaxInclusive = true,
      this.taxableAmount = 0.0});

  @override
  final String productId;
  @override
  final String productName;
  @override
  final String productImage;
  @override
  final String sellerName;
  @override
  final double unitPrice;
  @override
  final int quantity;
  @override
  final double lineTotal;
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
  final double taxableAmount;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderItemEntityCopyWith<_OrderItemEntity> get copyWith =>
      __$OrderItemEntityCopyWithImpl<_OrderItemEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItemEntity &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.gstRate, gstRate) || other.gstRate == gstRate) &&
            (identical(other.isTaxInclusive, isTaxInclusive) ||
                other.isTaxInclusive == isTaxInclusive) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      productImage,
      sellerName,
      unitPrice,
      quantity,
      lineTotal,
      hsnCode,
      gstRate,
      isTaxInclusive,
      taxableAmount);

  @override
  String toString() {
    return 'OrderItemEntity(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal, hsnCode: $hsnCode, gstRate: $gstRate, isTaxInclusive: $isTaxInclusive, taxableAmount: $taxableAmount)';
  }
}

/// @nodoc
abstract mixin class _$OrderItemEntityCopyWith<$Res>
    implements $OrderItemEntityCopyWith<$Res> {
  factory _$OrderItemEntityCopyWith(
          _OrderItemEntity value, $Res Function(_OrderItemEntity) _then) =
      __$OrderItemEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String sellerName,
      double unitPrice,
      int quantity,
      double lineTotal,
      String hsnCode,
      double gstRate,
      bool isTaxInclusive,
      double taxableAmount});
}

/// @nodoc
class __$OrderItemEntityCopyWithImpl<$Res>
    implements _$OrderItemEntityCopyWith<$Res> {
  __$OrderItemEntityCopyWithImpl(this._self, this._then);

  final _OrderItemEntity _self;
  final $Res Function(_OrderItemEntity) _then;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productImage = null,
    Object? sellerName = null,
    Object? unitPrice = null,
    Object? quantity = null,
    Object? lineTotal = null,
    Object? hsnCode = null,
    Object? gstRate = null,
    Object? isTaxInclusive = null,
    Object? taxableAmount = null,
  }) {
    return _then(_OrderItemEntity(
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
      unitPrice: null == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineTotal: null == lineTotal
          ? _self.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
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
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$OrderStatusHistoryEntity {
  String get status;
  DateTime get timestamp;
  String get note;

  /// Create a copy of OrderStatusHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderStatusHistoryEntityCopyWith<OrderStatusHistoryEntity> get copyWith =>
      _$OrderStatusHistoryEntityCopyWithImpl<OrderStatusHistoryEntity>(
          this as OrderStatusHistoryEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderStatusHistoryEntity &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp, note);

  @override
  String toString() {
    return 'OrderStatusHistoryEntity(status: $status, timestamp: $timestamp, note: $note)';
  }
}

/// @nodoc
abstract mixin class $OrderStatusHistoryEntityCopyWith<$Res> {
  factory $OrderStatusHistoryEntityCopyWith(OrderStatusHistoryEntity value,
          $Res Function(OrderStatusHistoryEntity) _then) =
      _$OrderStatusHistoryEntityCopyWithImpl;
  @useResult
  $Res call({String status, DateTime timestamp, String note});
}

/// @nodoc
class _$OrderStatusHistoryEntityCopyWithImpl<$Res>
    implements $OrderStatusHistoryEntityCopyWith<$Res> {
  _$OrderStatusHistoryEntityCopyWithImpl(this._self, this._then);

  final OrderStatusHistoryEntity _self;
  final $Res Function(OrderStatusHistoryEntity) _then;

  /// Create a copy of OrderStatusHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderStatusHistoryEntity].
extension OrderStatusHistoryEntityPatterns on OrderStatusHistoryEntity {
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
    TResult Function(_OrderStatusHistoryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryEntity() when $default != null:
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
    TResult Function(_OrderStatusHistoryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryEntity():
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
    TResult? Function(_OrderStatusHistoryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryEntity() when $default != null:
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
    TResult Function(String status, DateTime timestamp, String note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryEntity() when $default != null:
        return $default(_that.status, _that.timestamp, _that.note);
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
    TResult Function(String status, DateTime timestamp, String note) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryEntity():
        return $default(_that.status, _that.timestamp, _that.note);
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
    TResult? Function(String status, DateTime timestamp, String note)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryEntity() when $default != null:
        return $default(_that.status, _that.timestamp, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderStatusHistoryEntity implements OrderStatusHistoryEntity {
  const _OrderStatusHistoryEntity(
      {required this.status, required this.timestamp, required this.note});

  @override
  final String status;
  @override
  final DateTime timestamp;
  @override
  final String note;

  /// Create a copy of OrderStatusHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderStatusHistoryEntityCopyWith<_OrderStatusHistoryEntity> get copyWith =>
      __$OrderStatusHistoryEntityCopyWithImpl<_OrderStatusHistoryEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderStatusHistoryEntity &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp, note);

  @override
  String toString() {
    return 'OrderStatusHistoryEntity(status: $status, timestamp: $timestamp, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$OrderStatusHistoryEntityCopyWith<$Res>
    implements $OrderStatusHistoryEntityCopyWith<$Res> {
  factory _$OrderStatusHistoryEntityCopyWith(_OrderStatusHistoryEntity value,
          $Res Function(_OrderStatusHistoryEntity) _then) =
      __$OrderStatusHistoryEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String status, DateTime timestamp, String note});
}

/// @nodoc
class __$OrderStatusHistoryEntityCopyWithImpl<$Res>
    implements _$OrderStatusHistoryEntityCopyWith<$Res> {
  __$OrderStatusHistoryEntityCopyWithImpl(this._self, this._then);

  final _OrderStatusHistoryEntity _self;
  final $Res Function(_OrderStatusHistoryEntity) _then;

  /// Create a copy of OrderStatusHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = null,
  }) {
    return _then(_OrderStatusHistoryEntity(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$OrderEntity {
  String get id;
  String get orderNumber;
  List<OrderItemEntity> get orderItems;
  AddressEntity? get shippingAddress;
  String get shippingMethod;
  double get subtotal;
  double get shippingFee;
  double get tax;
  double get totalAmount;
  String get currency;
  String get currencySymbol;
  double get taxableAmount;
  double get discount;
  TaxBreakdownEntity? get taxBreakdown;
  String? get customerGstin;
  String get status;
  PaymentEntity? get payment;
  String get carrier;
  String get trackingNumber;
  String get cancellationReason;
  bool get canCancel;
  List<OrderStatusHistoryEntity> get statusHistory;
  DateTime get createdAt;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderEntityCopyWith<OrderEntity> get copyWith =>
      _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            const DeepCollectionEquality()
                .equals(other.orderItems, orderItems) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxBreakdown, taxBreakdown) ||
                other.taxBreakdown == taxBreakdown) &&
            (identical(other.customerGstin, customerGstin) ||
                other.customerGstin == customerGstin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.carrier, carrier) || other.carrier == carrier) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.canCancel, canCancel) ||
                other.canCancel == canCancel) &&
            const DeepCollectionEquality()
                .equals(other.statusHistory, statusHistory) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderNumber,
        const DeepCollectionEquality().hash(orderItems),
        shippingAddress,
        shippingMethod,
        subtotal,
        shippingFee,
        tax,
        totalAmount,
        currency,
        currencySymbol,
        taxableAmount,
        discount,
        taxBreakdown,
        customerGstin,
        status,
        payment,
        carrier,
        trackingNumber,
        cancellationReason,
        canCancel,
        const DeepCollectionEquality().hash(statusHistory),
        createdAt
      ]);

  @override
  String toString() {
    return 'OrderEntity(id: $id, orderNumber: $orderNumber, orderItems: $orderItems, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, totalAmount: $totalAmount, currency: $currency, currencySymbol: $currencySymbol, taxableAmount: $taxableAmount, discount: $discount, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin, status: $status, payment: $payment, carrier: $carrier, trackingNumber: $trackingNumber, cancellationReason: $cancellationReason, canCancel: $canCancel, statusHistory: $statusHistory, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res> {
  factory $OrderEntityCopyWith(
          OrderEntity value, $Res Function(OrderEntity) _then) =
      _$OrderEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      List<OrderItemEntity> orderItems,
      AddressEntity? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double totalAmount,
      String currency,
      String currencySymbol,
      double taxableAmount,
      double discount,
      TaxBreakdownEntity? taxBreakdown,
      String? customerGstin,
      String status,
      PaymentEntity? payment,
      String carrier,
      String trackingNumber,
      String cancellationReason,
      bool canCancel,
      List<OrderStatusHistoryEntity> statusHistory,
      DateTime createdAt});

  $AddressEntityCopyWith<$Res>? get shippingAddress;
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown;
  $PaymentEntityCopyWith<$Res>? get payment;
}

/// @nodoc
class _$OrderEntityCopyWithImpl<$Res> implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? orderItems = null,
    Object? shippingAddress = freezed,
    Object? shippingMethod = null,
    Object? subtotal = null,
    Object? shippingFee = null,
    Object? tax = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? taxableAmount = null,
    Object? discount = null,
    Object? taxBreakdown = freezed,
    Object? customerGstin = freezed,
    Object? status = null,
    Object? payment = freezed,
    Object? carrier = null,
    Object? trackingNumber = null,
    Object? cancellationReason = null,
    Object? canCancel = null,
    Object? statusHistory = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _self.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItemEntity>,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity?,
      shippingMethod: null == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxBreakdown: freezed == taxBreakdown
          ? _self.taxBreakdown
          : taxBreakdown // ignore: cast_nullable_to_non_nullable
              as TaxBreakdownEntity?,
      customerGstin: freezed == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payment: freezed == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentEntity?,
      carrier: null == carrier
          ? _self.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as String,
      trackingNumber: null == trackingNumber
          ? _self.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationReason: null == cancellationReason
          ? _self.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: null == canCancel
          ? _self.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      statusHistory: null == statusHistory
          ? _self.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusHistoryEntity>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressEntityCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown {
    if (_self.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownEntityCopyWith<$Res>(_self.taxBreakdown!, (value) {
      return _then(_self.copyWith(taxBreakdown: value));
    });
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentEntityCopyWith<$Res>? get payment {
    if (_self.payment == null) {
      return null;
    }

    return $PaymentEntityCopyWith<$Res>(_self.payment!, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
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
    TResult Function(_OrderEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderEntity() when $default != null:
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
    TResult Function(_OrderEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderEntity():
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
    TResult? Function(_OrderEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderEntity() when $default != null:
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
            String orderNumber,
            List<OrderItemEntity> orderItems,
            AddressEntity? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double totalAmount,
            String currency,
            String currencySymbol,
            double taxableAmount,
            double discount,
            TaxBreakdownEntity? taxBreakdown,
            String? customerGstin,
            String status,
            PaymentEntity? payment,
            String carrier,
            String trackingNumber,
            String cancellationReason,
            bool canCancel,
            List<OrderStatusHistoryEntity> statusHistory,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderEntity() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.orderItems,
            _that.shippingAddress,
            _that.shippingMethod,
            _that.subtotal,
            _that.shippingFee,
            _that.tax,
            _that.totalAmount,
            _that.currency,
            _that.currencySymbol,
            _that.taxableAmount,
            _that.discount,
            _that.taxBreakdown,
            _that.customerGstin,
            _that.status,
            _that.payment,
            _that.carrier,
            _that.trackingNumber,
            _that.cancellationReason,
            _that.canCancel,
            _that.statusHistory,
            _that.createdAt);
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
            String orderNumber,
            List<OrderItemEntity> orderItems,
            AddressEntity? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double totalAmount,
            String currency,
            String currencySymbol,
            double taxableAmount,
            double discount,
            TaxBreakdownEntity? taxBreakdown,
            String? customerGstin,
            String status,
            PaymentEntity? payment,
            String carrier,
            String trackingNumber,
            String cancellationReason,
            bool canCancel,
            List<OrderStatusHistoryEntity> statusHistory,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderEntity():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.orderItems,
            _that.shippingAddress,
            _that.shippingMethod,
            _that.subtotal,
            _that.shippingFee,
            _that.tax,
            _that.totalAmount,
            _that.currency,
            _that.currencySymbol,
            _that.taxableAmount,
            _that.discount,
            _that.taxBreakdown,
            _that.customerGstin,
            _that.status,
            _that.payment,
            _that.carrier,
            _that.trackingNumber,
            _that.cancellationReason,
            _that.canCancel,
            _that.statusHistory,
            _that.createdAt);
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
            String orderNumber,
            List<OrderItemEntity> orderItems,
            AddressEntity? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double totalAmount,
            String currency,
            String currencySymbol,
            double taxableAmount,
            double discount,
            TaxBreakdownEntity? taxBreakdown,
            String? customerGstin,
            String status,
            PaymentEntity? payment,
            String carrier,
            String trackingNumber,
            String cancellationReason,
            bool canCancel,
            List<OrderStatusHistoryEntity> statusHistory,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderEntity() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.orderItems,
            _that.shippingAddress,
            _that.shippingMethod,
            _that.subtotal,
            _that.shippingFee,
            _that.tax,
            _that.totalAmount,
            _that.currency,
            _that.currencySymbol,
            _that.taxableAmount,
            _that.discount,
            _that.taxBreakdown,
            _that.customerGstin,
            _that.status,
            _that.payment,
            _that.carrier,
            _that.trackingNumber,
            _that.cancellationReason,
            _that.canCancel,
            _that.statusHistory,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderEntity extends OrderEntity {
  const _OrderEntity(
      {required this.id,
      required this.orderNumber,
      final List<OrderItemEntity> orderItems = const [],
      this.shippingAddress,
      this.shippingMethod = 'STANDARD',
      required this.subtotal,
      required this.shippingFee,
      required this.tax,
      required this.totalAmount,
      this.currency = 'INR',
      this.currencySymbol = '₹',
      this.taxableAmount = 0.0,
      this.discount = 0.0,
      this.taxBreakdown,
      this.customerGstin,
      required this.status,
      this.payment,
      this.carrier = '',
      this.trackingNumber = '',
      this.cancellationReason = '',
      this.canCancel = false,
      final List<OrderStatusHistoryEntity> statusHistory = const [],
      required this.createdAt})
      : _orderItems = orderItems,
        _statusHistory = statusHistory,
        super._();

  @override
  final String id;
  @override
  final String orderNumber;
  final List<OrderItemEntity> _orderItems;
  @override
  @JsonKey()
  List<OrderItemEntity> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  @override
  final AddressEntity? shippingAddress;
  @override
  @JsonKey()
  final String shippingMethod;
  @override
  final double subtotal;
  @override
  final double shippingFee;
  @override
  final double tax;
  @override
  final double totalAmount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String currencySymbol;
  @override
  @JsonKey()
  final double taxableAmount;
  @override
  @JsonKey()
  final double discount;
  @override
  final TaxBreakdownEntity? taxBreakdown;
  @override
  final String? customerGstin;
  @override
  final String status;
  @override
  final PaymentEntity? payment;
  @override
  @JsonKey()
  final String carrier;
  @override
  @JsonKey()
  final String trackingNumber;
  @override
  @JsonKey()
  final String cancellationReason;
  @override
  @JsonKey()
  final bool canCancel;
  final List<OrderStatusHistoryEntity> _statusHistory;
  @override
  @JsonKey()
  List<OrderStatusHistoryEntity> get statusHistory {
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusHistory);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderEntityCopyWith<_OrderEntity> get copyWith =>
      __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.taxBreakdown, taxBreakdown) ||
                other.taxBreakdown == taxBreakdown) &&
            (identical(other.customerGstin, customerGstin) ||
                other.customerGstin == customerGstin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.carrier, carrier) || other.carrier == carrier) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.canCancel, canCancel) ||
                other.canCancel == canCancel) &&
            const DeepCollectionEquality()
                .equals(other._statusHistory, _statusHistory) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderNumber,
        const DeepCollectionEquality().hash(_orderItems),
        shippingAddress,
        shippingMethod,
        subtotal,
        shippingFee,
        tax,
        totalAmount,
        currency,
        currencySymbol,
        taxableAmount,
        discount,
        taxBreakdown,
        customerGstin,
        status,
        payment,
        carrier,
        trackingNumber,
        cancellationReason,
        canCancel,
        const DeepCollectionEquality().hash(_statusHistory),
        createdAt
      ]);

  @override
  String toString() {
    return 'OrderEntity(id: $id, orderNumber: $orderNumber, orderItems: $orderItems, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, totalAmount: $totalAmount, currency: $currency, currencySymbol: $currencySymbol, taxableAmount: $taxableAmount, discount: $discount, taxBreakdown: $taxBreakdown, customerGstin: $customerGstin, status: $status, payment: $payment, carrier: $carrier, trackingNumber: $trackingNumber, cancellationReason: $cancellationReason, canCancel: $canCancel, statusHistory: $statusHistory, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res>
    implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(
          _OrderEntity value, $Res Function(_OrderEntity) _then) =
      __$OrderEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      List<OrderItemEntity> orderItems,
      AddressEntity? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double totalAmount,
      String currency,
      String currencySymbol,
      double taxableAmount,
      double discount,
      TaxBreakdownEntity? taxBreakdown,
      String? customerGstin,
      String status,
      PaymentEntity? payment,
      String carrier,
      String trackingNumber,
      String cancellationReason,
      bool canCancel,
      List<OrderStatusHistoryEntity> statusHistory,
      DateTime createdAt});

  @override
  $AddressEntityCopyWith<$Res>? get shippingAddress;
  @override
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown;
  @override
  $PaymentEntityCopyWith<$Res>? get payment;
}

/// @nodoc
class __$OrderEntityCopyWithImpl<$Res> implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? orderItems = null,
    Object? shippingAddress = freezed,
    Object? shippingMethod = null,
    Object? subtotal = null,
    Object? shippingFee = null,
    Object? tax = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? taxableAmount = null,
    Object? discount = null,
    Object? taxBreakdown = freezed,
    Object? customerGstin = freezed,
    Object? status = null,
    Object? payment = freezed,
    Object? carrier = null,
    Object? trackingNumber = null,
    Object? cancellationReason = null,
    Object? canCancel = null,
    Object? statusHistory = null,
    Object? createdAt = null,
  }) {
    return _then(_OrderEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _self._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItemEntity>,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity?,
      shippingMethod: null == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      taxableAmount: null == taxableAmount
          ? _self.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      taxBreakdown: freezed == taxBreakdown
          ? _self.taxBreakdown
          : taxBreakdown // ignore: cast_nullable_to_non_nullable
              as TaxBreakdownEntity?,
      customerGstin: freezed == customerGstin
          ? _self.customerGstin
          : customerGstin // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payment: freezed == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentEntity?,
      carrier: null == carrier
          ? _self.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as String,
      trackingNumber: null == trackingNumber
          ? _self.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationReason: null == cancellationReason
          ? _self.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: null == canCancel
          ? _self.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      statusHistory: null == statusHistory
          ? _self._statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusHistoryEntity>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressEntityCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxBreakdownEntityCopyWith<$Res>? get taxBreakdown {
    if (_self.taxBreakdown == null) {
      return null;
    }

    return $TaxBreakdownEntityCopyWith<$Res>(_self.taxBreakdown!, (value) {
      return _then(_self.copyWith(taxBreakdown: value));
    });
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentEntityCopyWith<$Res>? get payment {
    if (_self.payment == null) {
      return null;
    }

    return $PaymentEntityCopyWith<$Res>(_self.payment!, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }
}

// dart format on
