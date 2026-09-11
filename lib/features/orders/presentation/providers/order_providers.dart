import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/order_remote_datasource.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/usecases/order_usecases.dart';

final orderRemoteDataSourceProvider = Provider<OrderRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return OrderRemoteDataSourceImpl(client);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final remote = ref.watch(orderRemoteDataSourceProvider);
  return OrderRepositoryImpl(remote);
});

final getOrdersUseCaseProvider = Provider<GetOrdersUseCase>((ref) {
  return GetOrdersUseCase(ref.watch(orderRepositoryProvider));
});

final getOrderDetailUseCaseProvider = Provider<GetOrderDetailUseCase>((ref) {
  return GetOrderDetailUseCase(ref.watch(orderRepositoryProvider));
});

final cancelOrderUseCaseProvider = Provider<CancelOrderUseCase>((ref) {
  return CancelOrderUseCase(ref.watch(orderRepositoryProvider));
});

class OrdersNotifier extends StateNotifier<UiState<List<OrderEntity>>> {
  final GetOrdersUseCase _getOrdersUseCase;
  final CancelOrderUseCase _cancelOrderUseCase;
  String? _currentFilter;

  OrdersNotifier({
    required GetOrdersUseCase getOrdersUseCase,
    required CancelOrderUseCase cancelOrderUseCase,
  })  : _getOrdersUseCase = getOrdersUseCase,
        _cancelOrderUseCase = cancelOrderUseCase,
        super(const UiState.initial()) {
    loadOrders();
  }

  Future<void> loadOrders({String? status}) async {
    _currentFilter = status;
    state = const UiState.loading();
    final result = await _getOrdersUseCase(status: status);
    result.fold(
      onSuccess: (orders) {
        if (orders.isEmpty) {
          state = const UiState.empty('No orders found');
        } else {
          state = UiState.success(orders);
        }
      },
      onFailure: (failure) {
        state = UiState.error(failure.message);
      },
    );
  }

  Future<bool> cancelOrder(String orderId, {String reason = 'Customer request'}) async {
    final result = await _cancelOrderUseCase(orderId, reason: reason);
    return result.fold(
      onSuccess: (_) {
        loadOrders(status: _currentFilter);
        return true;
      },
      onFailure: (_) => false,
    );
  }
}

final ordersNotifierProvider =
    StateNotifierProvider<OrdersNotifier, UiState<List<OrderEntity>>>((ref) {
  ref.watch(currentUserProvider.select((u) => u?.id));
  return OrdersNotifier(
    getOrdersUseCase: ref.watch(getOrdersUseCaseProvider),
    cancelOrderUseCase: ref.watch(cancelOrderUseCaseProvider),
  );
});

final orderDetailProvider =
    FutureProvider.family<OrderEntity, String>((ref, orderId) async {
  final useCase = ref.watch(getOrderDetailUseCaseProvider);
  final result = await useCase(orderId);
  return result.fold(
    onSuccess: (order) => order,
    onFailure: (failure) => throw Exception(failure.message),
  );
});
