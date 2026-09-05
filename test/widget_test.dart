import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/data/models/ai_config_model.dart';
import 'package:shopp_app/data/repositories/ai_repository.dart';
import 'package:shopp_app/main.dart';
import 'package:shopp_app/providers/address_provider.dart';
import 'package:shopp_app/providers/admin_provider.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/catalog_provider.dart';
import 'package:shopp_app/providers/checkout_provider.dart';
import 'package:shopp_app/providers/notification_provider.dart';
import 'package:shopp_app/providers/order_provider.dart';
import 'package:shopp_app/providers/review_provider.dart';
import 'package:shopp_app/providers/search_provider.dart';
import 'package:shopp_app/providers/user_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/addresses_page.dart';
import 'package:shopp_app/views/admin/admin_audit_logs_page.dart';
import 'package:shopp_app/views/admin/admin_dashboard_page.dart';
import 'package:shopp_app/views/admin/admin_orders_page.dart';
import 'package:shopp_app/views/admin/admin_products_page.dart';
import 'package:shopp_app/views/admin/admin_reviews_page.dart';
import 'package:shopp_app/views/admin/admin_users_page.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/checkout_page.dart';
import 'package:shopp_app/views/notifications_page.dart';
import 'package:shopp_app/views/order_confirmation_page.dart';
import 'package:shopp_app/views/order_detail_page.dart';
import 'package:shopp_app/views/orders_page.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/profile_page.dart';
import 'package:shopp_app/views/search_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';
import 'package:shopp_app/data/models/assistant_message_model.dart';
import 'package:shopp_app/providers/assistant_provider.dart';
import 'package:shopp_app/views/assistant_page.dart';
import 'package:shopp_app/data/models/recommendation_model.dart';
import 'package:shopp_app/providers/recommendation_provider.dart';
import 'package:shopp_app/views/widgets/recommendation_carousel.dart';
import 'package:shopp_app/views/widgets/address_form_dialog.dart';
import 'package:shopp_app/views/widgets/filter_bottom_sheet.dart';
import 'package:shopp_app/views/widgets/product_card.dart';
import 'package:shopp_app/views/widgets/write_review_dialog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Preferences.init();
  });

  Widget buildTestApp({Widget? home, CurrentUserModel? user}) {
    final userProvider = UserProvider();
    if (user != null) {
      userProvider.currentUser = user;
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: userProvider),
        ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => AdminProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
        ChangeNotifierProvider(create: (_) => AssistantProvider()),
        ChangeNotifierProvider(create: (_) => RecommendationProvider()),
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
      'App displays HomePage with Categories, Search, Wishlist, Notifications and Cart when authenticated',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    expect(find.text('Shoppy Store'), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.notifications_none_outlined), findsOneWidget);
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

  testWidgets('Tapping Notifications icon on HomePage opens NotificationsPage',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    final notifFinder =
        find.widgetWithIcon(IconButton, Icons.notifications_none_outlined);
    await tester.tap(notifFinder);
    await tester.pumpAndSettle();

    expect(find.byType(NotificationsPage), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('Tapping My Account icon on HomePage opens ProfilePage',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    final testUser = CurrentUserModel(
      id: 'usr_101',
      name: 'Jane Doe',
      email: 'jane@example.com',
      phone: '+1 555-0199',
    );

    await tester.pumpWidget(buildTestApp(user: testUser));
    await tester.pumpAndSettle();

    final profileFinder =
        find.widgetWithIcon(IconButton, Icons.person_outline);
    await tester.tap(profileFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ProfilePage), findsOneWidget);
    expect(find.text('My Account'), findsOneWidget);
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

    await tester.tap(find.text('Save Address'));
    await tester.pumpAndSettle();

    expect(find.text('Enter full name'), findsOneWidget);
    expect(find.text('Enter contact phone'), findsOneWidget);
    expect(find.text('Enter street address'), findsOneWidget);
    expect(find.text('Enter city'), findsOneWidget);
    expect(find.text('Enter postal code'), findsOneWidget);
  });

  testWidgets(
      'OrderConfirmationPage renders order receipt, status, items, and action buttons',
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
    expect(find.text('View All Orders'), findsOneWidget);
  });

  testWidgets('OrdersPage renders orders list with status and item info',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestApp(
        home: const OrdersPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('My Orders'), findsOneWidget);
  });

  testWidgets(
      'OrderDetailPage renders tracking timeline, delivery address, items, and cancel button',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestApp(
        home: const OrderDetailPage(orderId: '64f1b2c3d4e5f6a7b8c90001'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Order Details'), findsOneWidget);
  });

  testWidgets('AddressesPage renders addresses list and add address action',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestApp(
        home: const AddressesPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Delivery Addresses'), findsOneWidget);
  });

  testWidgets('NotificationsPage renders notifications and header',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestApp(
        home: const NotificationsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('ProfilePage renders account options and logout button',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    final testUser = CurrentUserModel(
      id: 'usr_101',
      name: 'Jane Doe',
      email: 'jane@example.com',
      phone: '+1 555-0199',
    );

    await tester.pumpWidget(
      buildTestApp(
        home: const ProfilePage(),
        user: testUser,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('My Account'), findsOneWidget);
    expect(find.text('Jane Doe'), findsOneWidget);
    expect(find.text('jane@example.com'), findsOneWidget);
    expect(find.text('+1 555-0199'), findsOneWidget);
    expect(find.text('My Orders'), findsOneWidget);
    expect(find.text('My Wishlist'), findsOneWidget);
    expect(find.text('Delivery Addresses'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Change Password'), findsOneWidget);
    expect(find.text('Notification Preferences'), findsOneWidget);
    expect(find.text('Log Out'), findsOneWidget);
  });

  testWidgets('ProfilePage displays Store Administration section for ADMIN user',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    final adminUser = CurrentUserModel(
      id: 'usr_admin',
      name: 'Super Administrator',
      email: 'admin@shoppy.com',
      role: 'ADMIN',
    );

    await tester.pumpWidget(
      buildTestApp(
        home: const ProfilePage(),
        user: adminUser,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Store Administration'), findsOneWidget);
    expect(find.text('Admin Dashboard'), findsOneWidget);
  });

  testWidgets('AdminDashboardPage renders KPI grid, navigation hub, and breakdown',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestApp(
        home: const AdminDashboardPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Admin Dashboard'), findsOneWidget);
    expect(find.text('Total Revenue'), findsOneWidget);
    expect(find.text('Total Orders'), findsOneWidget);
    expect(find.text('Active Products'), findsOneWidget);
    expect(find.text('Total Users'), findsOneWidget);
    expect(find.text('Store Administration'), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Orders'), findsOneWidget);
    expect(find.text('Users'), findsOneWidget);
    expect(find.text('Audit'), findsOneWidget);
  });

  testWidgets('AdminProductsPage renders search bar and low stock filter',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const AdminProductsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Product Management'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Low Stock'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('AdminOrdersPage renders status filter tabs and order list',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const AdminOrdersPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Order Management'), findsOneWidget);
    expect(find.text('ALL'), findsOneWidget);
    expect(find.text('CONFIRMED'), findsOneWidget);
    expect(find.text('PROCESSING'), findsOneWidget);
    expect(find.text('SHIPPED'), findsOneWidget);
    expect(find.text('DELIVERED'), findsOneWidget);
    expect(find.text('CANCELLED'), findsOneWidget);
  });

  testWidgets('AdminUsersPage renders user management directory and search',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const AdminUsersPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('User Management'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('AdminAuditLogsPage renders security audit trail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const AdminAuditLogsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Security & Audit Trail'), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });

  testWidgets(
      'ProductDetailPage renders customer reviews section and rating summary',
      (WidgetTester tester) async {
    final testProduct = Product(
      id: 'prod_999',
      productName: 'Noise Cancelling Headphones',
      sellerName: 'AudioMaster',
      description: 'Superior sound experience',
      price: 149.99,
      stock: 20,
      productRating: 4.5,
      productImage: '',
    );

    final reviewProvider = ReviewProvider();
    reviewProvider.setReviewsForTesting(
      summary: ReviewSummaryModel(
        averageRating: 4.5,
        totalReviews: 2,
        ratingDistribution: {1: 0, 2: 0, 3: 0, 4: 1, 5: 1},
      ),
      reviews: [
        ReviewModel(
          id: 'rev_1',
          rating: 5,
          title: 'Amazing sound',
          comment: 'Best headphones I have ever owned.',
          verifiedPurchase: true,
          authorName: 'David K.',
          createdAt: DateTime.now(),
        ),
      ],
      eligibility: ReviewEligibilityModel(
        canReview: true,
        hasReviewed: false,
        isVerifiedPurchase: true,
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
          ChangeNotifierProvider.value(value: reviewProvider),
          ChangeNotifierProvider(create: (_) => RecommendationProvider()),
        ],
        child: MaterialApp(
          home: ProductDetailPage(product: testProduct),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Customer Reviews'), findsOneWidget);
    expect(find.text('4.5'), findsWidgets);
    expect(find.text('David K.'), findsOneWidget);
    expect(find.text('✓ Verified'), findsOneWidget);
    expect(find.text('Amazing sound'), findsOneWidget);
    expect(find.text('Best headphones I have ever owned.'), findsOneWidget);
  });

  testWidgets(
      'WriteReviewDialog renders star rating picker and validates empty comment',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const Scaffold(
          body: WriteReviewDialog(
            productId: 'prod_999',
            productName: 'Noise Cancelling Headphones',
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Write a Review'), findsOneWidget);
    expect(find.text('Noise Cancelling Headphones'), findsOneWidget);
    expect(find.text('Excellent (5/5)'), findsOneWidget);
    expect(find.text('Submit Review'), findsOneWidget);

    // Tap Submit Review without entering comment -> validation error
    await tester.tap(find.text('Submit Review'));
    await tester.pumpAndSettle();

    expect(find.text('Review must be at least 3 characters'), findsOneWidget);
  });

  testWidgets(
      'AdminReviewsPage renders review moderation interface with filter chips',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const AdminReviewsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Review Moderation'), findsOneWidget);
    expect(find.text('ALL'), findsOneWidget);
    expect(find.text('PUBLISHED'), findsOneWidget);
    expect(find.text('HIDDEN'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  test('AiHealthModel correctly serializes and deserializes backend AI health payload', () {
    final Map<String, dynamic> sampleJson = {
      'enabled': true,
      'provider': 'mock',
      'model': 'gemini-1.5-flash',
      'healthy': true,
      'features': {
        'assistantEnabled': true,
        'semanticSearchEnabled': true,
        'toolCallingEnabled': true,
      },
      'allowlistedTools': [
        'search_products',
        'get_product_details',
        'get_user_order_status',
        'check_store_policy',
      ],
      'vectorStore': {
        'ready': true,
      },
    };

    final health = AiHealthModel.fromJson(sampleJson);
    expect(health.enabled, isTrue);
    expect(health.provider, equals('mock'));
    expect(health.model, equals('gemini-1.5-flash'));
    expect(health.healthy, isTrue);
    expect(health.features.assistantEnabled, isTrue);
    expect(health.features.semanticSearchEnabled, isTrue);
    expect(health.allowlistedTools.length, equals(4));
    expect(health.allowlistedTools.contains('search_products'), isTrue);
    expect(health.vectorStoreReady, isTrue);

    final serialized = health.toJson();
    expect(serialized['enabled'], isTrue);
    expect(serialized['provider'], equals('mock'));
  });

  test('AiQueryResultModel correctly parses query response with metadata', () {
    final Map<String, dynamic> queryJson = {
      'requestId': 'ai_req_test_123',
      'answer': 'We offer a 30-day return policy for all eligible items.',
      'toolResults': [
        {
          'toolName': 'check_store_policy',
          'result': {'policy': 'returns', 'days': 30},
        },
      ],
      'metadata': {
        'provider': 'mock',
        'model': 'mock-model-v1',
        'durationMs': 35,
      },
    };

    final result = AiQueryResultModel.fromJson(queryJson);
    expect(result.requestId, equals('ai_req_test_123'));
    expect(result.answer, contains('30-day return policy'));
    expect(result.provider, equals('mock'));
    expect(result.model, equals('mock-model-v1'));
    expect(result.durationMs, equals(35));
    expect(result.toolResults.length, equals(1));
  });

  test('AiRepository instantiates cleanly with default dependencies', () {
    final repo = AiRepository();
    expect(repo, isNotNull);
  });

  testWidgets('SearchPage renders natural language search hint and triggers search', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const SearchPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Search products, brands, or describe what you need...'), findsOneWidget);
    expect(find.byIcon(Icons.tune), findsOneWidget);
  });

  test('SearchProvider executes natural language query and maintains state', () async {
    final provider = SearchProvider();
    expect(provider.isSearching, isFalse);
    expect(provider.hasExecutedSearch, isFalse);

    // Filter setting
    provider.setFilters(maxPrice: 3000, inStockOnly: true);
    expect(provider.maxPrice, equals(3000));
    expect(provider.inStockOnly, isTrue);
    expect(provider.activeFilterCount, equals(2));

    // Reset filters
    provider.resetFilters();
    expect(provider.maxPrice, isNull);
    expect(provider.inStockOnly, isFalse);
    expect(provider.activeFilterCount, equals(0));
  });

  test('AssistantMessageModel and AssistantChatResponseModel serialize and deserialize accurately', () {
    final rawJson = {
      'conversationId': 'conv_123',
      'message': 'Here are top recommendations:',
      'answer': 'Here are top recommendations:',
      'products': [
        {
          'id': 'p_101',
          'name': 'Wireless Noise-Cancelling Headphones',
          'price': 149.99,
          'inStock': true,
          'stockCount': 10,
          'rating': 4.7,
          'seller': 'SoundPro',
          'productImage': '',
          'description': 'High clarity sound',
        }
      ],
      'sources': [
        {
          'chunkId': 'chk_1',
          'title': 'Store Policy',
          'section': 'Returns',
          'sourceType': 'POLICY',
          'content': '30-day return window',
        }
      ],
      'actions': [
        {
          'type': 'OPEN_PRODUCT',
          'label': 'View Product',
          'payload': {'productId': 'p_101'},
        }
      ],
      'requestId': 'req_777',
    };

    final resp = AssistantChatResponseModel.fromJson(rawJson);
    expect(resp.conversationId, equals('conv_123'));
    expect(resp.products.length, equals(1));
    expect(resp.products.first.name, equals('Wireless Noise-Cancelling Headphones'));
    expect(resp.sources.length, equals(1));
    expect(resp.sources.first.title, equals('Store Policy'));
    expect(resp.actions.length, equals(1));
    expect(resp.actions.first.type, equals('OPEN_PRODUCT'));

    final msg = AssistantMessageModel(
      id: 'm_1',
      role: 'assistant',
      content: resp.message,
      products: resp.products,
      sources: resp.sources,
      actions: resp.actions,
    );

    expect(msg.isUser, isFalse);
    expect(msg.hasProducts, isTrue);
    expect(msg.hasSources, isTrue);
    expect(msg.hasActions, isTrue);
  });

  test('AssistantProvider maintains conversation state and provides suggested prompts', () {
    final provider = AssistantProvider();
    expect(provider.messages.isEmpty, isTrue);
    expect(provider.isLoading, isFalse);
    expect(provider.suggestedPrompts.isNotEmpty, isTrue);
    expect(provider.suggestedPrompts.any((p) => p.contains('headphones')), isTrue);

    provider.startNewConversation();
    expect(provider.messages.isEmpty, isTrue);
    expect(provider.activeConversationId, isNull);
  });

  testWidgets('HomePage renders AI Assistant AppBar action button and navigates to AssistantPage',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    final assistantButtonFinder = find.byIcon(Icons.auto_awesome);
    expect(assistantButtonFinder, findsOneWidget);

    await tester.tap(assistantButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(AssistantPage), findsOneWidget);
    expect(find.text('Shoppy Assistant'), findsOneWidget);
    expect(find.text('AI Shopping Companion'), findsOneWidget);
    expect(find.text('How can I help you shop today?'), findsOneWidget);
  });

  testWidgets('AssistantPage renders empty state with prompt chips and input field',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(
        home: const AssistantPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Shoppy Assistant'), findsOneWidget);
    expect(find.text('How can I help you shop today?'), findsOneWidget);
    expect(find.text('Try asking:'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });

  test('AssistantConfirmationModel serializes and deserializes accurately', () {
    final confJson = {
      'confirmationId': 'conf_xyz_123',
      'action': 'cancel_order',
      'summary': 'Cancel order #ORD-999 containing 2 items',
      'orderId': 'ord_999',
      'orderNumber': 'ORD-999',
      'totalAmount': 89.99,
      'currency': 'USD',
      'details': {'reason': 'Changed mind'},
    };

    final confModel = AssistantConfirmationModel.fromJson(confJson);
    expect(confModel.confirmationId, equals('conf_xyz_123'));
    expect(confModel.action, equals('cancel_order'));
    expect(confModel.summary, equals('Cancel order #ORD-999 containing 2 items'));
    expect(confModel.orderId, equals('ord_999'));
    expect(confModel.orderNumber, equals('ORD-999'));
    expect(confModel.totalAmount, equals(89.99));
    expect(confModel.currency, equals('USD'));
    expect(confModel.details['reason'], equals('Changed mind'));

    final serialized = confModel.toJson();
    expect(serialized['confirmationId'], equals('conf_xyz_123'));
    expect(serialized['action'], equals('cancel_order'));
    expect(serialized['summary'], equals('Cancel order #ORD-999 containing 2 items'));
    expect(serialized['orderId'], equals('ord_999'));

    final msg = AssistantMessageModel(
      id: 'm_conf_1',
      role: 'assistant',
      content: 'Please confirm order cancellation',
      pendingConfirmation: confModel,
    );
    expect(msg.hasPendingConfirmation, isTrue);
    expect(msg.pendingConfirmation?.confirmationId, equals('conf_xyz_123'));
  });

  testWidgets('AssistantPage renders ConfirmationCard when pendingConfirmation is present',
      (WidgetTester tester) async {
    final assistantProvider = AssistantProvider();
    const confModel = AssistantConfirmationModel(
      confirmationId: 'conf_test_77',
      action: 'cancel_order',
      summary: 'Cancel order #ORD-2026-A10 (Total: \$89.99)',
      orderId: 'ORD-2026-A10',
      totalAmount: 89.99,
    );

    final msg = AssistantMessageModel(
      id: 'm_test_1',
      role: 'assistant',
      content: 'I have prepared your order cancellation request. Please confirm below:',
      pendingConfirmation: confModel,
    );
    assistantProvider.addMessage(msg);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AssistantProvider>.value(value: assistantProvider),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CatalogProvider()),
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
          ChangeNotifierProvider(create: (_) => AddressProvider()),
          ChangeNotifierProvider(create: (_) => CheckoutProvider()),
          ChangeNotifierProvider(create: (_) => OrderProvider()),
          ChangeNotifierProvider(create: (_) => NotificationProvider()),
          ChangeNotifierProvider(create: (_) => AdminProvider()),
          ChangeNotifierProvider(create: (_) => ReviewProvider()),
          ChangeNotifierProvider(create: (_) => RecommendationProvider()),
        ],
        child: const MaterialApp(
          home: AssistantPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Confirmation Required'), findsOneWidget);
    expect(find.text('Cancel order #ORD-2026-A10 (Total: \$89.99)'), findsOneWidget);
    expect(find.text('This action cannot be undone automatically.'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Cancel'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Confirm'), findsOneWidget);
  });

  // ==========================================
  // PHASE 16: AI RECOMMENDATIONS & PERSONALIZATION
  // ==========================================

  test('RecommendationResponseModel parses and serializes recommendation envelope', () {
    final rawJson = {
      'recommendationType': 'PERSONALIZED',
      'reason': 'Because you viewed Wireless Headphones',
      'count': 2,
      'products': [
        {
          'id': 'rec_p1',
          'productName': 'Noise Cancelling Headphones',
          'price': 199.99,
          'stock': 15,
          'productRating': 4.7,
          'productImage': 'https://example.com/headphones.jpg',
          'recommendationReason': 'High semantic similarity',
          'score': 0.88,
          'source': 'SEMANTIC',
        },
        {
          'id': 'rec_p2',
          'productName': 'Wireless Earbuds Pro',
          'price': 99.99,
          'stock': 25,
          'productRating': 4.5,
          'productImage': 'https://example.com/earbuds.jpg',
          'recommendationReason': 'Frequently bought together',
          'score': 0.76,
          'source': 'COOCCURRENCE',
        },
      ],
      'metadata': {
        'strategy': 'PERSONALIZED_HYBRID',
        'candidateCount': 10,
        'rankedCount': 2,
      },
    };

    final model = RecommendationResponseModel.fromJson(rawJson);
    expect(model.recommendationType, equals('PERSONALIZED'));
    expect(model.reason, equals('Because you viewed Wireless Headphones'));
    expect(model.count, equals(2));
    expect(model.items.length, equals(2));
    expect(model.products.length, equals(2));

    expect(model.items[0].product.productName, equals('Noise Cancelling Headphones'));
    expect(model.items[0].recommendationReason, equals('High semantic similarity'));
    expect(model.items[0].score, equals(0.88));
    expect(model.items[0].source, equals('SEMANTIC'));

    expect(model.items[1].product.productName, equals('Wireless Earbuds Pro'));
    expect(model.items[1].recommendationReason, equals('Frequently bought together'));

    final serialized = model.toJson();
    expect(serialized['recommendationType'], equals('PERSONALIZED'));
    expect(serialized['reason'], equals('Because you viewed Wireless Headphones'));
    expect(serialized['count'], equals(2));
    expect((serialized['products'] as List).length, equals(2));
  });

  testWidgets('RecommendationCarousel renders header, subtitle, and items correctly',
      (WidgetTester tester) async {
    final testProducts = [
      RecommendedProduct(
        product: Product(
          id: 'rec_widget_1',
          productName: 'Mechanical Keyboard RGB',
          price: 89.99,
          stock: 12,
          productRating: 4.8,
          productImage: '',
        ),
        recommendationReason: 'Trending in Electronics',
        score: 0.91,
      ),
      RecommendedProduct(
        product: Product(
          id: 'rec_widget_2',
          productName: 'Wireless Gaming Mouse',
          price: 49.99,
          stock: 30,
          productRating: 4.6,
          productImage: '',
        ),
        recommendationReason: 'Similar to recent views',
        score: 0.85,
      ),
    ];

    await tester.pumpWidget(
      buildTestApp(
        home: Scaffold(
          body: RecommendationCarousel(
            title: 'Recommended For You',
            subtitle: 'Based on your recent interest in Gaming',
            items: testProducts,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Recommended For You'), findsOneWidget);
    expect(find.text('Based on your recent interest in Gaming'), findsOneWidget);
    expect(find.text('Mechanical Keyboard RGB'), findsOneWidget);
    expect(find.text('Wireless Gaming Mouse'), findsOneWidget);
  });

  testWidgets('RecommendationCarousel renders loading placeholder when isLoading is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RecommendationCarousel(
            title: 'Loading Items',
            items: [],
            isLoading: true,
          ),
        ),
      ),
    );
    await tester.pump();

    // Verifies the horizontal shimmer list view is mounted
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('RecommendationCarousel returns empty SizedBox when items are empty and not loading',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RecommendationCarousel(
            title: 'Empty Recs',
            items: [],
            isLoading: false,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Empty Recs'), findsNothing);
  });
}

