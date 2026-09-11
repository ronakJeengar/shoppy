import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<Product>> getProducts({
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
  Future<Product> getProductById(String id);
  Future<List<Product>> getFeaturedProducts();
  Future<List<Product>> getTrendingProducts();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final ApiClient _client;

  CatalogRemoteDataSourceImpl(this._client);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _client.get(Urls.categories);
    final data = response.data;
    final list = (data is Map<String, dynamic> ? data['data'] : data) as List? ?? [];
    return list
        .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Product>> getProducts({
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
    final Map<String, dynamic> queryParams = {
      'page': page,
      'limit': limit,
    };
    if (categoryId != null && categoryId.isNotEmpty) {
      queryParams['category'] = categoryId;
    }
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }
    if (sort != null && sort.isNotEmpty) {
      queryParams['sort'] = sort;
    }
    if (minPrice != null) {
      queryParams['minPrice'] = minPrice;
    }
    if (maxPrice != null) {
      queryParams['maxPrice'] = maxPrice;
    }
    if (minRating != null) {
      queryParams['minRating'] = minRating;
    }
    if (inStockOnly == true) {
      queryParams['inStock'] = 'true';
    }

    final response = await _client.get(Urls.products, queryParameters: queryParams);
    final data = response.data;
    final rawList = data is Map<String, dynamic>
        ? (data['data'] is Map ? data['data']['products'] : (data['data'] ?? data['products']))
        : data;
    final list = rawList as List? ?? [];
    return list
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final response = await _client.get('${Urls.products}/$id');
    final data = response.data;
    final item = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return Product.fromJson(item);
  }

  @override
  Future<List<Product>> getFeaturedProducts() async {
    return getProducts(limit: 10, sort: 'featured');
  }

  @override
  Future<List<Product>> getTrendingProducts() async {
    return getProducts(limit: 10, sort: 'popularity');
  }
}
