/// Centralized API endpoint paths for the Shoppy backend.
/// Single source of truth for all network communication paths.
class ApiEndpoints {
  // Base Path
  static const String apiVersion = '/api/v1';

  // Auth
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String refreshToken = 'auth/refresh-token';
  static const String logout = 'auth/logout';
  static const String me = 'auth/me';
  static const String profile = 'auth/profile';
  static const String changePassword = 'auth/change-password';

  // Catalog
  static const String products = 'products';
  static const String categories = 'categories';
  static const String suggestions = 'products/suggestions';
  static String productDetail(String id) => 'products/$id';

  // Cart & Wishlist
  static const String cart = 'cart';
  static const String cartItems = 'cart/items';
  static const String cartCoupon = 'cart/coupon';
  static const String wishlist = 'wishlist';
  static const String wishlistToggle = 'wishlist/toggle';

  // Coupons & Promotions
  static const String couponsAvailable = 'coupons/available';
  static const String couponValidate = 'coupons/validate';

  // Campaigns & Sale Banners
  static const String campaignsActive = 'campaigns/active';
  static String campaignDetail(String id) => 'campaigns/$id';

  // Flash Sales & Quick Sales
  static const String flashSalesActive = 'flash-sales/active';
  static const String flashSalesUpcoming = 'flash-sales/upcoming';
  static String flashSaleDetail(String id) => 'flash-sales/$id';
  static String productFlashSale(String productId) => 'flash-sales/product/$productId';

  // Addresses & Checkout
  static const String addresses = 'addresses';
  static const String checkoutValidate = 'checkout/validate';
  static const String checkoutCreate = 'checkout/create';
  static const String paymentsVerify = 'payments/verify';
  static const String paymentsFail = 'payments/fail';

  // Orders
  static const String orders = 'orders';
  static String orderDetail(String id) => 'orders/$id';

  // Notifications
  static const String notifications = 'notifications';
  static const String notificationReadAll = 'notifications/read-all';
  static const String notificationDevices = 'notifications/devices';
  static const String notificationPreferences = 'notifications/preferences';

  // Reviews
  static const String reviews = 'reviews';
  static String productReviews(String productId) => 'products/$productId/reviews';
  static String reviewEligibility(String productId) => 'products/$productId/reviews/eligibility';

  // Recommendations & AI
  static const String recommendations = 'recommendations';
  static const String recommendationEvents = 'recommendations/events';
  static const String aiHealth = 'ai/health';
  static const String aiQuery = 'ai/query';
  static const String aiChat = 'ai/chat';
  static const String aiConversations = 'ai/conversations';
  static String aiConversation(String id) => 'ai/conversations/$id';
  static String aiClearConversation(String id) => 'ai/conversations/$id/clear';
  static const String aiConfirmAction = 'ai/assistant/confirm';
  static const String aiCancelAction = 'ai/assistant/cancel-action';

  // Admin
  static const String adminDashboard = 'admin/dashboard';
  static const String adminProducts = 'admin/products';
  static const String adminCategories = 'admin/categories';
  static const String adminOrders = 'admin/orders';
  static const String adminUsers = 'admin/users';
  static const String adminAuditLogs = 'admin/audit-logs';
  static const String adminReviews = 'admin/reviews';
  static const String adminConfig = 'admin/config';

  // App Bootstrap & Remote Configuration
  static const String appBootstrap = 'app/bootstrap';
}
