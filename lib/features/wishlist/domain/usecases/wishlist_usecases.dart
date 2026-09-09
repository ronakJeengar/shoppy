import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlistUseCase {
  final WishlistRepository _repository;

  GetWishlistUseCase(this._repository);

  Future<Result<List<ProductEntity>>> call() => _repository.getWishlist();
}

class ToggleWishlistUseCase {
  final WishlistRepository _repository;

  ToggleWishlistUseCase(this._repository);

  Future<Result<bool>> call(String productId) =>
      _repository.toggleWishlist(productId);
}

class RemoveFromWishlistUseCase {
  final WishlistRepository _repository;

  RemoveFromWishlistUseCase(this._repository);

  Future<Result<void>> call(String productId) =>
      _repository.removeFromWishlist(productId);
}
