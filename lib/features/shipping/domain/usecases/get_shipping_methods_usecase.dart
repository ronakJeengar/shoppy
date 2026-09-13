import '../../../../core/utils/result.dart';
import '../entities/shipping_entity.dart';
import '../repositories/shipping_repository.dart';

class GetShippingMethodsUseCase {
  final ShippingRepository _repository;

  GetShippingMethodsUseCase(this._repository);

  Future<Result<List<AvailableShippingMethodEntity>>> call() {
    return _repository.getShippingMethods();
  }
}
