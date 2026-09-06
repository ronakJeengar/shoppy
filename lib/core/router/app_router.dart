import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/core/router/main_shell.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/riverpod/auth_riverpod_provider.dart';
import 'package:shopp_app/views/addresses_page.dart';
import 'package:shopp_app/views/admin/admin_audit_logs_page.dart';
import 'package:shopp_app/views/admin/admin_dashboard_page.dart';
import 'package:shopp_app/views/admin/admin_orders_page.dart';
import 'package:shopp_app/views/admin/admin_products_page.dart';
import 'package:shopp_app/views/admin/admin_reviews_page.dart';
import 'package:shopp_app/views/admin/admin_users_page.dart';
import 'package:shopp_app/views/assistant_page.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/checkout_page.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/login_page.dart';
import 'package:shopp_app/views/notifications_page.dart';
import 'package:shopp_app/views/order_confirmation_page.dart';
import 'package:shopp_app/views/order_detail_page.dart';
import 'package:shopp_app/views/orders_page.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/profile_page.dart';
import 'package:shopp_app/views/search_page.dart';
import 'package:shopp_app/views/sign_up_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';

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

    final isAuthRoute = path == '/login' || path == '/register';

    // If unauthenticated, redirect to login unless already on an auth route
    if (!isAuthenticated) {
      if (isAuthRoute) return null;
      if (path == '/' || path == '/home') {
        return '/login';
      }
      return '/login?redirect=${Uri.encodeComponent(state.uri.toString())}';
    }

    // Authenticated user trying to access login/register is redirected to home or destination
    if (isAuthRoute && isAuthenticated) {
      final redirectParam = state.uri.queryParameters['redirect'];
      if (redirectParam != null && redirectParam.isNotEmpty) {
        return redirectParam;
      }
      return '/home';
    }

    // Admin role guard
    if (path.startsWith('/admin')) {
      if (!Preferences.isAdmin) {
        return '/home';
      }
    }

    if (path == '/') {
      return '/home';
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
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final token = Preferences.getAccessToken();
          return (token != null && token.isNotEmpty) ? '/home' : '/login';
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
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => SearchPage(
              initialQuery: state.uri.queryParameters['q'],
            ),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: '/wishlist',
            builder: (context, state) => const WishlistPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),

      // Auth Routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const SignUpPage(),
      ),

      // Catalog & Product Detail Route
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final productId = state.pathParameters['id'] ?? '';
          return ProductDetailPage(productId: productId);
        },
      ),

      // Checkout & Order Confirmation Routes
      GoRoute(
        path: '/checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: '/checkout/success/:orderId',
        builder: (context, state) {
          final orderId = state.pathParameters['orderId'] ?? '';
          return OrderConfirmationPage(orderId: orderId);
        },
      ),

      // Orders Routes
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrdersPage(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return OrderDetailPage(orderId: id);
            },
          ),
        ],
      ),

      // User Feature Routes
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/addresses',
        builder: (context, state) => const AddressesPage(),
      ),
      GoRoute(
        path: '/assistant',
        builder: (context, state) => const AssistantPage(),
      ),

      // Admin Routes with sub-routes
      GoRoute(
        path: '/admin',
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
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        title: const Text('Page Not Found', style: AppTypography.titleLarge),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.slate100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: 64,
                  color: AppColors.slate400,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '404 - Page Not Found',
                style: AppTypography.headingMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'We could not find the page at "${state.uri.path}".',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.slate500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AppButton(
                label: 'Return to Home',
                icon: Icons.home_rounded,
                onPressed: () => context.go('/home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
});
