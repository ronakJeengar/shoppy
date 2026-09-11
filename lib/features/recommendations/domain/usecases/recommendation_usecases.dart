import '../../../../core/utils/result.dart';
import '../entities/recommendation_entity.dart';
import '../repositories/recommendation_repository.dart';

class GetRecommendationsUseCase {
  final RecommendationRepository _repository;

  GetRecommendationsUseCase(this._repository);

  Future<Result<RecommendationResponseEntity>> call({
    String type = 'PERSONALIZED',
    String? productId,
    String? categoryId,
    int limit = 10,
  }) {
    return _repository.getRecommendations(
      type: type,
      productId: productId,
      categoryId: categoryId,
      limit: limit,
    );
  }
}

class TrackEventUseCase {
  final RecommendationRepository _repository;

  TrackEventUseCase(this._repository);

  Future<Result<void>> call({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  }) {
    return _repository.trackEvent(
      eventType: eventType,
      productId: productId,
      categoryId: categoryId,
      metadata: metadata,
    );
  }
}
