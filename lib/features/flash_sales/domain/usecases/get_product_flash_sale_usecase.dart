import '../../../../core/utils/result.dart';
import '../entities/flash_sale_entity.dart';
import '../repositories/flash_sale_repository.dart';

class GetProductFlashSaleUseCase {
  final FlashSaleRepository _repository;

  GetProductFlashSaleUseCase(this._repository);

  Future<Result<FlashSaleItemEntity?>> call(String productId) {
    return _repository.getProductFlashSale(productId);
  }
}
