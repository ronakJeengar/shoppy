import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/emi_plan_model.dart';

abstract class EmiRemoteDataSource {
  Future<EmiPlansResponseModel> getEmiPlans({double? amount});

  Future<EmiQuoteModel> calculateEmiQuote({
    required double amount,
    required String planId,
    required int tenureMonths,
  });
}

class EmiRemoteDataSourceImpl implements EmiRemoteDataSource {
  final ApiClient _client;

  EmiRemoteDataSourceImpl(this._client);

  @override
  Future<EmiPlansResponseModel> getEmiPlans({double? amount}) async {
    final queryParams = <String, dynamic>{};
    if (amount != null && amount > 0) {
      queryParams['amount'] = amount;
    }

    final response = await _client.get(
      Urls.emiPlans,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return EmiPlansResponseModel.fromJson(map);
  }

  @override
  Future<EmiQuoteModel> calculateEmiQuote({
    required double amount,
    required String planId,
    required int tenureMonths,
  }) async {
    final response = await _client.post(
      Urls.emiCalculate,
      data: {
        'amount': amount,
        'planId': planId,
        'tenureMonths': tenureMonths,
      },
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return EmiQuoteModel.fromJson(map);
  }
}
