import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/errors/failures.dart';
import 'package:shopp_app/core/router/main_shell.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/config/data/datasources/app_config_local_datasource.dart';
import 'package:shopp_app/features/config/data/datasources/app_config_remote_datasource.dart';
import 'package:shopp_app/features/config/data/models/app_config_model.dart';
import 'package:shopp_app/features/config/data/repositories/app_config_repository_impl.dart';
import 'package:shopp_app/features/config/domain/entities/app_config_entity.dart';
import 'package:shopp_app/features/config/domain/repositories/app_config_repository.dart';
import 'package:shopp_app/features/config/presentation/providers/app_config_providers.dart';
import 'package:shopp_app/features/config/presentation/widgets/maintenance_view.dart';
import 'package:shopp_app/features/config/presentation/widgets/update_required_dialog.dart';
import 'package:shopp_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:shopp_app/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:shopp_app/features/wishlist/presentation/providers/wishlist_providers.dart';
import 'package:shopp_app/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:shopp_app/features/notifications/presentation/providers/notification_providers.dart';
import 'package:shopp_app/data/models/recommendation_model.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/features/recommendations/presentation/providers/recommendation_providers.dart';
import 'package:shopp_app/features/reviews/domain/entities/review_entity.dart';
import 'package:shopp_app/features/reviews/presentation/providers/review_providers.dart';
import 'package:shopp_app/features/catalog/presentation/screens/home_page.dart';
import 'package:shopp_app/features/catalog/presentation/screens/product_detail_page.dart';

class MockAppConfigRemoteDataSource implements AppConfigRemoteDataSource {
  AppConfigRemoteResult? responseToReturn;
  Exception? exceptionToThrow;
  String? lastEtag;
  String? lastClientVersion;

  @override
  Future<AppConfigRemoteResult> fetchBootstrapConfig({
    String? etag,
    String clientVersion = '1.0.0',
  }) async {
    lastEtag = etag;
    lastClientVersion = clientVersion;

    if (exceptionToThrow != null) {
      throw exceptionToThrow!;
    }
    return responseToReturn ??
        AppConfigRemoteResult(
          model: AppConfigModel.fromEntity(AppConfigEntity.defaultConfig),
          etag: '"mock-etag-123"',
          isNotModified: false,
        );
  }
}

class FakeAppConfigRepository implements AppConfigRepository {
  AppConfigEntity _config;
  bool shouldFail;

  FakeAppConfigRepository({
    AppConfigEntity? initialConfig,
    this.shouldFail = false,
  }) : _config = initialConfig ?? AppConfigEntity.defaultConfig;

  void setConfig(AppConfigEntity config) {
    _config = config;
  }

  @override
  AppConfigEntity? getCachedConfig() => _config;

  @override
  Future<Result<AppConfigEntity>> fetchAppConfig({bool forceRefresh = false}) async {
    if (shouldFail) {
      return const FailureResult(ServerFailure('Simulated failure'));
    }
    return Success(_config);
  }

  @override
  Future<void> cacheConfig(AppConfigEntity config) async {
    _config = config;
  }
}

class FakeWishlistRepository implements WishlistRepository {
  @override
  Future<Result<List<ProductEntity>>> getWishlist() async => const Success([]);
  @override
  Future<Result<bool>> toggleWishlist(String productId) async => const Success(false);
  @override
  Future<Result<void>> removeFromWishlist(String productId) async => const Success(null);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppConfigModel serialization & entity mapping', () {
    test('round-trip serialization produces valid JSON', () {
      const defaultEntity = AppConfigEntity.defaultConfig;
      final model = AppConfigModel.fromEntity(defaultEntity);
      final json = model.toJson();

      expect(json['configVersion'], equals(defaultEntity.configVersion));
      expect(json['features']['wishlist'], isTrue);
      expect(json['appVersion']['minimumSupported'], equals('1.0.0'));
      expect(json['maintenance']['enabled'], isFalse);

      final deserialized = AppConfigModel.fromJson(json);
      final deserializedEntity = deserialized.toEntity();

      expect(deserializedEntity.configVersion, equals(defaultEntity.configVersion));
      expect(deserializedEntity.features.wishlist, isTrue);
      expect(deserializedEntity.appVersion.minimumSupported, equals('1.0.0'));
      expect(deserializedEntity.maintenance.enabled, isFalse);
      expect(deserializedEntity.ui.homeSections.length, equals(defaultEntity.ui.homeSections.length));
    });

