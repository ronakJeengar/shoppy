import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../../../../data/models/product_model.dart';

abstract class WishlistRemoteDataSource {
  Future<List<Product>> getWishlist();
  Future<bool> toggleWishlist(String productId);
  Future<void> removeFromWishlist(String productId);
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final ApiClient _client;

  WishlistRemoteDataSourceImpl(this._client);

  @override
  Future<List<Product>> getWishlist() async {
    final response = await _client.get(Urls.wishlist);
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    final items = map['items'] as List? ?? [];
    return items
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> toggleWishlist(String productId) async {
    final response = await _client.post(
      Urls.wishlistToggle,
      data: {'productId': productId},
    );
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['status'] == true;
    }
    return true;
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
    await _client.delete('${Urls.wishlist}/$productId');
  }
}
