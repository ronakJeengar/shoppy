import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/repositories/order_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

import 'package:shopp_app/riverpod/di_providers.dart';
export 'di_providers.dart';

class OrdersNotifier extends StateNotifier<UiState<List<OrderModel>>> {
  final OrderRepository _repository;

  OrdersNotifier(this._repository) : super(const UiState.initial()) {
    loadOrders();
  }

  Future<void> loadOrders({String? status}) async {
    state = const UiState.loading();
    try {
      final response = await _repository.getOrders(status: status);
      if (response.status && response.data is OrderPaginatedResult) {
        final result = response.data as OrderPaginatedResult;
        if (result.orders.isEmpty) {
          state = const UiState.empty('No orders found');
        } else {
          state = UiState.success(result.orders);
        }
      } else {
        state = UiState.error(response.message);
      }
    } catch (e) {
      state = UiState.error(e.toString());
    }
  }

  Future<bool> cancelOrder(String orderId, {String? reason}) async {
    try {
      final response = await _repository.cancelOrder(orderId, reason: reason);
      if (response.status && response.data is OrderModel) {
        final updatedOrder = response.data as OrderModel;
        final currentOrders = state.whenOrNull(success: (orders) => orders) ?? [];
        final updated = currentOrders.map((o) {
          return o.id == updatedOrder.id ? updatedOrder : o;
        }).toList();
        state = UiState.success(updated);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

final ordersStateProvider =
    StateNotifierProvider<OrdersNotifier, UiState<List<OrderModel>>>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrdersNotifier(repository);
});

final orderDetailProvider =
    FutureProvider.family<OrderModel?, String>((ref, orderId) async {
  final repository = ref.watch(orderRepositoryProvider);
  final response = await repository.getOrderById(orderId);
  if (response.status && response.data is OrderModel) {
    return response.data as OrderModel;
  }
  return null;
});
