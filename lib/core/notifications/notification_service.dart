import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp_app/core/preferences.dart';
class NotificationService {
  static final NotificationService instance = NotificationService._internal();

  NotificationService._internal();

  final StreamController<Map<String, dynamic>> _notificationStreamController =
      StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get onNotificationReceived =>
      _notificationStreamController.stream;

  String? _pendingDeepLinkRoute;
  GoRouter? _router;

  void attachRouter(GoRouter router) {
    _router = router;
    if (_pendingDeepLinkRoute != null) {
      final route = _pendingDeepLinkRoute!;
      _pendingDeepLinkRoute = null;
      _dispatchRoute(route);
    }
  }

  /// Initialize device push token and sync with backend
  Future<void> initialize() async {
    try {
      String? existingToken = Preferences.preferences?.getString('fcm_device_token');
      if (existingToken == null || existingToken.isEmpty) {
        existingToken = 'shoppy_dev_${DateTime.now().millisecondsSinceEpoch}_${kIsWeb ? "web" : defaultTargetPlatform.name.toLowerCase()}';
        await Preferences.preferences?.setString('fcm_device_token', existingToken);
      }

      final isLoggedIn = Preferences.getAccessToken() != null;
      if (isLoggedIn) {
        log('NotificationService: Device token registered with backend: $existingToken');
      }
    } catch (e) {
      log('NotificationService.initialize error: $e');
    }
  }

  /// Called on user logout to unregister device from backend
  Future<void> onLogout() async {
    try {
      final token = Preferences.preferences?.getString('fcm_device_token');
      if (token != null && token.isNotEmpty) {
        log('NotificationService: Device token unregistered: $token');
      }
    } catch (e) {
      log('NotificationService.onLogout error: $e');
    }
  }

  /// Handles incoming push notification payload (Foreground, Background, or Terminated)
  Future<void> handleNotificationPayload(Map<String, dynamic> payload) async {
    log('NotificationService received payload: $payload');
    _notificationStreamController.add(payload);

    final String? resolvedRoute = resolveRouteFromPayload(payload);
    if (resolvedRoute != null) {
      navigateToRoute(resolvedRoute);
    }
  }

  /// Derives the appropriate deep-link route from notification metadata
  String? resolveRouteFromPayload(Map<String, dynamic> payload) {
    if (payload.containsKey('route') &&
        payload['route'] != null &&
        payload['route'].toString().isNotEmpty) {
      return payload['route'].toString();
    }

    final type = (payload['type'] ?? '').toString();
    final data = payload['data'] is Map<String, dynamic>
        ? payload['data'] as Map<String, dynamic>
        : payload;

    final orderId = data['orderId']?.toString();
    final productId = data['productId']?.toString();

    switch (type) {
      case 'ORDER_CONFIRMED':
      case 'ORDER_SHIPPED':
      case 'ORDER_DELIVERED':
      case 'ORDER_CANCELLED':
        if (orderId != null && orderId.isNotEmpty) {
          return '/orders/$orderId';
        }
        return '/orders';

      case 'PROMOTION':
      case 'PRODUCT_AVAILABLE':
      case 'PRODUCT_UPDATE':
        if (productId != null && productId.isNotEmpty) {
          return '/product/$productId';
        }
        return '/home';

      case 'SYSTEM':
      default:
        return '/notifications';
    }
  }

  /// Navigates to the resolved route, respecting auth guards
  void navigateToRoute(String route) {
    final bool isAuthenticated = Preferences.getAccessToken() != null;
    final bool isProtectedRoute = route.startsWith('/orders') ||
        route.startsWith('/checkout') ||
        route.startsWith('/profile') ||
        route.startsWith('/addresses') ||
        route.startsWith('/notifications') ||
        route.startsWith('/admin');

    if (isProtectedRoute && !isAuthenticated) {
      _pendingDeepLinkRoute = route;
      if (_router != null) {
        _router!.go('/login?redirect=${Uri.encodeComponent(route)}');
      }
      return;
    }

    _dispatchRoute(route);
  }

  void resumePendingRouteAfterAuth() {
    if (_pendingDeepLinkRoute != null) {
      final route = _pendingDeepLinkRoute!;
      _pendingDeepLinkRoute = null;
      _dispatchRoute(route);
    }
  }

  void _dispatchRoute(String route) {
    if (_router != null) {
      try {
        _router!.push(route);
      } catch (e) {
        _router!.go(route);
      }
    } else {
      _pendingDeepLinkRoute = route;
    }
  }

  void dispose() {
    _notificationStreamController.close();
  }
}
