import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';

class SearchProvider extends ChangeNotifier {
  final CatalogRepository _catalogRepository = CatalogRepository();

  String _currentQuery = '';
  List<String> _recentSearches = [];
  List<Map<String, dynamic>> _suggestions = [];
  List<Product> _searchResults = [];

  bool _isSearching = false;
  bool _isLoadingSuggestions = false;
  bool _hasExecutedSearch = false;
  String? _errorMessage;

  // Filter state
  String? _selectedCategoryId;
  double? _minPrice;
  double? _maxPrice;
  double? _minRating;
  bool _inStockOnly = false;
  String _selectedSort = 'newest';

  Timer? _debounceTimer;

  // Getters
  String get currentQuery => _currentQuery;
  List<String> get recentSearches => _recentSearches;
  List<Map<String, dynamic>> get suggestions => _suggestions;
  List<Product> get searchResults => _searchResults;

  bool get isSearching => _isSearching;
  bool get isLoadingSuggestions => _isLoadingSuggestions;
  bool get hasExecutedSearch => _hasExecutedSearch;
  String? get errorMessage => _errorMessage;

  String? get selectedCategoryId => _selectedCategoryId;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;
  double? get minRating => _minRating;
  bool get inStockOnly => _inStockOnly;
  String get selectedSort => _selectedSort;

  int get activeFilterCount {
    int count = 0;
    if (_selectedCategoryId != null) count++;
    if (_minPrice != null || _maxPrice != null) count++;
    if (_minRating != null) count++;
    if (_inStockOnly) count++;
    return count;
  }

  SearchProvider() {
    loadRecentSearches();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void loadRecentSearches() {
    _recentSearches = Preferences.getRecentSearches();
    notifyListeners();
  }

  Future<void> removeRecentSearch(String query) async {
    await Preferences.removeRecentSearch(query);
    _recentSearches = Preferences.getRecentSearches();
    notifyListeners();
  }

  Future<void> clearRecentSearches() async {
    await Preferences.clearRecentSearches();
    _recentSearches = [];
    notifyListeners();
  }

  void onQueryChanged(String query) {
    _currentQuery = query;
    _errorMessage = null;

    if (query.trim().isEmpty) {
      _suggestions = [];
      _isLoadingSuggestions = false;
      _debounceTimer?.cancel();
      notifyListeners();
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      _fetchSuggestions(query);
    });
  }

  Future<void> _fetchSuggestions(String query) async {
    if (query.trim().isEmpty) return;

    _isLoadingSuggestions = true;
    notifyListeners();

    try {
      final response = await _catalogRepository.getSuggestions(query);
      if (response.status && response.data is List<Map<String, dynamic>>) {
        _suggestions = response.data as List<Map<String, dynamic>>;
      } else {
        _suggestions = [];
      }
    } catch (e) {
      log('_fetchSuggestions error: $e');
      _suggestions = [];
    } finally {
      _isLoadingSuggestions = false;
      notifyListeners();
    }
  }

  Future<void> executeSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    _debounceTimer?.cancel();
    _currentQuery = trimmed;
    _suggestions = [];
    _isSearching = true;
    _hasExecutedSearch = true;
    _errorMessage = null;
    notifyListeners();

    // Persist to search history
    await Preferences.addRecentSearch(trimmed);
    _recentSearches = Preferences.getRecentSearches();

    try {
      final response = await _catalogRepository.getProducts(
        page: 1,
        limit: 30,
        search: trimmed,
        categoryId: _selectedCategoryId,
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        minRating: _minRating,
        inStockOnly: _inStockOnly,
        sort: _selectedSort,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        _searchResults = (data['products'] as List<Product>?) ?? [];
      } else {
        _errorMessage = response.message;
        _searchResults = [];
      }
    } catch (e) {
      log('executeSearch error: $e');
      _errorMessage = 'Search request failed. Please try again.';
      _searchResults = [];
    } finally {
      _isSearching = false;
      notifyListeners();
    }
  }

  void setFilters({
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStockOnly,
  }) {
    _selectedCategoryId = categoryId;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _minRating = minRating;
    if (inStockOnly != null) _inStockOnly = inStockOnly;

    if (_hasExecutedSearch && _currentQuery.isNotEmpty) {
      executeSearch(_currentQuery);
    } else {
      notifyListeners();
    }
  }

  void setSort(String sort) {
    if (_selectedSort == sort) return;
    _selectedSort = sort;
    if (_hasExecutedSearch && _currentQuery.isNotEmpty) {
      executeSearch(_currentQuery);
    } else {
      notifyListeners();
    }
  }

  void resetFilters() {
    _selectedCategoryId = null;
    _minPrice = null;
    _maxPrice = null;
    _minRating = null;
    _inStockOnly = false;
    _selectedSort = 'newest';

    if (_hasExecutedSearch && _currentQuery.isNotEmpty) {
      executeSearch(_currentQuery);
    } else {
      notifyListeners();
    }
  }

  void clearSearch() {
    _currentQuery = '';
    _suggestions = [];
    _searchResults = [];
    _hasExecutedSearch = false;
    _errorMessage = null;
    _debounceTimer?.cancel();
    notifyListeners();
  }
}
