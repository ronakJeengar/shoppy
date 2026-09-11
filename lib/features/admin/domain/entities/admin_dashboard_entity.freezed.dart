// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminRecentOrderEntity {
  String get id;
  String get orderNumber;
  String get customerName;
  String get customerEmail;
  double get totalAmount;
  String get status;
  int get itemsCount;
  DateTime get createdAt;

  /// Create a copy of AdminRecentOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminRecentOrderEntityCopyWith<AdminRecentOrderEntity> get copyWith =>
      _$AdminRecentOrderEntityCopyWithImpl<AdminRecentOrderEntity>(
          this as AdminRecentOrderEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminRecentOrderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, orderNumber, customerName,
      customerEmail, totalAmount, status, itemsCount, createdAt);

  @override
  String toString() {
    return 'AdminRecentOrderEntity(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerEmail: $customerEmail, totalAmount: $totalAmount, status: $status, itemsCount: $itemsCount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AdminRecentOrderEntityCopyWith<$Res> {
  factory $AdminRecentOrderEntityCopyWith(AdminRecentOrderEntity value,
          $Res Function(AdminRecentOrderEntity) _then) =
      _$AdminRecentOrderEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerName,
      String customerEmail,
      double totalAmount,
      String status,
      int itemsCount,
      DateTime createdAt});
}

/// @nodoc
class _$AdminRecentOrderEntityCopyWithImpl<$Res>
    implements $AdminRecentOrderEntityCopyWith<$Res> {
  _$AdminRecentOrderEntityCopyWithImpl(this._self, this._then);

  final AdminRecentOrderEntity _self;
  final $Res Function(AdminRecentOrderEntity) _then;

  /// Create a copy of AdminRecentOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerName = null,
    Object? customerEmail = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? itemsCount = null,
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
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerEmail: null == customerEmail
          ? _self.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      itemsCount: null == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminRecentOrderEntity].
