import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/checkout_validation_model.dart';
import '../models/payment_model.dart';
import '../../../orders/data/models/order_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<CheckoutValidationModel> validateCheckout(String addressId, String shippingMethod);
  Future<Map<String, dynamic>> createOrder({
    required String addressId,
    required String shippingMethod,
    required String paymentMethod,
    String? idempotencyKey,
  });
  Future<PaymentModel> processPayment({
    required String orderId,
    required String paymentMethod,
    String? idempotencyKey,
    bool simulateSuccess = true,
  });
  Future<OrderModel> confirmOrder({
    required String orderId,
    required String paymentId,
  });
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiClient _client;

  CheckoutRemoteDataSourceImpl(this._client);

  @override
  Future<CheckoutValidationModel> validateCheckout(
      String addressId, String shippingMethod) async {
    final response = await _client.post(
      Urls.checkoutValidate,
      data: {
        'addressId': addressId,
        'shippingMethod': shippingMethod,
      },
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    return CheckoutValidationModel.fromJson(map);
  }

  @override
  Future<Map<String, dynamic>> createOrder({
    required String addressId,
    required String shippingMethod,
    required String paymentMethod,
    String? idempotencyKey,
  }) async {
    final response = await _client.post(
      Urls.checkoutCreate,
      data: {
        'addressId': addressId,
        'shippingMethod': shippingMethod,
        'paymentMethod': paymentMethod,
        if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
      },
    );
    final data = response.data;
    return (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
  }

  @override
  Future<PaymentModel> processPayment({
    required String orderId,
    required String paymentMethod,
    String? idempotencyKey,
    bool simulateSuccess = true,
  }) async {
    final endpoint = simulateSuccess ? Urls.paymentsVerify : Urls.paymentsFail;
    final response = await _client.post(
      endpoint,
      data: {
        'orderId': orderId,
        'transactionId': 'txn_${DateTime.now().millisecondsSinceEpoch}',
        if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
      },
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    final paymentMap = (map['payment'] is Map<String, dynamic>)
        ? map['payment'] as Map<String, dynamic>
        : map;
    return PaymentModel.fromJson(paymentMap);
  }

  @override
  Future<OrderModel> confirmOrder({
    required String orderId,
    required String paymentId,
  }) async {
    final response = await _client.get('${Urls.orders}/$orderId');
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    final orderMap = (map['order'] is Map<String, dynamic>)
        ? map['order'] as Map<String, dynamic>
        : map;
    return OrderModel.fromJson(orderMap);
  }
}
