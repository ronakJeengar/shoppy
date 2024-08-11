import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/preferences.dart';

class Api {
  final Dio _dio = Dio();

  static const String basicAuthClientId = "c5eeed0e457e69240fedd7108082dc4e";
  static const String basicAuthClientSecret =
      "6e4dbec0721e0563e9a66ca4dec7e6ce";
  static String auth =
      'Basic ${base64Encode(utf8.encode('$basicAuthClientId:$basicAuthClientSecret'))}';

  Map<String, dynamic> defaultHeader = {
    "Content-Type": "application/json",
    // "Authorization": auth,
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

        if (options.path != Urls.signIn || options.path != Urls.signUp) {
          log("TOKEN ==== $token");
          options.headers["x-auth-token"] = "$token";
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
