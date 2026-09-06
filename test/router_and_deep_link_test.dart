import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as legacy_provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/notifications/notification_service.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/core/router/app_router.dart';
import 'package:shopp_app/data/models/product_media_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
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
import 'package:shopp_app/views/widgets/product_media_gallery.dart';

Widget buildRouterApp(ProviderContainer container) {
  return UncontrolledProviderScope(
    container: container,
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
      child: MaterialApp.router(
        routerConfig: container.read(routerProvider),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Preferences.init();
  });

  group('NotificationService Deep Link Resolution Tests', () {
    final service = NotificationService.instance;

    test('resolves ORDER_CONFIRMED payload with orderId to /orders/:id', () {
      final payload = {
        'type': 'ORDER_CONFIRMED',
        'data': {'orderId': 'order_123_abc'},
      };
      final route = service.resolveRouteFromPayload(payload);
      expect(route, equals('/orders/order_123_abc'));
    });

    test('resolves ORDER_DELIVERED payload with orderId to /orders/:id', () {
      final payload = {
        'type': 'ORDER_DELIVERED',
        'data': {'orderId': 'order_456_def'},
      };
      final route = service.resolveRouteFromPayload(payload);
      expect(route, equals('/orders/order_456_def'));
    });

    test('resolves ORDER payload without orderId to /orders', () {
      final payload = {
        'type': 'ORDER_SHIPPED',
        'data': {},
      };
      final route = service.resolveRouteFromPayload(payload);
      expect(route, equals('/orders'));
    });

    test('resolves PROMOTION payload with productId to /product/:id', () {
      final payload = {
        'type': 'PROMOTION',
        'data': {'productId': 'prod_789_xyz'},
      };
      final route = service.resolveRouteFromPayload(payload);
      expect(route, equals('/product/prod_789_xyz'));
    });

    test('resolves custom explicit route payload', () {
      final payload = {
        'route': '/checkout/success/order_999',
      };
      final route = service.resolveRouteFromPayload(payload);
      expect(route, equals('/checkout/success/order_999'));
    });

    test('resolves SYSTEM notification payload to /notifications', () {
      final payload = {
        'type': 'SYSTEM',
        'data': {},
      };
      final route = service.resolveRouteFromPayload(payload);
      expect(route, equals('/notifications'));
    });
  });

  group('Product Media Model & Gallery Unit Tests', () {
    test('ProductMedia parses IMAGE, VIDEO, and MODEL_3D types correctly', () {
      final imgMedia = ProductMedia.fromJson({
        'url': 'https://example.com/img.png',
        'type': 'IMAGE',
        'order': 0,
      });
      expect(imgMedia.type, equals(ProductMediaType.image));
      expect(imgMedia.isImage, isTrue);
      expect(imgMedia.isVideo, isFalse);
      expect(imgMedia.is3dModel, isFalse);

      final videoMedia = ProductMedia.fromJson({
        'url': 'https://example.com/video.mp4',
        'type': 'VIDEO',
        'order': 1,
      });
      expect(videoMedia.type, equals(ProductMediaType.video));
      expect(videoMedia.isVideo, isTrue);

      final modelMedia = ProductMedia.fromJson({
        'url': 'https://example.com/model.glb',
        'type': 'MODEL_3D',
        'order': 2,
      });
      expect(modelMedia.type, equals(ProductMediaType.model3d));
      expect(modelMedia.is3dModel, isTrue);
    });

    test('Product helper methods derive allMedia and media capabilities', () {
      final product = Product(
        id: 'p1',
        productName: 'Headphones',
        description: 'Studio headphones',
        price: 199.99,
        categoryName: 'Audio',
        productImage: 'https://example.com/thumb.jpg',
        images: [
          'https://example.com/side1.jpg',
          'https://example.com/side2.jpg'
        ],
        videoUrl: 'https://example.com/demo.mp4',
        model3dUrl: 'https://example.com/model.glb',
        stock: 10,
      );

      expect(product.hasVideo, isTrue);
      expect(product.has3dModel, isTrue);
      expect(product.allImages.length, equals(2));
      expect(product.allMedia.length, equals(4));
    });

    testWidgets('ProductMediaGallery renders image carousel and page indicators',
        (WidgetTester tester) async {
      final product = Product(
        id: 'p_test',
        productName: 'Test Product',
        price: 99.99,
        productImage:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
        images: [
          'https://images.unsplash.com/photo-1572536147248-ac59a8abfa4b',
          'https://images.unsplash.com/photo-1583394838336-acd977736f90',
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductMediaGallery(
              product: product,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(PageView), findsOneWidget);
      expect(find.text('1 / 2'), findsOneWidget);
    });

    testWidgets('ProductMediaGallery renders interactive 3D viewer when model provided',
        (WidgetTester tester) async {
      final product = Product(
        id: 'p_3d',
        productName: '3D Astronaut',
        price: 149.99,
        productImage: '',
        model3dUrl: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        media: [
          const ProductMedia(
            id: 'm_3d',
            type: ProductMediaType.model3d,
            url: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductMediaGallery(
              product: product,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('3D VIEW'), findsOneWidget);
      expect(find.text('Drag to rotate 360°'), findsOneWidget);
      expect(find.byIcon(Icons.view_in_ar_rounded), findsWidgets);
    });
  });

  group('GoRouter & Role Guard Redirect Tests', () {
    testWidgets('Router redirects unauthenticated user from protected route to /login',
        (WidgetTester tester) async {
      final container = ProviderContainer();
      final router = container.read(routerProvider);

      await tester.pumpWidget(buildRouterApp(container));
      await tester.pumpAndSettle();

      // Initial unauthenticated location goes to /login
      expect(router.routeInformationProvider.value.uri.path, equals('/login'));

      // Attempt navigating to protected /orders
      router.go('/orders');
      await tester.pumpAndSettle();

      // Redirects back to login with redirect param
      expect(router.routeInformationProvider.value.uri.path, equals('/login'));
      expect(
        router.routeInformationProvider.value.uri.queryParameters['redirect'],
        equals('/orders'),
      );
    });

    testWidgets('Router redirects non-admin authenticated user from /admin to /home',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({
        Preferences.keyAccessToken: 'mock_token_abc',
        Preferences.keyUserRole: 'CUSTOMER',
      });
      await Preferences.init();

      final container = ProviderContainer();
      final router = container.read(routerProvider);

      await tester.pumpWidget(buildRouterApp(container));
      await tester.pumpAndSettle();

      // Authenticated customer lands on /home
      expect(router.routeInformationProvider.value.uri.path, equals('/home'));

      // Attempt navigating to /admin
      router.go('/admin');
      await tester.pumpAndSettle();

      // Role guard redirects customer back to /home
      expect(router.routeInformationProvider.value.uri.path, equals('/home'));
    });

    testWidgets('Router permits admin user to access /admin',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({
        Preferences.keyAccessToken: 'mock_admin_token_xyz',
        Preferences.keyUserRole: 'ADMIN',
      });
      await Preferences.init();

      final container = ProviderContainer();
      final router = container.read(routerProvider);

      await tester.pumpWidget(buildRouterApp(container));
      await tester.pumpAndSettle();

      router.go('/admin');
      await tester.pumpAndSettle();

      expect(router.routeInformationProvider.value.uri.path, equals('/admin'));
    });
  });
}
