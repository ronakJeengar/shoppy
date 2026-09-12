import '../../../../core/utils/result.dart';
import '../entities/campaign_entity.dart';

abstract class CampaignRepository {
  Future<Result<List<CampaignEntity>>> getActiveCampaigns({
    int limit = 10,
    String? type,
  });
}
