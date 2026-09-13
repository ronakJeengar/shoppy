import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/flash_sale_remote_datasource.dart';
import '../../data/repositories/flash_sale_repository_impl.dart';
import '../../domain/entities/flash_sale_entity.dart';
import '../../domain/repositories/flash_sale_repository.dart';
import '../../domain/usecases/get_active_flash_sales_usecase.dart';
import '../../domain/usecases/get_product_flash_sale_usecase.dart';

/// Data Source Provider
final flashSaleRemoteDataSourceProvider =
    Provider<FlashSaleRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return FlashSaleRemoteDataSourceImpl(client);
});

/// Repository Provider
final flashSaleRepositoryProvider = Provider<FlashSaleRepository>((ref) {
  final remote = ref.watch(flashSaleRemoteDataSourceProvider);
  return FlashSaleRepositoryImpl(remote);
});

/// Use Cases
final getActiveFlashSalesUseCaseProvider =
    Provider<GetActiveFlashSalesUseCase>((ref) {
  return GetActiveFlashSalesUseCase(ref.watch(flashSaleRepositoryProvider));
});

final getProductFlashSaleUseCaseProvider =
    Provider<GetProductFlashSaleUseCase>((ref) {
  return GetProductFlashSaleUseCase(ref.watch(flashSaleRepositoryProvider));
});

/// Active Flash Sales FutureProvider (auto-refreshable)
final activeFlashSalesProvider =
    FutureProvider.autoDispose<List<FlashSaleEntity>>((ref) async {
  final useCase = ref.watch(getActiveFlashSalesUseCaseProvider);
  final result = await useCase(limit: 10);
  return result.fold(
    onSuccess: (sales) => sales,
    onFailure: (failure) => throw failure.message,
  );
});

/// Single Product Flash Promotion Provider
final productFlashSaleProvider = FutureProvider.family
    .autoDispose<FlashSaleItemEntity?, String>((ref, productId) async {
  final useCase = ref.watch(getProductFlashSaleUseCaseProvider);
  final result = await useCase(productId);
  return result.fold(
    onSuccess: (promo) => promo,
    onFailure: (_) => null,
  );
});
