import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/wishlist_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
  return WishlistRepository();
});

class WishlistNotifier extends StateNotifier<UiState<List<Product>>> {
  final WishlistRepository _repository;

  WishlistNotifier(this._repository) : super(const UiState.initial()) {
    loadWishlist();
  }

  Future<void> loadWishlist() async {
    state = const UiState.loading();
    try {
      final response = await _repository.getWishlist();
      if (response.status && response.data is List<Product>) {
        final items = response.data as List<Product>;
        if (items.isEmpty) {
          state = const UiState.empty('Your wishlist is empty');
        } else {
          state = UiState.success(items);
        }
      } else {
        state = UiState.error(response.message);
      }
    } catch (e) {
      state = UiState.error(e.toString());
    }
  }

  Future<bool> toggleWishlist(Product product) async {
    try {
      final response = await _repository.toggleWishlist(product.id);
      if (response.status) {
        final currentItems = state.whenOrNull(success: (items) => items) ?? [];
        final exists = currentItems.any((item) => item.id == product.id);
        List<Product> updated;
        if (exists) {
          updated = currentItems.where((item) => item.id != product.id).toList();
        } else {
          updated = [...currentItems, product];
        }
        if (updated.isEmpty) {
          state = const UiState.empty('Your wishlist is empty');
        } else {
          state = UiState.success(updated);
        }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFromWishlist(String productId) async {
    try {
      final response = await _repository.removeFromWishlist(productId);
      if (response.status) {
        final currentItems = state.whenOrNull(success: (items) => items) ?? [];
        final updated = currentItems.where((item) => item.id != productId).toList();
        if (updated.isEmpty) {
          state = const UiState.empty('Your wishlist is empty');
        } else {
          state = UiState.success(updated);
        }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

final wishlistStateProvider =
    StateNotifierProvider<WishlistNotifier, UiState<List<Product>>>((ref) {
  final repository = ref.watch(wishlistRepositoryProvider);
  return WishlistNotifier(repository);
});

final isProductWishlistedProvider = Provider.family<bool, String>((ref, productId) {
  final wishlistState = ref.watch(wishlistStateProvider);
  return wishlistState.whenOrNull(
        success: (items) => items.any((item) => item.id == productId),
      ) ??
      false;
});
