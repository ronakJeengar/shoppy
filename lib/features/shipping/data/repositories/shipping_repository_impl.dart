import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/shipping_entity.dart';
import '../../domain/repositories/shipping_repository.dart';
import '../datasources/shipping_remote_datasource.dart';
import '../mappers/shipping_mappers.dart';

class ShippingRepositoryImpl implements ShippingRepository {
  final ShippingRemoteDataSource _remoteDataSource;

  ShippingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<PinServiceabilityEntity>> checkServiceability(String pinCode) async {
    try {
      final model = await _remoteDataSource.checkServiceability(pinCode);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to check PIN serviceability');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ShippingQuoteEntity>> calculateShippingQuote({
    required String pinCode,
    required double subtotal,
    String shippingMethod = 'STANDARD',
  }) async {
    try {
      final model = await _remoteDataSource.calculateShippingQuote(
        pinCode: pinCode,
        subtotal: subtotal,
        shippingMethod: shippingMethod,
      );
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to calculate shipping quote');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<AvailableShippingMethodEntity>>> getShippingMethods() async {
    try {
      final models = await _remoteDataSource.getShippingMethods();
      return Success(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load shipping methods');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
