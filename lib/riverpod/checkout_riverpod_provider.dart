import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/checkout_validation_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/payment_model.dart';
import 'package:shopp_app/data/repositories/checkout_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

final checkoutRepositoryProvider = Provider<CheckoutRepository>((ref) {
  return CheckoutRepository();
});

class CheckoutState {
  final String? selectedAddressId;
  final String shippingMethod;
  final String paymentMethod;
  final UiState<CheckoutValidationModel?> validationState;
  final UiState<OrderModel?> orderPlacementState;
  final PaymentModel? currentPayment;
  final String? errorMessage;

  const CheckoutState({
    this.selectedAddressId,
    this.shippingMethod = 'STANDARD',
    this.paymentMethod = 'CARD',
    this.validationState = const UiState.initial(),
    this.orderPlacementState = const UiState.initial(),
    this.currentPayment,
    this.errorMessage,
  });

  CheckoutState copyWith({
    String? selectedAddressId,
    String? shippingMethod,
    String? paymentMethod,
    UiState<CheckoutValidationModel?>? validationState,
    UiState<OrderModel?>? orderPlacementState,
    PaymentModel? currentPayment,
    String? errorMessage,
  }) {
    return CheckoutState(
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      validationState: validationState ?? this.validationState,
      orderPlacementState: orderPlacementState ?? this.orderPlacementState,
      currentPayment: currentPayment ?? this.currentPayment,
      errorMessage: errorMessage,
    );
  }
}

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final CheckoutRepository _repository;

  CheckoutNotifier(this._repository) : super(const CheckoutState());

  void selectAddress(String addressId) {
    state = state.copyWith(selectedAddressId: addressId);
    validateCheckout();
  }

  void selectShippingMethod(String method) {
    state = state.copyWith(shippingMethod: method);
    if (state.selectedAddressId != null) {
      validateCheckout();
    }
  }

  void selectPaymentMethod(String method) {
    state = state.copyWith(paymentMethod: method);
  }

  Future<bool> validateCheckout() async {
    final addressId = state.selectedAddressId;
    if (addressId == null) {
      state = state.copyWith(
        validationState: const UiState.error('Please select a shipping address'),
      );
      return false;
    }

    state = state.copyWith(validationState: const UiState.loading(), errorMessage: null);
    try {
      final response = await _repository.validateCheckout(
        addressId,
        shippingMethod: state.shippingMethod,
      );

      if (response.status && response.data is CheckoutValidationModel) {
        state = state.copyWith(
          validationState: UiState.success(response.data as CheckoutValidationModel),
          errorMessage: null,
        );
        return true;
      } else {
        state = state.copyWith(
          validationState: UiState.error(response.message),
          errorMessage: response.message,
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        validationState: UiState.error(e.toString()),
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<OrderModel?> placeOrder({String? idempotencyKey}) async {
    final addressId = state.selectedAddressId;
    if (addressId == null) {
      state = state.copyWith(
        orderPlacementState: const UiState.error('Please select an address'),
      );
      return null;
    }

    state = state.copyWith(orderPlacementState: const UiState.loading(), errorMessage: null);
    try {
      final response = await _repository.createOrder(
        addressId: addressId,
        shippingMethod: state.shippingMethod,
        paymentMethod: state.paymentMethod,
        idempotencyKey: idempotencyKey,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final order = data['order'] as OrderModel?;
        final payment = data['payment'] as PaymentModel?;

        state = state.copyWith(
          orderPlacementState: UiState.success(order),
          currentPayment: payment,
          errorMessage: null,
        );
        return order;
      } else {
        state = state.copyWith(
          orderPlacementState: UiState.error(response.message),
          errorMessage: response.message,
        );
        return null;
      }
    } catch (e) {
      state = state.copyWith(
        orderPlacementState: UiState.error(e.toString()),
        errorMessage: e.toString(),
      );
      return null;
    }
  }

  Future<bool> verifyPayment(String transactionId, {String? signature}) async {
    try {
      final response = await _repository.verifyPayment(transactionId, signature: signature);
      return response.status;
    } catch (e) {
      return false;
    }
  }

  void reset() {
    state = const CheckoutState();
  }
}

final checkoutStateProvider =
    StateNotifierProvider<CheckoutNotifier, CheckoutState>((ref) {
  final repository = ref.watch(checkoutRepositoryProvider);
  return CheckoutNotifier(repository);
});
