import '../../../../core/utils/result.dart';
import '../../../../data/models/order_model.dart';
import '../entities/checkout_entity.dart';
import '../repositories/checkout_repository.dart';

class ValidateCheckoutUseCase {
  final CheckoutRepository _repository;

  ValidateCheckoutUseCase(this._repository);

  Future<Result<CheckoutValidationEntity>> call(
    String addressId, {
    String shippingMethod = 'STANDARD',
  }) {
    return _repository.validateCheckout(addressId, shippingMethod: shippingMethod);
  }
}

class PlaceOrderUseCase {
  final CheckoutRepository _repository;

  PlaceOrderUseCase(this._repository);

  Future<Result<OrderModel>> call({
    required String addressId,
    String shippingMethod = 'STANDARD',
    String paymentMethod = 'CARD',
    String? idempotencyKey,
  }) async {
    final createResult = await _repository.createOrder(
      addressId: addressId,
      shippingMethod: shippingMethod,
      paymentMethod: paymentMethod,
      idempotencyKey: idempotencyKey,
    );

    return createResult.fold(
      onSuccess: (data) async {
        final order = data['order'] as OrderModel;
        if (paymentMethod == 'COD') {
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
