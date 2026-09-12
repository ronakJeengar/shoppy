import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/campaign_remote_datasource.dart';
import '../../data/repositories/campaign_repository_impl.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/repositories/campaign_repository.dart';
import '../../domain/usecases/get_active_campaigns_usecase.dart';

/// Data Source Provider
final campaignRemoteDataSourceProvider =
    Provider<CampaignRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return CampaignRemoteDataSourceImpl(client);
});

/// Repository Provider
final campaignRepositoryProvider = Provider<CampaignRepository>((ref) {
  final remote = ref.watch(campaignRemoteDataSourceProvider);
  return CampaignRepositoryImpl(remote);
});

/// Use Case Provider
final getActiveCampaignsUseCaseProvider =
    Provider<GetActiveCampaignsUseCase>((ref) {
  return GetActiveCampaignsUseCase(ref.watch(campaignRepositoryProvider));
});

/// Active Campaigns FutureProvider (for Home & Promo sections)
final activeCampaignsProvider =
    FutureProvider.autoDispose<List<CampaignEntity>>((ref) async {
  final useCase = ref.watch(getActiveCampaignsUseCaseProvider);
  final result = await useCase(limit: 10);
  return result.fold(
    onSuccess: (campaigns) => campaigns,
    onFailure: (failure) => throw failure.message,
  );
});
