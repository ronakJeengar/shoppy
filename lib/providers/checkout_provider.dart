import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/checkout_validation_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/payment_model.dart';
import 'package:shopp_app/data/repositories/checkout_repository.dart';
import 'package:shopp_app/providers/cart_provider.dart';

class CheckoutProvider extends ChangeNotifier {
  final CheckoutRepository _checkoutRepository = CheckoutRepository();

  CheckoutValidationModel? _validation;
  String _shippingMethod = 'STANDARD';
  String _paymentMethod = 'CARD';

  bool _isValidating = false;
  bool _isProcessingOrder = false;
  String? _errorMessage;

  OrderModel? _lastConfirmedOrder;
  PaymentModel? _lastConfirmedPayment;

  CheckoutValidationModel? get validation => _validation;
  String get shippingMethod => _shippingMethod;
  String get paymentMethod => _paymentMethod;
  bool get isValidating => _isValidating;
  bool get isProcessingOrder => _isProcessingOrder;
  String? get errorMessage => _errorMessage;
  OrderModel? get lastConfirmedOrder => _lastConfirmedOrder;
  PaymentModel? get lastConfirmedPayment => _lastConfirmedPayment;

  double get subtotal => _validation?.subtotal ?? 0.0;
  double get shippingFee => _validation?.shippingFee ?? 0.0;
  double get tax => _validation?.tax ?? 0.0;
  double get grandTotal => _validation?.grandTotal ?? 0.0;

  void resetState() {
    _validation = null;
    _shippingMethod = 'STANDARD';
    _paymentMethod = 'CARD';
    _isValidating = false;
    _isProcessingOrder = false;
    _errorMessage = null;
    _lastConfirmedOrder = null;
    _lastConfirmedPayment = null;
    notifyListeners();
  }

  void setPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }

  Future<void> setShippingMethod(String method, String addressId) async {
    _shippingMethod = method;
    notifyListeners();
    if (addressId.isNotEmpty) {
      await validateCheckout(addressId);
    }
  }

  Future<bool> validateCheckout(String addressId) async {
    _isValidating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _checkoutRepository.validateCheckout(
        addressId,
        shippingMethod: _shippingMethod,
      );

      if (response.status && response.data is CheckoutValidationModel) {
        _validation = response.data as CheckoutValidationModel;
        _isValidating = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _validation = null;
        _isValidating = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('CheckoutProvider validateCheckout error: $e');
      _errorMessage = 'Could not calculate checkout totals';
      _validation = null;
      _isValidating = false;
      notifyListeners();
      return false;
    }
  }

  Future<OrderModel?> placeOrderAndPay({
    required String addressId,
    required CartProvider cartProvider,
  }) async {
    _isProcessingOrder = true;
    _errorMessage = null;
    notifyListeners();

    // Client idempotency key for this checkout attempt
    final idempotencyKey =
        'client_${DateTime.now().millisecondsSinceEpoch}_${addressId.substring(0, addressId.length > 6 ? 6 : addressId.length)}';

    try {
      final orderRes = await _checkoutRepository.createOrder(
        addressId: addressId,
        shippingMethod: _shippingMethod,
        paymentMethod: _paymentMethod,
        idempotencyKey: idempotencyKey,
      );

      if (!orderRes.status || orderRes.data == null) {
        _errorMessage = orderRes.message;
        _isProcessingOrder = false;
        notifyListeners();
        return null;
      }

      final data = orderRes.data as Map<String, dynamic>;
      final order = data['order'] as OrderModel;
      final payment = data['payment'] as PaymentModel?;

      // If online card/UPI payment, verify transaction
      if (_paymentMethod != 'COD' && payment != null) {
        final verifyRes = await _checkoutRepository.verifyPayment(
          payment.transactionId,
        );
        if (!verifyRes.status) {
          // Log payment failure on backend
          await _checkoutRepository.failPayment(
            payment.transactionId,
            reason: verifyRes.message,
          );
          _errorMessage = verifyRes.message;
          _isProcessingOrder = false;
          notifyListeners();
          return null;
        }
      }

      // Order & Payment successfully confirmed
      _lastConfirmedOrder = order;
      _lastConfirmedPayment = payment;

      // Reload/clear client cart state
      await cartProvider.loadCart();

      _isProcessingOrder = false;
      notifyListeners();
      return order;
    } catch (e) {
      log('CheckoutProvider placeOrderAndPay error: $e');
      _errorMessage = 'An unexpected error occurred during checkout.';
      _isProcessingOrder = false;
      notifyListeners();
      return null;
    }
  }
}
