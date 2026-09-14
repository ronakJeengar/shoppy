import 'package:shopp_app/core/utils/result.dart';
import '../entities/emi_plan_entity.dart';
import '../repositories/emi_repository.dart';

class GetEmiPlansUseCase {
  final EmiRepository _repository;

  GetEmiPlansUseCase(this._repository);

  Future<Result<EmiPlansResponseEntity>> call({double? amount}) {
    return _repository.getEmiPlans(amount: amount);
  }
}
