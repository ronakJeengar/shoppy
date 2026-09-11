// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewEntity {
  String get id;
  int get rating;
  String get title;
  String get comment;
  bool get verifiedPurchase;
  String get authorName;
  bool get isOwner;
  DateTime get createdAt;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewEntityCopyWith<ReviewEntity> get copyWith =>
      _$ReviewEntityCopyWithImpl<ReviewEntity>(
          this as ReviewEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, rating, title, comment,
      verifiedPurchase, authorName, isOwner, createdAt);

  @override
  String toString() {
    return 'ReviewEntity(id: $id, rating: $rating, title: $title, comment: $comment, verifiedPurchase: $verifiedPurchase, authorName: $authorName, isOwner: $isOwner, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewEntityCopyWith<$Res> {
  factory $ReviewEntityCopyWith(
          ReviewEntity value, $Res Function(ReviewEntity) _then) =
      _$ReviewEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int rating,
      String title,
      String comment,
      bool verifiedPurchase,
      String authorName,
      bool isOwner,
      DateTime createdAt});
}

/// @nodoc
class _$ReviewEntityCopyWithImpl<$Res> implements $ReviewEntityCopyWith<$Res> {
  _$ReviewEntityCopyWithImpl(this._self, this._then);

  final ReviewEntity _self;
  final $Res Function(ReviewEntity) _then;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? title = null,
    Object? comment = null,
    Object? verifiedPurchase = null,
    Object? authorName = null,
    Object? isOwner = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      authorName: null == authorName
          ? _self.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      isOwner: null == isOwner
          ? _self.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewEntity].
