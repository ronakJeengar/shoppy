import '../../../../core/utils/result.dart';
import '../entities/flash_sale_entity.dart';

abstract class FlashSaleRepository {
  Future<Result<List<FlashSaleEntity>>> getActiveFlashSales({int limit = 10});
  Future<Result<List<FlashSaleEntity>>> getUpcomingFlashSales({int limit = 10});
  Future<Result<FlashSaleEntity>> getFlashSaleById(String id);
  Future<Result<FlashSaleItemEntity?>> getProductFlashSale(String productId);
}
