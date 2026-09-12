import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/repositories/campaign_repository.dart';
import '../datasources/campaign_remote_datasource.dart';
import '../mappers/campaign_mappers.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  final CampaignRemoteDataSource _remoteDataSource;

  CampaignRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<CampaignEntity>>> getActiveCampaigns({
    int limit = 10,
    String? type,
  }) async {
    try {
      final models = await _remoteDataSource.getActiveCampaigns(
        limit: limit,
        type: type,
      );
      return Success(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to fetch active campaigns');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