extension ReviewEntityPatterns on ReviewEntity {
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
    TResult Function(_ReviewEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
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
    TResult Function(_ReviewEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity():
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
    TResult? Function(_ReviewEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
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
            int rating,
            String title,
            String comment,
            bool verifiedPurchase,
            String authorName,
            bool isOwner,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
        return $default(
            _that.id,
            _that.rating,
            _that.title,
            _that.comment,
            _that.verifiedPurchase,
            _that.authorName,
            _that.isOwner,
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
            int rating,
            String title,
            String comment,
            bool verifiedPurchase,
            String authorName,
            bool isOwner,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity():
        return $default(
            _that.id,
            _that.rating,
            _that.title,
            _that.comment,
            _that.verifiedPurchase,
            _that.authorName,
            _that.isOwner,
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
            int rating,
            String title,
            String comment,
            bool verifiedPurchase,
            String authorName,
            bool isOwner,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
        return $default(
            _that.id,
            _that.rating,
            _that.title,
            _that.comment,
            _that.verifiedPurchase,
            _that.authorName,
            _that.isOwner,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReviewEntity extends ReviewEntity {
  const _ReviewEntity(
      {required this.id,
      required this.rating,
      this.title = '',
      required this.comment,
      this.verifiedPurchase = true,
      this.authorName = 'Customer',
      this.isOwner = false,
      required this.createdAt})
      : super._();

  @override
  final String id;
  @override
  final int rating;
  @override
  @JsonKey()
  final String title;
  @override
  final String comment;
  @override
  @JsonKey()
  final bool verifiedPurchase;
  @override
  @JsonKey()
  final String authorName;
  @override
  @JsonKey()
  final bool isOwner;
  @override
  final DateTime createdAt;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewEntityCopyWith<_ReviewEntity> get copyWith =>
      __$ReviewEntityCopyWithImpl<_ReviewEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, rating, title, comment,
      verifiedPurchase, authorName, isOwner, createdAt);

  @override
  String toString() {
    return 'ReviewEntity(id: $id, rating: $rating, title: $title, comment: $comment, verifiedPurchase: $verifiedPurchase, authorName: $authorName, isOwner: $isOwner, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ReviewEntityCopyWith<$Res>
    implements $ReviewEntityCopyWith<$Res> {
  factory _$ReviewEntityCopyWith(
          _ReviewEntity value, $Res Function(_ReviewEntity) _then) =
      __$ReviewEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int rating,
      String title,
      String comment,
      bool verifiedPurchase,
      String authorName,
      bool isOwner,
      DateTime createdAt});
}

/// @nodoc
class __$ReviewEntityCopyWithImpl<$Res>
    implements _$ReviewEntityCopyWith<$Res> {
  __$ReviewEntityCopyWithImpl(this._self, this._then);

  final _ReviewEntity _self;
  final $Res Function(_ReviewEntity) _then;

  /// Create a copy of ReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? title = null,
    Object? comment = null,
    Object? verifiedPurchase = null,
    Object? authorName = null,
    Object? isOwner = null,
    Object? createdAt = null,
  }) {
    return _then(_ReviewEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      authorName: null == authorName
          ? _self.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      isOwner: null == isOwner
          ? _self.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$ReviewSummaryEntity {
  double get averageRating;
  int get totalReviews;
  Map<int, int> get ratingDistribution;

  /// Create a copy of ReviewSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewSummaryEntityCopyWith<ReviewSummaryEntity> get copyWith =>
      _$ReviewSummaryEntityCopyWithImpl<ReviewSummaryEntity>(
          this as ReviewSummaryEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewSummaryEntity &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            const DeepCollectionEquality()
                .equals(other.ratingDistribution, ratingDistribution));
  }

  @override
  int get hashCode => Object.hash(runtimeType, averageRating, totalReviews,
      const DeepCollectionEquality().hash(ratingDistribution));

  @override
  String toString() {
    return 'ReviewSummaryEntity(averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution)';
  }
}

/// @nodoc
abstract mixin class $ReviewSummaryEntityCopyWith<$Res> {
  factory $ReviewSummaryEntityCopyWith(
          ReviewSummaryEntity value, $Res Function(ReviewSummaryEntity) _then) =
      _$ReviewSummaryEntityCopyWithImpl;
  @useResult
  $Res call(
      {double averageRating,
      int totalReviews,
      Map<int, int> ratingDistribution});
}

/// @nodoc
class _$ReviewSummaryEntityCopyWithImpl<$Res>
    implements $ReviewSummaryEntityCopyWith<$Res> {
  _$ReviewSummaryEntityCopyWithImpl(this._self, this._then);

  final ReviewSummaryEntity _self;
  final $Res Function(ReviewSummaryEntity) _then;

  /// Create a copy of ReviewSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = null,
    Object? totalReviews = null,
    Object? ratingDistribution = null,
  }) {
    return _then(_self.copyWith(
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _self.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      ratingDistribution: null == ratingDistribution
          ? _self.ratingDistribution
          : ratingDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewSummaryEntity].
extension ReviewSummaryEntityPatterns on ReviewSummaryEntity {
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
    TResult Function(_ReviewSummaryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryEntity() when $default != null:
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
    TResult Function(_ReviewSummaryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryEntity():
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
    TResult? Function(_ReviewSummaryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryEntity() when $default != null:
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
    TResult Function(double averageRating, int totalReviews,
            Map<int, int> ratingDistribution)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryEntity() when $default != null:
        return $default(
            _that.averageRating, _that.totalReviews, _that.ratingDistribution);
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
    TResult Function(double averageRating, int totalReviews,
            Map<int, int> ratingDistribution)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryEntity():
        return $default(
            _that.averageRating, _that.totalReviews, _that.ratingDistribution);
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
    TResult? Function(double averageRating, int totalReviews,
            Map<int, int> ratingDistribution)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryEntity() when $default != null:
        return $default(
            _that.averageRating, _that.totalReviews, _that.ratingDistribution);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReviewSummaryEntity implements ReviewSummaryEntity {
  const _ReviewSummaryEntity(
      {this.averageRating = 0.0,
      this.totalReviews = 0,
      final Map<int, int> ratingDistribution = const {
        1: 0,
        2: 0,
        3: 0,
        4: 0,
        5: 0
      }})
      : _ratingDistribution = ratingDistribution;

  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey()
  final int totalReviews;
  final Map<int, int> _ratingDistribution;
  @override
  @JsonKey()
  Map<int, int> get ratingDistribution {
    if (_ratingDistribution is EqualUnmodifiableMapView)
      return _ratingDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ratingDistribution);
  }

  /// Create a copy of ReviewSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewSummaryEntityCopyWith<_ReviewSummaryEntity> get copyWith =>
      __$ReviewSummaryEntityCopyWithImpl<_ReviewSummaryEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewSummaryEntity &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            const DeepCollectionEquality()
                .equals(other._ratingDistribution, _ratingDistribution));
  }

  @override
  int get hashCode => Object.hash(runtimeType, averageRating, totalReviews,
      const DeepCollectionEquality().hash(_ratingDistribution));

  @override
  String toString() {
    return 'ReviewSummaryEntity(averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution)';
  }
}

/// @nodoc
abstract mixin class _$ReviewSummaryEntityCopyWith<$Res>
    implements $ReviewSummaryEntityCopyWith<$Res> {
  factory _$ReviewSummaryEntityCopyWith(_ReviewSummaryEntity value,
          $Res Function(_ReviewSummaryEntity) _then) =
      __$ReviewSummaryEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double averageRating,
      int totalReviews,
      Map<int, int> ratingDistribution});
}

/// @nodoc
class __$ReviewSummaryEntityCopyWithImpl<$Res>
    implements _$ReviewSummaryEntityCopyWith<$Res> {
  __$ReviewSummaryEntityCopyWithImpl(this._self, this._then);

  final _ReviewSummaryEntity _self;
  final $Res Function(_ReviewSummaryEntity) _then;

  /// Create a copy of ReviewSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? averageRating = null,
    Object? totalReviews = null,
    Object? ratingDistribution = null,
  }) {
    return _then(_ReviewSummaryEntity(
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _self.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      ratingDistribution: null == ratingDistribution
          ? _self._ratingDistribution
          : ratingDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc
mixin _$ReviewEligibilityEntity {
  bool get canReview;
  bool get hasReviewed;
  bool get isVerifiedPurchase;
  String? get reason;
  String? get existingReviewId;
  int? get existingRating;
  String? get existingComment;

  /// Create a copy of ReviewEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewEligibilityEntityCopyWith<ReviewEligibilityEntity> get copyWith =>
      _$ReviewEligibilityEntityCopyWithImpl<ReviewEligibilityEntity>(
          this as ReviewEligibilityEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewEligibilityEntity &&
            (identical(other.canReview, canReview) ||
                other.canReview == canReview) &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.isVerifiedPurchase, isVerifiedPurchase) ||
                other.isVerifiedPurchase == isVerifiedPurchase) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.existingReviewId, existingReviewId) ||
                other.existingReviewId == existingReviewId) &&
            (identical(other.existingRating, existingRating) ||
                other.existingRating == existingRating) &&
            (identical(other.existingComment, existingComment) ||
                other.existingComment == existingComment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      canReview,
      hasReviewed,
      isVerifiedPurchase,
      reason,
      existingReviewId,
      existingRating,
      existingComment);

  @override
  String toString() {
    return 'ReviewEligibilityEntity(canReview: $canReview, hasReviewed: $hasReviewed, isVerifiedPurchase: $isVerifiedPurchase, reason: $reason, existingReviewId: $existingReviewId, existingRating: $existingRating, existingComment: $existingComment)';
  }
}

/// @nodoc
abstract mixin class $ReviewEligibilityEntityCopyWith<$Res> {
  factory $ReviewEligibilityEntityCopyWith(ReviewEligibilityEntity value,
          $Res Function(ReviewEligibilityEntity) _then) =
      _$ReviewEligibilityEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool canReview,
      bool hasReviewed,
      bool isVerifiedPurchase,
      String? reason,
      String? existingReviewId,
      int? existingRating,
      String? existingComment});
}

/// @nodoc
class _$ReviewEligibilityEntityCopyWithImpl<$Res>
    implements $ReviewEligibilityEntityCopyWith<$Res> {
  _$ReviewEligibilityEntityCopyWithImpl(this._self, this._then);

  final ReviewEligibilityEntity _self;
  final $Res Function(ReviewEligibilityEntity) _then;

  /// Create a copy of ReviewEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canReview = null,
    Object? hasReviewed = null,
    Object? isVerifiedPurchase = null,
    Object? reason = freezed,
    Object? existingReviewId = freezed,
    Object? existingRating = freezed,
    Object? existingComment = freezed,
  }) {
    return _then(_self.copyWith(
      canReview: null == canReview
          ? _self.canReview
          : canReview // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReviewed: null == hasReviewed
          ? _self.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifiedPurchase: null == isVerifiedPurchase
          ? _self.isVerifiedPurchase
          : isVerifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      existingReviewId: freezed == existingReviewId
          ? _self.existingReviewId
          : existingReviewId // ignore: cast_nullable_to_non_nullable
              as String?,
      existingRating: freezed == existingRating
          ? _self.existingRating
          : existingRating // ignore: cast_nullable_to_non_nullable
              as int?,
      existingComment: freezed == existingComment
          ? _self.existingComment
          : existingComment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReviewEligibilityEntity].
extension ReviewEligibilityEntityPatterns on ReviewEligibilityEntity {
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
    TResult Function(_ReviewEligibilityEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityEntity() when $default != null:
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
    TResult Function(_ReviewEligibilityEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityEntity():
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
    TResult? Function(_ReviewEligibilityEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityEntity() when $default != null:
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
            bool canReview,
            bool hasReviewed,
            bool isVerifiedPurchase,
            String? reason,
            String? existingReviewId,
            int? existingRating,
            String? existingComment)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityEntity() when $default != null:
        return $default(
            _that.canReview,
            _that.hasReviewed,
            _that.isVerifiedPurchase,
            _that.reason,
            _that.existingReviewId,
            _that.existingRating,
            _that.existingComment);
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
            bool canReview,
            bool hasReviewed,
            bool isVerifiedPurchase,
            String? reason,
            String? existingReviewId,
            int? existingRating,
            String? existingComment)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityEntity():
        return $default(
            _that.canReview,
            _that.hasReviewed,
            _that.isVerifiedPurchase,
            _that.reason,
            _that.existingReviewId,
            _that.existingRating,
            _that.existingComment);
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
            bool canReview,
            bool hasReviewed,
            bool isVerifiedPurchase,
            String? reason,
            String? existingReviewId,
            int? existingRating,
            String? existingComment)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityEntity() when $default != null:
        return $default(
            _that.canReview,
            _that.hasReviewed,
            _that.isVerifiedPurchase,
            _that.reason,
            _that.existingReviewId,
            _that.existingRating,
            _that.existingComment);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReviewEligibilityEntity implements ReviewEligibilityEntity {
  const _ReviewEligibilityEntity(
      {required this.canReview,
      required this.hasReviewed,
      required this.isVerifiedPurchase,
      this.reason,
      this.existingReviewId,
      this.existingRating,
      this.existingComment});

  @override
  final bool canReview;
  @override
  final bool hasReviewed;
  @override
  final bool isVerifiedPurchase;
  @override
  final String? reason;
  @override
  final String? existingReviewId;
  @override
  final int? existingRating;
  @override
  final String? existingComment;

  /// Create a copy of ReviewEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewEligibilityEntityCopyWith<_ReviewEligibilityEntity> get copyWith =>
      __$ReviewEligibilityEntityCopyWithImpl<_ReviewEligibilityEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewEligibilityEntity &&
            (identical(other.canReview, canReview) ||
                other.canReview == canReview) &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.isVerifiedPurchase, isVerifiedPurchase) ||
                other.isVerifiedPurchase == isVerifiedPurchase) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.existingReviewId, existingReviewId) ||
                other.existingReviewId == existingReviewId) &&
            (identical(other.existingRating, existingRating) ||
                other.existingRating == existingRating) &&
            (identical(other.existingComment, existingComment) ||
                other.existingComment == existingComment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      canReview,
      hasReviewed,
      isVerifiedPurchase,
      reason,
      existingReviewId,
      existingRating,
      existingComment);

  @override
  String toString() {
    return 'ReviewEligibilityEntity(canReview: $canReview, hasReviewed: $hasReviewed, isVerifiedPurchase: $isVerifiedPurchase, reason: $reason, existingReviewId: $existingReviewId, existingRating: $existingRating, existingComment: $existingComment)';
  }
}

/// @nodoc
abstract mixin class _$ReviewEligibilityEntityCopyWith<$Res>
    implements $ReviewEligibilityEntityCopyWith<$Res> {
  factory _$ReviewEligibilityEntityCopyWith(_ReviewEligibilityEntity value,
          $Res Function(_ReviewEligibilityEntity) _then) =
      __$ReviewEligibilityEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool canReview,
      bool hasReviewed,
      bool isVerifiedPurchase,
      String? reason,
      String? existingReviewId,
      int? existingRating,
      String? existingComment});
}

