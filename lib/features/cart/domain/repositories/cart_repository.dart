import '../../../../core/utils/result.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<Result<CartEntity>> getCart();
  Future<Result<CartEntity>> addToCart(String productId, {int quantity = 1});
  Future<Result<CartEntity>> updateQuantity(String productId, int quantity);
  Future<Result<CartEntity>> removeFromCart(String productId);
  Future<Result<CartEntity>> clearCart();
  Future<Result<CartEntity>> applyCoupon(String code);
  Future<Result<CartEntity>> removeCoupon();
}
