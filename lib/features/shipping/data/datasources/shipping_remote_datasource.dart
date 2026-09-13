import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/shipping_model.dart';

abstract class ShippingRemoteDataSource {
  Future<PinServiceabilityModel> checkServiceability(String pinCode);
  Future<ShippingQuoteModel> calculateShippingQuote({
    required String pinCode,
    required double subtotal,
    String shippingMethod = 'STANDARD',
  });
  Future<List<AvailableShippingMethodModel>> getShippingMethods();
}

class ShippingRemoteDataSourceImpl implements ShippingRemoteDataSource {
  final ApiClient _client;

  ShippingRemoteDataSourceImpl(this._client);

  @override
  Future<PinServiceabilityModel> checkServiceability(String pinCode) async {
    final response = await _client.get(
      Urls.shippingServiceability(pinCode),
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);

    if (map is Map<String, dynamic>) {
      return PinServiceabilityModel.fromJson(map);
    }

    return PinServiceabilityModel(
      serviceable: false,
      pinCode: pinCode,
      message: 'Failed to verify PIN code serviceability',
    );
  }

  @override
  Future<ShippingQuoteModel> calculateShippingQuote({
    required String pinCode,
    required double subtotal,
    String shippingMethod = 'STANDARD',
  }) async {
    final response = await _client.post(
      Urls.shippingQuote,
      data: {
        'pinCode': pinCode,
        'subtotal': subtotal,
        'shippingMethod': shippingMethod,
      },
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);

    if (map is Map<String, dynamic>) {
      return ShippingQuoteModel.fromJson(map);
    }

    return ShippingQuoteModel(
      serviceable: false,
      pinCode: pinCode,
      shippingAmount: 0.0,
      message: 'Failed to calculate shipping quote',
    );
  }

  @override
  Future<List<AvailableShippingMethodModel>> getShippingMethods() async {
    final response = await _client.get(
      Urls.shippingMethods,
    );

    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);

    final rawMethods = map is Map<String, dynamic> ? (map['methods'] ?? []) : (map is List ? map : []);
    final List<AvailableShippingMethodModel> methods = [];

    if (rawMethods is List) {
      for (final item in rawMethods) {
        if (item is Map<String, dynamic>) {
          methods.add(AvailableShippingMethodModel.fromJson(item));
        }
      }
    }

    return methods;
  }
}
