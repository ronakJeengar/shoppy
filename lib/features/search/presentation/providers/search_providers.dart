import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/catalog/domain/usecases/catalog_usecases.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';

class SearchState {
  final String query;
  final List<String> recentSearches;
  final List<Map<String, dynamic>> suggestions;
  final UiState<List<ProductEntity>> resultsState;
  final bool hasExecutedSearch;
  final bool isLoadingSuggestions;
  final String? selectedCategoryId;
  final double? minPrice;
  final double? maxPrice;
  final double? minRating;
  final bool inStockOnly;
  final String selectedSort;

  const SearchState({
    this.query = '',
    this.recentSearches = const [],
    this.suggestions = const [],
    this.resultsState = const UiState.initial(),
    this.hasExecutedSearch = false,
    this.isLoadingSuggestions = false,
    this.selectedCategoryId,
    this.minPrice,
    this.maxPrice,
    this.minRating,
    this.inStockOnly = false,
    this.selectedSort = 'newest',
  });

  int get activeFilterCount {
    int count = 0;
    if (selectedCategoryId != null) count++;
    if (minPrice != null || maxPrice != null) count++;
    if (minRating != null) count++;
    if (inStockOnly) count++;
    return count;
  }

  SearchState copyWith({
    String? query,
    List<String>? recentSearches,
    List<Map<String, dynamic>>? suggestions,
    UiState<List<ProductEntity>>? resultsState,
    bool? hasExecutedSearch,
    bool? isLoadingSuggestions,
    String? selectedCategoryId,
    bool clearCategory = false,
    double? minPrice,
    bool clearMinPrice = false,
    double? maxPrice,
    bool clearMaxPrice = false,
    double? minRating,
    bool clearMinRating = false,
    bool? inStockOnly,
    String? selectedSort,
  }) {
    return SearchState(
      query: query ?? this.query,
      recentSearches: recentSearches ?? this.recentSearches,
      suggestions: suggestions ?? this.suggestions,
      resultsState: resultsState ?? this.resultsState,
      hasExecutedSearch: hasExecutedSearch ?? this.hasExecutedSearch,
      isLoadingSuggestions:
          isLoadingSuggestions ?? this.isLoadingSuggestions,
      selectedCategoryId:
          clearCategory ? null : (selectedCategoryId ?? this.selectedCategoryId),
      minPrice: clearMinPrice ? null : (minPrice ?? this.minPrice),
      maxPrice: clearMaxPrice ? null : (maxPrice ?? this.maxPrice),
      minRating: clearMinRating ? null : (minRating ?? this.minRating),
      inStockOnly: inStockOnly ?? this.inStockOnly,
      selectedSort: selectedSort ?? this.selectedSort,
    );
  }
}

class SearchNotifier extends StateNotifier<SearchState> {
  final GetProductsUseCase _getProductsUseCase;
  Timer? _debounceTimer;

  SearchNotifier(this._getProductsUseCase) : super(const SearchState()) {
    loadRecentSearches();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void loadRecentSearches() {
    final recent = Preferences.getRecentSearches();
    state = state.copyWith(recentSearches: recent);
  }

  Future<void> addRecentSearch(String query) async {
    await Preferences.addRecentSearch(query);
    loadRecentSearches();
  }

  Future<void> removeRecentSearch(String query) async {
    await Preferences.removeRecentSearch(query);
    loadRecentSearches();
  }

  Future<void> clearRecentSearches() async {
    await Preferences.clearRecentSearches();
    state = state.copyWith(recentSearches: const []);
  }

  void clearSearch() {
    _debounceTimer?.cancel();
    state = state.copyWith(
      query: '',
      suggestions: const [],
      isLoadingSuggestions: false,
      hasExecutedSearch: false,
      resultsState: const UiState.initial(),
    );
  }

  void onQueryChanged(String query) {
    state = state.copyWith(query: query);
    _debounceTimer?.cancel();

    if (query.trim().length >= 2) {
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        fetchSuggestions(query.trim());
      });
    } else {
      state = state.copyWith(suggestions: const [], isLoadingSuggestions: false);
    }
  }

  Future<void> fetchSuggestions(String query) async {
    state = state.copyWith(isLoadingSuggestions: true);
    final result = await _getProductsUseCase(search: query, limit: 5);
    result.fold(
      onSuccess: (products) {
        final suggestions = products.map((p) => {
          'id': p.id,
          'name': p.name,
          'category': p.categoryName ?? '',
          'price': p.price,
        }).toList();
        state = state.copyWith(
          suggestions: suggestions,
          isLoadingSuggestions: false,
        );
      },
      onFailure: (_) {
        state = state.copyWith(
          suggestions: const [],
          isLoadingSuggestions: false,
        );
      },
    );
  }

  Future<void> executeSearch([String? newQuery]) async {
    final query = newQuery ?? state.query;
    if (query.trim().isNotEmpty) {
      addRecentSearch(query.trim());
    }

    state = state.copyWith(
      query: query,
      resultsState: const UiState.loading(),
      hasExecutedSearch: true,
      suggestions: const [],
    );

    final result = await _getProductsUseCase(
      search: query.trim().isEmpty ? null : query.trim(),
      categoryId: state.selectedCategoryId,
      sort: state.selectedSort,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
      minRating: state.minRating,
      inStockOnly: state.inStockOnly,
    );

    result.fold(
      onSuccess: (products) {
        if (products.isEmpty) {
          state = state.copyWith(
            resultsState: const UiState.empty('No products found matching your search'),
          );
        } else {
          state = state.copyWith(
            resultsState: UiState.success(products),
          );
        }
      },
      onFailure: (failure) {
        state = state.copyWith(
          resultsState: UiState.error(failure.message),
        );
      },
    );
  }

  void setCategoryFilter(String? categoryId) {
    if (categoryId == null) {
      state = state.copyWith(clearCategory: true);
    } else {
      state = state.copyWith(selectedCategoryId: categoryId);
    }
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }

  void setPriceFilter(double? minPrice, double? maxPrice) {
    state = state.copyWith(
      minPrice: minPrice,
      maxPrice: maxPrice,
      clearMinPrice: minPrice == null,
      clearMaxPrice: maxPrice == null,
    );
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }

  void setRatingFilter(double? minRating) {
    state = state.copyWith(
      minRating: minRating,
      clearMinRating: minRating == null,
    );
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }

  void setInStockOnly(bool inStock) {
    state = state.copyWith(inStockOnly: inStock);
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }

  void setSort(String sort) {
    state = state.copyWith(selectedSort: sort);
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }

  void setFilters({
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStockOnly,
    String? sort,
  }) {
    state = state.copyWith(
      selectedCategoryId: categoryId,
      clearCategory: categoryId == null,
      minPrice: minPrice,
      clearMinPrice: minPrice == null,
      maxPrice: maxPrice,
      clearMaxPrice: maxPrice == null,
      minRating: minRating,
      clearMinRating: minRating == null,
      inStockOnly: inStockOnly ?? state.inStockOnly,
      selectedSort: sort ?? state.selectedSort,
    );
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }

  void resetFilters() {
    state = state.copyWith(
      clearCategory: true,
      clearMinPrice: true,
      clearMaxPrice: true,
      clearMinRating: true,
      inStockOnly: false,
      selectedSort: 'newest',
    );
    if (state.hasExecutedSearch) {
      executeSearch();
    }
  }
}

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(ref.watch(getProductsUseCaseProvider));
});
