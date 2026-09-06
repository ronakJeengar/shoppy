import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/repositories/address_repository.dart';
import 'package:shopp_app/data/repositories/admin_repository.dart';
import 'package:shopp_app/data/repositories/ai_repository.dart';
import 'package:shopp_app/data/repositories/auth_repository.dart';
import 'package:shopp_app/data/repositories/cart_repository.dart';
import 'package:shopp_app/data/repositories/catalog_repository.dart';
import 'package:shopp_app/data/repositories/checkout_repository.dart';
import 'package:shopp_app/data/repositories/notification_repository.dart';
import 'package:shopp_app/data/repositories/order_repository.dart';
import 'package:shopp_app/data/repositories/recommendation_repository.dart';
import 'package:shopp_app/data/repositories/review_repository.dart';
import 'package:shopp_app/data/repositories/wishlist_repository.dart';

/// Centralized API HTTP Client provider.
final apiClientProvider = Provider<Api>((ref) {
  return Api();
});

/// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return AuthRepository(api: api);
});

/// Catalog & Category Repository Provider
final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return CatalogRepository(api: api);
});

/// Shopping Cart Repository Provider
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return CartRepository(api: api);
});

/// Wishlist Repository Provider
final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return WishlistRepository(api: api);
});

/// Checkout & Financial Validation Repository Provider
final checkoutRepositoryProvider = Provider<CheckoutRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return CheckoutRepository(api: api);
});

/// Orders & Tracking Repository Provider
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return OrderRepository(api: api);
});

/// Addresses Management Repository Provider
final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return AddressRepository(api: api);
});

/// Notifications Repository Provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return NotificationRepository(api: api);
});

/// Reviews & Ratings Repository Provider
final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return ReviewRepository(api: api);
});

/// AI Recommendations Repository Provider
final recommendationRepositoryProvider =
    Provider<RecommendationRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return RecommendationRepository(api: api);
});

/// AI Conversational Shopping Assistant Repository Provider
final aiRepositoryProvider = Provider<AiRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return AiRepository(api: api);
});

/// Admin Backoffice Repository Provider
final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final api = ref.watch(apiClientProvider);
  return AdminRepository(api: api);
});
