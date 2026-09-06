import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';
import 'package:shopp_app/riverpod/di_providers.dart';

export 'di_providers.dart';

class SearchState {
  final String query;
  final List<String> recentSearches;
  final List<Map<String, dynamic>> suggestions;
  final UiState<List<Product>> resultsState;
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
    UiState<List<Product>>? resultsState,
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
  final CatalogRepository _repository;
  Timer? _debounceTimer;

  SearchNotifier(this._repository) : super(const SearchState()) {
    loadRecentSearches();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void loadRecentSearches() {
    final list = Preferences.getRecentSearches();
    state = state.copyWith(recentSearches: list);
  }

  void onQueryChanged(String val) {
    state = state.copyWith(query: val);
    _debounceTimer?.cancel();

    if (val.trim().isEmpty) {
      state = state.copyWith(
        suggestions: [],
        isLoadingSuggestions: false,
      );
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      fetchSuggestions(val.trim());
    });
  }

  Future<void> fetchSuggestions(String term) async {
    state = state.copyWith(isLoadingSuggestions: true);
    try {
      final response = await _repository.getSuggestions(term);
      if (response.status && response.data is List) {
        final raw = (response.data as List)
            .whereType<Map<String, dynamic>>()
            .toList();
        state = state.copyWith(suggestions: raw, isLoadingSuggestions: false);
      } else {
        state = state.copyWith(suggestions: [], isLoadingSuggestions: false);
      }
    } catch (_) {
      state = state.copyWith(suggestions: [], isLoadingSuggestions: false);
    }
  }

  Future<void> executeSearch({String? queryOverride}) async {
    final activeQuery = (queryOverride ?? state.query).trim();
    if (activeQuery.isEmpty && state.selectedCategoryId == null) return;

    _debounceTimer?.cancel();
    state = state.copyWith(
      query: activeQuery,
      hasExecutedSearch: true,
      resultsState: const UiState.loading(),
      suggestions: [],
    );

    if (activeQuery.isNotEmpty) {
      await Preferences.addRecentSearch(activeQuery);
      state = state.copyWith(recentSearches: Preferences.getRecentSearches());
    }

    try {
      final response = await _repository.getProducts(
        search: activeQuery.isNotEmpty ? activeQuery : null,
        categoryId: state.selectedCategoryId,
        minPrice: state.minPrice,
        maxPrice: state.maxPrice,
        minRating: state.minRating,
        inStockOnly: state.inStockOnly,
        sort: state.selectedSort,
        limit: 40,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final products =
            (response.data as Map<String, dynamic>)['products'] as List<Product>? ??
                [];
        if (products.isEmpty) {
          state = state.copyWith(
            resultsState: const UiState.empty('No matching products found'),
          );
        } else {
          state = state.copyWith(
            resultsState: UiState.success(products),
          );
        }
      } else {
        state = state.copyWith(
          resultsState: UiState.error(response.message),
        );
      }
    } catch (e) {
      state = state.copyWith(
        resultsState: UiState.error(e.toString()),
      );
    }
  }

  void setFilter({
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStockOnly,
    String? sort,
  }) {
    state = state.copyWith(
      selectedCategoryId: categoryId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minRating: minRating,
      inStockOnly: inStockOnly,
      selectedSort: sort,
    );
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
  }

  Future<void> clearRecentSearches() async {
    await Preferences.clearRecentSearches();
    state = state.copyWith(recentSearches: []);
  }
}

final searchStateProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final repository = ref.watch(catalogRepositoryProvider);
  return SearchNotifier(repository);
});
