// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLogModel {
  String get id;
  String get action;
  String get adminEmail;
  String get resourceType;
  String get resourceId;
  Map<String, dynamic> get details;
  DateTime get createdAt;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuditLogModelCopyWith<AuditLogModel> get copyWith =>
      _$AuditLogModelCopyWithImpl<AuditLogModel>(
          this as AuditLogModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuditLogModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.adminEmail, adminEmail) ||
                other.adminEmail == adminEmail) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      action,
      adminEmail,
      resourceType,
      resourceId,
      const DeepCollectionEquality().hash(details),
      createdAt);

  @override
  String toString() {
    return 'AuditLogModel(id: $id, action: $action, adminEmail: $adminEmail, resourceType: $resourceType, resourceId: $resourceId, details: $details, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AuditLogModelCopyWith<$Res> {
  factory $AuditLogModelCopyWith(
          AuditLogModel value, $Res Function(AuditLogModel) _then) =
      _$AuditLogModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String action,
      String adminEmail,
      String resourceType,
      String resourceId,
      Map<String, dynamic> details,
      DateTime createdAt});
}

/// @nodoc
class _$AuditLogModelCopyWithImpl<$Res>
    implements $AuditLogModelCopyWith<$Res> {
  _$AuditLogModelCopyWithImpl(this._self, this._then);

  final AuditLogModel _self;
  final $Res Function(AuditLogModel) _then;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? adminEmail = null,
    Object? resourceType = null,
    Object? resourceId = null,
    Object? details = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      adminEmail: null == adminEmail
          ? _self.adminEmail
          : adminEmail // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _self.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _self.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [AuditLogModel].
extension AuditLogModelPatterns on AuditLogModel {
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
    TResult Function(_AuditLogModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditLogModel() when $default != null:
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
    TResult Function(_AuditLogModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLogModel():
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
    TResult? Function(_AuditLogModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLogModel() when $default != null:
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
            String action,
            String adminEmail,
            String resourceType,
            String resourceId,
            Map<String, dynamic> details,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditLogModel() when $default != null:
        return $default(
            _that.id,
            _that.action,
            _that.adminEmail,
            _that.resourceType,
            _that.resourceId,
            _that.details,
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
            String action,
            String adminEmail,
            String resourceType,
            String resourceId,
            Map<String, dynamic> details,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLogModel():
        return $default(
            _that.id,
            _that.action,
            _that.adminEmail,
            _that.resourceType,
            _that.resourceId,
            _that.details,
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
            String action,
            String adminEmail,
            String resourceType,
            String resourceId,
            Map<String, dynamic> details,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLogModel() when $default != null:
        return $default(
            _that.id,
            _that.action,
            _that.adminEmail,
            _that.resourceType,
            _that.resourceId,
            _that.details,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuditLogModel implements AuditLogModel {
  const _AuditLogModel(
      {required this.id,
      required this.action,
      required this.adminEmail,
      required this.resourceType,
      required this.resourceId,
      final Map<String, dynamic> details = const {},
      required this.createdAt})
      : _details = details;

  @override
  final String id;
  @override
  final String action;
  @override
  final String adminEmail;
  @override
  final String resourceType;
  @override
  final String resourceId;
  final Map<String, dynamic> _details;
  @override
  @JsonKey()
  Map<String, dynamic> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuditLogModelCopyWith<_AuditLogModel> get copyWith =>
      __$AuditLogModelCopyWithImpl<_AuditLogModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuditLogModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.adminEmail, adminEmail) ||
                other.adminEmail == adminEmail) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      action,
      adminEmail,
      resourceType,
      resourceId,
      const DeepCollectionEquality().hash(_details),
      createdAt);

  @override
  String toString() {
    return 'AuditLogModel(id: $id, action: $action, adminEmail: $adminEmail, resourceType: $resourceType, resourceId: $resourceId, details: $details, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AuditLogModelCopyWith<$Res>
    implements $AuditLogModelCopyWith<$Res> {
  factory _$AuditLogModelCopyWith(
          _AuditLogModel value, $Res Function(_AuditLogModel) _then) =
      __$AuditLogModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String action,
      String adminEmail,
      String resourceType,
      String resourceId,
      Map<String, dynamic> details,
      DateTime createdAt});
}

/// @nodoc
class __$AuditLogModelCopyWithImpl<$Res>
    implements _$AuditLogModelCopyWith<$Res> {
  __$AuditLogModelCopyWithImpl(this._self, this._then);

  final _AuditLogModel _self;
  final $Res Function(_AuditLogModel) _then;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? adminEmail = null,
    Object? resourceType = null,
    Object? resourceId = null,
    Object? details = null,
    Object? createdAt = null,
  }) {
    return _then(_AuditLogModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      adminEmail: null == adminEmail
          ? _self.adminEmail
          : adminEmail // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _self.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _self.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
