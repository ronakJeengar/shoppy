import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/coupon_entity.dart';
import '../../domain/repositories/coupon_repository.dart';
import '../datasources/coupon_remote_datasource.dart';
import '../mappers/coupon_mappers.dart';

class CouponRepositoryImpl implements CouponRepository {
  final CouponRemoteDataSource _remoteDataSource;

  CouponRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<CouponEntity>>> getAvailableCoupons() async {
    try {
      final models = await _remoteDataSource.getAvailableCoupons();
      return Success(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch available coupons');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<AppliedCouponEntity>> validateCoupon(
    String code, {
    double? subtotal,
  }) async {
    try {
      final model = await _remoteDataSource.validateCoupon(
        code,
        subtotal: subtotal,
      );
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Invalid coupon code');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
