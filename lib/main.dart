import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as legacy_provider;
import 'package:shopp_app/core/notifications/notification_service.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/core/router/app_router.dart';
import 'package:shopp_app/core/theme/app_theme.dart';
import 'package:shopp_app/providers/address_provider.dart';
import 'package:shopp_app/providers/admin_provider.dart';
import 'package:shopp_app/providers/assistant_provider.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/checkout_provider.dart';
import 'package:shopp_app/providers/notification_provider.dart';
import 'package:shopp_app/providers/order_provider.dart';
import 'package:shopp_app/providers/recommendation_provider.dart';
import 'package:shopp_app/providers/review_provider.dart';
import 'package:shopp_app/providers/search_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await NotificationService.instance.initialize();

  runApp(
    ProviderScope(
      child: legacy_provider.MultiProvider(
        providers: [
          legacy_provider.ChangeNotifierProvider(create: (_) => UserProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => CatalogProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => SearchProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => CartProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => WishlistProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => AddressProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => CheckoutProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => OrderProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => NotificationProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => AdminProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => ReviewProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => AssistantProvider()),
          legacy_provider.ChangeNotifierProvider(create: (_) => RecommendationProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    NotificationService.instance.attachRouter(router);

    return MaterialApp.router(
      title: 'Shoppy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}

