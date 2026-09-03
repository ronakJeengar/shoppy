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

  // Backwards-compatibility aliases
  static const String signUp = register;
  static const String signIn = login;
  static const String currentUser = me;
}
