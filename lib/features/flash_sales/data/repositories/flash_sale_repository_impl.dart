import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/flash_sale_entity.dart';
import '../../domain/repositories/flash_sale_repository.dart';
import '../datasources/flash_sale_remote_datasource.dart';
import '../mappers/flash_sale_mappers.dart';

class FlashSaleRepositoryImpl implements FlashSaleRepository {
  final FlashSaleRemoteDataSource _remoteDataSource;

  FlashSaleRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<FlashSaleEntity>>> getActiveFlashSales({int limit = 10}) async {
    try {
      final models = await _remoteDataSource.getActiveFlashSales(limit: limit);
      return Success(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch active flash sales');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<FlashSaleEntity>>> getUpcomingFlashSales({int limit = 10}) async {
    try {
      final models = await _remoteDataSource.getUpcomingFlashSales(limit: limit);
      return Success(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch upcoming flash sales');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<FlashSaleEntity>> getFlashSaleById(String id) async {
    try {
      final model = await _remoteDataSource.getFlashSaleById(id);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch flash sale details');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<FlashSaleItemEntity?>> getProductFlashSale(String productId) async {
    try {
      final model = await _remoteDataSource.getProductFlashSale(productId);
      return Success(model?.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch product flash promotion');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
