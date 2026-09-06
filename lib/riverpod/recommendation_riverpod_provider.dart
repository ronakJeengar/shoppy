import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/recommendation_model.dart';
import 'package:shopp_app/data/repositories/recommendation_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';
import 'package:shopp_app/riverpod/di_providers.dart';

export 'di_providers.dart';

class RecommendationsState {
  final UiState<List<RecommendedProduct>> personalizedState;
  final UiState<List<RecommendedProduct>> trendingState;
  final String personalizedReason;
  final String trendingReason;

  const RecommendationsState({
    this.personalizedState = const UiState.initial(),
    this.trendingState = const UiState.initial(),
    this.personalizedReason = 'Recommended for you',
    this.trendingReason = 'Trending now',
  });

  RecommendationsState copyWith({
    UiState<List<RecommendedProduct>>? personalizedState,
    UiState<List<RecommendedProduct>>? trendingState,
    String? personalizedReason,
    String? trendingReason,
  }) {
    return RecommendationsState(
      personalizedState: personalizedState ?? this.personalizedState,
      trendingState: trendingState ?? this.trendingState,
      personalizedReason: personalizedReason ?? this.personalizedReason,
      trendingReason: trendingReason ?? this.trendingReason,
    );
  }
}

class RecommendationsNotifier extends StateNotifier<RecommendationsState> {
  final RecommendationRepository _repository;

  RecommendationsNotifier(this._repository)
      : super(const RecommendationsState()) {
    fetchPersonalized();
    fetchTrending();
  }

  Future<void> fetchPersonalized({int limit = 10}) async {
    state = state.copyWith(personalizedState: const UiState.loading());
    try {
      final response = await _repository.getRecommendations(
        type: 'PERSONALIZED',
        limit: limit,
      );

      if (response.status && response.data is RecommendationResponseModel) {
        final model = response.data as RecommendationResponseModel;
        state = state.copyWith(
          personalizedState: model.items.isEmpty
              ? const UiState.empty('No recommendations available')
              : UiState.success(model.items),
          personalizedReason: model.reason,
        );
      } else {
        state = state.copyWith(
          personalizedState: UiState.error(response.message),
        );
      }
    } catch (e) {
      state = state.copyWith(
        personalizedState: UiState.error(e.toString()),
      );
    }
  }

  Future<void> fetchTrending({int limit = 10}) async {
    state = state.copyWith(trendingState: const UiState.loading());
    try {
      final response = await _repository.getRecommendations(
        type: 'TRENDING',
        limit: limit,
      );

      if (response.status && response.data is RecommendationResponseModel) {
        final model = response.data as RecommendationResponseModel;
        state = state.copyWith(
          trendingState: model.items.isEmpty
              ? const UiState.empty('No trending items available')
              : UiState.success(model.items),
          trendingReason: model.reason,
        );
      } else {
        state = state.copyWith(
          trendingState: UiState.error(response.message),
        );
      }
    } catch (e) {
      state = state.copyWith(
        trendingState: UiState.error(e.toString()),
      );
    }
  }
}

final recommendationsStateProvider = StateNotifierProvider<
    RecommendationsNotifier, RecommendationsState>((ref) {
  final repository = ref.watch(recommendationRepositoryProvider);
  return RecommendationsNotifier(repository);
});

final similarProductsProvider =
    FutureProvider.family<List<RecommendedProduct>, String>(
        (ref, productId) async {
  final repository = ref.watch(recommendationRepositoryProvider);
  final response = await repository.getRecommendations(
    type: 'SIMILAR_PRODUCTS',
    productId: productId,
    limit: 8,
  );
  if (response.status && response.data is RecommendationResponseModel) {
    return (response.data as RecommendationResponseModel).items;
  }
  return [];
});

final frequentlyBoughtTogetherProvider =
    FutureProvider.family<List<RecommendedProduct>, String>(
        (ref, productId) async {
  final repository = ref.watch(recommendationRepositoryProvider);
  final response = await repository.getRecommendations(
    type: 'FREQUENTLY_BOUGHT_TOGETHER',
    productId: productId,
    limit: 6,
  );
  if (response.status && response.data is RecommendationResponseModel) {
    return (response.data as RecommendationResponseModel).items;
  }
  return [];
});
