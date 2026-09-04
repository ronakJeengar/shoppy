import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/admin_dashboard_model.dart';
import 'package:shopp_app/data/models/admin_user_model.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/audit_log_model.dart';
import 'package:shopp_app/data/models/category_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/product_model.dart';

class AdminRepository {
  final Api _api = Api();

  // 1. Dashboard
  Future<ApiResponse> getDashboardMetrics() async {
    try {
      final response = await _api.getRequest(Urls.adminDashboard);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final metrics = AdminDashboardMetrics.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: metrics,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository getDashboardMetrics error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load dashboard metrics',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 2. Products
  Future<ApiResponse> getAdminProducts({
    int page = 1,
    int limit = 20,
    String? search,
    String? category,
    String? status,
    bool? lowStock,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
        if (category != null && category.isNotEmpty) 'category': category,
        if (status != null && status.isNotEmpty) 'status': status,
        if (lowStock == true) 'lowStock': true,
      };

      final response = await _api.getRequest(
        Urls.adminProducts,
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawList = data['products'] as List? ?? [];
        final products = <Product>[];
        for (final item in rawList) {
          if (item is Map<String, dynamic>) {
            products.add(Product.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: products,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository getAdminProducts error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load products',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> createProduct(Map<String, dynamic> data) async {
    try {
      final response = await _api.postRequest(Urls.adminProducts, data: data);
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final product =
            Product.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: product,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository createProduct error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to create product',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateProduct(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final response =
          await _api.patchRequest('${Urls.adminProducts}/$id', data: data);
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final product =
            Product.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: product,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository updateProduct error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update product',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateProductStock(
    String id,
    int quantity,
    String operation,
  ) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.adminProducts}/$id/stock',
        data: {'quantity': quantity, 'operation': operation},
      );
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final product =
            Product.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: product,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository updateProductStock error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to adjust stock',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> deleteProduct(String id) async {
    try {
      final response = await _api.deleteRequest('${Urls.adminProducts}/$id');
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AdminRepository deleteProduct error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to delete product',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 3. Categories
  Future<ApiResponse> getAdminCategories() async {
    try {
      final response = await _api.getRequest(Urls.adminCategories);
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is List) {
        final list = <CategoryModel>[];
        for (final item in apiResponse.data as List) {
          if (item is Map<String, dynamic>) {
            list.add(CategoryModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: list,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository getAdminCategories error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load categories',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> createCategory(String name) async {
    try {
      final response = await _api.postRequest(
        Urls.adminCategories,
        data: {'name': name},
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AdminRepository createCategory error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to create category',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> deleteCategory(String id) async {
    try {
      final response = await _api.deleteRequest('${Urls.adminCategories}/$id');
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AdminRepository deleteCategory error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to delete category',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 4. Orders
  Future<ApiResponse> getAdminOrders({
    int page = 1,
    int limit = 20,
    String? status,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (status != null && status.isNotEmpty) 'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final response = await _api.getRequest(
        Urls.adminOrders,
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawList = data['orders'] as List? ?? [];
        final orders = <OrderModel>[];
        for (final item in rawList) {
          if (item is Map<String, dynamic>) {
            orders.add(OrderModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: orders,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository getAdminOrders error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load orders',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateOrderStatus(
    String id, {
    required String status,
    String? carrier,
    String? trackingNumber,
    String? note,
  }) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.adminOrders}/$id/status',
        data: {
          'status': status,
          if (carrier != null) 'carrier': carrier,
          if (trackingNumber != null) 'trackingNumber': trackingNumber,
          if (note != null) 'note': note,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);
      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final order =
            OrderModel.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: order,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository updateOrderStatus error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update order status',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 5. Users
  Future<ApiResponse> getAdminUsers({
    int page = 1,
    int limit = 20,
    String? search,
    String? role,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
        if (role != null && role.isNotEmpty) 'role': role,
      };

      final response = await _api.getRequest(
        Urls.adminUsers,
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawList = data['users'] as List? ?? [];
        final users = <AdminUserModel>[];
        for (final item in rawList) {
          if (item is Map<String, dynamic>) {
            users.add(AdminUserModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: users,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository getAdminUsers error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load users',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateUserStatus(String id, bool isActive) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.adminUsers}/$id/status',
        data: {'isActive': isActive},
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AdminRepository updateUserStatus error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update user status',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateUserRole(String id, String role) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.adminUsers}/$id/role',
        data: {'role': role},
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AdminRepository updateUserRole error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update user role',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  // 6. Audit Logs
  Future<ApiResponse> getAuditLogs({
    int page = 1,
    int limit = 20,
    String? action,
    String? resourceType,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (action != null && action.isNotEmpty) 'action': action,
        if (resourceType != null && resourceType.isNotEmpty)
          'resourceType': resourceType,
      };

      final response = await _api.getRequest(
        Urls.adminAuditLogs,
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawList = data['logs'] as List? ?? [];
        final logs = <AuditLogModel>[];
        for (final item in rawList) {
          if (item is Map<String, dynamic>) {
            logs.add(AuditLogModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: logs,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AdminRepository getAuditLogs error: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load audit logs',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