extension AdminRecentOrderEntityPatterns on AdminRecentOrderEntity {
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
    TResult Function(_AdminRecentOrderEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderEntity() when $default != null:
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
    TResult Function(_AdminRecentOrderEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderEntity():
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
    TResult? Function(_AdminRecentOrderEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderEntity() when $default != null:
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
            String customerName,
            String customerEmail,
            double totalAmount,
            String status,
            int itemsCount,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderEntity() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerName,
            _that.customerEmail,
            _that.totalAmount,
            _that.status,
            _that.itemsCount,
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
            String customerName,
            String customerEmail,
            double totalAmount,
            String status,
            int itemsCount,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderEntity():
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerName,
            _that.customerEmail,
            _that.totalAmount,
            _that.status,
            _that.itemsCount,
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
            String customerName,
            String customerEmail,
            double totalAmount,
            String status,
            int itemsCount,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderEntity() when $default != null:
        return $default(
            _that.id,
            _that.orderNumber,
            _that.customerName,
            _that.customerEmail,
            _that.totalAmount,
            _that.status,
            _that.itemsCount,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminRecentOrderEntity implements AdminRecentOrderEntity {
  const _AdminRecentOrderEntity(
      {required this.id,
      required this.orderNumber,
      required this.customerName,
      required this.customerEmail,
      required this.totalAmount,
      required this.status,
      required this.itemsCount,
      required this.createdAt});

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String customerName;
  @override
  final String customerEmail;
  @override
  final double totalAmount;
  @override
  final String status;
  @override
  final int itemsCount;
  @override
  final DateTime createdAt;

  /// Create a copy of AdminRecentOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminRecentOrderEntityCopyWith<_AdminRecentOrderEntity> get copyWith =>
      __$AdminRecentOrderEntityCopyWithImpl<_AdminRecentOrderEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminRecentOrderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, orderNumber, customerName,
      customerEmail, totalAmount, status, itemsCount, createdAt);

  @override
  String toString() {
    return 'AdminRecentOrderEntity(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerEmail: $customerEmail, totalAmount: $totalAmount, status: $status, itemsCount: $itemsCount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AdminRecentOrderEntityCopyWith<$Res>
    implements $AdminRecentOrderEntityCopyWith<$Res> {
  factory _$AdminRecentOrderEntityCopyWith(_AdminRecentOrderEntity value,
          $Res Function(_AdminRecentOrderEntity) _then) =
      __$AdminRecentOrderEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String customerName,
      String customerEmail,
      double totalAmount,
      String status,
      int itemsCount,
      DateTime createdAt});
}

/// @nodoc
class __$AdminRecentOrderEntityCopyWithImpl<$Res>
    implements _$AdminRecentOrderEntityCopyWith<$Res> {
  __$AdminRecentOrderEntityCopyWithImpl(this._self, this._then);

  final _AdminRecentOrderEntity _self;
  final $Res Function(_AdminRecentOrderEntity) _then;

  /// Create a copy of AdminRecentOrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerName = null,
    Object? customerEmail = null,
    Object? totalAmount = null,
    Object? status = null,
    Object? itemsCount = null,
    Object? createdAt = null,
  }) {
    return _then(_AdminRecentOrderEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerEmail: null == customerEmail
          ? _self.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      itemsCount: null == itemsCount
          ? _self.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$AdminDashboardMetricsEntity {
  int get totalUsers;
  int get totalProducts;
  int get totalOrders;
  double get totalRevenue;
  int get lowStockProducts;
  Map<String, int> get ordersByStatus;
  List<AdminRecentOrderEntity> get recentOrders;

  /// Create a copy of AdminDashboardMetricsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminDashboardMetricsEntityCopyWith<AdminDashboardMetricsEntity>
      get copyWith => _$AdminDashboardMetricsEntityCopyWithImpl<
              AdminDashboardMetricsEntity>(
          this as AdminDashboardMetricsEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminDashboardMetricsEntity &&
            (identical(other.totalUsers, totalUsers) ||
                other.totalUsers == totalUsers) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.lowStockProducts, lowStockProducts) ||
                other.lowStockProducts == lowStockProducts) &&
            const DeepCollectionEquality()
                .equals(other.ordersByStatus, ordersByStatus) &&
            const DeepCollectionEquality()
                .equals(other.recentOrders, recentOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalUsers,
      totalProducts,
      totalOrders,
      totalRevenue,
      lowStockProducts,
      const DeepCollectionEquality().hash(ordersByStatus),
      const DeepCollectionEquality().hash(recentOrders));

  @override
  String toString() {
    return 'AdminDashboardMetricsEntity(totalUsers: $totalUsers, totalProducts: $totalProducts, totalOrders: $totalOrders, totalRevenue: $totalRevenue, lowStockProducts: $lowStockProducts, ordersByStatus: $ordersByStatus, recentOrders: $recentOrders)';
  }
}

/// @nodoc
abstract mixin class $AdminDashboardMetricsEntityCopyWith<$Res> {
  factory $AdminDashboardMetricsEntityCopyWith(
          AdminDashboardMetricsEntity value,
          $Res Function(AdminDashboardMetricsEntity) _then) =
      _$AdminDashboardMetricsEntityCopyWithImpl;
  @useResult
  $Res call(
      {int totalUsers,
      int totalProducts,
      int totalOrders,
      double totalRevenue,
      int lowStockProducts,
      Map<String, int> ordersByStatus,
      List<AdminRecentOrderEntity> recentOrders});
}

/// @nodoc
class _$AdminDashboardMetricsEntityCopyWithImpl<$Res>
    implements $AdminDashboardMetricsEntityCopyWith<$Res> {
  _$AdminDashboardMetricsEntityCopyWithImpl(this._self, this._then);

  final AdminDashboardMetricsEntity _self;
  final $Res Function(AdminDashboardMetricsEntity) _then;

  /// Create a copy of AdminDashboardMetricsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsers = null,
    Object? totalProducts = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? lowStockProducts = null,
    Object? ordersByStatus = null,
    Object? recentOrders = null,
  }) {
    return _then(_self.copyWith(
      totalUsers: null == totalUsers
          ? _self.totalUsers
          : totalUsers // ignore: cast_nullable_to_non_nullable
              as int,
      totalProducts: null == totalProducts
          ? _self.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _self.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockProducts: null == lowStockProducts
          ? _self.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as int,
      ordersByStatus: null == ordersByStatus
          ? _self.ordersByStatus
          : ordersByStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      recentOrders: null == recentOrders
          ? _self.recentOrders
          : recentOrders // ignore: cast_nullable_to_non_nullable
              as List<AdminRecentOrderEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminDashboardMetricsEntity].
extension AdminDashboardMetricsEntityPatterns on AdminDashboardMetricsEntity {
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
    TResult Function(_AdminDashboardMetricsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsEntity() when $default != null:
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
    TResult Function(_AdminDashboardMetricsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsEntity():
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
    TResult? Function(_AdminDashboardMetricsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsEntity() when $default != null:
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
            int totalUsers,
            int totalProducts,
            int totalOrders,
            double totalRevenue,
            int lowStockProducts,
            Map<String, int> ordersByStatus,
            List<AdminRecentOrderEntity> recentOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsEntity() when $default != null:
        return $default(
            _that.totalUsers,
            _that.totalProducts,
            _that.totalOrders,
            _that.totalRevenue,
            _that.lowStockProducts,
            _that.ordersByStatus,
            _that.recentOrders);
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
            int totalUsers,
            int totalProducts,
            int totalOrders,
            double totalRevenue,
            int lowStockProducts,
            Map<String, int> ordersByStatus,
            List<AdminRecentOrderEntity> recentOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsEntity():
        return $default(
            _that.totalUsers,
            _that.totalProducts,
            _that.totalOrders,
            _that.totalRevenue,
            _that.lowStockProducts,
            _that.ordersByStatus,
            _that.recentOrders);
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
            int totalUsers,
            int totalProducts,
            int totalOrders,
            double totalRevenue,
            int lowStockProducts,
            Map<String, int> ordersByStatus,
            List<AdminRecentOrderEntity> recentOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsEntity() when $default != null:
        return $default(
            _that.totalUsers,
            _that.totalProducts,
            _that.totalOrders,
            _that.totalRevenue,
            _that.lowStockProducts,
            _that.ordersByStatus,
            _that.recentOrders);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminDashboardMetricsEntity implements AdminDashboardMetricsEntity {
  const _AdminDashboardMetricsEntity(
      {required this.totalUsers,
      required this.totalProducts,
      required this.totalOrders,
      required this.totalRevenue,
      required this.lowStockProducts,
      final Map<String, int> ordersByStatus = const {},
      final List<AdminRecentOrderEntity> recentOrders = const []})
      : _ordersByStatus = ordersByStatus,
        _recentOrders = recentOrders;

  @override
  final int totalUsers;
  @override
  final int totalProducts;
  @override
  final int totalOrders;
  @override
  final double totalRevenue;
  @override
  final int lowStockProducts;
  final Map<String, int> _ordersByStatus;
  @override
  @JsonKey()
  Map<String, int> get ordersByStatus {
    if (_ordersByStatus is EqualUnmodifiableMapView) return _ordersByStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ordersByStatus);
  }

  final List<AdminRecentOrderEntity> _recentOrders;
  @override
  @JsonKey()
  List<AdminRecentOrderEntity> get recentOrders {
    if (_recentOrders is EqualUnmodifiableListView) return _recentOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentOrders);
  }

  /// Create a copy of AdminDashboardMetricsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminDashboardMetricsEntityCopyWith<_AdminDashboardMetricsEntity>
      get copyWith => __$AdminDashboardMetricsEntityCopyWithImpl<
          _AdminDashboardMetricsEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminDashboardMetricsEntity &&
            (identical(other.totalUsers, totalUsers) ||
                other.totalUsers == totalUsers) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.lowStockProducts, lowStockProducts) ||
                other.lowStockProducts == lowStockProducts) &&
            const DeepCollectionEquality()
                .equals(other._ordersByStatus, _ordersByStatus) &&
            const DeepCollectionEquality()
                .equals(other._recentOrders, _recentOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalUsers,
      totalProducts,
      totalOrders,
      totalRevenue,
      lowStockProducts,
      const DeepCollectionEquality().hash(_ordersByStatus),
      const DeepCollectionEquality().hash(_recentOrders));

  @override
  String toString() {
    return 'AdminDashboardMetricsEntity(totalUsers: $totalUsers, totalProducts: $totalProducts, totalOrders: $totalOrders, totalRevenue: $totalRevenue, lowStockProducts: $lowStockProducts, ordersByStatus: $ordersByStatus, recentOrders: $recentOrders)';
  }
}

/// @nodoc
abstract mixin class _$AdminDashboardMetricsEntityCopyWith<$Res>
    implements $AdminDashboardMetricsEntityCopyWith<$Res> {
  factory _$AdminDashboardMetricsEntityCopyWith(
          _AdminDashboardMetricsEntity value,
          $Res Function(_AdminDashboardMetricsEntity) _then) =
      __$AdminDashboardMetricsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalUsers,
      int totalProducts,
      int totalOrders,
      double totalRevenue,
      int lowStockProducts,
      Map<String, int> ordersByStatus,
      List<AdminRecentOrderEntity> recentOrders});
}

/// @nodoc
class __$AdminDashboardMetricsEntityCopyWithImpl<$Res>
    implements _$AdminDashboardMetricsEntityCopyWith<$Res> {
  __$AdminDashboardMetricsEntityCopyWithImpl(this._self, this._then);

  final _AdminDashboardMetricsEntity _self;
  final $Res Function(_AdminDashboardMetricsEntity) _then;

  /// Create a copy of AdminDashboardMetricsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalUsers = null,
    Object? totalProducts = null,
    Object? totalOrders = null,
    Object? totalRevenue = null,
    Object? lowStockProducts = null,
    Object? ordersByStatus = null,
    Object? recentOrders = null,
  }) {
    return _then(_AdminDashboardMetricsEntity(
      totalUsers: null == totalUsers
          ? _self.totalUsers
          : totalUsers // ignore: cast_nullable_to_non_nullable
              as int,
      totalProducts: null == totalProducts
          ? _self.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrders: null == totalOrders
          ? _self.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _self.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockProducts: null == lowStockProducts
          ? _self.lowStockProducts
          : lowStockProducts // ignore: cast_nullable_to_non_nullable
              as int,
      ordersByStatus: null == ordersByStatus
          ? _self._ordersByStatus
          : ordersByStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      recentOrders: null == recentOrders
          ? _self._recentOrders
          : recentOrders // ignore: cast_nullable_to_non_nullable
              as List<AdminRecentOrderEntity>,
    ));
  }
}

// dart format on
