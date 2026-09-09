import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/app_config_entity.dart';
import '../../domain/repositories/app_config_repository.dart';
import '../datasources/app_config_local_datasource.dart';
import '../datasources/app_config_remote_datasource.dart';
import '../models/app_config_model.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final AppConfigRemoteDataSource _remoteDataSource;
  final AppConfigLocalDataSource _localDataSource;
  final String _clientVersion;

  AppConfigRepositoryImpl({
    required AppConfigRemoteDataSource remoteDataSource,
    required AppConfigLocalDataSource localDataSource,
    String clientVersion = '1.0.0',
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _clientVersion = clientVersion;

  @override
  AppConfigEntity? getCachedConfig() {
    try {
      final model = _localDataSource.getCachedConfig();
      return model?.toEntity();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> cacheConfig(AppConfigEntity config) async {
    try {
      final model = AppConfigModel.fromEntity(config);
      await _localDataSource.saveConfig(model);
    } catch (_) {}
  }

  @override
  Future<Result<AppConfigEntity>> fetchAppConfig({bool forceRefresh = false}) async {
    final cachedModel = _localDataSource.getCachedConfig();
    final cachedEtag = forceRefresh ? null : _localDataSource.getCachedEtag();

    try {
      final remoteResult = await _remoteDataSource.fetchBootstrapConfig(
        etag: cachedEtag,
        clientVersion: _clientVersion,
      );

      if (remoteResult.isNotModified && cachedModel != null) {
        return Success(cachedModel.toEntity());
      }

      if (remoteResult.model != null) {
        final newModel = remoteResult.model!;
        await _localDataSource.saveConfig(newModel);
        if (remoteResult.etag != null) {
          await _localDataSource.saveEtag(remoteResult.etag!);
        }
        return Success(newModel.toEntity());
      }

      // Fallback if remote returned empty
      if (cachedModel != null) {
        return Success(cachedModel.toEntity());
      }
      return const Success(AppConfigEntity.defaultConfig);
    } on DioException catch (e) {
      final errorMsg = extractDioErrorMessage(e, 'Failed to fetch remote configuration');
      log('AppConfig fetch failed: $errorMsg, falling back to cache');

      if (cachedModel != null) {
        return Success(cachedModel.toEntity());
      }
      // Safe bootstrap fallback for first launch offline
      return const Success(AppConfigEntity.defaultConfig);
    } catch (e) {
      if (cachedModel != null) {
        return Success(cachedModel.toEntity());
      }
      return const Success(AppConfigEntity.defaultConfig);
    }
  }
}
