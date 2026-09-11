// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {
  String get id;
  int get rating;
  String get title;
  String get comment;
  bool get verifiedPurchase;
  String get authorName;
  bool get isOwner;
  DateTime get createdAt;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewModel &&
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
    return 'ReviewModel(id: $id, rating: $rating, title: $title, comment: $comment, verifiedPurchase: $verifiedPurchase, authorName: $authorName, isOwner: $isOwner, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) _then) =
      _$ReviewModelCopyWithImpl;
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
class _$ReviewModelCopyWithImpl<$Res> implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

  /// Create a copy of ReviewModel
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

/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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
    TResult Function(_ReviewModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
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
    TResult Function(_ReviewModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel():
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
    TResult? Function(_ReviewModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
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
      case _ReviewModel() when $default != null:
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
      case _ReviewModel():
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
      case _ReviewModel() when $default != null:
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

class _ReviewModel extends ReviewModel {
  const _ReviewModel(
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

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewModelCopyWith<_ReviewModel> get copyWith =>
      __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewModel &&
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
    return 'ReviewModel(id: $id, rating: $rating, title: $title, comment: $comment, verifiedPurchase: $verifiedPurchase, authorName: $authorName, isOwner: $isOwner, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(
          _ReviewModel value, $Res Function(_ReviewModel) _then) =
      __$ReviewModelCopyWithImpl;
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
class __$ReviewModelCopyWithImpl<$Res> implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

  /// Create a copy of ReviewModel
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
    return _then(_ReviewModel(
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
mixin _$ReviewSummaryModel {
  double get averageRating;
  int get totalReviews;
  Map<int, int> get ratingDistribution;

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewSummaryModelCopyWith<ReviewSummaryModel> get copyWith =>
      _$ReviewSummaryModelCopyWithImpl<ReviewSummaryModel>(
          this as ReviewSummaryModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewSummaryModel &&
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
    return 'ReviewSummaryModel(averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution)';
  }
}

/// @nodoc
abstract mixin class $ReviewSummaryModelCopyWith<$Res> {
  factory $ReviewSummaryModelCopyWith(
          ReviewSummaryModel value, $Res Function(ReviewSummaryModel) _then) =
      _$ReviewSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {double averageRating,
      int totalReviews,
      Map<int, int> ratingDistribution});
}

/// @nodoc
class _$ReviewSummaryModelCopyWithImpl<$Res>
    implements $ReviewSummaryModelCopyWith<$Res> {
  _$ReviewSummaryModelCopyWithImpl(this._self, this._then);

  final ReviewSummaryModel _self;
  final $Res Function(ReviewSummaryModel) _then;

  /// Create a copy of ReviewSummaryModel
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

/// Adds pattern-matching-related methods to [ReviewSummaryModel].
extension ReviewSummaryModelPatterns on ReviewSummaryModel {
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
    TResult Function(_ReviewSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel() when $default != null:
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
    TResult Function(_ReviewSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel():
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
    TResult? Function(_ReviewSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewSummaryModel() when $default != null:
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
      case _ReviewSummaryModel() when $default != null:
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
      case _ReviewSummaryModel():
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
      case _ReviewSummaryModel() when $default != null:
        return $default(
            _that.averageRating, _that.totalReviews, _that.ratingDistribution);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReviewSummaryModel implements ReviewSummaryModel {
  const _ReviewSummaryModel(
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

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewSummaryModelCopyWith<_ReviewSummaryModel> get copyWith =>
      __$ReviewSummaryModelCopyWithImpl<_ReviewSummaryModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewSummaryModel &&
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
    return 'ReviewSummaryModel(averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution)';
  }
}

/// @nodoc
abstract mixin class _$ReviewSummaryModelCopyWith<$Res>
    implements $ReviewSummaryModelCopyWith<$Res> {
  factory _$ReviewSummaryModelCopyWith(
          _ReviewSummaryModel value, $Res Function(_ReviewSummaryModel) _then) =
      __$ReviewSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double averageRating,
      int totalReviews,
      Map<int, int> ratingDistribution});
}

/// @nodoc
class __$ReviewSummaryModelCopyWithImpl<$Res>
    implements _$ReviewSummaryModelCopyWith<$Res> {
  __$ReviewSummaryModelCopyWithImpl(this._self, this._then);

  final _ReviewSummaryModel _self;
  final $Res Function(_ReviewSummaryModel) _then;

  /// Create a copy of ReviewSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? averageRating = null,
    Object? totalReviews = null,
    Object? ratingDistribution = null,
  }) {
    return _then(_ReviewSummaryModel(
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
mixin _$ReviewEligibilityModel {
  bool get canReview;
  bool get hasReviewed;
  bool get isVerifiedPurchase;
  String? get reason;
  String? get existingReviewId;
  int? get existingRating;
  String? get existingComment;

  /// Create a copy of ReviewEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewEligibilityModelCopyWith<ReviewEligibilityModel> get copyWith =>
      _$ReviewEligibilityModelCopyWithImpl<ReviewEligibilityModel>(
          this as ReviewEligibilityModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewEligibilityModel &&
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
    return 'ReviewEligibilityModel(canReview: $canReview, hasReviewed: $hasReviewed, isVerifiedPurchase: $isVerifiedPurchase, reason: $reason, existingReviewId: $existingReviewId, existingRating: $existingRating, existingComment: $existingComment)';
  }
}

/// @nodoc
abstract mixin class $ReviewEligibilityModelCopyWith<$Res> {
  factory $ReviewEligibilityModelCopyWith(ReviewEligibilityModel value,
          $Res Function(ReviewEligibilityModel) _then) =
      _$ReviewEligibilityModelCopyWithImpl;
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
class _$ReviewEligibilityModelCopyWithImpl<$Res>
    implements $ReviewEligibilityModelCopyWith<$Res> {
  _$ReviewEligibilityModelCopyWithImpl(this._self, this._then);

  final ReviewEligibilityModel _self;
  final $Res Function(ReviewEligibilityModel) _then;

  /// Create a copy of ReviewEligibilityModel
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

/// Adds pattern-matching-related methods to [ReviewEligibilityModel].
extension ReviewEligibilityModelPatterns on ReviewEligibilityModel {
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
    TResult Function(_ReviewEligibilityModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityModel() when $default != null:
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
    TResult Function(_ReviewEligibilityModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityModel():
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
    TResult? Function(_ReviewEligibilityModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEligibilityModel() when $default != null:
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
      case _ReviewEligibilityModel() when $default != null:
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
      case _ReviewEligibilityModel():
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
      case _ReviewEligibilityModel() when $default != null:
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

class _ReviewEligibilityModel implements ReviewEligibilityModel {
  const _ReviewEligibilityModel(
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

  /// Create a copy of ReviewEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewEligibilityModelCopyWith<_ReviewEligibilityModel> get copyWith =>
      __$ReviewEligibilityModelCopyWithImpl<_ReviewEligibilityModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewEligibilityModel &&
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
    return 'ReviewEligibilityModel(canReview: $canReview, hasReviewed: $hasReviewed, isVerifiedPurchase: $isVerifiedPurchase, reason: $reason, existingReviewId: $existingReviewId, existingRating: $existingRating, existingComment: $existingComment)';
  }
}

/// @nodoc
abstract mixin class _$ReviewEligibilityModelCopyWith<$Res>
    implements $ReviewEligibilityModelCopyWith<$Res> {
  factory _$ReviewEligibilityModelCopyWith(_ReviewEligibilityModel value,
          $Res Function(_ReviewEligibilityModel) _then) =
      __$ReviewEligibilityModelCopyWithImpl;
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
class __$ReviewEligibilityModelCopyWithImpl<$Res>
    implements _$ReviewEligibilityModelCopyWith<$Res> {
  __$ReviewEligibilityModelCopyWithImpl(this._self, this._then);

  final _ReviewEligibilityModel _self;
  final $Res Function(_ReviewEligibilityModel) _then;

  /// Create a copy of ReviewEligibilityModel
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
    return _then(_ReviewEligibilityModel(
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
mixin _$AdminReviewModel {
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

  /// Create a copy of AdminReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminReviewModelCopyWith<AdminReviewModel> get copyWith =>
      _$AdminReviewModelCopyWithImpl<AdminReviewModel>(
          this as AdminReviewModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminReviewModel &&
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
    return 'AdminReviewModel(id: $id, rating: $rating, title: $title, comment: $comment, status: $status, verifiedPurchase: $verifiedPurchase, userName: $userName, userEmail: $userEmail, productName: $productName, productImage: $productImage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AdminReviewModelCopyWith<$Res> {
  factory $AdminReviewModelCopyWith(
          AdminReviewModel value, $Res Function(AdminReviewModel) _then) =
      _$AdminReviewModelCopyWithImpl;
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
class _$AdminReviewModelCopyWithImpl<$Res>
    implements $AdminReviewModelCopyWith<$Res> {
  _$AdminReviewModelCopyWithImpl(this._self, this._then);

  final AdminReviewModel _self;
  final $Res Function(AdminReviewModel) _then;

  /// Create a copy of AdminReviewModel
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

/// Adds pattern-matching-related methods to [AdminReviewModel].
extension AdminReviewModelPatterns on AdminReviewModel {
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
    TResult Function(_AdminReviewModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminReviewModel() when $default != null:
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
    TResult Function(_AdminReviewModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminReviewModel():
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
    TResult? Function(_AdminReviewModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminReviewModel() when $default != null:
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
      case _AdminReviewModel() when $default != null:
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
      case _AdminReviewModel():
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
      case _AdminReviewModel() when $default != null:
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

class _AdminReviewModel implements AdminReviewModel {
  const _AdminReviewModel(
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

  /// Create a copy of AdminReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminReviewModelCopyWith<_AdminReviewModel> get copyWith =>
      __$AdminReviewModelCopyWithImpl<_AdminReviewModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminReviewModel &&
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
    return 'AdminReviewModel(id: $id, rating: $rating, title: $title, comment: $comment, status: $status, verifiedPurchase: $verifiedPurchase, userName: $userName, userEmail: $userEmail, productName: $productName, productImage: $productImage, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AdminReviewModelCopyWith<$Res>
    implements $AdminReviewModelCopyWith<$Res> {
  factory _$AdminReviewModelCopyWith(
          _AdminReviewModel value, $Res Function(_AdminReviewModel) _then) =
      __$AdminReviewModelCopyWithImpl;
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
class __$AdminReviewModelCopyWithImpl<$Res>
    implements _$AdminReviewModelCopyWith<$Res> {
  __$AdminReviewModelCopyWithImpl(this._self, this._then);

  final _AdminReviewModel _self;
  final $Res Function(_AdminReviewModel) _then;

  /// Create a copy of AdminReviewModel
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
    return _then(_AdminReviewModel(
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

// dart format on
