import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/cart_model.dart';
import 'package:shopp_app/data/repositories/cart_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

import 'package:shopp_app/riverpod/di_providers.dart';
export 'di_providers.dart';

class CartNotifier extends StateNotifier<UiState<CartModel>> {
  final CartRepository _repository;

  CartNotifier(this._repository) : super(const UiState.initial()) {
    loadCart();
  }

  Future<void> loadCart() async {
    state = const UiState.loading();
    try {
      final response = await _repository.getCart();
      if (response.status && response.data is CartModel) {
        final cart = response.data as CartModel;
        if (cart.items.isEmpty) {
          state = const UiState.empty('Your shopping cart is empty');
        } else {
          state = UiState.success(cart);
        }
      } else {
        state = UiState.error(response.message);
      }
    } catch (e) {
      state = UiState.error(e.toString());
    }
  }

  Future<bool> addItem(String productId, {int quantity = 1}) async {
    try {
      final response = await _repository.addItem(productId, quantity: quantity);
      if (response.status && response.data is CartModel) {
        state = UiState.success(response.data as CartModel);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateQuantity(String productId, int quantity) async {
    try {
      final response = await _repository.updateQuantity(productId, quantity);
      if (response.status && response.data is CartModel) {
        final cart = response.data as CartModel;
        if (cart.items.isEmpty) {
          state = const UiState.empty('Your shopping cart is empty');
        } else {
          state = UiState.success(cart);
        }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeItem(String productId) async {
    try {
      final response = await _repository.removeItem(productId);
      if (response.status && response.data is CartModel) {
        final cart = response.data as CartModel;
        if (cart.items.isEmpty) {
          state = const UiState.empty('Your shopping cart is empty');
        } else {
          state = UiState.success(cart);
        }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearCart() async {
    try {
      final response = await _repository.clearCart();
      if (response.status) {
        state = const UiState.empty('Your shopping cart is empty');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

final cartStateProvider =
    StateNotifierProvider<CartNotifier, UiState<CartModel>>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartNotifier(repository);
});

final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartStateProvider);
  return cartState.whenOrNull(
        success: (cart) => cart.itemCount,
      ) ??
      0;
});

final cartTotalProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartStateProvider);
  return cartState.whenOrNull(
        success: (cart) => cart.total,
      ) ??
      0.0;
});
