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
        String? token = Preferences.getAccessToken() ?? await Preferences.getString('token');

        if (options.path != Urls.signIn &&
            options.path != Urls.signUp &&
            options.path != Urls.refreshToken) {
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401 &&
            error.requestOptions.path != Urls.signIn &&
            error.requestOptions.path != Urls.signUp &&
            error.requestOptions.path != Urls.refreshToken &&
            error.requestOptions.extra['retry'] != true) {
          error.requestOptions.extra['retry'] = true;
          final refreshToken = Preferences.getRefreshToken();

          if (refreshToken != null && refreshToken.isNotEmpty) {
            try {
              final refreshDio = Dio(BaseOptions(baseUrl: Urls.baseUrl));
              final refreshResponse = await refreshDio.post(
                Urls.refreshToken,
                data: {'refreshToken': refreshToken},
              );

              if (refreshResponse.statusCode == 200 &&
                  refreshResponse.data?['data']?['accessToken'] != null) {
                final newAccessToken =
                    refreshResponse.data['data']['accessToken'] as String;
                final newRefreshToken =
                    refreshResponse.data['data']['refreshToken'] as String?;

                await Preferences.saveTokens(
                  accessToken: newAccessToken,
                  refreshToken: newRefreshToken,
                );

                error.requestOptions.headers["Authorization"] =
                    "Bearer $newAccessToken";
                final response = await _dio.fetch(error.requestOptions);
                return handler.resolve(response);
              }
            } catch (refreshError) {
              log('Automatic token refresh failed: $refreshError');
              await Preferences.clearAuth();
            }
          }
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
