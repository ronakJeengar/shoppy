import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/admin_dashboard_model.dart';
import '../models/admin_user_model.dart';
import '../models/audit_log_model.dart';
import '../../../catalog/data/models/product_model.dart';
import '../../../catalog/data/models/category_model.dart';
import '../../../orders/data/models/order_model.dart';
import '../../../reviews/data/models/review_model.dart';

abstract class AdminRemoteDataSource {
  Future<AdminDashboardMetricsModel> getDashboardMetrics();

  Future<List<ProductModel>> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  });

  Future<List<CategoryModel>> getAdminCategories();

  Future<ProductModel> createProduct(Map<String, dynamic> data);
  Future<ProductModel> updateProduct(String id, Map<String, dynamic> data);
  Future<ProductModel> updateProductStock(String id, int quantity, String operation);
  Future<void> deleteProduct(String id);

  Future<List<OrderModel>> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  });

  Future<OrderModel> updateOrderStatus(
    String id, {
    required String status,
    String? trackingNumber,
    String? carrier,
    String? note,
  });

  Future<List<AdminUserModel>> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? role,
    String? search,
  });

  Future<AdminUserModel> updateUserRole(String id, String role);
  Future<AdminUserModel> toggleUserStatus(String id, bool isActive);

  Future<List<AdminReviewModel>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? status,
    String? search,
  });

  Future<bool> updateAdminReviewStatus(
    String reviewId, {
    required String status,
    String? reason,
  });

  Future<void> deleteAdminReview(String id);

  Future<List<AuditLogModel>> getAuditLogs({
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
  Future<AdminDashboardMetricsModel> getDashboardMetrics() async {
    final response = await _client.get(Urls.adminDashboard);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return AdminDashboardMetricsModel.fromJson(map);
  }

  @override
  Future<List<ProductModel>> getAdminProducts({
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
    final response = await _client.get(Urls.adminProducts, queryParameters: queryParams);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData);
    final rawList = map is Map && map['products'] is List
        ? map['products'] as List
        : (map is List ? map : []);
    return rawList
        .whereType<Map<String, dynamic>>()
        .map((p) => ProductModel.fromJson(p))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getAdminCategories() async {
    final response = await _client.get(Urls.adminCategories);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData);
    final rawList = map is Map && map['categories'] is List
        ? map['categories'] as List
        : (map is List ? map : []);
    return rawList
        .whereType<Map<String, dynamic>>()
        .map((c) => CategoryModel.fromJson(c))
        .toList();
  }

  @override
  Future<ProductModel> createProduct(Map<String, dynamic> data) async {
    final response = await _client.post(Urls.adminProducts, data: data);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return ProductModel.fromJson(map);
  }

  @override
  Future<ProductModel> updateProduct(String id, Map<String, dynamic> data) async {
    final response = await _client.patch('${Urls.adminProducts}/$id', data: data);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return ProductModel.fromJson(map);
  }

  @override
  Future<ProductModel> updateProductStock(String id, int quantity, String operation) async {
    final response = await _client.patch(
      '${Urls.adminProducts}/$id/stock',
      data: {'quantity': quantity, 'operation': operation},
    );
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return ProductModel.fromJson(map);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _client.delete('${Urls.adminProducts}/$id');
  }

  @override
  Future<List<OrderModel>> getAdminOrders({
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
    final response = await _client.get(Urls.adminOrders, queryParameters: queryParams);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData);
    final rawList = map is Map && map['orders'] is List
        ? map['orders'] as List
        : (map is List ? map : []);
    return rawList
        .whereType<Map<String, dynamic>>()
        .map((o) => OrderModel.fromJson(o))
        .toList();
  }

  @override
  Future<OrderModel> updateOrderStatus(
    String id, {
    required String status,
    String? trackingNumber,
    String? carrier,
    String? note,
  }) async {
    final response = await _client.patch(
      '${Urls.adminOrders}/$id/status',
      data: {
        'status': status,
        if (trackingNumber != null) 'trackingNumber': trackingNumber,
        if (carrier != null) 'carrier': carrier,
        if (note != null) 'note': note,
      },
    );
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData)
        as Map<String, dynamic>;
    return OrderModel.fromJson(map);
  }

  @override
  Future<List<AdminUserModel>> getAdminUsers({
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
    final response = await _client.get(Urls.adminUsers, queryParameters: queryParams);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData);
    final rawList = map is Map && map['users'] is List
        ? map['users'] as List
        : (map is List ? map : []);
    return rawList
        .whereType<Map<String, dynamic>>()
        .map((u) => AdminUserModel.fromJson(u))
        .toList();
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
  Future<List<AdminReviewModel>> getAdminReviews({
    int page = 1,
    int limit = 20,
    int? rating,
    String? status,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (rating != null) 'rating': rating,
      if (status != null && status.isNotEmpty) 'status': status,
      if (search != null && search.isNotEmpty) 'search': search,
    };
    final response = await _client.get(Urls.adminReviews, queryParameters: queryParams);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData);
    final rawList = map is Map && map['reviews'] is List
        ? map['reviews'] as List
        : (map is List ? map : []);
    return rawList
        .whereType<Map<String, dynamic>>()
        .map((r) => AdminReviewModel.fromJson(r))
        .toList();
  }

  @override
  Future<bool> updateAdminReviewStatus(
    String reviewId, {
    required String status,
    String? reason,
  }) async {
    final response = await _client.patch(
      '${Urls.adminReviews}/$reviewId/status',
      data: {
        'status': status,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
      },
    );
    final resData = response.data;
    if (resData is Map<String, dynamic>) {
      return resData['status'] == true || resData['success'] == true;
    }
    return true;
  }

  @override
  Future<void> deleteAdminReview(String id) async {
    await _client.delete('${Urls.adminReviews}/$id');
  }

  @override
  Future<List<AuditLogModel>> getAuditLogs({
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
    final response = await _client.get(Urls.adminAuditLogs, queryParameters: queryParams);
    final resData = response.data;
    final map = (resData is Map<String, dynamic> ? (resData['data'] ?? resData) : resData);
    final rawList = map is Map && map['logs'] is List
        ? map['logs'] as List
        : (map is List ? map : []);
    return rawList
        .whereType<Map<String, dynamic>>()
        .map((l) => AuditLogModel.fromJson(l))
        .toList();
  }
}
