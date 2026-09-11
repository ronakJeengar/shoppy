// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminRecentOrderModel {
  String get id;
  String get orderNumber;
  String get customerName;
  String get customerEmail;
  double get totalAmount;
  String get status;
  int get itemsCount;
  DateTime get createdAt;

  /// Create a copy of AdminRecentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminRecentOrderModelCopyWith<AdminRecentOrderModel> get copyWith =>
      _$AdminRecentOrderModelCopyWithImpl<AdminRecentOrderModel>(
          this as AdminRecentOrderModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminRecentOrderModel &&
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
    return 'AdminRecentOrderModel(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerEmail: $customerEmail, totalAmount: $totalAmount, status: $status, itemsCount: $itemsCount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AdminRecentOrderModelCopyWith<$Res> {
  factory $AdminRecentOrderModelCopyWith(AdminRecentOrderModel value,
          $Res Function(AdminRecentOrderModel) _then) =
      _$AdminRecentOrderModelCopyWithImpl;
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
class _$AdminRecentOrderModelCopyWithImpl<$Res>
    implements $AdminRecentOrderModelCopyWith<$Res> {
  _$AdminRecentOrderModelCopyWithImpl(this._self, this._then);

  final AdminRecentOrderModel _self;
  final $Res Function(AdminRecentOrderModel) _then;

  /// Create a copy of AdminRecentOrderModel
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

/// Adds pattern-matching-related methods to [AdminRecentOrderModel].
extension AdminRecentOrderModelPatterns on AdminRecentOrderModel {
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
    TResult Function(_AdminRecentOrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderModel() when $default != null:
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
    TResult Function(_AdminRecentOrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderModel():
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
    TResult? Function(_AdminRecentOrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminRecentOrderModel() when $default != null:
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
      case _AdminRecentOrderModel() when $default != null:
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
      case _AdminRecentOrderModel():
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
      case _AdminRecentOrderModel() when $default != null:
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

class _AdminRecentOrderModel implements AdminRecentOrderModel {
  const _AdminRecentOrderModel(
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

  /// Create a copy of AdminRecentOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminRecentOrderModelCopyWith<_AdminRecentOrderModel> get copyWith =>
      __$AdminRecentOrderModelCopyWithImpl<_AdminRecentOrderModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminRecentOrderModel &&
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
    return 'AdminRecentOrderModel(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerEmail: $customerEmail, totalAmount: $totalAmount, status: $status, itemsCount: $itemsCount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AdminRecentOrderModelCopyWith<$Res>
    implements $AdminRecentOrderModelCopyWith<$Res> {
  factory _$AdminRecentOrderModelCopyWith(_AdminRecentOrderModel value,
          $Res Function(_AdminRecentOrderModel) _then) =
      __$AdminRecentOrderModelCopyWithImpl;
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
class __$AdminRecentOrderModelCopyWithImpl<$Res>
    implements _$AdminRecentOrderModelCopyWith<$Res> {
  __$AdminRecentOrderModelCopyWithImpl(this._self, this._then);

  final _AdminRecentOrderModel _self;
  final $Res Function(_AdminRecentOrderModel) _then;

  /// Create a copy of AdminRecentOrderModel
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
    return _then(_AdminRecentOrderModel(
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
mixin _$AdminDashboardMetricsModel {
  int get totalUsers;
  int get totalProducts;
  int get totalOrders;
  double get totalRevenue;
  int get lowStockProducts;
  Map<String, int> get ordersByStatus;
  List<AdminRecentOrderModel> get recentOrders;

  /// Create a copy of AdminDashboardMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminDashboardMetricsModelCopyWith<AdminDashboardMetricsModel>
      get copyWith =>
          _$AdminDashboardMetricsModelCopyWithImpl<AdminDashboardMetricsModel>(
              this as AdminDashboardMetricsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminDashboardMetricsModel &&
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
    return 'AdminDashboardMetricsModel(totalUsers: $totalUsers, totalProducts: $totalProducts, totalOrders: $totalOrders, totalRevenue: $totalRevenue, lowStockProducts: $lowStockProducts, ordersByStatus: $ordersByStatus, recentOrders: $recentOrders)';
  }
}

/// @nodoc
abstract mixin class $AdminDashboardMetricsModelCopyWith<$Res> {
  factory $AdminDashboardMetricsModelCopyWith(AdminDashboardMetricsModel value,
          $Res Function(AdminDashboardMetricsModel) _then) =
      _$AdminDashboardMetricsModelCopyWithImpl;
  @useResult
  $Res call(
      {int totalUsers,
      int totalProducts,
      int totalOrders,
      double totalRevenue,
      int lowStockProducts,
      Map<String, int> ordersByStatus,
      List<AdminRecentOrderModel> recentOrders});
}

/// @nodoc
class _$AdminDashboardMetricsModelCopyWithImpl<$Res>
    implements $AdminDashboardMetricsModelCopyWith<$Res> {
  _$AdminDashboardMetricsModelCopyWithImpl(this._self, this._then);

  final AdminDashboardMetricsModel _self;
  final $Res Function(AdminDashboardMetricsModel) _then;

  /// Create a copy of AdminDashboardMetricsModel
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
              as List<AdminRecentOrderModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminDashboardMetricsModel].
extension AdminDashboardMetricsModelPatterns on AdminDashboardMetricsModel {
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
    TResult Function(_AdminDashboardMetricsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsModel() when $default != null:
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
    TResult Function(_AdminDashboardMetricsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsModel():
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
    TResult? Function(_AdminDashboardMetricsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsModel() when $default != null:
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
            List<AdminRecentOrderModel> recentOrders)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsModel() when $default != null:
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
            List<AdminRecentOrderModel> recentOrders)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsModel():
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
            List<AdminRecentOrderModel> recentOrders)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminDashboardMetricsModel() when $default != null:
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

class _AdminDashboardMetricsModel implements AdminDashboardMetricsModel {
  const _AdminDashboardMetricsModel(
      {required this.totalUsers,
      required this.totalProducts,
      required this.totalOrders,
      required this.totalRevenue,
      required this.lowStockProducts,
      final Map<String, int> ordersByStatus = const {},
      final List<AdminRecentOrderModel> recentOrders = const []})
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

  final List<AdminRecentOrderModel> _recentOrders;
  @override
  @JsonKey()
  List<AdminRecentOrderModel> get recentOrders {
    if (_recentOrders is EqualUnmodifiableListView) return _recentOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentOrders);
  }

  /// Create a copy of AdminDashboardMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminDashboardMetricsModelCopyWith<_AdminDashboardMetricsModel>
      get copyWith => __$AdminDashboardMetricsModelCopyWithImpl<
          _AdminDashboardMetricsModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminDashboardMetricsModel &&
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
    return 'AdminDashboardMetricsModel(totalUsers: $totalUsers, totalProducts: $totalProducts, totalOrders: $totalOrders, totalRevenue: $totalRevenue, lowStockProducts: $lowStockProducts, ordersByStatus: $ordersByStatus, recentOrders: $recentOrders)';
  }
}

/// @nodoc
abstract mixin class _$AdminDashboardMetricsModelCopyWith<$Res>
    implements $AdminDashboardMetricsModelCopyWith<$Res> {
  factory _$AdminDashboardMetricsModelCopyWith(
          _AdminDashboardMetricsModel value,
          $Res Function(_AdminDashboardMetricsModel) _then) =
      __$AdminDashboardMetricsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalUsers,
      int totalProducts,
      int totalOrders,
      double totalRevenue,
      int lowStockProducts,
      Map<String, int> ordersByStatus,
      List<AdminRecentOrderModel> recentOrders});
}

/// @nodoc
class __$AdminDashboardMetricsModelCopyWithImpl<$Res>
    implements _$AdminDashboardMetricsModelCopyWith<$Res> {
  __$AdminDashboardMetricsModelCopyWithImpl(this._self, this._then);

  final _AdminDashboardMetricsModel _self;
  final $Res Function(_AdminDashboardMetricsModel) _then;

  /// Create a copy of AdminDashboardMetricsModel
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
    return _then(_AdminDashboardMetricsModel(
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
              as List<AdminRecentOrderModel>,
    ));
  }
}

// dart format on
