import '../../../../core/utils/result.dart';
import '../entities/category_entity.dart';
import '../entities/product_entity.dart';

abstract class CatalogRepository {
  Future<Result<List<CategoryEntity>>> getCategories();

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
  });

  Future<Result<ProductEntity>> getProductById(String id);

  Future<Result<List<ProductEntity>>> getFeaturedProducts();

  Future<Result<List<ProductEntity>>> getTrendingProducts();
}
