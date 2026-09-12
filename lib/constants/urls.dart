import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shopp_app/core/constants/api_endpoints.dart';

class Urls {
  static String get baseUrl {
    if (kIsWeb) return "http://localhost:8000/api/v1/";
    try {
      if (Platform.isAndroid) return "http://10.0.2.2:8000/api/v1/";
    } catch (_) {}
    return "http://localhost:8000/api/v1/";
  }

  // Authentication module
  static const String register = ApiEndpoints.register;
  static const String login = ApiEndpoints.login;
  static const String refreshToken = ApiEndpoints.refreshToken;
  static const String logout = ApiEndpoints.logout;
  static const String me = ApiEndpoints.me;
  static const String profile = ApiEndpoints.profile;
  static const String changePassword = ApiEndpoints.changePassword;

  // Product Catalog & Categories modules
  static const String products = ApiEndpoints.products;
  static const String categories = ApiEndpoints.categories;
  static const String searchSuggestions = ApiEndpoints.suggestions;

  // Cart & Wishlist modules
  static const String cart = ApiEndpoints.cart;
  static const String cartItems = ApiEndpoints.cartItems;
  static const String cartCoupon = ApiEndpoints.cartCoupon;
  static const String wishlist = ApiEndpoints.wishlist;
  static const String wishlistToggle = ApiEndpoints.wishlistToggle;

  // Coupons & Promotions modules
  static const String couponsAvailable = ApiEndpoints.couponsAvailable;
  static const String couponValidate = ApiEndpoints.couponValidate;

  // Campaigns & Sale Banners modules
  static const String campaignsActive = ApiEndpoints.campaignsActive;
  static String campaignDetail(String id) => ApiEndpoints.campaignDetail(id);

  // Address, Checkout & Payment modules
  static const String addresses = ApiEndpoints.addresses;
  static const String checkoutValidate = ApiEndpoints.checkoutValidate;
  static const String checkoutCreate = ApiEndpoints.checkoutCreate;
  static const String paymentsVerify = ApiEndpoints.paymentsVerify;
  static const String paymentsFail = ApiEndpoints.paymentsFail;
  static const String orders = ApiEndpoints.orders;

  // Notifications module
  static const String notifications = ApiEndpoints.notifications;
  static const String notificationPreferences = ApiEndpoints.notificationPreferences;
  static const String notificationDevices = ApiEndpoints.notificationDevices;

  // Reviews & Ratings module
  static const String reviews = ApiEndpoints.reviews;
  static String review(String id) => '${ApiEndpoints.reviews}/$id';
  static String voteReviewHelpful(String id) => '${ApiEndpoints.reviews}/$id/helpful';
  static String productReviews(String productId) => ApiEndpoints.productReviews(productId);
  static String reviewEligibility(String productId) =>
      ApiEndpoints.reviewEligibility(productId);

  // Admin module
  static const String adminDashboard = ApiEndpoints.adminDashboard;
  static const String adminProducts = ApiEndpoints.adminProducts;
  static const String adminCategories = ApiEndpoints.adminCategories;
  static const String adminOrders = ApiEndpoints.adminOrders;
  static const String adminUsers = ApiEndpoints.adminUsers;
  static const String adminAuditLogs = ApiEndpoints.adminAuditLogs;
  static const String adminReviews = ApiEndpoints.adminReviews;

  // AI Foundation & Assistant module
  static const String aiHealth = ApiEndpoints.aiHealth;
  static const String aiQuery = ApiEndpoints.aiQuery;
  static const String aiChat = ApiEndpoints.aiChat;
  static const String aiConversations = ApiEndpoints.aiConversations;
  static String aiConversation(String id) => ApiEndpoints.aiConversation(id);
  static String aiClearConversation(String id) => ApiEndpoints.aiClearConversation(id);
  static const String aiConfirmAction = ApiEndpoints.aiConfirmAction;
  static const String aiCancelAction = ApiEndpoints.aiCancelAction;

  // AI Recommendations & Personalization module
  static const String recommendations = ApiEndpoints.recommendations;
  static const String recommendationEvents = ApiEndpoints.recommendationEvents;

  // Backwards-compatibility aliases
  static const String signUp = register;
  static const String signIn = login;
  static const String currentUser = me;
}
