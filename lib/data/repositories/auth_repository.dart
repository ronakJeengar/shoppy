import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/user_model.dart';

class AuthRepository {
  final _api = Api();

  Future<ApiResponse> signUp({required User userData}) async {
    try {
      Response response =
          await _api.postRequest(Urls.signUp, data: userData.toJson());
      ApiResponse apiResponse;
      Map<String, dynamic> responseBody = response.data;
      apiResponse = ApiResponse.fromJson(responseBody);
      return apiResponse;
    } on DioException catch (e) {
      log('exception is :- $e');
      rethrow;
    }
  }

  Future<ApiResponse> signIn({required Map<String, dynamic> loginData}) async {
    try {
      Response response = await _api.postRequest(Urls.signIn, data: loginData);
      ApiResponse apiResponse;
      Map<String, dynamic> responseData = response.data;

      apiResponse = ApiResponse.fromJson(responseData);
      return apiResponse;
    } on DioException catch (e) {
      log('exception is :- $e');
      rethrow;
    }
  }

  Future<ApiResponse> getCurrentUser() async {
    try {
      Response response = await _api.getRequest(Urls.currentUser);
      ApiResponse apiResponse;
      Map<String, dynamic> responseData = response.data;
      apiResponse = ApiResponse.fromJson(responseData);
      return apiResponse;
    } on DioException catch (e) {
      log('exception is :- $e');
      rethrow;
    }
  }
}
