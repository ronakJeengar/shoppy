import '../../../../core/utils/result.dart';
import '../entities/coupon_entity.dart';
import '../repositories/coupon_repository.dart';

class ValidateCouponUseCase {
  final CouponRepository _repository;

  ValidateCouponUseCase(this._repository);

  Future<Result<AppliedCouponEntity>> call(String code, {double? subtotal}) {
    return _repository.validateCoupon(code, subtotal: subtotal);
  }
}
