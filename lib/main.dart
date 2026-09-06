import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as legacy_provider;
import 'package:shopp_app/core/preferences.dart';
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
import 'package:shopp_app/core/theme/app_theme.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    token = Preferences.getAccessToken() ?? await Preferences.getString('token');
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: (token != null && token!.isNotEmpty)
          ? const HomePage()
          : const LoginPage(),
    );
  }
}
