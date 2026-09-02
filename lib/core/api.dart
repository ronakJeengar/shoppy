import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/preferences.dart';

class Api {
  final Dio _dio = Dio();

  Map<String, dynamic> defaultHeader = {
    "Content-Type": "application/json",
  };

  Api() {
    _dio.options.baseUrl = Urls.baseUrl;
    _dio.options.headers = defaultHeader;

    _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        String? token = await Preferences.getString('token');

        if (options.path != Urls.signIn && options.path != Urls.signUp) {
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 401) {
          log('response : - ${error.response}');
          // Navigator.pushNamedAndRemoveUntil(
          //   NavigationService.navigatorKey.currentContext!,
          //   SignInScreen.rootName,
          //       (route) => false,
          // );
        }

        return handler.next(error);
      },
    ));
  }

  Future<Response> getRequest(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> postRequest(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> patchRequest(String path, {dynamic data}) async {
    return await _dio.patch(path, data: data);
  }

  Future<Response> putRequest(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  Future<Response> deleteRequest(String path, {dynamic data}) async {
    return await _dio.delete(path, data: data);
  }
}
