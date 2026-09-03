import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/order_model.dart';

class OrderPaginatedResult {
  final List<OrderModel> orders;
  final int page;
  final int limit;
  final int totalOrders;
  final int totalPages;
  final bool hasNextPage;

  OrderPaginatedResult({
    required this.orders,
    required this.page,
    required this.limit,
    required this.totalOrders,
    required this.totalPages,
    required this.hasNextPage,
  });
}

class OrderRepository {
  final Api _api = Api();

  Future<ApiResponse> getOrders({
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'limit': limit,
        if (status != null && status.isNotEmpty) 'status': status,
      };

      final response = await _api.getRequest(
        Urls.orders,
        queryParameters: queryParameters,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final rawList = data['orders'] as List? ?? [];
        final List<OrderModel> orders = [];
        for (final item in rawList) {
          if (item is Map<String, dynamic>) {
            orders.add(OrderModel.fromJson(item));
          }
        }

        final paginatedResult = OrderPaginatedResult(
          orders: orders,
          page: (data['page'] is num) ? (data['page'] as num).toInt() : page,
          limit:
              (data['limit'] is num) ? (data['limit'] as num).toInt() : limit,
          totalOrders: (data['totalOrders'] is num)
              ? (data['totalOrders'] as num).toInt()
              : orders.length,
          totalPages: (data['totalPages'] is num)
              ? (data['totalPages'] as num).toInt()
              : 1,
          hasNextPage: data['hasNextPage'] == true,
        );

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: paginatedResult,
          statusCode: apiResponse.statusCode,
        );
      } else if (apiResponse.status && apiResponse.data is List) {
        // Fallback for flat array response
        final List<OrderModel> orders = [];
        for (final item in apiResponse.data as List) {
          if (item is Map<String, dynamic>) {
            orders.add(OrderModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: OrderPaginatedResult(
            orders: orders,
            page: 1,
            limit: orders.length,
            totalOrders: orders.length,
            totalPages: 1,
            hasNextPage: false,
          ),
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('OrderRepository getOrders DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load order history',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('OrderRepository getOrders error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> getOrderById(String orderId) async {
    try {
      final response = await _api.getRequest('${Urls.orders}/$orderId');
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final order = OrderModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: order,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('OrderRepository getOrderById DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load order details',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('OrderRepository getOrderById error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> cancelOrder(
    String orderId, {
    String? reason,
  }) async {
    try {
      final response = await _api.postRequest(
        '${Urls.orders}/$orderId/cancel',
        data: {
          if (reason != null && reason.isNotEmpty) 'reason': reason,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final data = apiResponse.data as Map<String, dynamic>;
        final orderData = data['order'] is Map<String, dynamic>
            ? data['order'] as Map<String, dynamic>
            : data;
        final order = OrderModel.fromJson(orderData);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: order,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('OrderRepository cancelOrder DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to cancel order',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('OrderRepository cancelOrder error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
