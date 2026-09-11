import '../../../../core/utils/result.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Result<List<OrderEntity>>> getOrders({
    int page = 1,
    int limit = 10,
    String? status,
  });

  Future<Result<OrderEntity>> getOrderById(String id);

  Future<Result<OrderEntity>> cancelOrder(String id, {String reason = 'Customer request'});
}
