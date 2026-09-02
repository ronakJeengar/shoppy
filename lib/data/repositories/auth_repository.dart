import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/user_model.dart';

class AuthRepository {
  final Api _api = Api();

  Future<ApiResponse> signUp({required User userData}) async {
    try {
      final response = await _api.postRequest(
        Urls.signUp,
        data: {
          'name': userData.name,
          'email': userData.email,
          'password': userData.password,
        },
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AuthRepository signUp error: $e');
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        return ApiResponse.fromJson(e.response!.data);
      }
      return ApiResponse(
        status: false,
        message: e.message ?? 'Registration request failed',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('Unexpected signUp error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> signIn({required Map<String, dynamic> loginData}) async {
    try {
      final response = await _api.postRequest(Urls.signIn, data: loginData);
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AuthRepository signIn error: $e');
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        return ApiResponse.fromJson(e.response!.data);
      }
      return ApiResponse(
        status: false,
        message: e.message ?? 'Login request failed',
        data: null,
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      log('Unexpected signIn error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> getCurrentUser() async {
    try {
      final response = await _api.getRequest(Urls.currentUser);
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AuthRepository getCurrentUser error: $e');
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        return ApiResponse.fromJson(e.response!.data);
      }
      return ApiResponse(
        status: false,
        message: e.message ?? 'Failed to retrieve profile',
        data: null,
        statusCode: e.response?.statusCode ?? 401,
      );
    } catch (e) {
      log('Unexpected getCurrentUser error: $e');
      return ApiResponse(status: false, message: e.toString(), data: null);
    }
  }

  Future<ApiResponse> refreshToken({required String refreshToken}) async {
    try {
      final response = await _api.postRequest(
        Urls.refreshToken,
        data: {'refreshToken': refreshToken},
      );
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AuthRepository refreshToken error: $e');
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        return ApiResponse.fromJson(e.response!.data);
      }
      return ApiResponse(
        status: false,
        message: e.message ?? 'Failed to refresh token',
        data: null,
        statusCode: e.response?.statusCode ?? 401,
      );
    }
  }

  Future<ApiResponse> logout() async {
    try {
      final response = await _api.postRequest(Urls.logout);
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      log('AuthRepository logout error: $e');
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        return ApiResponse.fromJson(e.response!.data);
      }
      return ApiResponse(
        status: true,
        message: 'Logged out locally',
        data: null,
      );
    }
  }
}
