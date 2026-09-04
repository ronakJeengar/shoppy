import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Urls {
  static String get baseUrl {
    if (kIsWeb) return "http://localhost:8000/api/v1/";
    try {
      if (Platform.isAndroid) return "http://10.0.2.2:8000/api/v1/";
    } catch (_) {}
    return "http://localhost:8000/api/v1/";
  }

  // Authentication module
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String refreshToken = "auth/refresh-token";
  static const String logout = "auth/logout";
  static const String me = "auth/me";
  static const String profile = "auth/profile";
  static const String changePassword = "auth/change-password";

  // Product Catalog & Categories modules
  static const String products = "products";
  static const String categories = "categories";
  static const String searchSuggestions = "products/suggestions";

  // Cart & Wishlist modules
  static const String cart = "cart";
  static const String cartItems = "cart/items";
  static const String wishlist = "wishlist";
  static const String wishlistToggle = "wishlist/toggle";

  // Address, Checkout & Payment modules
  static const String addresses = "addresses";
  static const String checkoutValidate = "checkout/validate";
  static const String checkoutCreate = "checkout/create";
  static const String paymentsVerify = "payments/verify";
  static const String paymentsFail = "payments/fail";
  static const String orders = "orders";

  // Notifications module
  static const String notifications = "notifications";
  static const String notificationPreferences = "notifications/preferences";
  static const String notificationDevices = "notifications/devices";

  // Admin module
  static const String adminDashboard = "admin/dashboard";
  static const String adminProducts = "admin/products";
  static const String adminCategories = "admin/categories";
  static const String adminOrders = "admin/orders";
  static const String adminUsers = "admin/users";
  static const String adminAuditLogs = "admin/audit-logs";

  // Backwards-compatibility aliases
  static const String signUp = register;
  static const String signIn = login;
  static const String currentUser = me;
}
