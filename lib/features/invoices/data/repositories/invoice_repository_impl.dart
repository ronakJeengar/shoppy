import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/invoice_entity.dart';
import '../../domain/repositories/invoice_repository.dart';
import '../datasources/invoice_remote_datasource.dart';
import '../mappers/invoice_mappers.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceRemoteDataSource _remoteDataSource;

  InvoiceRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<InvoiceEntity>> getOrderInvoice(String orderId) async {
    try {
      final model = await _remoteDataSource.getOrderInvoice(orderId);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch tax invoice');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<String>> getOrderInvoiceHtml(String orderId) async {
    try {
      final html = await _remoteDataSource.getOrderInvoiceHtml(orderId);
      return Success(html);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch printable invoice');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
