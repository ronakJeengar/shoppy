import 'package:shopp_app/core/utils/result.dart';
import '../entities/emi_plan_entity.dart';
import '../repositories/emi_repository.dart';

class CalculateEmiQuoteUseCase {
  final EmiRepository _repository;

  CalculateEmiQuoteUseCase(this._repository);

  Future<Result<EmiQuoteEntity>> call({
    required double amount,
    required String planId,
    required int tenureMonths,
  }) {
    return _repository.calculateEmiQuote(
      amount: amount,
      planId: planId,
      tenureMonths: tenureMonths,
    );
  }
}
