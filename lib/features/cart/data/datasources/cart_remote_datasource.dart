import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<CartModel> addItem(String productId, int quantity);
  Future<CartModel> updateQuantity(String productId, int quantity);
  Future<CartModel> removeItem(String productId);
  Future<void> clearCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiClient _client;

  CartRemoteDataSourceImpl(this._client);

  @override
  Future<CartModel> getCart() async {
    final response = await _client.get(Urls.cart);
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return CartModel.fromJson(map);
  }

  @override
  Future<CartModel> addItem(String productId, int quantity) async {
    final response = await _client.post(
      Urls.cartItems,
      data: {'productId': productId, 'quantity': quantity},
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return CartModel.fromJson(map);
  }

  @override
  Future<CartModel> updateQuantity(String productId, int quantity) async {
    final response = await _client.patch(
      '${Urls.cartItems}/$productId',
      data: {'quantity': quantity},
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return CartModel.fromJson(map);
  }

  @override
  Future<CartModel> removeItem(String productId) async {
    final response = await _client.delete('${Urls.cartItems}/$productId');
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return CartModel.fromJson(map);
  }

  @override
  Future<void> clearCart() async {
    await _client.delete(Urls.cart);
  }
}
