import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_entity.freezed.dart';

@freezed
abstract class AppliedCouponEntity with _$AppliedCouponEntity {
  const factory AppliedCouponEntity({
    required String code,
    @Default('') String name,
    @Default('') String description,
    @Default('PERCENTAGE') String discountType,
    @Default(0.0) double discountValue,
    @Default(0.0) double discountAmount,
    DateTime? expiresAt,
  }) = _AppliedCouponEntity;
}

@freezed
abstract class CouponEntity with _$CouponEntity {
  const factory CouponEntity({
    required String code,
    required String name,
    @Default('') String description,
    required String discountType,
    required double discountValue,
    @Default(0.0) double minimumOrderValue,
    double? maximumDiscountAmount,
    DateTime? expiresAt,
    @Default(true) bool isActive,
    @Default(false) bool firstOrderOnly,
  }) = _CouponEntity;
}
