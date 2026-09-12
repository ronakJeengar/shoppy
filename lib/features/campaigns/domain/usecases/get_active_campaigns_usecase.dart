import '../../../../core/utils/result.dart';
import '../entities/campaign_entity.dart';
import '../repositories/campaign_repository.dart';

class GetActiveCampaignsUseCase {
  final CampaignRepository _repository;

  GetActiveCampaignsUseCase(this._repository);

  Future<Result<List<CampaignEntity>>> call({
    int limit = 10,
    String? type,
  }) {
    return _repository.getActiveCampaigns(limit: limit, type: type);
  }
}
