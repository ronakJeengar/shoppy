import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/category_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';

class CatalogProvider extends ChangeNotifier {
  final CatalogRepository _catalogRepository = CatalogRepository();

  List<CategoryModel> _categories = [];
  List<Product> _products = [];
  String? _selectedCategoryId;
  String _selectedSort = 'newest';

  bool _isLoadingCategories = false;
  bool _isLoadingProducts = false;
  bool _isLoadingMore = false;
  String? _errorMessage;

  int _currentPage = 1;
  bool _hasNextPage = false;
  final int _limit = 20;

  // Getters
  List<CategoryModel> get categories => _categories;
  List<Product> get products => _products;
  String? get selectedCategoryId => _selectedCategoryId;
  String get selectedSort => _selectedSort;

  bool get isLoadingCategories => _isLoadingCategories;
  bool get isLoadingProducts => _isLoadingProducts;
  bool get isLoadingMore => _isLoadingMore;
  String? get errorMessage => _errorMessage;

  int get currentPage => _currentPage;
  bool get hasNextPage => _hasNextPage;

  Future<void> loadInitialData() async {
    _isLoadingCategories = true;
    _isLoadingProducts = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final categoriesFuture = _catalogRepository.getCategories();
      final productsFuture = _catalogRepository.getProducts(
        page: 1,
        limit: _limit,
        categoryId: _selectedCategoryId,
        sort: _selectedSort,
      );

      final results = await Future.wait([categoriesFuture, productsFuture]);
      final catResponse = results[0];
      final prodResponse = results[1];

      if (catResponse.status && catResponse.data is List<CategoryModel>) {
        _categories = catResponse.data as List<CategoryModel>;
      }

      if (prodResponse.status && prodResponse.data is Map<String, dynamic>) {
        final data = prodResponse.data as Map<String, dynamic>;
        _products = (data['products'] as List<Product>?) ?? [];
        final pagination = data['pagination'] as Map<String, dynamic>? ?? {};
        _currentPage = pagination['page'] ?? 1;
        _hasNextPage = pagination['hasNext'] ?? false;
      } else {
        _errorMessage = prodResponse.message;
      }
    } catch (e) {
      log('loadInitialData exception: $e');
      _errorMessage = 'Failed to load catalog. Please try again.';
    } finally {
      _isLoadingCategories = false;
      _isLoadingProducts = false;
      notifyListeners();
    }
  }

  Future<void> selectCategory(String? categoryId) async {
    if (_selectedCategoryId == categoryId) return;

    _selectedCategoryId = categoryId;
    _currentPage = 1;
    _products = [];
    _isLoadingProducts = true;
    _errorMessage = null;
    notifyListeners();

    await _fetchProducts(page: 1, append: false);
  }

  Future<void> setSort(String sort) async {
    if (_selectedSort == sort) return;

    _selectedSort = sort;
    _currentPage = 1;
    _products = [];
    _isLoadingProducts = true;
    _errorMessage = null;
    notifyListeners();

    await _fetchProducts(page: 1, append: false);
  }

  Future<void> loadMoreProducts() async {
    if (!_hasNextPage || _isLoadingMore || _isLoadingProducts) return;

    _isLoadingMore = true;
    notifyListeners();

    final nextPage = _currentPage + 1;
    await _fetchProducts(page: nextPage, append: true);

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<void> refreshCatalog() async {
    _currentPage = 1;
    _errorMessage = null;
    await loadInitialData();
  }

  Future<void> _fetchProducts({required int page, required bool append}) async {
    try {
      final response = await _catalogRepository.getProducts(
        page: page,
        limit: _limit,
        categoryId: _selectedCategoryId,
        sort: _selectedSort,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final newProducts = (data['products'] as List<Product>?) ?? [];
        final pagination = data['pagination'] as Map<String, dynamic>? ?? {};

        if (append) {
          _products.addAll(newProducts);
        } else {
          _products = newProducts;
        }

        _currentPage = pagination['page'] ?? page;
        _hasNextPage = pagination['hasNext'] ?? false;
      } else {
        if (!append) {
          _errorMessage = response.message;
        }
      }
    } catch (e) {
      log('_fetchProducts error: $e');
      if (!append) {
        _errorMessage = 'Unable to fetch products.';
      }
    } finally {
      if (!append) {
        _isLoadingProducts = false;
        notifyListeners();
      }
    }
  }
}
