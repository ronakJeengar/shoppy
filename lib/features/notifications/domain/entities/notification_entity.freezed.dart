// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationEntity {
  String get id;
  String get type;
  String get title;
  String get body;
  String? get orderId;
  String? get orderNumber;
  bool get isRead;
  DateTime get createdAt;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationEntityCopyWith<NotificationEntity> get copyWith =>
      _$NotificationEntityCopyWithImpl<NotificationEntity>(
          this as NotificationEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, body, orderId,
      orderNumber, isRead, createdAt);

  @override
  String toString() {
    return 'NotificationEntity(id: $id, type: $type, title: $title, body: $body, orderId: $orderId, orderNumber: $orderNumber, isRead: $isRead, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $NotificationEntityCopyWith<$Res> {
  factory $NotificationEntityCopyWith(
          NotificationEntity value, $Res Function(NotificationEntity) _then) =
      _$NotificationEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String body,
      String? orderId,
      String? orderNumber,
      bool isRead,
      DateTime createdAt});
}

/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._self, this._then);

  final NotificationEntity _self;
  final $Res Function(NotificationEntity) _then;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? isRead = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationEntity].
extension NotificationEntityPatterns on NotificationEntity {
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
    TResult Function(_NotificationEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationEntity() when $default != null:
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
    TResult Function(_NotificationEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationEntity():
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
    TResult? Function(_NotificationEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationEntity() when $default != null:
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
            String type,
            String title,
            String body,
            String? orderId,
            String? orderNumber,
            bool isRead,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationEntity() when $default != null:
        return $default(_that.id, _that.type, _that.title, _that.body,
            _that.orderId, _that.orderNumber, _that.isRead, _that.createdAt);
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
            String type,
            String title,
            String body,
            String? orderId,
            String? orderNumber,
            bool isRead,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationEntity():
        return $default(_that.id, _that.type, _that.title, _that.body,
            _that.orderId, _that.orderNumber, _that.isRead, _that.createdAt);
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
            String type,
            String title,
            String body,
            String? orderId,
            String? orderNumber,
            bool isRead,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationEntity() when $default != null:
        return $default(_that.id, _that.type, _that.title, _that.body,
            _that.orderId, _that.orderNumber, _that.isRead, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationEntity implements NotificationEntity {
  const _NotificationEntity(
      {required this.id,
      required this.type,
      required this.title,
      required this.body,
      this.orderId,
      this.orderNumber,
      this.isRead = false,
      required this.createdAt});

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String body;
  @override
  final String? orderId;
  @override
  final String? orderNumber;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final DateTime createdAt;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationEntityCopyWith<_NotificationEntity> get copyWith =>
      __$NotificationEntityCopyWithImpl<_NotificationEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, body, orderId,
      orderNumber, isRead, createdAt);

  @override
  String toString() {
    return 'NotificationEntity(id: $id, type: $type, title: $title, body: $body, orderId: $orderId, orderNumber: $orderNumber, isRead: $isRead, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationEntityCopyWith<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  factory _$NotificationEntityCopyWith(
          _NotificationEntity value, $Res Function(_NotificationEntity) _then) =
      __$NotificationEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String body,
      String? orderId,
      String? orderNumber,
      bool isRead,
      DateTime createdAt});
}

/// @nodoc
class __$NotificationEntityCopyWithImpl<$Res>
    implements _$NotificationEntityCopyWith<$Res> {
  __$NotificationEntityCopyWithImpl(this._self, this._then);

  final _NotificationEntity _self;
  final $Res Function(_NotificationEntity) _then;

  /// Create a copy of NotificationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? orderId = freezed,
    Object? orderNumber = freezed,
    Object? isRead = null,
    Object? createdAt = null,
  }) {
    return _then(_NotificationEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _self.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$NotificationPaginatedEntity {
  List<NotificationEntity> get notifications;
  int get unreadCount;
  int get page;
  int get limit;
  int get totalNotifications;
  int get totalPages;
  bool get hasNextPage;

  /// Create a copy of NotificationPaginatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationPaginatedEntityCopyWith<NotificationPaginatedEntity>
      get copyWith => _$NotificationPaginatedEntityCopyWithImpl<
              NotificationPaginatedEntity>(
          this as NotificationPaginatedEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPaginatedEntity &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalNotifications, totalNotifications) ||
                other.totalNotifications == totalNotifications) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notifications),
      unreadCount,
      page,
      limit,
      totalNotifications,
      totalPages,
      hasNextPage);

  @override
  String toString() {
    return 'NotificationPaginatedEntity(notifications: $notifications, unreadCount: $unreadCount, page: $page, limit: $limit, totalNotifications: $totalNotifications, totalPages: $totalPages, hasNextPage: $hasNextPage)';
  }
}

/// @nodoc
abstract mixin class $NotificationPaginatedEntityCopyWith<$Res> {
  factory $NotificationPaginatedEntityCopyWith(
          NotificationPaginatedEntity value,
          $Res Function(NotificationPaginatedEntity) _then) =
      _$NotificationPaginatedEntityCopyWithImpl;
  @useResult
  $Res call(
      {List<NotificationEntity> notifications,
      int unreadCount,
      int page,
      int limit,
      int totalNotifications,
      int totalPages,
      bool hasNextPage});
}

