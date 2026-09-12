import '../models/coupon_model.dart';
import '../../domain/entities/coupon_entity.dart';

extension AppliedCouponModelMapper on AppliedCouponModel {
  AppliedCouponEntity toEntity() {
    return AppliedCouponEntity(
      code: code,
      name: name,
      description: description,
      discountType: discountType,
      discountValue: discountValue,
      discountAmount: discountAmount,
      expiresAt: expiresAt,
    );
  }
}

extension AppliedCouponEntityMapper on AppliedCouponEntity {
  AppliedCouponModel toModel() {
    return AppliedCouponModel(
      code: code,
      name: name,
      description: description,
      discountType: discountType,
      discountValue: discountValue,
      discountAmount: discountAmount,
      expiresAt: expiresAt,
    );
  }
}

extension CouponModelMapper on CouponModel {
  CouponEntity toEntity() {
    return CouponEntity(
      code: code,
      name: name,
      description: description,
      discountType: discountType,
      discountValue: discountValue,
      minimumOrderValue: minimumOrderValue,
      maximumDiscountAmount: maximumDiscountAmount,
      expiresAt: expiresAt,
      isActive: isActive,
      firstOrderOnly: firstOrderOnly,
    );
  }
}

extension CouponEntityMapper on CouponEntity {
  CouponModel toModel() {
    return CouponModel(
      code: code,
      name: name,
      description: description,
      discountType: discountType,
      discountValue: discountValue,
      minimumOrderValue: minimumOrderValue,
      maximumDiscountAmount: maximumDiscountAmount,
      expiresAt: expiresAt,
      isActive: isActive,
      firstOrderOnly: firstOrderOnly,
    );
  }
}
