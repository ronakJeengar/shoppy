import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/campaign_model.dart';

abstract class CampaignRemoteDataSource {
  Future<List<CampaignModel>> getActiveCampaigns({
    int limit = 10,
    String? type,
  });
}

class CampaignRemoteDataSourceImpl implements CampaignRemoteDataSource {
  final ApiClient _client;

  CampaignRemoteDataSourceImpl(this._client);

  @override
  Future<List<CampaignModel>> getActiveCampaigns({
    int limit = 10,
    String? type,
  }) async {
    final queryParameters = <String, dynamic>{
      'limit': limit,
      if (type != null && type.isNotEmpty) 'type': type,
    };

    final response = await _client.get(
      Urls.campaignsActive,
      queryParameters: queryParameters,
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);
    final rawList = map is Map<String, dynamic>
        ? (map['items'] ?? map['campaigns'] ?? [])
        : (map is List ? map : []);

    final List<CampaignModel> campaigns = [];
    if (rawList is List) {
      for (final item in rawList) {
        if (item is Map<String, dynamic>) {
          campaigns.add(CampaignModel.fromJson(item));
        }
      }
    }
    return campaigns;
  }
}
