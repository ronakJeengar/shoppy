// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {
  String get productId;
  String get productName;
  String get productImage;
  String get sellerName;
  double get unitPrice;
  int get quantity;
  double get lineTotal;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      _$OrderItemModelCopyWithImpl<OrderItemModel>(
          this as OrderItemModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderItemModel &&
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
                other.lineTotal == lineTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      productImage, sellerName, unitPrice, quantity, lineTotal);

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) _then) =
      _$OrderItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String sellerName,
      double unitPrice,
      int quantity,
      double lineTotal});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

  /// Create a copy of OrderItemModel
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
    ));
  }
}

/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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
    TResult Function(_OrderItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
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
    TResult Function(_OrderItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel():
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
    TResult? Function(_OrderItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
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
            double lineTotal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(_that.productId, _that.productName, _that.productImage,
            _that.sellerName, _that.unitPrice, _that.quantity, _that.lineTotal);
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
    TResult Function(String productId, String productName, String productImage,
            String sellerName, double unitPrice, int quantity, double lineTotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel():
        return $default(_that.productId, _that.productName, _that.productImage,
            _that.sellerName, _that.unitPrice, _that.quantity, _that.lineTotal);
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
            double lineTotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemModel() when $default != null:
        return $default(_that.productId, _that.productName, _that.productImage,
            _that.sellerName, _that.unitPrice, _that.quantity, _that.lineTotal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.sellerName,
      required this.unitPrice,
      required this.quantity,
      required this.lineTotal});

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

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderItemModelCopyWith<_OrderItemModel> get copyWith =>
      __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItemModel &&
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
                other.lineTotal == lineTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      productImage, sellerName, unitPrice, quantity, lineTotal);

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productName: $productName, productImage: $productImage, sellerName: $sellerName, unitPrice: $unitPrice, quantity: $quantity, lineTotal: $lineTotal)';
  }
}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(
          _OrderItemModel value, $Res Function(_OrderItemModel) _then) =
      __$OrderItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      String productImage,
      String sellerName,
      double unitPrice,
      int quantity,
      double lineTotal});
}

/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

  /// Create a copy of OrderItemModel
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
  }) {
    return _then(_OrderItemModel(
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
    ));
  }
}

/// @nodoc
mixin _$OrderStatusHistoryItem {
  String get status;
  DateTime get timestamp;
  String get note;

  /// Create a copy of OrderStatusHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderStatusHistoryItemCopyWith<OrderStatusHistoryItem> get copyWith =>
      _$OrderStatusHistoryItemCopyWithImpl<OrderStatusHistoryItem>(
          this as OrderStatusHistoryItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderStatusHistoryItem &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp, note);

  @override
  String toString() {
    return 'OrderStatusHistoryItem(status: $status, timestamp: $timestamp, note: $note)';
  }
}

/// @nodoc
abstract mixin class $OrderStatusHistoryItemCopyWith<$Res> {
  factory $OrderStatusHistoryItemCopyWith(OrderStatusHistoryItem value,
          $Res Function(OrderStatusHistoryItem) _then) =
      _$OrderStatusHistoryItemCopyWithImpl;
  @useResult
  $Res call({String status, DateTime timestamp, String note});
}

