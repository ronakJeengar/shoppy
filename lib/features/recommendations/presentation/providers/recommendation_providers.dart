import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../data/models/recommendation_model.dart';
import '../../data/datasources/recommendation_remote_datasource.dart';
import '../../data/repositories/recommendation_repository_impl.dart';
import '../../domain/repositories/recommendation_repository.dart';
import '../../domain/usecases/recommendation_usecases.dart';

final recommendationRemoteDataSourceProvider =
    Provider<RecommendationRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return RecommendationRemoteDataSourceImpl(client);
});

final recommendationRepositoryProvider =
    Provider<RecommendationRepository>((ref) {
  final remote = ref.watch(recommendationRemoteDataSourceProvider);
  return RecommendationRepositoryImpl(remote);
});

final getRecommendationsUseCaseProvider =
    Provider<GetRecommendationsUseCase>((ref) {
  return GetRecommendationsUseCase(ref.watch(recommendationRepositoryProvider));
});

final trackEventUseCaseProvider = Provider<TrackEventUseCase>((ref) {
  return TrackEventUseCase(ref.watch(recommendationRepositoryProvider));
});

final personalizedRecommendationsProvider =
    FutureProvider<RecommendationResponseModel>((ref) async {
  final useCase = ref.watch(getRecommendationsUseCaseProvider);
  final result = await useCase(type: 'PERSONALIZED', limit: 10);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

final trendingRecommendationsProvider =
    FutureProvider<RecommendationResponseModel>((ref) async {
  final useCase = ref.watch(getRecommendationsUseCaseProvider);
  final result = await useCase(type: 'TRENDING', limit: 10);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

final frequentlyBoughtTogetherProvider =
    FutureProvider.family<RecommendationResponseModel, String>(
        (ref, productId) async {
  final useCase = ref.watch(getRecommendationsUseCaseProvider);
  final result = await useCase(
    type: 'FREQUENTLY_BOUGHT_TOGETHER',
    productId: productId,
    limit: 6,
  );
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});
