import '../../../../core/utils/result.dart';
import '../../../../data/models/order_model.dart';

abstract class OrderRepository {
  Future<Result<List<OrderModel>>> getOrders({
    int page = 1,
    int limit = 10,
    String? status,
  });

  Future<Result<OrderModel>> getOrderById(String id);

  Future<Result<OrderModel>> cancelOrder(String id, {String reason = 'Customer request'});
}