/// @nodoc
class _$OrderStatusHistoryItemCopyWithImpl<$Res>
    implements $OrderStatusHistoryItemCopyWith<$Res> {
  _$OrderStatusHistoryItemCopyWithImpl(this._self, this._then);

  final OrderStatusHistoryItem _self;
  final $Res Function(OrderStatusHistoryItem) _then;

  /// Create a copy of OrderStatusHistoryItem
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

/// Adds pattern-matching-related methods to [OrderStatusHistoryItem].
extension OrderStatusHistoryItemPatterns on OrderStatusHistoryItem {
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
    TResult Function(_OrderStatusHistoryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryItem() when $default != null:
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
    TResult Function(_OrderStatusHistoryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryItem():
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
    TResult? Function(_OrderStatusHistoryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusHistoryItem() when $default != null:
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
      case _OrderStatusHistoryItem() when $default != null:
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
      case _OrderStatusHistoryItem():
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
      case _OrderStatusHistoryItem() when $default != null:
        return $default(_that.status, _that.timestamp, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrderStatusHistoryItem implements OrderStatusHistoryItem {
  const _OrderStatusHistoryItem(
      {required this.status, required this.timestamp, required this.note});

  @override
  final String status;
  @override
  final DateTime timestamp;
  @override
  final String note;

  /// Create a copy of OrderStatusHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderStatusHistoryItemCopyWith<_OrderStatusHistoryItem> get copyWith =>
      __$OrderStatusHistoryItemCopyWithImpl<_OrderStatusHistoryItem>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderStatusHistoryItem &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp, note);

  @override
  String toString() {
    return 'OrderStatusHistoryItem(status: $status, timestamp: $timestamp, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$OrderStatusHistoryItemCopyWith<$Res>
    implements $OrderStatusHistoryItemCopyWith<$Res> {
  factory _$OrderStatusHistoryItemCopyWith(_OrderStatusHistoryItem value,
          $Res Function(_OrderStatusHistoryItem) _then) =
      __$OrderStatusHistoryItemCopyWithImpl;
  @override
  @useResult
  $Res call({String status, DateTime timestamp, String note});
}

/// @nodoc
class __$OrderStatusHistoryItemCopyWithImpl<$Res>
    implements _$OrderStatusHistoryItemCopyWith<$Res> {
  __$OrderStatusHistoryItemCopyWithImpl(this._self, this._then);

  final _OrderStatusHistoryItem _self;
  final $Res Function(_OrderStatusHistoryItem) _then;

  /// Create a copy of OrderStatusHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = null,
  }) {
    return _then(_OrderStatusHistoryItem(
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
mixin _$OrderModel {
  String get id;
  String get orderNumber;
  List<OrderItemModel> get orderItems;
  AddressModel? get shippingAddress;
  String get shippingMethod;
  double get subtotal;
  double get shippingFee;
  double get tax;
  double get totalAmount;
  String get currency;
  String get status;
  PaymentModel? get payment;
  String get carrier;
  String get trackingNumber;
  String get cancellationReason;
  bool get canCancel;
  List<OrderStatusHistoryItem> get statusHistory;
  DateTime get createdAt;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<OrderModel> get copyWith =>
      _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderModel &&
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
  int get hashCode => Object.hash(
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
      status,
      payment,
      carrier,
      trackingNumber,
      cancellationReason,
      canCancel,
      const DeepCollectionEquality().hash(statusHistory),
      createdAt);

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, orderItems: $orderItems, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, totalAmount: $totalAmount, currency: $currency, status: $status, payment: $payment, carrier: $carrier, trackingNumber: $trackingNumber, cancellationReason: $cancellationReason, canCancel: $canCancel, statusHistory: $statusHistory, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) _then) =
      _$OrderModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      List<OrderItemModel> orderItems,
      AddressModel? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double totalAmount,
      String currency,
      String status,
      PaymentModel? payment,
      String carrier,
      String trackingNumber,
      String cancellationReason,
      bool canCancel,
      List<OrderStatusHistoryItem> statusHistory,
      DateTime createdAt});

  $AddressModelCopyWith<$Res>? get shippingAddress;
  $PaymentModelCopyWith<$Res>? get payment;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

  /// Create a copy of OrderModel
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
              as List<OrderItemModel>,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payment: freezed == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
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
              as List<OrderStatusHistoryItem>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_self.payment!, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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
    TResult Function(_OrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
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
    TResult Function(_OrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
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
    TResult? Function(_OrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
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
            List<OrderItemModel> orderItems,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double totalAmount,
            String currency,
            String status,
            PaymentModel? payment,
            String carrier,
            String trackingNumber,
            String cancellationReason,
            bool canCancel,
            List<OrderStatusHistoryItem> statusHistory,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
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
            List<OrderItemModel> orderItems,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double totalAmount,
            String currency,
            String status,
            PaymentModel? payment,
            String carrier,
            String trackingNumber,
            String cancellationReason,
            bool canCancel,
            List<OrderStatusHistoryItem> statusHistory,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
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
            List<OrderItemModel> orderItems,
            AddressModel? shippingAddress,
            String shippingMethod,
            double subtotal,
            double shippingFee,
            double tax,
            double totalAmount,
            String currency,
            String status,
            PaymentModel? payment,
            String carrier,
            String trackingNumber,
            String cancellationReason,
            bool canCancel,
            List<OrderStatusHistoryItem> statusHistory,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
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

class _OrderModel extends OrderModel {
  const _OrderModel(
      {required this.id,
      required this.orderNumber,
      final List<OrderItemModel> orderItems = const [],
      this.shippingAddress,
      this.shippingMethod = 'STANDARD',
      required this.subtotal,
      required this.shippingFee,
      required this.tax,
      required this.totalAmount,
      this.currency = 'USD',
      required this.status,
      this.payment,
      this.carrier = '',
      this.trackingNumber = '',
      this.cancellationReason = '',
      this.canCancel = false,
      final List<OrderStatusHistoryItem> statusHistory = const [],
      required this.createdAt})
      : _orderItems = orderItems,
        _statusHistory = statusHistory,
        super._();

  @override
  final String id;
  @override
  final String orderNumber;
  final List<OrderItemModel> _orderItems;
  @override
  @JsonKey()
  List<OrderItemModel> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  @override
  final AddressModel? shippingAddress;
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
  final String status;
  @override
  final PaymentModel? payment;
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
  final List<OrderStatusHistoryItem> _statusHistory;
  @override
  @JsonKey()
  List<OrderStatusHistoryItem> get statusHistory {
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusHistory);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
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
  int get hashCode => Object.hash(
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
      status,
      payment,
      carrier,
      trackingNumber,
      cancellationReason,
      canCancel,
      const DeepCollectionEquality().hash(_statusHistory),
      createdAt);

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, orderItems: $orderItems, shippingAddress: $shippingAddress, shippingMethod: $shippingMethod, subtotal: $subtotal, shippingFee: $shippingFee, tax: $tax, totalAmount: $totalAmount, currency: $currency, status: $status, payment: $payment, carrier: $carrier, trackingNumber: $trackingNumber, cancellationReason: $cancellationReason, canCancel: $canCancel, statusHistory: $statusHistory, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) _then) =
      __$OrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      List<OrderItemModel> orderItems,
      AddressModel? shippingAddress,
      String shippingMethod,
      double subtotal,
      double shippingFee,
      double tax,
      double totalAmount,
      String currency,
      String status,
      PaymentModel? payment,
      String carrier,
      String trackingNumber,
      String cancellationReason,
      bool canCancel,
      List<OrderStatusHistoryItem> statusHistory,
      DateTime createdAt});

  @override
  $AddressModelCopyWith<$Res>? get shippingAddress;
  @override
  $PaymentModelCopyWith<$Res>? get payment;
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

  /// Create a copy of OrderModel
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
    Object? status = null,
    Object? payment = freezed,
    Object? carrier = null,
    Object? trackingNumber = null,
    Object? cancellationReason = null,
    Object? canCancel = null,
    Object? statusHistory = null,
    Object? createdAt = null,
  }) {
    return _then(_OrderModel(
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
              as List<OrderItemModel>,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payment: freezed == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
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
              as List<OrderStatusHistoryItem>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_self.shippingAddress!, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_self.payment!, (value) {
      return _then(_self.copyWith(payment: value));
    });
  }
}

// dart format on
