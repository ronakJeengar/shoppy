import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/cart_model.dart';

class CartRepository {
  final Api _api = Api();

  Future<ApiResponse> getCart() async {
    try {
      final response = await _api.getRequest(Urls.cart);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final cart = CartModel.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: cart,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CartRepository getCart DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ?? e.message ?? 'Failed to load cart',
        data: CartModel.empty(),
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CartRepository getCart error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: CartModel.empty(),
      );
    }
  }

  Future<ApiResponse> addItem(String productId, {int quantity = 1}) async {
    try {
      final response = await _api.postRequest(
        Urls.cartItems,
        data: {
          'productId': productId,
          'quantity': quantity,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final cart = CartModel.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: cart,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CartRepository addItem DioException: $e');
      final msg = e.response?.data?['message'] ??
          e.message ??
          'Failed to add item to cart';
      return ApiResponse(
        status: false,
        message: msg,
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CartRepository addItem error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  Future<ApiResponse> updateQuantity(String productId, int quantity) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.cartItems}/$productId',
        data: {'quantity': quantity},
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final cart = CartModel.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: cart,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CartRepository updateQuantity DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update item quantity',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CartRepository updateQuantity error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  Future<ApiResponse> removeItem(String productId) async {
    try {
      final response = await _api.deleteRequest('${Urls.cartItems}/$productId');
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final cart = CartModel.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: cart,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CartRepository removeItem DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to remove item from cart',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CartRepository removeItem error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  Future<ApiResponse> clearCart() async {
    try {
      final response = await _api.deleteRequest(Urls.cart);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final cart = CartModel.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: cart,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CartRepository clearCart DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to clear cart',
        data: CartModel.empty(),
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CartRepository clearCart error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: CartModel.empty(),
      );
    }
  }
}
