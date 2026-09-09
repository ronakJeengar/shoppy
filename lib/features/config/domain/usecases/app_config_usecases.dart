import '../../../../core/utils/result.dart';
import '../entities/app_config_entity.dart';
import '../repositories/app_config_repository.dart';

class GetAppConfigUseCase {
  final AppConfigRepository _repository;

  const GetAppConfigUseCase(this._repository);

  Future<Result<AppConfigEntity>> call({bool forceRefresh = false}) {
    return _repository.fetchAppConfig(forceRefresh: forceRefresh);
  }

  AppConfigEntity? getCached() {
    return _repository.getCachedConfig();
  }
}
