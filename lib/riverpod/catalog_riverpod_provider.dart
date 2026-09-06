import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/category_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

import 'package:shopp_app/riverpod/di_providers.dart';
export 'di_providers.dart';

class CategoriesNotifier extends StateNotifier<UiState<List<CategoryModel>>> {
  final CatalogRepository _repository;

  CategoriesNotifier(this._repository) : super(const UiState.initial()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    state = const UiState.loading();
    try {
      final response = await _repository.getCategories();
      if (response.status && response.data is List<CategoryModel>) {
        final list = response.data as List<CategoryModel>;
        if (list.isEmpty) {
          state = const UiState.empty('No categories found');
        } else {
          state = UiState.success(list);
        }
      } else {
        state = UiState.error(response.message);
      }
    } catch (e) {
      state = UiState.error(e.toString());
    }
  }
}

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, UiState<List<CategoryModel>>>((ref) {
  final repository = ref.watch(catalogRepositoryProvider);
  return CategoriesNotifier(repository);
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
final catalogSearchQueryProvider = StateProvider<String>((ref) => '');
final catalogSortProvider = StateProvider<String>((ref) => 'newest');

class ProductsNotifier extends StateNotifier<UiState<List<Product>>> {
  final CatalogRepository _repository;
  final Ref _ref;

  ProductsNotifier(this._repository, this._ref) : super(const UiState.initial()) {
    fetchProducts();
  }

  Future<void> fetchProducts({
    String? categoryId,
    String? search,
    String? sort,
    int page = 1,
    int limit = 20,
  }) async {
    state = const UiState.loading();
    try {
      final activeCategory = categoryId ?? _ref.read(selectedCategoryProvider);
      final activeSearch = search ?? _ref.read(catalogSearchQueryProvider);
      final activeSort = sort ?? _ref.read(catalogSortProvider);

      final response = await _repository.getProducts(
        page: page,
        limit: limit,
        categoryId: activeCategory,
        search: activeSearch,
        sort: activeSort,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final products = data['products'] as List<Product>? ?? [];
        if (products.isEmpty) {
          state = const UiState.empty('No products available');
        } else {
          state = UiState.success(products);
        }
      } else {
        state = UiState.error(response.message);
      }
    } catch (e) {
      state = UiState.error(e.toString());
    }
  }
}

final productsProvider =
    StateNotifierProvider<ProductsNotifier, UiState<List<Product>>>((ref) {
  final repository = ref.watch(catalogRepositoryProvider);
  return ProductsNotifier(repository, ref);
});

final productDetailProvider =
    FutureProvider.family<Product?, String>((ref, productId) async {
  final repository = ref.watch(catalogRepositoryProvider);
  final response = await repository.getProductById(productId);
  if (response.status && response.data is Product) {
    return response.data as Product;
  }
  return null;
});
