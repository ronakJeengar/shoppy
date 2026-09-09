import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../../../data/models/order_model.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<OrderModel>>> getOrders({
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    try {
      final orders = await _remoteDataSource.getOrders(
        page: page,
        limit: limit,
        status: status,
      );
      return Success(orders);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load orders');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<OrderModel>> getOrderById(String id) async {
    try {
      final order = await _remoteDataSource.getOrderById(id);
      return Success(order);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load order details');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<OrderModel>> cancelOrder(
    String id, {
    String reason = 'Customer request',
  }) async {
    try {
      final order = await _remoteDataSource.cancelOrder(id, reason);
      return Success(order);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to cancel order');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
