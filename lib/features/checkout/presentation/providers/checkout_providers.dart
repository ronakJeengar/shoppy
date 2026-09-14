import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../../data/datasources/checkout_remote_datasource.dart';
import '../../data/repositories/checkout_repository_impl.dart';
import '../../domain/entities/checkout_entity.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../../domain/usecases/checkout_usecases.dart';

final checkoutRemoteDataSourceProvider =
    Provider<CheckoutRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return CheckoutRemoteDataSourceImpl(client);
});

final checkoutRepositoryProvider = Provider<CheckoutRepository>((ref) {
  final remote = ref.watch(checkoutRemoteDataSourceProvider);
  return CheckoutRepositoryImpl(remote);
});

final validateCheckoutUseCaseProvider =
    Provider<ValidateCheckoutUseCase>((ref) {
  return ValidateCheckoutUseCase(ref.watch(checkoutRepositoryProvider));
});

final placeOrderUseCaseProvider = Provider<PlaceOrderUseCase>((ref) {
  return PlaceOrderUseCase(ref.watch(checkoutRepositoryProvider));
});

class CheckoutState {
  final bool isValidating;
  final bool isPlacingOrder;
  final CheckoutValidationEntity? validation;
  final String? error;
  final OrderEntity? placedOrder;
  final String selectedPaymentMethod;
  final String selectedShippingMethod;

  const CheckoutState({
    this.isValidating = false,
    this.isPlacingOrder = false,
    this.validation,
    this.error,
    this.placedOrder,
    this.selectedPaymentMethod = 'CARD',
    this.selectedShippingMethod = 'STANDARD',
  });

  CheckoutState copyWith({
    bool? isValidating,
    bool? isPlacingOrder,
    CheckoutValidationEntity? validation,
    String? error,
    bool clearError = false,
    OrderEntity? placedOrder,
    String? selectedPaymentMethod,
    String? selectedShippingMethod,
  }) {
    return CheckoutState(
      isValidating: isValidating ?? this.isValidating,
      isPlacingOrder: isPlacingOrder ?? this.isPlacingOrder,
      validation: validation ?? this.validation,
      error: clearError ? null : (error ?? this.error),
      placedOrder: placedOrder ?? this.placedOrder,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectedShippingMethod:
          selectedShippingMethod ?? this.selectedShippingMethod,
    );
  }
}

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final ValidateCheckoutUseCase _validateUseCase;
  final PlaceOrderUseCase _placeOrderUseCase;

  CheckoutNotifier({
    required ValidateCheckoutUseCase validateUseCase,
    required PlaceOrderUseCase placeOrderUseCase,
  })  : _validateUseCase = validateUseCase,
        _placeOrderUseCase = placeOrderUseCase,
        super(const CheckoutState());

  void setPaymentMethod(String method) {
    state = state.copyWith(selectedPaymentMethod: method);
  }

  void setShippingMethod(String method) {
    state = state.copyWith(selectedShippingMethod: method);
  }

  Future<void> validateCheckout(String addressId, {Map<String, dynamic>? emiPlan}) async {
    state = state.copyWith(isValidating: true, clearError: true);
    final result = await _validateUseCase(
      addressId,
      shippingMethod: state.selectedShippingMethod,
      paymentMethod: state.selectedPaymentMethod,
      emiPlan: emiPlan,
    );

    result.fold(
      onSuccess: (val) {
        state = state.copyWith(isValidating: false, validation: val);
      },
      onFailure: (failure) {
        state = state.copyWith(isValidating: false, error: failure.message);
      },
    );
  }

  Future<OrderEntity?> placeOrder({
    required String addressId,
    Map<String, dynamic>? emiPlan,
    String? idempotencyKey,
  }) async {
    state = state.copyWith(isPlacingOrder: true, clearError: true);
    final result = await _placeOrderUseCase(
      addressId: addressId,
      shippingMethod: state.selectedShippingMethod,
      paymentMethod: state.selectedPaymentMethod,
      emiPlan: emiPlan,
      idempotencyKey: idempotencyKey,
    );

    return result.fold(
      onSuccess: (order) {
        state = state.copyWith(isPlacingOrder: false, placedOrder: order);
        return order;
      },
      onFailure: (failure) {
        state = state.copyWith(isPlacingOrder: false, error: failure.message);
        return null;
      },
    );
  }
}

final checkoutNotifierProvider =
    StateNotifierProvider<CheckoutNotifier, CheckoutState>((ref) {
  return CheckoutNotifier(
    validateUseCase: ref.watch(validateCheckoutUseCaseProvider),
    placeOrderUseCase: ref.watch(placeOrderUseCaseProvider),
  );
});
