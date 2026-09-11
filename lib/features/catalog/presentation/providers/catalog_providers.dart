import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import 'package:shopp_app/core/utils/ui_state.dart';
export 'package:shopp_app/core/utils/ui_state.dart';
import '../../data/datasources/catalog_remote_datasource.dart';
import '../../data/repositories/catalog_repository_impl.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../../domain/usecases/catalog_usecases.dart';

/// Data source & Repository Providers
final catalogRemoteDataSourceProvider = Provider<CatalogRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return CatalogRemoteDataSourceImpl(client);
});

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final remoteDataSource = ref.watch(catalogRemoteDataSourceProvider);
  return CatalogRepositoryImpl(remoteDataSource);
});

/// Use Case Providers
final getCategoriesUseCaseProvider = Provider<GetCategoriesUseCase>((ref) {
  return GetCategoriesUseCase(ref.watch(catalogRepositoryProvider));
});

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(ref.watch(catalogRepositoryProvider));
});

final getProductDetailUseCaseProvider = Provider<GetProductDetailUseCase>((ref) {
  return GetProductDetailUseCase(ref.watch(catalogRepositoryProvider));
});

final getFeaturedProductsUseCaseProvider = Provider<GetFeaturedProductsUseCase>((ref) {
  return GetFeaturedProductsUseCase(ref.watch(catalogRepositoryProvider));
});

final getTrendingProductsUseCaseProvider = Provider<GetTrendingProductsUseCase>((ref) {
  return GetTrendingProductsUseCase(ref.watch(catalogRepositoryProvider));
});

/// Currently selected category ID (null = "All")
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

/// Categories State Notifier
class CategoriesNotifier extends StateNotifier<UiState<List<CategoryEntity>>> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesNotifier(this._getCategoriesUseCase) : super(const UiState.initial()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    state = const UiState.loading();
    final result = await _getCategoriesUseCase();
    result.fold(
      onSuccess: (categories) {
        if (categories.isEmpty) {
          state = const UiState.empty('No categories available');
        } else {
          state = UiState.success(categories);
        }
      },
      onFailure: (failure) {
        state = UiState.error(failure.message);
      },
    );
  }
}

final categoriesNotifierProvider =
    StateNotifierProvider<CategoriesNotifier, UiState<List<CategoryEntity>>>((ref) {
  return CategoriesNotifier(ref.watch(getCategoriesUseCaseProvider));
});

/// Products State Notifier
class ProductsState {
  final UiState<List<ProductEntity>> productsState;
  final String? selectedCategory;
  final String? searchQuery;
  final String sort;
  final bool inStockOnly;
  final double? minRating;

  const ProductsState({
    required this.productsState,
    this.selectedCategory,
    this.searchQuery,
    this.sort = 'newest',
    this.inStockOnly = false,
    this.minRating,
  });

  factory ProductsState.initial() => const ProductsState(
        productsState: UiState.initial(),
      );

  ProductsState copyWith({
    UiState<List<ProductEntity>>? productsState,
    String? selectedCategory,
    bool clearCategory = false,
    String? searchQuery,
    bool clearSearch = false,
    String? sort,
    bool? inStockOnly,
    double? minRating,
    bool clearMinRating = false,
  }) {
    return ProductsState(
      productsState: productsState ?? this.productsState,
      selectedCategory:
          clearCategory ? null : (selectedCategory ?? this.selectedCategory),
      searchQuery: clearSearch ? null : (searchQuery ?? this.searchQuery),
      sort: sort ?? this.sort,
      inStockOnly: inStockOnly ?? this.inStockOnly,
      minRating: clearMinRating ? null : (minRating ?? this.minRating),
    );
  }
}

class ProductsNotifier extends StateNotifier<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsNotifier(this._getProductsUseCase) : super(ProductsState.initial()) {
    fetchProducts();
  }

  Future<void> fetchProducts({
    String? categoryId,
    String? search,
    String? sort,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStockOnly,
  }) async {
    state = state.copyWith(
      productsState: const UiState.loading(),
      selectedCategory: categoryId,
      searchQuery: search,
      sort: sort,
      minRating: minRating,
      inStockOnly: inStockOnly,
    );

    final result = await _getProductsUseCase(
      categoryId: state.selectedCategory,
      search: state.searchQuery,
      sort: state.sort,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minRating: state.minRating,
      inStockOnly: state.inStockOnly,
    );

    result.fold(
      onSuccess: (products) {
        if (products.isEmpty) {
          state = state.copyWith(
            productsState: const UiState.empty('No products found'),
          );
        } else {
          state = state.copyWith(
            productsState: UiState.success(products),
          );
        }
      },
      onFailure: (failure) {
        state = state.copyWith(
          productsState: UiState.error(failure.message),
        );
      },
    );
  }

  void selectCategory(String? categoryId) {
    if (state.selectedCategory == categoryId) return;
    if (categoryId == null) {
      state = state.copyWith(clearCategory: true);
    } else {
      state = state.copyWith(selectedCategory: categoryId);
    }
    fetchProducts(categoryId: state.selectedCategory);
  }

  void setSort(String sort) {
    state = state.copyWith(sort: sort);
    fetchProducts(sort: sort);
  }
}

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(ref.watch(getProductsUseCaseProvider));
});

/// Single Product Detail Provider Family
final productDetailProvider =
    FutureProvider.family<ProductEntity, String>((ref, productId) async {
  final useCase = ref.watch(getProductDetailUseCaseProvider);
  final result = await useCase(productId);
  return result.fold(
    onSuccess: (product) => product,
    onFailure: (failure) => throw Exception(failure.message),
  );
});
