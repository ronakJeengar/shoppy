import '../../../../core/utils/result.dart';
import '../entities/coupon_entity.dart';
import '../repositories/coupon_repository.dart';

class GetAvailableCouponsUseCase {
  final CouponRepository _repository;

  GetAvailableCouponsUseCase(this._repository);

  Future<Result<List<CouponEntity>>> call() {
    return _repository.getAvailableCoupons();
  }
}
