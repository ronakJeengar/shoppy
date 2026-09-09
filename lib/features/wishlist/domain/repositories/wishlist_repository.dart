import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';

abstract class WishlistRepository {
  Future<Result<List<ProductEntity>>> getWishlist();
  Future<Result<bool>> toggleWishlist(String productId);
  Future<Result<void>> removeFromWishlist(String productId);
}
