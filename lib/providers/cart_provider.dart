import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/cart_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();

  CartModel? _cart;
  bool _isLoading = false;
  bool _isMutating = false;
  String? _errorMessage;

  CartModel? get cart => _cart;
  bool get isLoading => _isLoading;
  bool get isMutating => _isMutating;
  String? get errorMessage => _errorMessage;

  int get totalItemCount => _cart?.itemCount ?? 0;
  double get subtotal => _cart?.subtotal ?? 0.0;
  double get shipping => _cart?.shipping ?? 0.0;
  double get tax => _cart?.tax ?? 0.0;
  double get totalAmount => _cart?.total ?? 0.0;
  List<CartItemModel> get items => _cart?.items ?? [];

  CartProvider() {
    loadCart();
  }

  void clearCartState() {
    _cart = null;
    _errorMessage = null;
    _isLoading = false;
    _isMutating = false;
    notifyListeners();
  }

  Future<void> loadCart() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _cartRepository.getCart();
      if (response.status && response.data is CartModel) {
        _cart = response.data as CartModel;
      } else {
        _errorMessage = response.message;
        _cart = CartModel.empty();
      }
    } catch (e) {
      log('CartProvider loadCart error: $e');
      _errorMessage = 'Could not load your cart';
      _cart = CartModel.empty();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addToCart(Product product, {int quantity = 1}) async {
    _isMutating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _cartRepository.addItem(
        product.id,
        quantity: quantity,
      );

      if (response.status && response.data is CartModel) {
        _cart = response.data as CartModel;
        _isMutating = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isMutating = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('CartProvider addToCart error: $e');
      _errorMessage = 'Failed to add item to cart';
      _isMutating = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    _isMutating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _cartRepository.updateQuantity(
        productId,
        newQuantity,
      );

      if (response.status && response.data is CartModel) {
        _cart = response.data as CartModel;
      } else {
        _errorMessage = response.message;
      }
    } catch (e) {
      log('CartProvider updateQuantity error: $e');
      _errorMessage = 'Failed to update quantity';
    } finally {
      _isMutating = false;
      notifyListeners();
    }
  }

  Future<void> removeItem(String productId) async {
    _isMutating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _cartRepository.removeItem(productId);
      if (response.status && response.data is CartModel) {
        _cart = response.data as CartModel;
      } else {
        _errorMessage = response.message;
      }
    } catch (e) {
      log('CartProvider removeItem error: $e');
      _errorMessage = 'Failed to remove item';
    } finally {
      _isMutating = false;
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    _isMutating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _cartRepository.clearCart();
      if (response.status && response.data is CartModel) {
        _cart = response.data as CartModel;
      } else {
        _cart = CartModel.empty();
      }
    } catch (e) {
      log('CartProvider clearCart error: $e');
      _cart = CartModel.empty();
    } finally {
      _isMutating = false;
      notifyListeners();
    }
  }
}
