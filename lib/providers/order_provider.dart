import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/repositories/order_repository.dart';

class OrderProvider extends ChangeNotifier {
  final OrderRepository _orderRepository = OrderRepository();

  List<OrderModel> _orders = [];
  OrderModel? _selectedOrder;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _isCancelling = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String? _errorMessage;
  String? _statusFilter;

  List<OrderModel> get orders => _orders;
  OrderModel? get selectedOrder => _selectedOrder;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get isCancelling => _isCancelling;
  bool get hasMore => _hasMore;
  int get currentPage => _currentPage;
  String? get errorMessage => _errorMessage;
  String? get statusFilter => _statusFilter;

  OrderProvider() {
    loadOrders();
  }

  void clearOrderState() {
    _orders = [];
    _selectedOrder = null;
    _isLoading = false;
    _isLoadingMore = false;
    _isCancelling = false;
    _hasMore = true;
    _currentPage = 1;
    _errorMessage = null;
    _statusFilter = null;
    notifyListeners();
  }

  Future<void> setStatusFilter(String? status) async {
    _statusFilter = status;
    await loadOrders(refresh: true);
  }

  Future<void> loadOrders({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _orderRepository.getOrders(
        page: _currentPage,
        limit: 10,
        status: _statusFilter,
      );

      if (response.status && response.data is OrderPaginatedResult) {
        final result = response.data as OrderPaginatedResult;
        _orders = result.orders;
        _hasMore = result.hasNextPage;
      } else {
        _errorMessage = response.message;
        _orders = [];
        _hasMore = false;
      }
    } catch (e) {
      log('OrderProvider loadOrders error: $e');
      _errorMessage = 'Could not load order history';
      _orders = [];
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreOrders() async {
    if (_isLoading || _isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final nextPage = _currentPage + 1;
      final response = await _orderRepository.getOrders(
        page: nextPage,
        limit: 10,
        status: _statusFilter,
      );

      if (response.status && response.data is OrderPaginatedResult) {
        final result = response.data as OrderPaginatedResult;
        _orders.addAll(result.orders);
        _currentPage = nextPage;
        _hasMore = result.hasNextPage;
      } else {
        _hasMore = false;
      }
    } catch (e) {
      log('OrderProvider loadMoreOrders error: $e');
      _hasMore = false;
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> refreshOrders() async {
    await loadOrders(refresh: true);
  }

  Future<bool> loadOrderDetails(String orderId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _orderRepository.getOrderById(orderId);
      if (response.status && response.data is OrderModel) {
        _selectedOrder = response.data as OrderModel;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _selectedOrder = null;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('OrderProvider loadOrderDetails error: $e');
      _errorMessage = 'Failed to load order details';
      _selectedOrder = null;
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> cancelOrder(String orderId, {String? reason}) async {
    _isCancelling = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _orderRepository.cancelOrder(
        orderId,
        reason: reason,
      );

      if (response.status && response.data is OrderModel) {
        final updatedOrder = response.data as OrderModel;
        _selectedOrder = updatedOrder;

        // Update item in local list
        final index = _orders.indexWhere((o) => o.id == orderId);
        if (index != -1) {
          _orders[index] = updatedOrder;
        }

        _isCancelling = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isCancelling = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('OrderProvider cancelOrder error: $e');
      _errorMessage = 'Failed to cancel order';
      _isCancelling = false;
      notifyListeners();
      return false;
    }
  }
}
