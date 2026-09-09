import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constants/urls.dart';
import '../preferences.dart';

/// Centralized API HTTP Client for network requests.
class ApiClient {
  final Dio dio;

  ApiClient({Dio? customDio}) : dio = customDio ?? Dio() {
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        String? token =
            Preferences.getAccessToken() ?? await Preferences.getString('token');

        if (options.path != Urls.signIn &&
            options.path != Urls.signUp &&
            options.path != Urls.refreshToken) {
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
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

                error.requestOptions.headers['Authorization'] =
                    'Bearer $newAccessToken';
                final response = await dio.fetch(error.requestOptions);
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

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}

/// Global provider for ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