    test('handles missing or null JSON fields gracefully with robust fallbacks', () {
      final model = AppConfigModel.fromJson({});
      final entity = model.toEntity();

      expect(entity.configVersion, equals('2026.09.01.1'));
      expect(entity.features.wishlist, isTrue);
      expect(entity.features.reviews, isTrue);
      expect(entity.maintenance.enabled, isFalse);
      expect(entity.appVersion.forceUpdateRequired, isFalse);
      expect(entity.ui.homeSections, isNotEmpty);
    });
  });

  group('AppConfigLocalDataSource tests', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await Preferences.init();
    });

    test('saves and retrieves cached config and etag', () async {
      final local = AppConfigLocalDataSourceImpl();

      expect(local.getCachedConfig(), isNull);
      expect(local.getCachedEtag(), isNull);

      const entity = AppConfigEntity.defaultConfig;
      final model = AppConfigModel.fromEntity(entity);
      await local.saveConfig(model);
      await local.saveEtag('"test-etag-555"');

      final cached = local.getCachedConfig();
      expect(cached, isNotNull);
      expect(cached!.configVersion, equals(entity.configVersion));
      expect(local.getCachedEtag(), equals('"test-etag-555"'));
    });
  });

  group('AppConfigRepositoryImpl tests', () {
    late MockAppConfigRemoteDataSource remoteMock;
    late AppConfigLocalDataSourceImpl localSource;
    late AppConfigRepositoryImpl repo;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await Preferences.init();
      remoteMock = MockAppConfigRemoteDataSource();
      localSource = AppConfigLocalDataSourceImpl();
      repo = AppConfigRepositoryImpl(
        remoteDataSource: remoteMock,
        localDataSource: localSource,
      );
    });

    test('fetches from remote, updates local cache and returns success', () async {
      final customModel = AppConfigModel.fromEntity(
        AppConfigEntity.defaultConfig.copyWith(
          configVersion: '2026.09.09-v2',
          features: AppConfigEntity.defaultConfig.features.copyWith(coupons: false),
        ),
      );

      remoteMock.responseToReturn = AppConfigRemoteResult(
        model: customModel,
        etag: '"etag-custom-1"',
        isNotModified: false,
      );

      final result = await repo.fetchAppConfig();
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull!.configVersion, equals('2026.09.09-v2'));
      expect(result.dataOrNull!.features.coupons, isFalse);

      final cached = localSource.getCachedConfig();
      expect(cached, isNotNull);
      expect(cached!.configVersion, equals('2026.09.09-v2'));
    });

    test('returns cached config on 304 Not Modified', () async {
      const cachedEntity = AppConfigEntity.defaultConfig;
      await localSource.saveConfig(AppConfigModel.fromEntity(cachedEntity));
      await localSource.saveEtag('"etag-cached"');

      remoteMock.responseToReturn = const AppConfigRemoteResult(
        model: null,
        etag: '"etag-cached"',
        isNotModified: true,
      );

      final result = await repo.fetchAppConfig();
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull!.configVersion, equals(cachedEntity.configVersion));
      expect(remoteMock.lastEtag, equals('"etag-cached"'));
    });

    test('falls back to local cached config when remote fails', () async {
      final localEntity = AppConfigEntity.defaultConfig.copyWith(configVersion: 'cached-version-99');
      await localSource.saveConfig(AppConfigModel.fromEntity(localEntity));

      remoteMock.exceptionToThrow = Exception('Network offline');

      final result = await repo.fetchAppConfig();
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull!.configVersion, equals('cached-version-99'));
    });

    test('falls back to AppConfigEntity.defaultConfig when offline and cache empty', () async {
      remoteMock.exceptionToThrow = Exception('Network unreachable');

      final result = await repo.fetchAppConfig();
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull, equals(AppConfigEntity.defaultConfig));
    });
  });

  group('Riverpod Providers and Selectors tests', () {
    test('selector providers derive maintenance and update flags accurately', () {
      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          maintenance: const MaintenanceConfigEntity(
            enabled: true,
            message: 'Upgrading database servers',
          ),
          appVersion: const AppVersionEntity(
            minimumSupported: '2.0.0',
            latestRecommended: '2.5.0',
            forceUpdateRequired: true,
          ),
        ),
      );

      final container = ProviderContainer(
        overrides: [
          appConfigRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      expect(container.read(isMaintenanceModeProvider), isTrue);
      expect(container.read(forceUpdateRequiredProvider), isTrue);
      expect(container.read(featureFlagsProvider).wishlist, isTrue);

      final sections = container.read(homeSectionsProvider);
      expect(sections, isNotEmpty);
      expect(sections.first.order, lessThanOrEqualTo(sections.last.order));
    });
  });

  group('MaintenanceView Widget Tests', () {
    testWidgets('renders maintenance view with custom message and retry button',
        (WidgetTester tester) async {
      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          maintenance: const MaintenanceConfigEntity(
            enabled: true,
            message: 'Shoppy is temporarily offline for upgrades.',
          ),
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appConfigRepositoryProvider.overrideWithValue(fakeRepo),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: MaintenanceView(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Under Maintenance'), findsOneWidget);
      expect(find.text('Shoppy is temporarily offline for upgrades.'), findsOneWidget);
      expect(find.text('Check Status'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (w) => w is AppIcon && w.assetPath == AppIcons.maintenance,
        ),
        findsOneWidget,
      );
    });
  });

  group('UpdateRequiredDialog Widget Tests', () {
    testWidgets('renders force update modal with minimum version info',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UpdateRequiredDialog(
              minimumVersion: '2.1.0',
              updateUrl: 'https://example.com/update',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Update Required'), findsOneWidget);
      expect(find.textContaining('2.1.0'), findsOneWidget);
      expect(find.text('Update Now'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (w) => w is AppIcon && w.assetPath == AppIcons.systemUpdate,
        ),
        findsOneWidget,
      );
    });
  });

  group('MainShell Remote Config Integration Tests', () {
    testWidgets('renders MaintenanceView when isMaintenanceMode is true',
        (WidgetTester tester) async {
      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          maintenance: const MaintenanceConfigEntity(
            enabled: true,
            message: 'Service downtime for migration',
          ),
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appConfigRepositoryProvider.overrideWithValue(fakeRepo),
            cartItemCountProvider.overrideWithValue(0),
            wishlistRepositoryProvider.overrideWithValue(FakeWishlistRepository()),
            notificationUnreadCountProvider.overrideWithValue(0),
          ],
          child: const MaterialApp(
            home: MainShell(
              location: '/home',
              child: Text('Shell Home Content'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(MaintenanceView), findsOneWidget);
      expect(find.text('Service downtime for migration'), findsOneWidget);
      expect(find.text('Shell Home Content'), findsNothing);
    });

    testWidgets('renders UpdateRequiredDialog when forceUpdateRequired is true',
        (WidgetTester tester) async {
      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          appVersion: const AppVersionEntity(
            minimumSupported: '3.0.0',
            latestRecommended: '3.1.0',
            forceUpdateRequired: true,
          ),
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appConfigRepositoryProvider.overrideWithValue(fakeRepo),
            cartItemCountProvider.overrideWithValue(0),
            wishlistRepositoryProvider.overrideWithValue(FakeWishlistRepository()),
            notificationUnreadCountProvider.overrideWithValue(0),
          ],
          child: const MaterialApp(
            home: MainShell(
              location: '/home',
              child: Text('Protected App Content'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(UpdateRequiredDialog), findsOneWidget);
      expect(find.textContaining('3.0.0'), findsOneWidget);
      expect(find.text('Protected App Content'), findsNothing);
    });

    testWidgets('toggles Wishlist navigation tab based on featureFlags.wishlist',
        (WidgetTester tester) async {
      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          features: AppConfigEntity.defaultConfig.features.copyWith(
            wishlist: false,
          ),
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appConfigRepositoryProvider.overrideWithValue(fakeRepo),
            cartItemCountProvider.overrideWithValue(0),
            wishlistRepositoryProvider.overrideWithValue(FakeWishlistRepository()),
            notificationUnreadCountProvider.overrideWithValue(0),
          ],
          child: const MaterialApp(
            home: MainShell(
              location: '/home',
              child: Text('Main Content Area'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Wishlist'), findsNothing);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
  });

  group('ProductDetailPage Feature Flag Gating Tests', () {
    testWidgets('hides reviews and wishlist when corresponding feature flags are disabled',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          features: AppConfigEntity.defaultConfig.features.copyWith(
            wishlist: false,
            reviews: false,
            recommendations: false,
          ),
        ),
      );

      const testProduct = ProductEntity(
        id: 'prod-test-1',
        productName: 'Config Test Watch',
        price: 199.99,
        productImage: '',
        description: 'A stylish test watch for remote config verification.',
        stock: 10,
        sellerName: 'Shoppy Store',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appConfigRepositoryProvider.overrideWithValue(fakeRepo),
            cartItemCountProvider.overrideWithValue(0),
            wishlistRepositoryProvider.overrideWithValue(FakeWishlistRepository()),
            productDetailProvider.overrideWith((ref, id) => testProduct),
            productReviewsProvider('prod-test-1').overrideWith(
              (ref) => ProductReviewsResult(
                reviews: [],
                summary: ReviewSummaryModel(averageRating: 0, totalReviews: 0, ratingDistribution: {}),
              ),
            ),
            frequentlyBoughtTogetherProvider('prod-test-1').overrideWith(
              (ref) => RecommendationResponseModel(
                recommendationType: 'FBT',
                reason: 'None',
                count: 0,
                items: [],
              ),
            ),
          ],
          child: const MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Config Test Watch'), findsNWidgets(2));
      // Wishlist icon should NOT be in the AppBar actions
      expect(
        find.byWidgetPredicate(
          (w) => w is AppIcon && (w.assetPath == AppIcons.wishlist || w.assetPath == AppIcons.wishlistFilled),
        ),
        findsNothing,
      );
      // Customer Reviews section should NOT be rendered
      expect(find.text('Customer Reviews'), findsNothing);
      expect(find.text('Frequently Bought Together'), findsNothing);
    });
  });

  group('HomePage Server-Driven Dynamic Sections Tests', () {
    testWidgets('renders Offers banner and orders sections dynamically',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final fakeRepo = FakeAppConfigRepository(
        initialConfig: AppConfigEntity.defaultConfig.copyWith(
          features: AppConfigEntity.defaultConfig.features.copyWith(
            coupons: true,
            notifications: false,
          ),
          ui: const UiConfigEntity(
            homeSections: [
              HomeSectionEntity(id: 'offers', name: 'Flash Deals & Offers', enabled: true, order: 10),
              HomeSectionEntity(id: 'categories', name: 'Shop By Category', enabled: true, order: 20),
            ],
            showOffers: true,
            showRecommendations: false,
          ),
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appConfigRepositoryProvider.overrideWithValue(fakeRepo),
            cartItemCountProvider.overrideWithValue(0),
            wishlistRepositoryProvider.overrideWithValue(FakeWishlistRepository()),
            notificationUnreadCountProvider.overrideWithValue(0),
          ],
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Offers banner should be rendered
      expect(find.text('Flash Deals & Offers'), findsOneWidget);
      expect(find.text('Shop By Category'), findsOneWidget);
      // Notifications AppBar icon should NOT be present when notifications flag is false
      expect(
        find.byWidgetPredicate(
          (w) => w is AppIcon && w.assetPath == AppIcons.notifications,
        ),
        findsNothing,
      );
    });
  });
}
