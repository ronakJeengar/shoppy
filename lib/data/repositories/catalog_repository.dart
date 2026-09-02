import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/category_model.dart';
import 'package:shopp_app/data/models/product_model.dart';

class CatalogRepository {
  final Api _api = Api();

  Future<ApiResponse> getCategories() async {
    try {
      final response = await _api.getRequest(Urls.categories);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is List) {
        final List<CategoryModel> categories = (apiResponse.data as List)
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: categories,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CatalogRepository getCategories DioException: $e');
      return ApiResponse(
        status: false,
        message: e.message ?? 'Failed to load categories',
        data: <CategoryModel>[],
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CatalogRepository getCategories error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: <CategoryModel>[],
      );
    }
  }

  Future<ApiResponse> getProducts({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? search,
    String? sort,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'page': page,
        'limit': limit,
      };

      if (categoryId != null && categoryId.isNotEmpty) {
        queryParams['category'] = categoryId;
      }
      if (search != null && search.trim().isNotEmpty) {
        queryParams['search'] = search.trim();
      }
      if (sort != null && sort.isNotEmpty) {
        queryParams['sort'] = sort;
      }

      final response = await _api.getRequest(
        Urls.products,
        queryParameters: queryParams,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final rawData = apiResponse.data as Map<String, dynamic>;
        final List<Product> products = [];

        if (rawData['products'] is List) {
          for (final item in rawData['products'] as List) {
            if (item is Map<String, dynamic>) {
              products.add(Product.fromJson(item));
            }
          }
        }

        final pagination = rawData['pagination'] as Map<String, dynamic>? ?? {};

        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: {
            'products': products,
            'pagination': pagination,
          },
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      log('CatalogRepository getProducts DioException: $e');
      return ApiResponse(
        status: false,
        message: e.message ?? 'Failed to load products',
        data: {
          'products': <Product>[],
          'pagination': {},
        },
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CatalogRepository getProducts error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: {
          'products': <Product>[],
          'pagination': {},
        },
      );
    }
  }

  Future<ApiResponse> getProductById(String id) async {
    try {
      final response = await _api.getRequest('${Urls.products}/$id');
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final product = Product.fromJson(apiResponse.data as Map<String, dynamic>);
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: product,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('CatalogRepository getProductById DioException: $e');
      return ApiResponse(
        status: false,
        message: e.message ?? 'Failed to load product details',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('CatalogRepository getProductById error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }
}
