// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserEntity {
  String get id;
  String get fullName;
  String get email;
  String get username;
  String get phone;
  String get role;
  bool get isActive;
  DateTime get createdAt;

  /// Create a copy of AdminUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminUserEntityCopyWith<AdminUserEntity> get copyWith =>
      _$AdminUserEntityCopyWithImpl<AdminUserEntity>(
          this as AdminUserEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminUserEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, username,
      phone, role, isActive, createdAt);

  @override
  String toString() {
    return 'AdminUserEntity(id: $id, fullName: $fullName, email: $email, username: $username, phone: $phone, role: $role, isActive: $isActive, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AdminUserEntityCopyWith<$Res> {
  factory $AdminUserEntityCopyWith(
          AdminUserEntity value, $Res Function(AdminUserEntity) _then) =
      _$AdminUserEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String fullName,
      String email,
      String username,
      String phone,
      String role,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class _$AdminUserEntityCopyWithImpl<$Res>
    implements $AdminUserEntityCopyWith<$Res> {
  _$AdminUserEntityCopyWithImpl(this._self, this._then);

  final AdminUserEntity _self;
  final $Res Function(AdminUserEntity) _then;

  /// Create a copy of AdminUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? username = null,
    Object? phone = null,
    Object? role = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminUserEntity].
extension AdminUserEntityPatterns on AdminUserEntity {
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
    TResult Function(_AdminUserEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminUserEntity() when $default != null:
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
    TResult Function(_AdminUserEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserEntity():
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
    TResult? Function(_AdminUserEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserEntity() when $default != null:
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
    TResult Function(String id, String fullName, String email, String username,
            String phone, String role, bool isActive, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminUserEntity() when $default != null:
        return $default(_that.id, _that.fullName, _that.email, _that.username,
            _that.phone, _that.role, _that.isActive, _that.createdAt);
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
    TResult Function(String id, String fullName, String email, String username,
            String phone, String role, bool isActive, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserEntity():
        return $default(_that.id, _that.fullName, _that.email, _that.username,
            _that.phone, _that.role, _that.isActive, _that.createdAt);
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
    TResult? Function(String id, String fullName, String email, String username,
            String phone, String role, bool isActive, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserEntity() when $default != null:
        return $default(_that.id, _that.fullName, _that.email, _that.username,
            _that.phone, _that.role, _that.isActive, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminUserEntity implements AdminUserEntity {
  const _AdminUserEntity(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.username,
      this.phone = '',
      required this.role,
      this.isActive = true,
      required this.createdAt});

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String username;
  @override
  @JsonKey()
  final String phone;
  @override
  final String role;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime createdAt;

  /// Create a copy of AdminUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminUserEntityCopyWith<_AdminUserEntity> get copyWith =>
      __$AdminUserEntityCopyWithImpl<_AdminUserEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminUserEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, username,
      phone, role, isActive, createdAt);

  @override
  String toString() {
    return 'AdminUserEntity(id: $id, fullName: $fullName, email: $email, username: $username, phone: $phone, role: $role, isActive: $isActive, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AdminUserEntityCopyWith<$Res>
    implements $AdminUserEntityCopyWith<$Res> {
  factory _$AdminUserEntityCopyWith(
          _AdminUserEntity value, $Res Function(_AdminUserEntity) _then) =
      __$AdminUserEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String email,
      String username,
      String phone,
      String role,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class __$AdminUserEntityCopyWithImpl<$Res>
    implements _$AdminUserEntityCopyWith<$Res> {
  __$AdminUserEntityCopyWithImpl(this._self, this._then);

  final _AdminUserEntity _self;
  final $Res Function(_AdminUserEntity) _then;

  /// Create a copy of AdminUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? username = null,
    Object? phone = null,
    Object? role = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_AdminUserEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
