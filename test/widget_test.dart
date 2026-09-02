import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/main.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/widgets/product_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Preferences.init();
  });

  testWidgets('App launches and displays Login page when unauthenticated',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Login form triggers validation error when submitted empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Tapping Register button navigates to Create Account screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    final registerButtonFinder = find.widgetWithText(TextButton, 'Register');
    await tester.tap(registerButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Join Shoppy Today'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });

  testWidgets('App displays HomePage with Categories and Search when authenticated',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Shoppy Store'), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Search products, brands and categories...'), findsOneWidget);
  });

  testWidgets('ProductCard displays information and navigates to ProductDetailPage',
      (WidgetTester tester) async {
    final testProduct = Product(
      id: 'prod_123',
      productName: 'Mechanical Gaming Keyboard',
      sellerName: 'KeyCrafters',
      description: 'RGB mechanical keyboard with tactile switches.',
      price: 89.99,
      stock: 15,
      productRating: 4.8,
      productImage: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 300,
            width: 200,
            child: ProductCard(product: testProduct),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mechanical Gaming Keyboard'), findsOneWidget);
    expect(find.text('KeyCrafters'), findsOneWidget);
    expect(find.text('\$89.99'), findsOneWidget);
    expect(find.text('4.8'), findsOneWidget);

    // Tap card to navigate
    await tester.tap(find.byType(ProductCard));
    await tester.pumpAndSettle();

    expect(find.byType(ProductDetailPage), findsOneWidget);
    expect(find.text('Sold by KeyCrafters'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
  });
}
