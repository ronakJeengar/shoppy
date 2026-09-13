import '../../../../core/utils/result.dart';
import '../entities/shipping_entity.dart';
import '../repositories/shipping_repository.dart';

class CheckServiceabilityUseCase {
  final ShippingRepository _repository;

  CheckServiceabilityUseCase(this._repository);

  Future<Result<PinServiceabilityEntity>> call(String pinCode) {
    return _repository.checkServiceability(pinCode);
  }
}
