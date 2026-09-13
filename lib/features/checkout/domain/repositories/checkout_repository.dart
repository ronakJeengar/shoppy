import '../../../../core/utils/result.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../entities/checkout_entity.dart';
import '../entities/payment_entity.dart';

abstract class CheckoutRepository {
  Future<Result<CheckoutValidationEntity>> validateCheckout(
    String addressId, {
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
  });

  Future<Result<Map<String, dynamic>>> createOrder({
    required String addressId,
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    String? idempotencyKey,
  });

  Future<Result<PaymentEntity>> processPayment({
    required String orderId,
    required String paymentMethod,
    String? idempotencyKey,
    bool simulateSuccess = true,
  });

  Future<Result<OrderEntity>> confirmOrder({
    required String orderId,
    required String paymentId,
  });
}
