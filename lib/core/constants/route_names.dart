/// Centralized route paths and URL parameter builders for GoRouter.
class RouteNames {
  static const String root = '/';
  static const String home = '/home';
  static const String search = '/search';
  static const String cart = '/cart';
  static const String wishlist = '/wishlist';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String productDetails = '/product/:id';
  static const String checkout = '/checkout';
  static const String checkoutSuccess = '/checkout/success/:orderId';
  static const String orders = '/orders';
  static const String orderDetails = '/orders/:id';
  static const String notifications = '/notifications';
  static const String addresses = '/addresses';
  static const String assistant = '/assistant';
  static const String admin = '/admin';
  static const String adminProducts = '/admin/products';
  static const String adminOrders = '/admin/orders';
  static const String adminUsers = '/admin/users';
  static const String adminReviews = '/admin/reviews';
  static const String adminAuditLogs = '/admin/audit-logs';

  // Generator Helpers
  static String productDetail(String id) => '/product/$id';
  static String orderDetail(String id) => '/orders/$id';
  static String checkoutSuccessWithId(String orderId) => '/checkout/success/$orderId';
  static String loginWithRedirect(String redirect) =>
      '/login?redirect=${Uri.encodeComponent(redirect)}';
}
