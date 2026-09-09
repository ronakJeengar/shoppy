import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../models/app_config_model.dart';

class AppConfigRemoteResult {
  final AppConfigModel? model;
  final String? etag;
  final bool isNotModified;

  const AppConfigRemoteResult({
    this.model,
    this.etag,
    this.isNotModified = false,
  });
}

abstract class AppConfigRemoteDataSource {
  Future<AppConfigRemoteResult> fetchBootstrapConfig({
    String? etag,
    String clientVersion = '1.0.0',
  });
}

class AppConfigRemoteDataSourceImpl implements AppConfigRemoteDataSource {
  final ApiClient _client;

  AppConfigRemoteDataSourceImpl(this._client);

  @override
  Future<AppConfigRemoteResult> fetchBootstrapConfig({
    String? etag,
    String clientVersion = '1.0.0',
  }) async {
    final headers = <String, dynamic>{
      'X-App-Version': clientVersion,
    };
    if (etag != null && etag.isNotEmpty) {
      headers['If-None-Match'] = etag;
    }

    try {
      final response = await _client.dio.get(
        ApiEndpoints.appBootstrap,
        queryParameters: {'clientVersion': clientVersion},
        options: Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status < 300 || status == 304),
        ),
      );

      if (response.statusCode == 304) {
        return AppConfigRemoteResult(
          etag: etag,
          isNotModified: true,
        );
      }

      final responseEtag = response.headers.value('etag') ?? response.headers.value('ETag');
      final data = response.data is Map<String, dynamic>
          ? (response.data['data'] as Map<String, dynamic>? ?? response.data as Map<String, dynamic>)
          : <String, dynamic>{};

      final model = AppConfigModel.fromJson(data);
      return AppConfigRemoteResult(
        model: model,
        etag: responseEtag,
        isNotModified: false,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 304) {
        return AppConfigRemoteResult(
          etag: etag,
          isNotModified: true,
        );
      }
      rethrow;
    }
  }
}
