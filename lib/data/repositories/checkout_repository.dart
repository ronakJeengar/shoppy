import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/checkout_validation_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/payment_model.dart';

class CheckoutRepository {
  final Api _api = Api();

  Future<ApiResponse> validateCheckout(
    String addressId, {
    String shippingMethod = 'STANDARD',
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.checkoutValidate,
        data: {
          'addressId': addressId,
          'shippingMethod': shippingMethod,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final validation = CheckoutValidationModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: validation,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CheckoutRepository validateCheckout DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to validate checkout',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CheckoutRepository validateCheckout error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> createOrder({
    required String addressId,
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    String? idempotencyKey,
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.checkoutCreate,
        data: {
          'addressId': addressId,
          'shippingMethod': shippingMethod,
          'paymentMethod': paymentMethod,
          if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final rawData = apiResponse.data as Map<String, dynamic>;
        final order = OrderModel.fromJson(
          rawData['order'] as Map<String, dynamic>,
        );
        PaymentModel? payment;
        if (rawData['payment'] is Map<String, dynamic>) {
          payment = PaymentModel.fromJson(
            rawData['payment'] as Map<String, dynamic>,
          );
        }

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: {'order': order, 'payment': payment},
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CheckoutRepository createOrder DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to create order',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CheckoutRepository createOrder error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> verifyPayment(
    String transactionId, {
    String? signature,
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.paymentsVerify,
        data: {
          'transactionId': transactionId,
          if (signature != null) 'signature': signature,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioException catch (e) {
      log('CheckoutRepository verifyPayment DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Payment verification failed',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CheckoutRepository verifyPayment error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> failPayment(
    String transactionId, {
    String? reason,
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.paymentsFail,
        data: {
          'transactionId': transactionId,
          if (reason != null) 'reason': reason,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioException catch (e) {
      log('CheckoutRepository failPayment DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to record payment cancellation',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CheckoutRepository failPayment error: $e');
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
      log('CheckoutRepository getOrderById DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load order receipt',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CheckoutRepository getOrderById error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
