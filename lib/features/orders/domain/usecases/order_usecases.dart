import '../../../../core/utils/result.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class GetOrdersUseCase {
  final OrderRepository _repository;

  GetOrdersUseCase(this._repository);

  Future<Result<List<OrderEntity>>> call({
    int page = 1,
    int limit = 10,
    String? status,
  }) {
    return _repository.getOrders(page: page, limit: limit, status: status);
  }
}

class GetOrderDetailUseCase {
  final OrderRepository _repository;

  GetOrderDetailUseCase(this._repository);

  Future<Result<OrderEntity>> call(String id) {
    return _repository.getOrderById(id);
  }
}

class CancelOrderUseCase {
  final OrderRepository _repository;

  CancelOrderUseCase(this._repository);

  Future<Result<OrderEntity>> call(String id, {String reason = 'Customer request'}) {
    return _repository.cancelOrder(id, reason: reason);
  }
}
