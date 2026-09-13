import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/shipping_remote_datasource.dart';
import '../../data/repositories/shipping_repository_impl.dart';
import '../../domain/entities/shipping_entity.dart';
import '../../domain/repositories/shipping_repository.dart';
import '../../domain/usecases/check_serviceability_usecase.dart';
import '../../domain/usecases/get_shipping_methods_usecase.dart';
import '../../domain/usecases/get_shipping_quote_usecase.dart';

final shippingRemoteDataSourceProvider = Provider<ShippingRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return ShippingRemoteDataSourceImpl(client);
});

final shippingRepositoryProvider = Provider<ShippingRepository>((ref) {
  final remote = ref.watch(shippingRemoteDataSourceProvider);
  return ShippingRepositoryImpl(remote);
});

final checkServiceabilityUseCaseProvider = Provider<CheckServiceabilityUseCase>((ref) {
  final repo = ref.watch(shippingRepositoryProvider);
  return CheckServiceabilityUseCase(repo);
});

final getShippingQuoteUseCaseProvider = Provider<GetShippingQuoteUseCase>((ref) {
  final repo = ref.watch(shippingRepositoryProvider);
  return GetShippingQuoteUseCase(repo);
});

final getShippingMethodsUseCaseProvider = Provider<GetShippingMethodsUseCase>((ref) {
  final repo = ref.watch(shippingRepositoryProvider);
  return GetShippingMethodsUseCase(repo);
});

/// Holds the last entered / selected PIN code across the application
final selectedPinCodeProvider = StateProvider<String?>((ref) => null);

/// State for checking PIN serviceability
class PinServiceabilityState {
  final bool isLoading;
  final String pinCode;
  final PinServiceabilityEntity? result;
  final String? error;

  const PinServiceabilityState({
    this.isLoading = false,
    this.pinCode = '',
    this.result,
    this.error,
  });

  PinServiceabilityState copyWith({
    bool? isLoading,
    String? pinCode,
    PinServiceabilityEntity? result,
    String? error,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return PinServiceabilityState(
      isLoading: isLoading ?? this.isLoading,
      pinCode: pinCode ?? this.pinCode,
      result: clearResult ? null : (result ?? this.result),
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class PinServiceabilityNotifier extends StateNotifier<PinServiceabilityState> {
  final CheckServiceabilityUseCase _checkUseCase;
  final Ref _ref;

  PinServiceabilityNotifier(this._checkUseCase, this._ref)
      : super(const PinServiceabilityState());

  Future<void> check(String rawPin) async {
    final trimmed = rawPin.trim();
    if (trimmed.isEmpty) return;

    if (!RegExp(r'^[1-9][0-9]{5}$').hasMatch(trimmed)) {
      state = state.copyWith(
        isLoading: false,
        pinCode: trimmed,
        error: 'Please enter a valid 6-digit Indian PIN code (cannot start with 0).',
        clearResult: true,
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
      pinCode: trimmed,
      clearError: true,
    );

    final res = await _checkUseCase(trimmed);
    res.fold(
      onSuccess: (entity) {
        state = state.copyWith(
          isLoading: false,
          result: entity,
          clearError: true,
        );
        _ref.read(selectedPinCodeProvider.notifier).state = trimmed;
      },
      onFailure: (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
          clearResult: true,
        );
      },
    );
  }

  void clear() {
    state = const PinServiceabilityState();
  }
}

final pinServiceabilityNotifierProvider =
    StateNotifierProvider<PinServiceabilityNotifier, PinServiceabilityState>((ref) {
  final useCase = ref.watch(checkServiceabilityUseCaseProvider);
  return PinServiceabilityNotifier(useCase, ref);
});

/// Available shipping methods from backend configuration
final availableShippingMethodsProvider =
    FutureProvider<List<AvailableShippingMethodEntity>>((ref) async {
  final useCase = ref.watch(getShippingMethodsUseCaseProvider);
  final res = await useCase();
  return res.fold(
    onSuccess: (methods) => methods,
    onFailure: (failure) => [],
  );
});

/// Shipping quote query parameter tuple
class ShippingQuoteParams {
  final String pinCode;
  final double subtotal;
  final String shippingMethod;

  const ShippingQuoteParams({
    required this.pinCode,
    required this.subtotal,
    this.shippingMethod = 'STANDARD',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingQuoteParams &&
          runtimeType == other.runtimeType &&
          pinCode == other.pinCode &&
          subtotal == other.subtotal &&
          shippingMethod == other.shippingMethod;

  @override
  int get hashCode => Object.hash(pinCode, subtotal, shippingMethod);
}

final shippingQuoteProvider =
    FutureProvider.family<ShippingQuoteEntity?, ShippingQuoteParams>(
        (ref, params) async {
  if (params.pinCode.trim().length != 6) return null;
  final useCase = ref.watch(getShippingQuoteUseCaseProvider);
  final res = await useCase(
    pinCode: params.pinCode.trim(),
    subtotal: params.subtotal,
    shippingMethod: params.shippingMethod,
  );
  return res.fold(
    onSuccess: (quote) => quote,
    onFailure: (failure) => null,
  );
});
