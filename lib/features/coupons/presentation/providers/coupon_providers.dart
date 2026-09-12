import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/coupon_remote_datasource.dart';
import '../../data/repositories/coupon_repository_impl.dart';
import '../../domain/entities/coupon_entity.dart';
import '../../domain/repositories/coupon_repository.dart';
import '../../domain/usecases/get_available_coupons_usecase.dart';
import '../../domain/usecases/validate_coupon_usecase.dart';

/// Data Source Provider
final couponRemoteDataSourceProvider = Provider<CouponRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return CouponRemoteDataSourceImpl(client);
});

/// Repository Provider
final couponRepositoryProvider = Provider<CouponRepository>((ref) {
  final remote = ref.watch(couponRemoteDataSourceProvider);
  return CouponRepositoryImpl(remote);
});

/// Use Case Providers
final getAvailableCouponsUseCaseProvider =
    Provider<GetAvailableCouponsUseCase>((ref) {
  return GetAvailableCouponsUseCase(ref.watch(couponRepositoryProvider));
});

final validateCouponUseCaseProvider = Provider<ValidateCouponUseCase>((ref) {
  return ValidateCouponUseCase(ref.watch(couponRepositoryProvider));
});

/// Available Coupons Async Provider (for discovery / promo selection sheet)
final availableCouponsProvider =
    FutureProvider.autoDispose<List<CouponEntity>>((ref) async {
  final useCase = ref.watch(getAvailableCouponsUseCaseProvider);
  final result = await useCase();
  return result.fold(
    onSuccess: (coupons) => coupons,
    onFailure: (failure) => throw failure.message,
  );
});
