import 'package:dio/dio.dart';
import 'package:shopp_app/core/errors/failures.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_remote_datasource.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource _remoteDataSource;

  WishlistRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<ProductEntity>>> getWishlist() async {
    try {
      final models = await _remoteDataSource.getWishlist();
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to load wishlist');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<bool>> toggleWishlist(String productId) async {
    try {
      final success = await _remoteDataSource.toggleWishlist(productId);
      return Success(success);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to toggle wishlist');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> removeFromWishlist(String productId) async {
    try {
      await _remoteDataSource.removeFromWishlist(productId);
      return const Success(null);
    } on DioException catch (e) {
      final msg = extractDioErrorMessage(e, 'Failed to remove from wishlist');
      return FailureResult(ServerFailure(msg, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
