import '../../../../core/utils/result.dart';
import '../entities/shipping_entity.dart';

abstract class ShippingRepository {
  Future<Result<PinServiceabilityEntity>> checkServiceability(String pinCode);
  Future<Result<ShippingQuoteEntity>> calculateShippingQuote({
    required String pinCode,
    required double subtotal,
    String shippingMethod = 'STANDARD',
  });
  Future<Result<List<AvailableShippingMethodEntity>>> getShippingMethods();
}
