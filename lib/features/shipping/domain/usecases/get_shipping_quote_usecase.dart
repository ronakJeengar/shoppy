import '../../../../core/utils/result.dart';
import '../entities/shipping_entity.dart';
import '../repositories/shipping_repository.dart';

class GetShippingQuoteUseCase {
  final ShippingRepository _repository;

  GetShippingQuoteUseCase(this._repository);

  Future<Result<ShippingQuoteEntity>> call({
    required String pinCode,
    required double subtotal,
    String shippingMethod = 'STANDARD',
  }) {
    return _repository.calculateShippingQuote(
      pinCode: pinCode,
      subtotal: subtotal,
      shippingMethod: shippingMethod,
    );
  }
}
