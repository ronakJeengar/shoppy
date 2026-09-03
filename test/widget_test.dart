import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/main.dart';
import 'package:shopp_app/providers/address_provider.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/checkout_provider.dart';
import 'package:shopp_app/providers/search_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/checkout_page.dart';
import 'package:shopp_app/views/order_confirmation_page.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/search_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';
import 'package:shopp_app/views/widgets/address_form_dialog.dart';
import 'package:shopp_app/views/widgets/filter_bottom_sheet.dart';
import 'package:shopp_app/views/widgets/product_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Preferences.init();
  });

  Widget buildTestApp({Widget? home}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ],
      child: home != null ? MaterialApp(home: home) : const MyApp(),
    );
  }

  testWidgets('App launches and displays Login page when unauthenticated',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Login form triggers validation error when submitted empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Tapping Register button navigates to Create Account screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    final registerButtonFinder = find.widgetWithText(TextButton, 'Register');
    await tester.tap(registerButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Join Shoppy Today'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });

  testWidgets(
      'App displays HomePage with Categories, Search, Wishlist, and Cart when authenticated',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    expect(find.text('Shoppy Store'), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsWidgets);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
    expect(
        find.text('Search products, brands and categories...'), findsOneWidget);

    // Tap search bar to verify navigation to SearchPage
    await tester.tap(find.text('Search products, brands and categories...'));
    await tester.pumpAndSettle();

    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byIcon(Icons.tune), findsOneWidget);
  });

  testWidgets('Tapping Cart icon on HomePage opens CartPage',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    // Tap cart icon in AppBar
    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();

    expect(find.byType(CartPage), findsOneWidget);
    expect(find.textContaining('Shopping Cart'), findsOneWidget);
  });

  testWidgets('Tapping Wishlist icon on HomePage opens WishlistPage',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    final wishlistIconFinder =
        find.widgetWithIcon(IconButton, Icons.favorite_border);
    await tester.tap(wishlistIconFinder.first);
    await tester.pumpAndSettle();

    expect(find.byType(WishlistPage), findsOneWidget);
    expect(find.text('My Wishlist (0)'), findsOneWidget);
  });

  testWidgets(
      'ProductCard displays information, wishlist toggle, and navigates to ProductDetailPage',
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
      buildTestApp(
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
    await tester.tap(find.text('Mechanical Gaming Keyboard'));
    await tester.pumpAndSettle();

    expect(find.byType(ProductDetailPage), findsOneWidget);
    expect(find.text('Sold by KeyCrafters'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });

  testWidgets('SearchPage displays recent searches and opens filter sheet',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyRecentSearches: ['Headphones', 'Keyboard'],
    });
    await Preferences.init();

    await tester.pumpWidget(
      buildTestApp(
        home: const SearchPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Recent Searches'), findsOneWidget);
    expect(find.text('Headphones'), findsOneWidget);
    expect(find.text('Keyboard'), findsOneWidget);
    expect(find.text('Clear All'), findsOneWidget);

    // Tap filters button
    await tester.tap(find.byIcon(Icons.tune));
    await tester.pumpAndSettle();

    expect(find.byType(FilterBottomSheet), findsOneWidget);
    expect(find.text('Filters'), findsOneWidget);
    expect(find.text('Apply Filters'), findsOneWidget);
    expect(find.text('In-Stock Items Only'), findsOneWidget);
  });

  testWidgets(
      'CheckoutPage displays address section, shipping methods, and payment methods',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestApp(
        home: const CheckoutPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Checkout'), findsOneWidget);
    expect(find.text('Delivery Address'), findsOneWidget);
    expect(find.text('Shipping Method'), findsOneWidget);
    expect(find.text('Standard Delivery (3-5 Days)'), findsOneWidget);
    expect(find.text('Express Delivery (1-2 Days)'), findsOneWidget);
    expect(find.text('Payment Method'), findsOneWidget);
    expect(find.text('Credit / Debit Card'), findsOneWidget);
    expect(find.text('Cash on Delivery (COD)'), findsOneWidget);
    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('Place Order'), findsOneWidget);
  });

  testWidgets('AddressFormBottomSheet validates required input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const Scaffold(
          body: AddressFormBottomSheet(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Add Delivery Address'), findsOneWidget);
    expect(find.text('Save Address'), findsOneWidget);

    // Tap Save with empty fields
    await tester.tap(find.text('Save Address'));
    await tester.pumpAndSettle();

    expect(find.text('Enter full name'), findsOneWidget);
    expect(find.text('Enter contact phone'), findsOneWidget);
    expect(find.text('Enter street address'), findsOneWidget);
    expect(find.text('Enter city'), findsOneWidget);
    expect(find.text('Enter postal code'), findsOneWidget);
  });

  testWidgets(
      'OrderConfirmationPage renders order receipt, status, items, and continue action',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    final testOrder = OrderModel(
      id: 'ord_123',
      orderNumber: 'ORD-2026-X99',
      orderItems: [
        OrderItemModel(
          productId: 'prod_1',
          productName: 'Wireless Headphones',
          productImage: '',
          sellerName: 'SoundTech',
          unitPrice: 149.99,
          quantity: 1,
          lineTotal: 149.99,
        ),
      ],
      shippingAddress: AddressModel(
        id: 'addr_1',
        fullName: 'Jane Doe',
        phone: '555-1234',
        streetAddress: '123 Market St',
        city: 'San Francisco',
        state: 'CA',
        postalCode: '94105',
      ),
      subtotal: 149.99,
      shippingFee: 0.0,
      tax: 12.0,
      totalAmount: 161.99,
      status: 'CONFIRMED',
      createdAt: DateTime.now(),
    );

    await tester.pumpWidget(
      buildTestApp(
        home: OrderConfirmationPage(order: testOrder),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Order Confirmed'), findsOneWidget);
    expect(find.text('Thank you for your order!'), findsOneWidget);
    expect(find.text('ORD-2026-X99'), findsOneWidget);
    expect(find.text('CONFIRMED'), findsOneWidget);
    expect(find.text('Jane Doe'), findsOneWidget);
    expect(find.text('Wireless Headphones'), findsOneWidget);
    expect(find.text('\$161.99'), findsOneWidget);
    expect(find.text('Continue Shopping'), findsOneWidget);
  });
}
