import '../../../../core/utils/result.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/payment_model.dart';
import '../entities/checkout_entity.dart';

abstract class CheckoutRepository {
  Future<Result<CheckoutValidationEntity>> validateCheckout(
    String addressId, {
    String shippingMethod = 'STANDARD',
  });

  Future<Result<Map<String, dynamic>>> createOrder({
    required String addressId,
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    String? idempotencyKey,
  });

  Future<Result<PaymentModel>> processPayment({
    required String orderId,
    required String paymentMethod,
    String? idempotencyKey,
    bool simulateSuccess = true,
  });

  Future<Result<OrderModel>> confirmOrder({
    required String orderId,
    required String paymentId,
  });
}
