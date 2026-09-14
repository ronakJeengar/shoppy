import 'package:shopp_app/core/utils/result.dart';
import '../entities/emi_plan_entity.dart';

abstract class EmiRepository {
  /// Fetch all active EMI plans with calculated quotes if amount is specified
  Future<Result<EmiPlansResponseEntity>> getEmiPlans({double? amount});

  /// Authoritatively calculate an EMI quote for an amount, planId, and tenure
  Future<Result<EmiQuoteEntity>> calculateEmiQuote({
    required double amount,
    required String planId,
    required int tenureMonths,
  });
}
