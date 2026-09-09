import '../../../../core/utils/result.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _repository;

  GetCartUseCase(this._repository);

  Future<Result<CartEntity>> call() => _repository.getCart();
}

class AddToCartUseCase {
  final CartRepository _repository;

  AddToCartUseCase(this._repository);

  Future<Result<CartEntity>> call(String productId, {int quantity = 1}) {
    return _repository.addToCart(productId, quantity: quantity);
  }
}

class UpdateCartQuantityUseCase {
  final CartRepository _repository;

  UpdateCartQuantityUseCase(this._repository);

  Future<Result<CartEntity>> call(String productId, int quantity) {
    return _repository.updateQuantity(productId, quantity);
  }
}

class RemoveFromCartUseCase {
  final CartRepository _repository;

  RemoveFromCartUseCase(this._repository);

  Future<Result<CartEntity>> call(String productId) {
    return _repository.removeFromCart(productId);
  }
}

class ClearCartUseCase {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  Future<Result<CartEntity>> call() => _repository.clearCart();
}
