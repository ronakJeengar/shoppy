import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/wishlist_repository.dart';

class WishlistProvider extends ChangeNotifier {
  final WishlistRepository _wishlistRepository = WishlistRepository();

  List<Product> _items = [];
  Set<String> _wishlistedIds = {};
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get items => _items;
  int get itemCount => _items.length;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  WishlistProvider() {
    loadWishlist();
  }

  bool isInWishlist(String productId) {
    return _wishlistedIds.contains(productId);
  }

  void clearWishlistState() {
    _items = [];
    _wishlistedIds = {};
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadWishlist() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _wishlistRepository.getWishlist();
      if (response.status && response.data is List<Product>) {
        _items = response.data as List<Product>;
        _wishlistedIds = _items.map((p) => p.id).toSet();
      } else {
        _errorMessage = response.message;
        _items = [];
        _wishlistedIds = {};
      }
    } catch (e) {
      log('WishlistProvider loadWishlist error: $e');
      _errorMessage = 'Could not load wishlist';
      _items = [];
      _wishlistedIds = {};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> toggleWishlist(Product product) async {
    final alreadyIn = _wishlistedIds.contains(product.id);

    // Optimistic UI update
    if (alreadyIn) {
      _wishlistedIds.remove(product.id);
      _items.removeWhere((p) => p.id == product.id);
    } else {
      _wishlistedIds.add(product.id);
      _items.insert(0, product);
    }
    notifyListeners();

    try {
      final response = await _wishlistRepository.toggleWishlist(product.id);
      if (!response.status) {
        // Revert optimistic update
        if (alreadyIn) {
          _wishlistedIds.add(product.id);
          _items.insert(0, product);
        } else {
          _wishlistedIds.remove(product.id);
          _items.removeWhere((p) => p.id == product.id);
        }
        _errorMessage = response.message;
        notifyListeners();
        return alreadyIn;
      }
      return !alreadyIn;
    } catch (e) {
      log('WishlistProvider toggleWishlist error: $e');
      // Revert optimistic update
      if (alreadyIn) {
        _wishlistedIds.add(product.id);
        _items.insert(0, product);
      } else {
        _wishlistedIds.remove(product.id);
        _items.removeWhere((p) => p.id == product.id);
      }
      _errorMessage = 'Failed to update wishlist';
      notifyListeners();
      return alreadyIn;
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    _wishlistedIds.remove(productId);
    _items.removeWhere((p) => p.id == productId);
    notifyListeners();

    try {
      await _wishlistRepository.removeFromWishlist(productId);
    } catch (e) {
      log('WishlistProvider removeFromWishlist error: $e');
    }
  }
}
