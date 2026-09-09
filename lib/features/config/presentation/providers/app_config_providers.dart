import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/app_config_local_datasource.dart';
import '../../data/datasources/app_config_remote_datasource.dart';
import '../../data/repositories/app_config_repository_impl.dart';
import '../../domain/entities/app_config_entity.dart';
import '../../domain/repositories/app_config_repository.dart';
import '../../domain/usecases/app_config_usecases.dart';

@immutable
class AppConfigState {
  final bool isLoading;
  final bool isInitialized;
  final AppConfigEntity config;
  final String? errorMessage;

  const AppConfigState({
    this.isLoading = false,
    this.isInitialized = false,
    this.config = AppConfigEntity.defaultConfig,
    this.errorMessage,
  });

  bool get isMaintenance => config.maintenance.enabled;
  bool get isForceUpdateRequired => config.appVersion.forceUpdateRequired;
  bool get isOptionalUpdateAvailable => config.appVersion.optionalUpdateAvailable;

  AppConfigState copyWith({
    bool? isLoading,
    bool? isInitialized,
    AppConfigEntity? config,
    String? errorMessage,
  }) {
    return AppConfigState(
      isLoading: isLoading ?? this.isLoading,
      isInitialized: isInitialized ?? this.isInitialized,
      config: config ?? this.config,
      errorMessage: errorMessage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isInitialized == other.isInitialized &&
          config == other.config &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(isLoading, isInitialized, config, errorMessage);
}

class AppConfigNotifier extends StateNotifier<AppConfigState> {
  final GetAppConfigUseCase _useCase;

  AppConfigNotifier(this._useCase)
      : super(AppConfigState(
          config: _useCase.getCached() ?? AppConfigEntity.defaultConfig,
          isInitialized: true,
          isLoading: true,
        )) {
    refreshConfig();
  }

  Future<void> refreshConfig({bool forceRefresh = false}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _useCase(forceRefresh: forceRefresh);

    result.fold(
      onSuccess: (newConfig) {
        state = state.copyWith(
          config: newConfig,
          isLoading: false,
          isInitialized: true,
          errorMessage: null,
        );
      },
      onFailure: (failure) {
        state = state.copyWith(
          isLoading: false,
          isInitialized: true,
          errorMessage: failure.message,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Dependency Injection Providers
// ---------------------------------------------------------------------------

final appConfigLocalDataSourceProvider =
    Provider<AppConfigLocalDataSource>((ref) {
  return AppConfigLocalDataSourceImpl();
});

final appConfigRemoteDataSourceProvider =
    Provider<AppConfigRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AppConfigRemoteDataSourceImpl(apiClient);
});

final appConfigRepositoryProvider = Provider<AppConfigRepository>((ref) {
  final remote = ref.watch(appConfigRemoteDataSourceProvider);
  final local = ref.watch(appConfigLocalDataSourceProvider);
  return AppConfigRepositoryImpl(
    remoteDataSource: remote,
    localDataSource: local,
  );
});

final getAppConfigUseCaseProvider = Provider<GetAppConfigUseCase>((ref) {
  final repo = ref.watch(appConfigRepositoryProvider);
  return GetAppConfigUseCase(repo);
});

final appConfigNotifierProvider =
    StateNotifierProvider<AppConfigNotifier, AppConfigState>((ref) {
  final useCase = ref.watch(getAppConfigUseCaseProvider);
  return AppConfigNotifier(useCase);
});

// ---------------------------------------------------------------------------
// Convenience Selector Providers
// ---------------------------------------------------------------------------

final appConfigProvider = Provider<AppConfigEntity>((ref) {
  return ref.watch(appConfigNotifierProvider).config;
});

final featureFlagsProvider = Provider<FeatureFlagsEntity>((ref) {
  return ref.watch(appConfigProvider).features;
});

final maintenanceConfigProvider = Provider<MaintenanceConfigEntity>((ref) {
  return ref.watch(appConfigProvider).maintenance;
});

final isMaintenanceModeProvider = Provider<bool>((ref) {
  return ref.watch(maintenanceConfigProvider).enabled;
});

final appVersionCompatibilityProvider = Provider<AppVersionEntity>((ref) {
  return ref.watch(appConfigProvider).appVersion;
});

final forceUpdateRequiredProvider = Provider<bool>((ref) {
  return ref.watch(appVersionCompatibilityProvider).forceUpdateRequired;
});

final homeSectionsProvider = Provider<List<HomeSectionEntity>>((ref) {
  final sections = ref.watch(appConfigProvider).ui.homeSections;
  final enabledSections = sections.where((s) => s.enabled).toList()
    ..sort((a, b) => a.order.compareTo(b.order));
  return enabledSections;
});
