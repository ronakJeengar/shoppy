import '../../../../core/utils/result.dart';
import '../entities/app_config_entity.dart';

abstract class AppConfigRepository {
  /// Fetches application bootstrap configuration from backend with ETag caching,
  /// falling back to locally cached configuration or default config if offline.
  Future<Result<AppConfigEntity>> fetchAppConfig({bool forceRefresh = false});

  /// Reads synchronously or from local storage the last valid cached configuration.
  AppConfigEntity? getCachedConfig();

  /// Persists valid configuration to local storage.
  Future<void> cacheConfig(AppConfigEntity config);
}
