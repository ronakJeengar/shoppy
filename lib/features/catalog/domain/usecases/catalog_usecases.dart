import '../../../../core/utils/result.dart';
import '../entities/category_entity.dart';
import '../entities/product_entity.dart';
import '../repositories/catalog_repository.dart';

class GetCategoriesUseCase {
  final CatalogRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<Result<List<CategoryEntity>>> call() {
    return _repository.getCategories();
  }
}

class GetProductsUseCase {
  final CatalogRepository _repository;

  GetProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>>> call({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? search,
    String? sort,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStockOnly,
  }) {
    return _repository.getProducts(
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
  }
}

class GetProductDetailUseCase {
  final CatalogRepository _repository;

  GetProductDetailUseCase(this._repository);

  Future<Result<ProductEntity>> call(String id) {
    return _repository.getProductById(id);
  }
}

class GetFeaturedProductsUseCase {
  final CatalogRepository _repository;

  GetFeaturedProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>>> call() {
    return _repository.getFeaturedProducts();
  }
}

class GetTrendingProductsUseCase {
  final CatalogRepository _repository;

  GetTrendingProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>>> call() {
    return _repository.getTrendingProducts();
  }
}
