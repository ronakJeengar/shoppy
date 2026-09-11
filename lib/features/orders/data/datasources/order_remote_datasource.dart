import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders({int page = 1, int limit = 10, String? status});
  Future<OrderModel> getOrderById(String id);
  Future<OrderModel> cancelOrder(String id, String reason);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiClient _client;

  OrderRemoteDataSourceImpl(this._client);

  @override
  Future<List<OrderModel>> getOrders({
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    final response = await _client.get(
      Urls.orders,
      queryParameters: {
        'page': page,
        'limit': limit,
        if (status != null && status.isNotEmpty) 'status': status,
      },
    );
    final data = response.data;
    final map = data is Map<String, dynamic> ? (data['data'] ?? data) : data;
    final rawList = map is Map<String, dynamic> ? (map['orders'] ?? []) : map;
    final list = rawList as List? ?? [];
    return list
        .map((item) => OrderModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<OrderModel> getOrderById(String id) async {
    final response = await _client.get('${Urls.orders}/$id');
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return OrderModel.fromJson(map);
  }

  @override
  Future<OrderModel> cancelOrder(String id, String reason) async {
    final response = await _client.post(
      '${Urls.orders}/$id/cancel',
      data: {'reason': reason},
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return OrderModel.fromJson(map);
  }
}