/// @nodoc
class __$ReviewEligibilityEntityCopyWithImpl<$Res>
    implements _$ReviewEligibilityEntityCopyWith<$Res> {
  __$ReviewEligibilityEntityCopyWithImpl(this._self, this._then);

  final _ReviewEligibilityEntity _self;
  final $Res Function(_ReviewEligibilityEntity) _then;

  /// Create a copy of ReviewEligibilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? canReview = null,
    Object? hasReviewed = null,
    Object? isVerifiedPurchase = null,
    Object? reason = freezed,
    Object? existingReviewId = freezed,
    Object? existingRating = freezed,
    Object? existingComment = freezed,
  }) {
    return _then(_ReviewEligibilityEntity(
      canReview: null == canReview
          ? _self.canReview
          : canReview // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReviewed: null == hasReviewed
          ? _self.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifiedPurchase: null == isVerifiedPurchase
          ? _self.isVerifiedPurchase
          : isVerifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      existingReviewId: freezed == existingReviewId
          ? _self.existingReviewId
          : existingReviewId // ignore: cast_nullable_to_non_nullable
              as String?,
      existingRating: freezed == existingRating
          ? _self.existingRating
          : existingRating // ignore: cast_nullable_to_non_nullable
              as int?,
      existingComment: freezed == existingComment
          ? _self.existingComment
          : existingComment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$AdminReviewEntity {
  String get id;
  int get rating;
  String get title;
  String get comment;
  String get status;
  bool get verifiedPurchase;
  String get userName;
  String get userEmail;
  String get productName;
  String get productImage;
  DateTime get createdAt;

  /// Create a copy of AdminReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminReviewEntityCopyWith<AdminReviewEntity> get copyWith =>
      _$AdminReviewEntityCopyWithImpl<AdminReviewEntity>(
          this as AdminReviewEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminReviewEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      rating,
      title,
      comment,
      status,
      verifiedPurchase,
      userName,
      userEmail,
      productName,
      productImage,
      createdAt);

  @override
  String toString() {
    return 'AdminReviewEntity(id: $id, rating: $rating, title: $title, comment: $comment, status: $status, verifiedPurchase: $verifiedPurchase, userName: $userName, userEmail: $userEmail, productName: $productName, productImage: $productImage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AdminReviewEntityCopyWith<$Res> {
  factory $AdminReviewEntityCopyWith(
          AdminReviewEntity value, $Res Function(AdminReviewEntity) _then) =
      _$AdminReviewEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int rating,
      String title,
      String comment,
      String status,
      bool verifiedPurchase,
      String userName,
      String userEmail,
      String productName,
      String productImage,
      DateTime createdAt});
}

/// @nodoc
class _$AdminReviewEntityCopyWithImpl<$Res>
    implements $AdminReviewEntityCopyWith<$Res> {
  _$AdminReviewEntityCopyWithImpl(this._self, this._then);

  final AdminReviewEntity _self;
  final $Res Function(AdminReviewEntity) _then;

  /// Create a copy of AdminReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? title = null,
    Object? comment = null,
    Object? status = null,
    Object? verifiedPurchase = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? productName = null,
    Object? productImage = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminReviewEntity].
extension AdminReviewEntityPatterns on AdminReviewEntity {
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
    TResult Function(_AdminReviewEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminReviewEntity() when $default != null:
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
    TResult Function(_AdminReviewEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminReviewEntity():
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
    TResult? Function(_AdminReviewEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminReviewEntity() when $default != null:
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
            int rating,
            String title,
            String comment,
            String status,
            bool verifiedPurchase,
            String userName,
            String userEmail,
            String productName,
            String productImage,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminReviewEntity() when $default != null:
        return $default(
            _that.id,
            _that.rating,
            _that.title,
            _that.comment,
            _that.status,
            _that.verifiedPurchase,
            _that.userName,
            _that.userEmail,
            _that.productName,
            _that.productImage,
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
            int rating,
            String title,
            String comment,
            String status,
            bool verifiedPurchase,
            String userName,
            String userEmail,
            String productName,
            String productImage,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminReviewEntity():
        return $default(
            _that.id,
            _that.rating,
            _that.title,
            _that.comment,
            _that.status,
            _that.verifiedPurchase,
            _that.userName,
            _that.userEmail,
            _that.productName,
            _that.productImage,
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
            int rating,
            String title,
            String comment,
            String status,
            bool verifiedPurchase,
            String userName,
            String userEmail,
            String productName,
            String productImage,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminReviewEntity() when $default != null:
        return $default(
            _that.id,
            _that.rating,
            _that.title,
            _that.comment,
            _that.status,
            _that.verifiedPurchase,
            _that.userName,
            _that.userEmail,
            _that.productName,
            _that.productImage,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminReviewEntity implements AdminReviewEntity {
  const _AdminReviewEntity(
      {required this.id,
      required this.rating,
      this.title = '',
      required this.comment,
      required this.status,
      this.verifiedPurchase = true,
      required this.userName,
      required this.userEmail,
      required this.productName,
      this.productImage = '',
      required this.createdAt});

  @override
  final String id;
  @override
  final int rating;
  @override
  @JsonKey()
  final String title;
  @override
  final String comment;
  @override
  final String status;
  @override
  @JsonKey()
  final bool verifiedPurchase;
  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final String productName;
  @override
  @JsonKey()
  final String productImage;
  @override
  final DateTime createdAt;

  /// Create a copy of AdminReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminReviewEntityCopyWith<_AdminReviewEntity> get copyWith =>
      __$AdminReviewEntityCopyWithImpl<_AdminReviewEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminReviewEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      rating,
      title,
      comment,
      status,
      verifiedPurchase,
      userName,
      userEmail,
      productName,
      productImage,
      createdAt);

  @override
  String toString() {
    return 'AdminReviewEntity(id: $id, rating: $rating, title: $title, comment: $comment, status: $status, verifiedPurchase: $verifiedPurchase, userName: $userName, userEmail: $userEmail, productName: $productName, productImage: $productImage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AdminReviewEntityCopyWith<$Res>
    implements $AdminReviewEntityCopyWith<$Res> {
  factory _$AdminReviewEntityCopyWith(
          _AdminReviewEntity value, $Res Function(_AdminReviewEntity) _then) =
      __$AdminReviewEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int rating,
      String title,
      String comment,
      String status,
      bool verifiedPurchase,
      String userName,
      String userEmail,
      String productName,
      String productImage,
      DateTime createdAt});
}

/// @nodoc
class __$AdminReviewEntityCopyWithImpl<$Res>
    implements _$AdminReviewEntityCopyWith<$Res> {
  __$AdminReviewEntityCopyWithImpl(this._self, this._then);

  final _AdminReviewEntity _self;
  final $Res Function(_AdminReviewEntity) _then;

  /// Create a copy of AdminReviewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? title = null,
    Object? comment = null,
    Object? status = null,
    Object? verifiedPurchase = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? productName = null,
    Object? productImage = null,
    Object? createdAt = null,
  }) {
    return _then(_AdminReviewEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$ProductReviewsResult {
  List<ReviewEntity> get reviews;
  ReviewSummaryEntity get summary;

  /// Create a copy of ProductReviewsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductReviewsResultCopyWith<ProductReviewsResult> get copyWith =>
      _$ProductReviewsResultCopyWithImpl<ProductReviewsResult>(
          this as ProductReviewsResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductReviewsResult &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(reviews), summary);

  @override
  String toString() {
    return 'ProductReviewsResult(reviews: $reviews, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class $ProductReviewsResultCopyWith<$Res> {
  factory $ProductReviewsResultCopyWith(ProductReviewsResult value,
          $Res Function(ProductReviewsResult) _then) =
      _$ProductReviewsResultCopyWithImpl;
  @useResult
  $Res call({List<ReviewEntity> reviews, ReviewSummaryEntity summary});

  $ReviewSummaryEntityCopyWith<$Res> get summary;
}

/// @nodoc
class _$ProductReviewsResultCopyWithImpl<$Res>
    implements $ProductReviewsResultCopyWith<$Res> {
  _$ProductReviewsResultCopyWithImpl(this._self, this._then);

  final ProductReviewsResult _self;
  final $Res Function(ProductReviewsResult) _then;

  /// Create a copy of ProductReviewsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? summary = null,
  }) {
    return _then(_self.copyWith(
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewEntity>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ReviewSummaryEntity,
    ));
  }

  /// Create a copy of ProductReviewsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewSummaryEntityCopyWith<$Res> get summary {
    return $ReviewSummaryEntityCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProductReviewsResult].
extension ProductReviewsResultPatterns on ProductReviewsResult {
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
    TResult Function(_ProductReviewsResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductReviewsResult() when $default != null:
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
    TResult Function(_ProductReviewsResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductReviewsResult():
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
    TResult? Function(_ProductReviewsResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductReviewsResult() when $default != null:
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
    TResult Function(List<ReviewEntity> reviews, ReviewSummaryEntity summary)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductReviewsResult() when $default != null:
        return $default(_that.reviews, _that.summary);
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
    TResult Function(List<ReviewEntity> reviews, ReviewSummaryEntity summary)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductReviewsResult():
        return $default(_that.reviews, _that.summary);
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
    TResult? Function(List<ReviewEntity> reviews, ReviewSummaryEntity summary)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductReviewsResult() when $default != null:
        return $default(_that.reviews, _that.summary);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductReviewsResult implements ProductReviewsResult {
  const _ProductReviewsResult(
      {required final List<ReviewEntity> reviews, required this.summary})
      : _reviews = reviews;

  final List<ReviewEntity> _reviews;
  @override
  List<ReviewEntity> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final ReviewSummaryEntity summary;

  /// Create a copy of ProductReviewsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductReviewsResultCopyWith<_ProductReviewsResult> get copyWith =>
      __$ProductReviewsResultCopyWithImpl<_ProductReviewsResult>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductReviewsResult &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reviews), summary);

  @override
  String toString() {
    return 'ProductReviewsResult(reviews: $reviews, summary: $summary)';
  }
}

/// @nodoc
abstract mixin class _$ProductReviewsResultCopyWith<$Res>
    implements $ProductReviewsResultCopyWith<$Res> {
  factory _$ProductReviewsResultCopyWith(_ProductReviewsResult value,
          $Res Function(_ProductReviewsResult) _then) =
      __$ProductReviewsResultCopyWithImpl;
  @override
  @useResult
  $Res call({List<ReviewEntity> reviews, ReviewSummaryEntity summary});

  @override
  $ReviewSummaryEntityCopyWith<$Res> get summary;
}

/// @nodoc
class __$ProductReviewsResultCopyWithImpl<$Res>
    implements _$ProductReviewsResultCopyWith<$Res> {
  __$ProductReviewsResultCopyWithImpl(this._self, this._then);

  final _ProductReviewsResult _self;
  final $Res Function(_ProductReviewsResult) _then;

  /// Create a copy of ProductReviewsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviews = null,
    Object? summary = null,
  }) {
    return _then(_ProductReviewsResult(
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewEntity>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ReviewSummaryEntity,
    ));
  }

  /// Create a copy of ProductReviewsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewSummaryEntityCopyWith<$Res> get summary {
    return $ReviewSummaryEntityCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

// dart format on
