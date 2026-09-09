import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/review_remote_datasource.dart';
import '../../data/repositories/review_repository_impl.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repositories/review_repository.dart';
import '../../domain/usecases/review_usecases.dart';

final reviewRemoteDataSourceProvider = Provider<ReviewRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return ReviewRemoteDataSourceImpl(client);
});

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  final remote = ref.watch(reviewRemoteDataSourceProvider);
  return ReviewRepositoryImpl(remote);
});

final getProductReviewsUseCaseProvider =
    Provider<GetProductReviewsUseCase>((ref) {
  return GetProductReviewsUseCase(ref.watch(reviewRepositoryProvider));
});

final submitReviewUseCaseProvider = Provider<SubmitReviewUseCase>((ref) {
  return SubmitReviewUseCase(ref.watch(reviewRepositoryProvider));
});

final updateReviewUseCaseProvider = Provider<UpdateReviewUseCase>((ref) {
  return UpdateReviewUseCase(ref.watch(reviewRepositoryProvider));
});

final deleteReviewUseCaseProvider = Provider<DeleteReviewUseCase>((ref) {
  return DeleteReviewUseCase(ref.watch(reviewRepositoryProvider));
});

final voteHelpfulUseCaseProvider = Provider<VoteHelpfulUseCase>((ref) {
  return VoteHelpfulUseCase(ref.watch(reviewRepositoryProvider));
});

final productReviewsProvider =
    FutureProvider.family<ProductReviewsResult, String>((ref, productId) async {
  final useCase = ref.watch(getProductReviewsUseCaseProvider);
  final result = await useCase(productId);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw Exception(failure.message),
  );
});
