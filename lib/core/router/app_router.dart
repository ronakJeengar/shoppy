import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/constants/route_names.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/core/router/main_shell.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/widgets/widgets.dart';
import 'package:shopp_app/features/addresses/presentation/screens/addresses_page.dart';
import 'package:shopp_app/features/admin/presentation/screens/admin_audit_logs_page.dart';
import 'package:shopp_app/features/admin/presentation/screens/admin_dashboard_page.dart';
import 'package:shopp_app/features/admin/presentation/screens/admin_orders_page.dart';
import 'package:shopp_app/features/admin/presentation/screens/admin_products_page.dart';
import 'package:shopp_app/features/admin/presentation/screens/admin_reviews_page.dart';
import 'package:shopp_app/features/admin/presentation/screens/admin_users_page.dart';
import 'package:shopp_app/features/assistant/presentation/screens/assistant_page.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopp_app/features/auth/presentation/screens/login_page.dart';
import 'package:shopp_app/features/auth/presentation/screens/sign_up_page.dart';
import 'package:shopp_app/features/cart/presentation/screens/cart_page.dart';
import 'package:shopp_app/features/catalog/presentation/screens/home_page.dart';
import 'package:shopp_app/features/catalog/presentation/screens/product_detail_page.dart';
import 'package:shopp_app/features/checkout/presentation/screens/checkout_page.dart';
import 'package:shopp_app/features/checkout/presentation/screens/order_confirmation_page.dart';
import 'package:shopp_app/features/notifications/presentation/screens/notifications_page.dart';
import 'package:shopp_app/features/orders/presentation/screens/order_detail_page.dart';
import 'package:shopp_app/features/orders/presentation/screens/orders_page.dart';
import 'package:shopp_app/features/invoices/presentation/screens/invoice_page.dart';
import 'package:shopp_app/features/profile/presentation/screens/profile_page.dart';
import 'package:shopp_app/features/search/presentation/screens/search_page.dart';
import 'package:shopp_app/features/wishlist/presentation/screens/wishlist_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNav');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNav');

/// ChangeNotifier to notify GoRouter when Riverpod AuthState updates.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final token = Preferences.getAccessToken();
    final isAuthenticated = token != null && token.isNotEmpty;
    final path = state.uri.path;

    final isAuthRoute =
        path == RouteNames.login || path == RouteNames.register;

    // If unauthenticated, redirect to login unless already on an auth route
    if (!isAuthenticated) {
      if (isAuthRoute) return null;
      if (path == RouteNames.root || path == RouteNames.home) {
        return RouteNames.login;
      }
      return RouteNames.loginWithRedirect(state.uri.toString());
    }

    // Authenticated user trying to access login/register is redirected to home or destination
    if (isAuthRoute && isAuthenticated) {
      final redirectParam = state.uri.queryParameters['redirect'];
      if (redirectParam != null && redirectParam.isNotEmpty) {
        return redirectParam;
      }
      return RouteNames.home;
    }

    // Admin role guard
    if (path.startsWith(RouteNames.admin)) {
      if (!Preferences.isAdmin) {
        return RouteNames.home;
      }
    }

    if (path == RouteNames.root) {
      return RouteNames.home;
    }

    return null;
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

/// Riverpod provider for GoRouter instance
final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteNames.root,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      GoRoute(
        path: RouteNames.root,
        redirect: (context, state) {
          final token = Preferences.getAccessToken();
          return (token != null && token.isNotEmpty)
              ? RouteNames.home
              : RouteNames.login;
        },
      ),
      // Bottom Navigation Shell
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainShell(
            location: state.uri.path,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: RouteNames.search,
            builder: (context, state) => SearchPage(
              initialQuery: state.uri.queryParameters['q'],
            ),
          ),
          GoRoute(
            path: RouteNames.cart,
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: RouteNames.wishlist,
            builder: (context, state) => const WishlistPage(),
          ),
          GoRoute(
            path: RouteNames.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),

      // Auth Routes
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const SignUpPage(),
      ),

      // Catalog & Product Detail Route
      GoRoute(
        path: RouteNames.productDetails,
        builder: (context, state) {
          final productId = state.pathParameters['id'] ?? '';
          return ProductDetailPage(productId: productId);
        },
      ),

      // Checkout & Order Confirmation Routes
      GoRoute(
        path: RouteNames.checkout,
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: RouteNames.checkoutSuccess,
        builder: (context, state) {
          final orderId = state.pathParameters['orderId'] ?? '';
          return OrderConfirmationPage(orderId: orderId);
        },
      ),

      // Orders Routes
      GoRoute(
        path: RouteNames.orders,
        builder: (context, state) => const OrdersPage(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return OrderDetailPage(orderId: id);
            },
            routes: [
              GoRoute(
                path: 'invoice',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return InvoicePage(orderId: id);
                },
              ),
            ],
          ),
        ],
      ),

      // User Feature Routes
      GoRoute(
        path: RouteNames.notifications,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: RouteNames.addresses,
        builder: (context, state) => const AddressesPage(),
      ),
      GoRoute(
        path: RouteNames.assistant,
        builder: (context, state) => const AssistantPage(),
      ),

      // Admin Routes with sub-routes
      GoRoute(
        path: RouteNames.admin,
        builder: (context, state) => const AdminDashboardPage(),
        routes: [
          GoRoute(
            path: 'products',
            builder: (context, state) => const AdminProductsPage(),
          ),
          GoRoute(
            path: 'orders',
            builder: (context, state) => const AdminOrdersPage(),
          ),
          GoRoute(
            path: 'users',
            builder: (context, state) => const AdminUsersPage(),
          ),
          GoRoute(
            path: 'reviews',
            builder: (context, state) => const AdminReviewsPage(),
          ),
          GoRoute(
            path: 'audit-logs',
            builder: (context, state) => const AdminAuditLogsPage(),
          ),
        ],
      ),
    ],

    // Global 404 Error Page
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppStrings.errors.notFound, style: AppTypography.titleLarge),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: AppDimensions.modalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: AppDimensions.paddingXl,
                decoration: const BoxDecoration(
                  color: AppColors.slate100,
                  shape: BoxShape.circle,
                ),
                child: const AppIcon(
                  AppIcons.errorOutline,
                  size: AppIconSizes.emptyState,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: AppDimensions.xxl),
              Text(
                AppStrings.errors.notFound,
                style: AppTypography.headingMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.md),
              Text(
                '${AppStrings.errors.notFoundSubtitle} ("${state.uri.path}")',
                style: AppTypography.productDescription.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.xxxl),
              AppButton(
                label: AppStrings.common.back,
                icon: AppIcons.home,
                onPressed: () => context.go(RouteNames.home),
              ),
            ],
          ),
        ),
      ),
    ),
  );
});