/// @nodoc
class _$NotificationPaginatedEntityCopyWithImpl<$Res>
    implements $NotificationPaginatedEntityCopyWith<$Res> {
  _$NotificationPaginatedEntityCopyWithImpl(this._self, this._then);

  final NotificationPaginatedEntity _self;
  final $Res Function(NotificationPaginatedEntity) _then;

  /// Create a copy of NotificationPaginatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? page = null,
    Object? limit = null,
    Object? totalNotifications = null,
    Object? totalPages = null,
    Object? hasNextPage = null,
  }) {
    return _then(_self.copyWith(
      notifications: null == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationEntity>,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalNotifications: null == totalNotifications
          ? _self.totalNotifications
          : totalNotifications // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationPaginatedEntity].
extension NotificationPaginatedEntityPatterns on NotificationPaginatedEntity {
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
    TResult Function(_NotificationPaginatedEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationPaginatedEntity() when $default != null:
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
    TResult Function(_NotificationPaginatedEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPaginatedEntity():
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
    TResult? Function(_NotificationPaginatedEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPaginatedEntity() when $default != null:
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
            List<NotificationEntity> notifications,
            int unreadCount,
            int page,
            int limit,
            int totalNotifications,
            int totalPages,
            bool hasNextPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationPaginatedEntity() when $default != null:
        return $default(
            _that.notifications,
            _that.unreadCount,
            _that.page,
            _that.limit,
            _that.totalNotifications,
            _that.totalPages,
            _that.hasNextPage);
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
            List<NotificationEntity> notifications,
            int unreadCount,
            int page,
            int limit,
            int totalNotifications,
            int totalPages,
            bool hasNextPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPaginatedEntity():
        return $default(
            _that.notifications,
            _that.unreadCount,
            _that.page,
            _that.limit,
            _that.totalNotifications,
            _that.totalPages,
            _that.hasNextPage);
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
            List<NotificationEntity> notifications,
            int unreadCount,
            int page,
            int limit,
            int totalNotifications,
            int totalPages,
            bool hasNextPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPaginatedEntity() when $default != null:
        return $default(
            _that.notifications,
            _that.unreadCount,
            _that.page,
            _that.limit,
            _that.totalNotifications,
            _that.totalPages,
            _that.hasNextPage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationPaginatedEntity implements NotificationPaginatedEntity {
  const _NotificationPaginatedEntity(
      {final List<NotificationEntity> notifications = const [],
      this.unreadCount = 0,
      this.page = 1,
      this.limit = 20,
      this.totalNotifications = 0,
      this.totalPages = 1,
      this.hasNextPage = false})
      : _notifications = notifications;

  final List<NotificationEntity> _notifications;
  @override
  @JsonKey()
  List<NotificationEntity> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int totalNotifications;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final bool hasNextPage;

  /// Create a copy of NotificationPaginatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationPaginatedEntityCopyWith<_NotificationPaginatedEntity>
      get copyWith => __$NotificationPaginatedEntityCopyWithImpl<
          _NotificationPaginatedEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPaginatedEntity &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalNotifications, totalNotifications) ||
                other.totalNotifications == totalNotifications) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notifications),
      unreadCount,
      page,
      limit,
      totalNotifications,
      totalPages,
      hasNextPage);

  @override
  String toString() {
    return 'NotificationPaginatedEntity(notifications: $notifications, unreadCount: $unreadCount, page: $page, limit: $limit, totalNotifications: $totalNotifications, totalPages: $totalPages, hasNextPage: $hasNextPage)';
  }
}

/// @nodoc
abstract mixin class _$NotificationPaginatedEntityCopyWith<$Res>
    implements $NotificationPaginatedEntityCopyWith<$Res> {
  factory _$NotificationPaginatedEntityCopyWith(
          _NotificationPaginatedEntity value,
          $Res Function(_NotificationPaginatedEntity) _then) =
      __$NotificationPaginatedEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NotificationEntity> notifications,
      int unreadCount,
      int page,
      int limit,
      int totalNotifications,
      int totalPages,
      bool hasNextPage});
}

/// @nodoc
class __$NotificationPaginatedEntityCopyWithImpl<$Res>
    implements _$NotificationPaginatedEntityCopyWith<$Res> {
  __$NotificationPaginatedEntityCopyWithImpl(this._self, this._then);

  final _NotificationPaginatedEntity _self;
  final $Res Function(_NotificationPaginatedEntity) _then;

  /// Create a copy of NotificationPaginatedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? page = null,
    Object? limit = null,
    Object? totalNotifications = null,
    Object? totalPages = null,
    Object? hasNextPage = null,
  }) {
    return _then(_NotificationPaginatedEntity(
      notifications: null == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationEntity>,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalNotifications: null == totalNotifications
          ? _self.totalNotifications
          : totalNotifications // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
