import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/models/api_response.dart';

class AddressRepository {
  final Api _api = Api();

  Future<ApiResponse> getAddresses() async {
    try {
      final response = await _api.getRequest(Urls.addresses);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is List) {
        final List<AddressModel> addresses = [];
        for (final item in apiResponse.data as List) {
          if (item is Map<String, dynamic>) {
            addresses.add(AddressModel.fromJson(item));
          }
        }
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: addresses,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AddressRepository getAddresses DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to load delivery addresses',
        data: <AddressModel>[],
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('AddressRepository getAddresses error: $e');
      return ApiResponse(
        status: false,
        message: e.toString(),
        data: <AddressModel>[],
      );
    }
  }

  Future<ApiResponse> createAddress(Map<String, dynamic> addressData) async {
    try {
      final response = await _api.postRequest(
        Urls.addresses,
        data: addressData,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final address = AddressModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: address,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AddressRepository createAddress DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to add address',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('AddressRepository createAddress error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> updateAddress(
    String id,
    Map<String, dynamic> addressData,
  ) async {
    try {
      final response = await _api.patchRequest(
        '${Urls.addresses}/$id',
        data: addressData,
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final address = AddressModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: address,
          statusCode: apiResponse.statusCode,
        );
      }
      return apiResponse;
    } on DioException catch (e) {
      log('AddressRepository updateAddress DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to update address',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('AddressRepository updateAddress error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> deleteAddress(String id) async {
    try {
      final response = await _api.deleteRequest('${Urls.addresses}/$id');
      final apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioException catch (e) {
      log('AddressRepository deleteAddress DioException: $e');
      return ApiResponse(
        status: false,
        message: e.response?.data?['message'] ??
            e.message ??
            'Failed to delete address',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('AddressRepository deleteAddress error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }
}
