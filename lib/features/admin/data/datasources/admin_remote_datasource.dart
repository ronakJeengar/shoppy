import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../../../../data/models/admin_dashboard_model.dart';
import '../../../../data/models/admin_user_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';

abstract class AdminRemoteDataSource {
  Future<AdminDashboardMetrics> getDashboardMetrics();
  Future<Map<String, dynamic>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  });
  Future<Product> createProduct(Map<String, dynamic> data);
  Future<Product> updateProduct(String id, Map<String, dynamic> data);
  Future<void> deleteProduct(String id);
  Future<Map<String, dynamic>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  });
  Future<OrderModel> updateOrderStatus(
    String id,
    String status, {
    String? trackingNumber,
    String? carrier,
  });
  Future<Map<String, dynamic>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  });
  Future<AdminUserModel> updateUserRole(String id, String role);
  Future<AdminUserModel> toggleUserStatus(String id, bool isActive);
  Future<Map<String, dynamic>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? search,
  });
  Future<void> deleteAdminReview(String id);
  Future<Map<String, dynamic>> getAuditLogs({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  });
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final ApiClient _client;

  AdminRemoteDataSourceImpl(this._client);

  @override
  Future<AdminDashboardMetrics> getDashboardMetrics() async {
    final response = await _client.get(Urls.adminDashboard);
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return AdminDashboardMetrics.fromJson(map);
  }

  @override
  Future<Map<String, dynamic>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (search != null && search.isNotEmpty) 'search': search,
      if (category != null && category.isNotEmpty) 'category': category,
      if (status != null && status.isNotEmpty) 'status': status,
      if (lowStock == true) 'lowStock': true,
    };
    final response =
        await _client.get(Urls.adminProducts, queryParameters: queryParams);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Product> createProduct(Map<String, dynamic> data) async {
    final response = await _client.post(Urls.adminProducts, data: data);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return Product.fromJson(map);
  }

  @override
  Future<Product> updateProduct(String id, Map<String, dynamic> data) async {
    final response = await _client.patch('${Urls.adminProducts}/$id', data: data);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return Product.fromJson(map);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _client.delete('${Urls.adminProducts}/$id');
  }

  @override
  Future<Map<String, dynamic>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (status != null && status.isNotEmpty) 'status': status,
      if (search != null && search.isNotEmpty) 'search': search,
    };
    final response =
        await _client.get(Urls.adminOrders, queryParameters: queryParams);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<OrderModel> updateOrderStatus(
    String id,
    String status, {
    String? trackingNumber,
    String? carrier,
  }) async {
    final response = await _client.patch(
      '${Urls.adminOrders}/$id/status',
      data: {
        'status': status,
        if (trackingNumber != null) 'trackingNumber': trackingNumber,
        if (carrier != null) 'carrier': carrier,
      },
    );
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return OrderModel.fromJson(map);
  }

  @override
  Future<Map<String, dynamic>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (role != null && role.isNotEmpty) 'role': role,
      if (search != null && search.isNotEmpty) 'search': search,
    };
    final response =
        await _client.get(Urls.adminUsers, queryParameters: queryParams);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<AdminUserModel> updateUserRole(String id, String role) async {
    final response = await _client.patch(
      '${Urls.adminUsers}/$id/role',
      data: {'role': role},
    );
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return AdminUserModel.fromJson(map);
  }

  @override
  Future<AdminUserModel> toggleUserStatus(String id, bool isActive) async {
    final response = await _client.patch(
      '${Urls.adminUsers}/$id/status',
      data: {'isActive': isActive},
    );
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return AdminUserModel.fromJson(map);
  }

  @override
  Future<Map<String, dynamic>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (rating != null) 'rating': rating,
      if (search != null && search.isNotEmpty) 'search': search,
    };
    final response =
        await _client.get(Urls.adminReviews, queryParameters: queryParams);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<void> deleteAdminReview(String id) async {
    await _client.delete('${Urls.adminReviews}/$id');
  }

  @override
  Future<Map<String, dynamic>> getAuditLogs({
    int page = 1,
    int limit = 30,
    String? action,
    String? targetType,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (action != null && action.isNotEmpty) 'action': action,
      if (targetType != null && targetType.isNotEmpty) 'targetType': targetType,
    };
    final response =
        await _client.get(Urls.adminAuditLogs, queryParameters: queryParams);
    return response.data as Map<String, dynamic>;
  }
}
