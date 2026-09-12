import '../../../../core/utils/result.dart';
import '../entities/coupon_entity.dart';

abstract class CouponRepository {
  Future<Result<List<CouponEntity>>> getAvailableCoupons();
  Future<Result<AppliedCouponEntity>> validateCoupon(String code, {double? subtotal});
}
