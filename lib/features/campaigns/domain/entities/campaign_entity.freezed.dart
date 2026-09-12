// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampaignCtaActionEntity {
  String get type;
  String get value;

  /// Create a copy of CampaignCtaActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CampaignCtaActionEntityCopyWith<CampaignCtaActionEntity> get copyWith =>
      _$CampaignCtaActionEntityCopyWithImpl<CampaignCtaActionEntity>(
          this as CampaignCtaActionEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CampaignCtaActionEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @override
  String toString() {
    return 'CampaignCtaActionEntity(type: $type, value: $value)';
  }
}

/// @nodoc
abstract mixin class $CampaignCtaActionEntityCopyWith<$Res> {
  factory $CampaignCtaActionEntityCopyWith(CampaignCtaActionEntity value,
          $Res Function(CampaignCtaActionEntity) _then) =
      _$CampaignCtaActionEntityCopyWithImpl;
  @useResult
  $Res call({String type, String value});
}

/// @nodoc
class _$CampaignCtaActionEntityCopyWithImpl<$Res>
    implements $CampaignCtaActionEntityCopyWith<$Res> {
  _$CampaignCtaActionEntityCopyWithImpl(this._self, this._then);

  final CampaignCtaActionEntity _self;
  final $Res Function(CampaignCtaActionEntity) _then;

  /// Create a copy of CampaignCtaActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CampaignCtaActionEntity].
extension CampaignCtaActionEntityPatterns on CampaignCtaActionEntity {
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
    TResult Function(_CampaignCtaActionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampaignCtaActionEntity() when $default != null:
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
    TResult Function(_CampaignCtaActionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignCtaActionEntity():
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
    TResult? Function(_CampaignCtaActionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignCtaActionEntity() when $default != null:
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
    TResult Function(String type, String value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampaignCtaActionEntity() when $default != null:
        return $default(_that.type, _that.value);
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
    TResult Function(String type, String value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignCtaActionEntity():
        return $default(_that.type, _that.value);
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
    TResult? Function(String type, String value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignCtaActionEntity() when $default != null:
        return $default(_that.type, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CampaignCtaActionEntity implements CampaignCtaActionEntity {
  const _CampaignCtaActionEntity({this.type = 'HOME', this.value = ''});

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String value;

  /// Create a copy of CampaignCtaActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CampaignCtaActionEntityCopyWith<_CampaignCtaActionEntity> get copyWith =>
      __$CampaignCtaActionEntityCopyWithImpl<_CampaignCtaActionEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CampaignCtaActionEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @override
  String toString() {
    return 'CampaignCtaActionEntity(type: $type, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$CampaignCtaActionEntityCopyWith<$Res>
    implements $CampaignCtaActionEntityCopyWith<$Res> {
  factory _$CampaignCtaActionEntityCopyWith(_CampaignCtaActionEntity value,
          $Res Function(_CampaignCtaActionEntity) _then) =
      __$CampaignCtaActionEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String value});
}

/// @nodoc
class __$CampaignCtaActionEntityCopyWithImpl<$Res>
    implements _$CampaignCtaActionEntityCopyWith<$Res> {
  __$CampaignCtaActionEntityCopyWithImpl(this._self, this._then);

  final _CampaignCtaActionEntity _self;
  final $Res Function(_CampaignCtaActionEntity) _then;

  /// Create a copy of CampaignCtaActionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_CampaignCtaActionEntity(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CampaignEntity {
  String get id;
  String get title;
  String get subtitle;
  String get description;
  String get bannerImage;
  String get mobileImage;
  String get desktopImage;
  String get campaignType;
  DateTime? get startAt;
  DateTime? get endAt;
  bool get isActive;
  int get priority;
  int get displayOrder;
  String get targetType;
  String get targetId;
  String get ctaLabel;
  CampaignCtaActionEntity? get ctaAction;
  String? get couponCode;
  Map<String, dynamic> get metadata;

  /// Create a copy of CampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CampaignEntityCopyWith<CampaignEntity> get copyWith =>
      _$CampaignEntityCopyWithImpl<CampaignEntity>(
          this as CampaignEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CampaignEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            (identical(other.desktopImage, desktopImage) ||
                other.desktopImage == desktopImage) &&
            (identical(other.campaignType, campaignType) ||
                other.campaignType == campaignType) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.ctaLabel, ctaLabel) ||
                other.ctaLabel == ctaLabel) &&
            (identical(other.ctaAction, ctaAction) ||
                other.ctaAction == ctaAction) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        subtitle,
        description,
        bannerImage,
        mobileImage,
        desktopImage,
        campaignType,
        startAt,
        endAt,
        isActive,
        priority,
        displayOrder,
        targetType,
        targetId,
        ctaLabel,
        ctaAction,
        couponCode,
        const DeepCollectionEquality().hash(metadata)
      ]);

  @override
  String toString() {
    return 'CampaignEntity(id: $id, title: $title, subtitle: $subtitle, description: $description, bannerImage: $bannerImage, mobileImage: $mobileImage, desktopImage: $desktopImage, campaignType: $campaignType, startAt: $startAt, endAt: $endAt, isActive: $isActive, priority: $priority, displayOrder: $displayOrder, targetType: $targetType, targetId: $targetId, ctaLabel: $ctaLabel, ctaAction: $ctaAction, couponCode: $couponCode, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $CampaignEntityCopyWith<$Res> {
  factory $CampaignEntityCopyWith(
          CampaignEntity value, $Res Function(CampaignEntity) _then) =
      _$CampaignEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      String description,
      String bannerImage,
      String mobileImage,
      String desktopImage,
      String campaignType,
      DateTime? startAt,
      DateTime? endAt,
      bool isActive,
      int priority,
      int displayOrder,
      String targetType,
      String targetId,
      String ctaLabel,
      CampaignCtaActionEntity? ctaAction,
      String? couponCode,
      Map<String, dynamic> metadata});

  $CampaignCtaActionEntityCopyWith<$Res>? get ctaAction;
}

/// @nodoc
class _$CampaignEntityCopyWithImpl<$Res>
    implements $CampaignEntityCopyWith<$Res> {
  _$CampaignEntityCopyWithImpl(this._self, this._then);

  final CampaignEntity _self;
  final $Res Function(CampaignEntity) _then;

  /// Create a copy of CampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? bannerImage = null,
    Object? mobileImage = null,
    Object? desktopImage = null,
    Object? campaignType = null,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? isActive = null,
    Object? priority = null,
    Object? displayOrder = null,
    Object? targetType = null,
    Object? targetId = null,
    Object? ctaLabel = null,
    Object? ctaAction = freezed,
    Object? couponCode = freezed,
    Object? metadata = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImage: null == bannerImage
          ? _self.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _self.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImage: null == desktopImage
          ? _self.desktopImage
          : desktopImage // ignore: cast_nullable_to_non_nullable
              as String,
      campaignType: null == campaignType
          ? _self.campaignType
          : campaignType // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: freezed == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _self.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      targetType: null == targetType
          ? _self.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLabel: null == ctaLabel
          ? _self.ctaLabel
          : ctaLabel // ignore: cast_nullable_to_non_nullable
              as String,
      ctaAction: freezed == ctaAction
          ? _self.ctaAction
          : ctaAction // ignore: cast_nullable_to_non_nullable
              as CampaignCtaActionEntity?,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of CampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CampaignCtaActionEntityCopyWith<$Res>? get ctaAction {
    if (_self.ctaAction == null) {
      return null;
    }

    return $CampaignCtaActionEntityCopyWith<$Res>(_self.ctaAction!, (value) {
      return _then(_self.copyWith(ctaAction: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CampaignEntity].
extension CampaignEntityPatterns on CampaignEntity {
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
    TResult Function(_CampaignEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampaignEntity() when $default != null:
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
    TResult Function(_CampaignEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignEntity():
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
    TResult? Function(_CampaignEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignEntity() when $default != null:
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
            String title,
            String subtitle,
            String description,
            String bannerImage,
            String mobileImage,
            String desktopImage,
            String campaignType,
            DateTime? startAt,
            DateTime? endAt,
            bool isActive,
            int priority,
            int displayOrder,
            String targetType,
            String targetId,
            String ctaLabel,
            CampaignCtaActionEntity? ctaAction,
            String? couponCode,
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampaignEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.subtitle,
            _that.description,
            _that.bannerImage,
            _that.mobileImage,
            _that.desktopImage,
            _that.campaignType,
            _that.startAt,
            _that.endAt,
            _that.isActive,
            _that.priority,
            _that.displayOrder,
            _that.targetType,
            _that.targetId,
            _that.ctaLabel,
            _that.ctaAction,
            _that.couponCode,
            _that.metadata);
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
            String title,
            String subtitle,
            String description,
            String bannerImage,
            String mobileImage,
            String desktopImage,
            String campaignType,
            DateTime? startAt,
            DateTime? endAt,
            bool isActive,
            int priority,
            int displayOrder,
            String targetType,
            String targetId,
            String ctaLabel,
            CampaignCtaActionEntity? ctaAction,
            String? couponCode,
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignEntity():
        return $default(
            _that.id,
            _that.title,
            _that.subtitle,
            _that.description,
            _that.bannerImage,
            _that.mobileImage,
            _that.desktopImage,
            _that.campaignType,
            _that.startAt,
            _that.endAt,
            _that.isActive,
            _that.priority,
            _that.displayOrder,
            _that.targetType,
            _that.targetId,
            _that.ctaLabel,
            _that.ctaAction,
            _that.couponCode,
            _that.metadata);
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
            String title,
            String subtitle,
            String description,
            String bannerImage,
            String mobileImage,
            String desktopImage,
            String campaignType,
            DateTime? startAt,
            DateTime? endAt,
            bool isActive,
            int priority,
            int displayOrder,
            String targetType,
            String targetId,
            String ctaLabel,
            CampaignCtaActionEntity? ctaAction,
            String? couponCode,
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampaignEntity() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.subtitle,
            _that.description,
            _that.bannerImage,
            _that.mobileImage,
            _that.desktopImage,
            _that.campaignType,
            _that.startAt,
            _that.endAt,
            _that.isActive,
            _that.priority,
            _that.displayOrder,
            _that.targetType,
            _that.targetId,
            _that.ctaLabel,
            _that.ctaAction,
            _that.couponCode,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CampaignEntity implements CampaignEntity {
  const _CampaignEntity(
      {required this.id,
      required this.title,
      this.subtitle = '',
      this.description = '',
      required this.bannerImage,
      this.mobileImage = '',
      this.desktopImage = '',
      this.campaignType = 'GENERAL',
      this.startAt,
      this.endAt,
      this.isActive = true,
      this.priority = 0,
      this.displayOrder = 0,
      this.targetType = 'HOME',
      this.targetId = '',
      this.ctaLabel = 'Shop Now',
      this.ctaAction,
      this.couponCode,
      final Map<String, dynamic> metadata = const <String, dynamic>{}})
      : _metadata = metadata;

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String subtitle;
  @override
  @JsonKey()
  final String description;
  @override
  final String bannerImage;
  @override
  @JsonKey()
  final String mobileImage;
  @override
  @JsonKey()
  final String desktopImage;
  @override
  @JsonKey()
  final String campaignType;
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int priority;
  @override
  @JsonKey()
  final int displayOrder;
  @override
  @JsonKey()
  final String targetType;
  @override
  @JsonKey()
  final String targetId;
  @override
  @JsonKey()
  final String ctaLabel;
  @override
  final CampaignCtaActionEntity? ctaAction;
  @override
  final String? couponCode;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  /// Create a copy of CampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CampaignEntityCopyWith<_CampaignEntity> get copyWith =>
      __$CampaignEntityCopyWithImpl<_CampaignEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CampaignEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            (identical(other.desktopImage, desktopImage) ||
                other.desktopImage == desktopImage) &&
            (identical(other.campaignType, campaignType) ||
                other.campaignType == campaignType) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.ctaLabel, ctaLabel) ||
                other.ctaLabel == ctaLabel) &&
            (identical(other.ctaAction, ctaAction) ||
                other.ctaAction == ctaAction) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        subtitle,
        description,
        bannerImage,
        mobileImage,
        desktopImage,
        campaignType,
        startAt,
        endAt,
        isActive,
        priority,
        displayOrder,
        targetType,
        targetId,
        ctaLabel,
        ctaAction,
        couponCode,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @override
  String toString() {
    return 'CampaignEntity(id: $id, title: $title, subtitle: $subtitle, description: $description, bannerImage: $bannerImage, mobileImage: $mobileImage, desktopImage: $desktopImage, campaignType: $campaignType, startAt: $startAt, endAt: $endAt, isActive: $isActive, priority: $priority, displayOrder: $displayOrder, targetType: $targetType, targetId: $targetId, ctaLabel: $ctaLabel, ctaAction: $ctaAction, couponCode: $couponCode, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$CampaignEntityCopyWith<$Res>
    implements $CampaignEntityCopyWith<$Res> {
  factory _$CampaignEntityCopyWith(
          _CampaignEntity value, $Res Function(_CampaignEntity) _then) =
      __$CampaignEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      String description,
      String bannerImage,
      String mobileImage,
      String desktopImage,
      String campaignType,
      DateTime? startAt,
      DateTime? endAt,
      bool isActive,
      int priority,
      int displayOrder,
      String targetType,
      String targetId,
      String ctaLabel,
      CampaignCtaActionEntity? ctaAction,
      String? couponCode,
      Map<String, dynamic> metadata});

  @override
  $CampaignCtaActionEntityCopyWith<$Res>? get ctaAction;
}

/// @nodoc
class __$CampaignEntityCopyWithImpl<$Res>
    implements _$CampaignEntityCopyWith<$Res> {
  __$CampaignEntityCopyWithImpl(this._self, this._then);

  final _CampaignEntity _self;
  final $Res Function(_CampaignEntity) _then;

  /// Create a copy of CampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? bannerImage = null,
    Object? mobileImage = null,
    Object? desktopImage = null,
    Object? campaignType = null,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? isActive = null,
    Object? priority = null,
    Object? displayOrder = null,
    Object? targetType = null,
    Object? targetId = null,
    Object? ctaLabel = null,
    Object? ctaAction = freezed,
    Object? couponCode = freezed,
    Object? metadata = null,
  }) {
    return _then(_CampaignEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImage: null == bannerImage
          ? _self.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _self.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImage: null == desktopImage
          ? _self.desktopImage
          : desktopImage // ignore: cast_nullable_to_non_nullable
              as String,
      campaignType: null == campaignType
          ? _self.campaignType
          : campaignType // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: freezed == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _self.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      targetType: null == targetType
          ? _self.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLabel: null == ctaLabel
          ? _self.ctaLabel
          : ctaLabel // ignore: cast_nullable_to_non_nullable
              as String,
      ctaAction: freezed == ctaAction
          ? _self.ctaAction
          : ctaAction // ignore: cast_nullable_to_non_nullable
              as CampaignCtaActionEntity?,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of CampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CampaignCtaActionEntityCopyWith<$Res>? get ctaAction {
    if (_self.ctaAction == null) {
      return null;
    }

    return $CampaignCtaActionEntityCopyWith<$Res>(_self.ctaAction!, (value) {
      return _then(_self.copyWith(ctaAction: value));
    });
  }
}

// dart format on
