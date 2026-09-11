import '../../../../core/utils/result.dart';
import '../entities/recommendation_entity.dart';

abstract class RecommendationRepository {
  Future<Result<RecommendationResponseEntity>> getRecommendations({
    String type = 'PERSONALIZED',
    String? productId,
    String? categoryId,
    int limit = 10,
  });

  Future<Result<void>> trackEvent({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  });
}
