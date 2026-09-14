import '../../../../core/utils/result.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../entities/checkout_entity.dart';
import '../repositories/checkout_repository.dart';

class ValidateCheckoutUseCase {
  final CheckoutRepository _repository;

  ValidateCheckoutUseCase(this._repository);

  Future<Result<CheckoutValidationEntity>> call(
    String addressId, {
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    Map<String, dynamic>? emiPlan,
  }) {
    return _repository.validateCheckout(
      addressId,
      shippingMethod: shippingMethod,
      paymentMethod: paymentMethod,
      emiPlan: emiPlan,
    );
  }
}

class PlaceOrderUseCase {
  final CheckoutRepository _repository;

  PlaceOrderUseCase(this._repository);

  Future<Result<OrderEntity>> call({
    required String addressId,
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    Map<String, dynamic>? emiPlan,
    String? idempotencyKey,
  }) async {
    final createResult = await _repository.createOrder(
      addressId: addressId,
      shippingMethod: shippingMethod,
      paymentMethod: paymentMethod,
      emiPlan: emiPlan,
      idempotencyKey: idempotencyKey,
    );

    return createResult.fold(
      onSuccess: (data) async {
        final order = data['order'] as OrderEntity;
        if (paymentMethod == 'COD' || paymentMethod == 'EMI') {
          return Success(order);
        }

        final payResult = await _repository.processPayment(
          orderId: order.id,
          paymentMethod: paymentMethod,
          idempotencyKey: idempotencyKey,
        );

        return payResult.fold(
          onSuccess: (payment) async {
            final confirmResult = await _repository.confirmOrder(
              orderId: order.id,
              paymentId: payment.id,
            );
            return confirmResult.fold(
              onSuccess: (confirmed) => Success(confirmed),
              onFailure: (failure) => Success(order),
            );
          },
          onFailure: (failure) => FailureResult(failure),
        );
      },
      onFailure: (failure) => FailureResult(failure),
    );
  }
}
