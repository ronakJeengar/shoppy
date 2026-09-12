import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/cart_remote_datasource.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/cart_usecases.dart';

/// Data Source Provider
final cartRemoteDataSourceProvider = Provider<CartRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return CartRemoteDataSourceImpl(client);
});

/// Repository Provider
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final remote = ref.watch(cartRemoteDataSourceProvider);
  return CartRepositoryImpl(remote);
});

/// Use Case Providers
final getCartUseCaseProvider = Provider<GetCartUseCase>((ref) {
  return GetCartUseCase(ref.watch(cartRepositoryProvider));
});

final addToCartUseCaseProvider = Provider<AddToCartUseCase>((ref) {
  return AddToCartUseCase(ref.watch(cartRepositoryProvider));
});

final updateCartQuantityUseCaseProvider = Provider<UpdateCartQuantityUseCase>((ref) {
  return UpdateCartQuantityUseCase(ref.watch(cartRepositoryProvider));
});

final removeFromCartUseCaseProvider = Provider<RemoveFromCartUseCase>((ref) {
  return RemoveFromCartUseCase(ref.watch(cartRepositoryProvider));
});

final clearCartUseCaseProvider = Provider<ClearCartUseCase>((ref) {
  return ClearCartUseCase(ref.watch(cartRepositoryProvider));
});

final applyCouponUseCaseProvider = Provider<ApplyCouponUseCase>((ref) {
  return ApplyCouponUseCase(ref.watch(cartRepositoryProvider));
});

final removeCouponUseCaseProvider = Provider<RemoveCouponUseCase>((ref) {
  return RemoveCouponUseCase(ref.watch(cartRepositoryProvider));
});

/// Cart State Notifier
class CartNotifier extends StateNotifier<UiState<CartEntity>> {
  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartQuantityUseCase _updateCartQuantityUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final ApplyCouponUseCase _applyCouponUseCase;
  final RemoveCouponUseCase _removeCouponUseCase;

  CartNotifier({
    required GetCartUseCase getCartUseCase,
    required AddToCartUseCase addToCartUseCase,
    required UpdateCartQuantityUseCase updateCartQuantityUseCase,
    required RemoveFromCartUseCase removeFromCartUseCase,
    required ClearCartUseCase clearCartUseCase,
    required ApplyCouponUseCase applyCouponUseCase,
    required RemoveCouponUseCase removeCouponUseCase,
  })  : _getCartUseCase = getCartUseCase,
        _addToCartUseCase = addToCartUseCase,
        _updateCartQuantityUseCase = updateCartQuantityUseCase,
        _removeFromCartUseCase = removeFromCartUseCase,
        _clearCartUseCase = clearCartUseCase,
        _applyCouponUseCase = applyCouponUseCase,
        _removeCouponUseCase = removeCouponUseCase,
        super(const UiState.initial()) {
    loadCart();
  }

  Future<void> loadCart() async {
    state = const UiState.loading();
    final result = await _getCartUseCase();
    result.fold(
      onSuccess: (cart) {
        if (cart.isEmpty) {
          state = const UiState.empty('Your cart is empty');
        } else {
          state = UiState.success(cart);
        }
      },
      onFailure: (failure) {
        state = UiState.error(failure.message);
      },
    );
  }

  Future<bool> addToCart(String productId, {int quantity = 1}) async {
    final result = await _addToCartUseCase(productId, quantity: quantity);
    return result.fold(
      onSuccess: (cart) {
        state = UiState.success(cart);
        return true;
      },
      onFailure: (failure) {
        return false;
      },
    );
  }

  Future<bool> updateQuantity(String productId, int quantity) async {
    if (quantity <= 0) {
      return removeFromCart(productId);
    }
    final result = await _updateCartQuantityUseCase(productId, quantity);
    return result.fold(
      onSuccess: (cart) {
        state = cart.isEmpty
            ? const UiState.empty('Your cart is empty')
            : UiState.success(cart);
        return true;
      },
      onFailure: (failure) => false,
    );
  }

  Future<bool> removeFromCart(String productId) async {
    final result = await _removeFromCartUseCase(productId);
    return result.fold(
      onSuccess: (cart) {
        state = cart.isEmpty
            ? const UiState.empty('Your cart is empty')
            : UiState.success(cart);
        return true;
      },
      onFailure: (failure) => false,
    );
  }

  Future<void> clearCart() async {
    await _clearCartUseCase();
    state = const UiState.empty('Your cart is empty');
  }

  Future<String?> applyCoupon(String code) async {
    final result = await _applyCouponUseCase(code);
    return result.fold(
      onSuccess: (cart) {
        state = UiState.success(cart);
        return null; // Null indicates success
      },
      onFailure: (failure) {
        return failure.message;
      },
    );
  }

  Future<bool> removeCoupon() async {
    final result = await _removeCouponUseCase();
    return result.fold(
      onSuccess: (cart) {
        state = UiState.success(cart);
        return true;
      },
      onFailure: (failure) => false,
    );
  }
}

/// Global Cart Notifier Provider
final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, UiState<CartEntity>>((ref) {
  ref.watch(currentUserProvider.select((u) => u?.id));
  return CartNotifier(
    getCartUseCase: ref.watch(getCartUseCaseProvider),
    addToCartUseCase: ref.watch(addToCartUseCaseProvider),
    updateCartQuantityUseCase: ref.watch(updateCartQuantityUseCaseProvider),
    removeFromCartUseCase: ref.watch(removeFromCartUseCaseProvider),
    clearCartUseCase: ref.watch(clearCartUseCaseProvider),
    applyCouponUseCase: ref.watch(applyCouponUseCaseProvider),
    removeCouponUseCase: ref.watch(removeCouponUseCaseProvider),
  );
});

/// Cart item count provider (e.g. for badges)
final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartNotifierProvider);
  return cartState.whenOrNull(
        success: (cart) => cart.itemCount,
      ) ??
      0;
});
