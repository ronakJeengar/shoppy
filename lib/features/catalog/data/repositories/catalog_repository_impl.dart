import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../datasources/catalog_remote_datasource.dart';
import '../mappers/catalog_mappers.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogRemoteDataSource _remoteDataSource;

  CatalogRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    try {
      final models = await _remoteDataSource.getCategories();
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to load categories');
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> getProducts({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? search,
    String? sort,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStockOnly,
  }) async {
    try {
      final models = await _remoteDataSource.getProducts(
        page: page,
        limit: limit,
        categoryId: categoryId,
        search: search,
        sort: sort,
        minPrice: minPrice,
        maxPrice: maxPrice,
        minRating: minRating,
        inStockOnly: inStockOnly,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to load products');
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<ProductEntity>> getProductById(String id) async {
    try {
      final model = await _remoteDataSource.getProductById(id);
      return Success(model.toEntity());
    } on DioException catch (e) {
      final message = extractDioErrorMessage(e, 'Failed to load product details');
      return FailureResult(ServerFailure(message, statusCode: e.response?.statusCode));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> getFeaturedProducts() async {
    try {
      final models = await _remoteDataSource.getFeaturedProducts();
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      return FailureResult(ServerFailure(e.message ?? 'Failed to load featured products'));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> getTrendingProducts() async {
    try {
      final models = await _remoteDataSource.getTrendingProducts();
      final entities = models.map((m) => m.toEntity()).toList();
      return Success(entities);
    } on DioException catch (e) {
      return FailureResult(ServerFailure(e.message ?? 'Failed to load trending products'));
    } catch (e) {
      return FailureResult(UnknownFailure(e.toString()));
    }
  }
}
