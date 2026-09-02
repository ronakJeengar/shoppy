import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/product_model.dart';

class WishlistRepository {
  final Api _api = Api();

  Future<ApiResponse> getWishlist() async {
    try {
      final response = await _api.getRequest(Urls.wishlist);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final rawData = apiResponse.data as Map<String, dynamic>;
        final List<Product> products = [];
        if (rawData['items'] is List) {
          for (final item in rawData['items'] as List) {
            if (item is Map<String, dynamic>) {
              products.add(Product.fromJson(item));
            }
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
      log('WishlistRepository getWishlist DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load wishlist',
        data: <Product>[],
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('WishlistRepository getWishlist error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: <Product>[],
      );
    }
  }

  Future<ApiResponse> toggleWishlist(String productId) async {
    try {
      final response = await _api.postRequest(
        Urls.wishlistToggle,
        data: {'productId': productId},
      );
      final apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioException catch (e) {
      log('WishlistRepository toggleWishlist DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update wishlist',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('WishlistRepository toggleWishlist error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  Future<ApiResponse> removeFromWishlist(String productId) async {
    try {
      final response = await _api.deleteRequest('${Urls.wishlist}/$productId');
      final apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioException catch (e) {
      log('WishlistRepository removeFromWishlist DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to remove product from wishlist',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('WishlistRepository removeFromWishlist error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }
}
