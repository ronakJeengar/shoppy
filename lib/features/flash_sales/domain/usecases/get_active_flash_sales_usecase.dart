import '../../../../core/utils/result.dart';
import '../entities/flash_sale_entity.dart';
import '../repositories/flash_sale_repository.dart';

class GetActiveFlashSalesUseCase {
  final FlashSaleRepository _repository;

  GetActiveFlashSalesUseCase(this._repository);

  Future<Result<List<FlashSaleEntity>>> call({int limit = 10}) {
    return _repository.getActiveFlashSales(limit: limit);
  }
}
