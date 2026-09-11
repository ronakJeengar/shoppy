import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/recommendation_entity.dart';
import '../../domain/repositories/recommendation_repository.dart';
import '../datasources/recommendation_remote_datasource.dart';
import '../mappers/recommendation_mappers.dart';

class RecommendationRepositoryImpl implements RecommendationRepository {
  final RecommendationRemoteDataSource _remoteDataSource;

  RecommendationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<RecommendationResponseEntity>> getRecommendations({
    String type = 'PERSONALIZED',
    String? productId,
    String? categoryId,
    int limit = 10,
  }) async {
    try {
      final res = await _remoteDataSource.getRecommendations(
        type: type,
        productId: productId,
        categoryId: categoryId,
        limit: limit,
      );
      return Success(res.toEntity());
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load recommendations');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> trackEvent({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      await _remoteDataSource.trackEvent(
        eventType: eventType,
        productId: productId,
        categoryId: categoryId,
        metadata: metadata,
      );
      return const Success(null);
    } catch (e) {
      // Event tracking fails silently
      return const Success(null);
    }
  }
}
