import 'package:dio/dio.dart';
import 'package:shopp_app/core/errors/failures.dart';
import 'package:shopp_app/core/utils/result.dart';
import '../../domain/entities/emi_plan_entity.dart';
import '../../domain/repositories/emi_repository.dart';
import '../datasources/emi_remote_datasource.dart';
import '../mappers/emi_mappers.dart';

class EmiRepositoryImpl implements EmiRepository {
  final EmiRemoteDataSource _remoteDataSource;

  EmiRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<EmiPlansResponseEntity>> getEmiPlans({double? amount}) async {
    try {
      final model = await _remoteDataSource.getEmiPlans(amount: amount);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch EMI plans');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<EmiQuoteEntity>> calculateEmiQuote({
    required double amount,
    required String planId,
    required int tenureMonths,
  }) async {
    try {
      final model = await _remoteDataSource.calculateEmiQuote(
        amount: amount,
        planId: planId,
        tenureMonths: tenureMonths,
      );
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to calculate EMI quote');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
