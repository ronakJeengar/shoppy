import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/network/api_client.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import '../../data/datasources/wishlist_remote_datasource.dart';
import '../../data/repositories/wishlist_repository_impl.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../../domain/usecases/wishlist_usecases.dart';

final wishlistRemoteDataSourceProvider =
    Provider<WishlistRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return WishlistRemoteDataSourceImpl(client);
});

final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
  final remote = ref.watch(wishlistRemoteDataSourceProvider);
  return WishlistRepositoryImpl(remote);
});

final getWishlistUseCaseProvider = Provider<GetWishlistUseCase>((ref) {
  return GetWishlistUseCase(ref.watch(wishlistRepositoryProvider));
});

final toggleWishlistUseCaseProvider = Provider<ToggleWishlistUseCase>((ref) {
  return ToggleWishlistUseCase(ref.watch(wishlistRepositoryProvider));
});

final removeFromWishlistUseCaseProvider =
    Provider<RemoveFromWishlistUseCase>((ref) {
  return RemoveFromWishlistUseCase(ref.watch(wishlistRepositoryProvider));
});

class WishlistNotifier extends StateNotifier<UiState<List<ProductEntity>>> {
  final GetWishlistUseCase _getWishlistUseCase;
  final ToggleWishlistUseCase _toggleWishlistUseCase;
  final RemoveFromWishlistUseCase _removeFromWishlistUseCase;
  Set<String> _wishlistedIds = {};

  WishlistNotifier({
    required GetWishlistUseCase getWishlistUseCase,
    required ToggleWishlistUseCase toggleWishlistUseCase,
    required RemoveFromWishlistUseCase removeFromWishlistUseCase,
  })  : _getWishlistUseCase = getWishlistUseCase,
        _toggleWishlistUseCase = toggleWishlistUseCase,
        _removeFromWishlistUseCase = removeFromWishlistUseCase,
        super(const UiState.initial()) {
    loadWishlist();
  }

  bool isWishlisted(String productId) => _wishlistedIds.contains(productId);

  Future<void> loadWishlist() async {
    state = const UiState.loading();
    final result = await _getWishlistUseCase();
    result.fold(
      onSuccess: (items) {
        _wishlistedIds = items.map((e) => e.id).toSet();
        if (items.isEmpty) {
          state = const UiState.empty('Your wishlist is empty');
        } else {
          state = UiState.success(items);
        }
      },
      onFailure: (failure) {
        state = UiState.error(failure.message);
      },
    );
  }

  Future<bool> toggle(ProductEntity product) async {
    final currentlyWishlisted = _wishlistedIds.contains(product.id);
    if (currentlyWishlisted) {
      _wishlistedIds.remove(product.id);
    } else {
      _wishlistedIds.add(product.id);
    }

    final currentItems = state.dataOrNull ?? [];
    final updatedItems = currentlyWishlisted
        ? currentItems.where((p) => p.id != product.id).toList()
        : [...currentItems, product];

    state = updatedItems.isEmpty
        ? const UiState.empty('Your wishlist is empty')
        : UiState.success(updatedItems);

    final result = await _toggleWishlistUseCase(product.id);
    return result.fold(
      onSuccess: (_) => true,
      onFailure: (_) {
        // Rollback on failure
        if (currentlyWishlisted) {
          _wishlistedIds.add(product.id);
        } else {
          _wishlistedIds.remove(product.id);
        }
        state = currentItems.isEmpty
            ? const UiState.empty('Your wishlist is empty')
            : UiState.success(currentItems);
        return false;
      },
    );
  }

  Future<void> remove(String productId) async {
    _wishlistedIds.remove(productId);
    final currentItems = state.dataOrNull ?? [];
    final updatedItems = currentItems.where((p) => p.id != productId).toList();

    state = updatedItems.isEmpty
        ? const UiState.empty('Your wishlist is empty')
        : UiState.success(updatedItems);

    await _removeFromWishlistUseCase(productId);
  }
}

final wishlistNotifierProvider =
    StateNotifierProvider<WishlistNotifier, UiState<List<ProductEntity>>>((ref) {
  ref.watch(currentUserProvider.select((u) => u?.id));
  return WishlistNotifier(
    getWishlistUseCase: ref.watch(getWishlistUseCaseProvider),
    toggleWishlistUseCase: ref.watch(toggleWishlistUseCaseProvider),
    removeFromWishlistUseCase: ref.watch(removeFromWishlistUseCaseProvider),
  );
});

final isWishlistedProvider = Provider.family<bool, String>((ref, productId) {
  final notifier = ref.watch(wishlistNotifierProvider.notifier);
  ref.watch(wishlistNotifierProvider);
  return notifier.isWishlisted(productId);
});
