import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/flash_sales/data/models/flash_sale_model.dart';
import 'package:shopp_app/features/flash_sales/data/mappers/flash_sale_mappers.dart';
import 'package:shopp_app/features/flash_sales/domain/entities/flash_sale_entity.dart';
import 'package:shopp_app/features/flash_sales/domain/repositories/flash_sale_repository.dart';
import 'package:shopp_app/features/flash_sales/domain/usecases/get_active_flash_sales_usecase.dart';
import 'package:shopp_app/features/flash_sales/domain/usecases/get_product_flash_sale_usecase.dart';
import 'package:shopp_app/features/flash_sales/presentation/providers/flash_sale_providers.dart';
import 'package:shopp_app/features/flash_sales/presentation/widgets/flash_sale_card.dart';
import 'package:shopp_app/features/flash_sales/presentation/widgets/flash_sale_countdown_timer.dart';
import 'package:shopp_app/features/flash_sales/presentation/widgets/flash_sale_section.dart';
import 'package:shopp_app/features/flash_sales/presentation/widgets/product_detail_flash_sale_badge.dart';

class FakeFlashSaleRepository implements FlashSaleRepository {
  final List<FlashSaleEntity> activeSales;
  final Map<String, FlashSaleItemEntity?> productPromos;

  FakeFlashSaleRepository({
    this.activeSales = const [],
    this.productPromos = const {},
  });

  @override
  Future<Result<List<FlashSaleEntity>>> getActiveFlashSales({int limit = 10}) async {
    return Success(activeSales);
  }

  @override
  Future<Result<List<FlashSaleEntity>>> getUpcomingFlashSales({int limit = 10}) async {
    return const Success([]);
  }

  @override
  Future<Result<FlashSaleEntity>> getFlashSaleById(String id) async {
    final sale = activeSales.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Not found'),
    );
    return Success(sale);
  }

  @override
  Future<Result<FlashSaleItemEntity?>> getProductFlashSale(String productId) async {
    return Success(productPromos[productId]);
  }
}

void main() {
  group('Flash Sale Models & Mappers Tests', () {
    test('FlashSaleModel & FlashSaleItemModel parse from JSON accurately', () {
      final json = {
        '_id': 'fs_001',
        'name': 'midnight-madness',
        'title': 'Midnight Madness Lightning Deals',
        'description': 'Up to 70% off for 2 hours only',
        'saleType': 'LIGHTNING_DEAL',
        'bannerImage': 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da',
        'startAt': '2026-09-13T00:00:00.000Z',
        'endAt': '2026-09-13T04:00:00.000Z',
        'isActive': true,
        'priority': 100,
        'itemCount': 1,
        'items': [
          {
            '_id': 'item_001',
            'productId': 'prod_boat_450',
            'productName': 'boAt Rockerz 450 Bluetooth Headphones',
            'productImage': 'https://example.com/boat.png',
            'sellerName': 'Imagine Marketing',
            'regularPrice': 1999.0,
            'salePrice': 999.0,
            'mrp': 3990.0,
            'discountType': 'FIXED_PRICE',
            'discountValue': 1000.0,
            'discountPercentage': 50,
            'maximumQuantityPerOrder': 2,
            'stockAllocated': 50,
            'stockSold': 10,
            'remainingStock': 40,
            'isSoldOut': false,
          }
        ],
      };

      final model = FlashSaleModel.fromJson(json);
      expect(model.id, 'fs_001');
      expect(model.name, 'midnight-madness');
      expect(model.title, 'Midnight Madness Lightning Deals');
      expect(model.saleType, 'LIGHTNING_DEAL');
      expect(model.priority, 100);
      expect(model.items.length, 1);

      final item = model.items.first;
      expect(item.id, 'item_001');
      expect(item.productId, 'prod_boat_450');
      expect(item.regularPrice, 1999.0);
      expect(item.salePrice, 999.0);
      expect(item.mrp, 3990.0);
      expect(item.discountPercentage, 50);
      expect(item.maximumQuantityPerOrder, 2);
      expect(item.stockAllocated, 50);
      expect(item.stockSold, 10);
      expect(item.remainingStock, 40);
      expect(item.isSoldOut, isFalse);

      final entity = model.toEntity();
      expect(entity.id, 'fs_001');
      expect(entity.items.first.productName, 'boAt Rockerz 450 Bluetooth Headphones');

      final backToModel = entity.toModel();
      expect(backToModel.id, 'fs_001');
      expect(backToModel.items.first.salePrice, 999.0);
    });

    test('FlashSaleItemModel computes discount percentage and sold out correctly', () {
      final json = {
        'productId': 'prod_auto_calc',
        'productName': 'Smart Watch',
        'regularPrice': 2000.0,
        'salePrice': 1500.0,
        'stockAllocated': 10,
        'stockSold': 10,
      };

      final model = FlashSaleItemModel.fromJson(json);
      // Auto-calculated discount: ((2000 - 1500) / 2000) * 100 = 25%
      expect(model.discountPercentage, 25);
      // Sold out because stockSold >= stockAllocated
      expect(model.isSoldOut, isTrue);
      expect(model.remainingStock, 0);
    });
  });

  group('Flash Sale Use Cases & Repository Tests', () {
    test('GetActiveFlashSalesUseCase retrieves active flash sales successfully', () async {
      final mockSale = FlashSaleEntity(
        id: 'fs_active_1',
        name: 'test-sale',
        title: 'Super Flash Sale',
        startAt: DateTime.now().subtract(const Duration(hours: 1)),
        endAt: DateTime.now().add(const Duration(hours: 2)),
      );

      final repo = FakeFlashSaleRepository(activeSales: [mockSale]);
      final useCase = GetActiveFlashSalesUseCase(repo);

      final result = await useCase(limit: 5);
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull?.length, 1);
      expect(result.dataOrNull?.first.title, 'Super Flash Sale');
    });

    test('GetProductFlashSaleUseCase retrieves product promo details successfully', () async {
      const mockPromo = FlashSaleItemEntity(
        id: 'promo_item_1',
        productId: 'prod_123',
        productName: 'Noise Pulse 2 Buzz',
        regularPrice: 2499.0,
        salePrice: 1299.0,
        discountPercentage: 48,
        maximumQuantityPerOrder: 1,
      );

      final repo = FakeFlashSaleRepository(
        productPromos: {'prod_123': mockPromo},
      );
      final useCase = GetProductFlashSaleUseCase(repo);

      final result = await useCase('prod_123');
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull?.productId, 'prod_123');
      expect(result.dataOrNull?.salePrice, 1299.0);
      expect(result.dataOrNull?.discountPercentage, 48);
    });
  });

  group('Flash Sale Widget Tests', () {
    testWidgets('FlashSaleCountdownTimer displays countdown accurately and triggers onExpired', (tester) async {
      bool expiredCalled = false;
      final futureEndTime = DateTime.now().add(const Duration(seconds: 1));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FlashSaleCountdownTimer(
              endTime: futureEndTime,
              onExpired: () {
                expiredCalled = true;
              },
            ),
          ),
        ),
      );

      // Verify timer is rendered
      expect(find.byType(FlashSaleCountdownTimer), findsOneWidget);

      // Fast forward past the timer duration
      await tester.pump(const Duration(seconds: 2));
      expect(expiredCalled, isTrue);
      expect(find.text('Sale Ended'), findsOneWidget);
    });

    testWidgets('FlashSaleCard renders sale price, strike-through regular price, and stock progress', (tester) async {
      const item = FlashSaleItemEntity(
        id: 'item_card_test',
        productId: 'p_test',
        productName: 'Wireless Earbuds Pro',
        sellerName: 'AudioTech Store',
        regularPrice: 2999.0,
        salePrice: 1499.0,
        mrp: 4999.0,
        discountPercentage: 50,
        stockAllocated: 100,
        stockSold: 60,
        remainingStock: 40,
        maximumQuantityPerOrder: 2,
      );

      bool cardTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              height: 320,
              child: FlashSaleCard(
                item: item,
                onTap: () {
                  cardTapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Wireless Earbuds Pro'), findsOneWidget);
      expect(find.text('50% OFF'), findsOneWidget);
      expect(find.text('60% claimed'), findsOneWidget);

      // Tap card
      await tester.tap(find.byType(FlashSaleCard));
      await tester.pump();
      expect(cardTapped, isTrue);
    });

    testWidgets('FlashSaleSection renders nothing when active sales list is empty', (tester) async {
      final container = ProviderContainer(
        overrides: [
          activeFlashSalesProvider.overrideWith((ref) async => []),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: FlashSaleSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('FLASH SALE'), findsNothing);
    });

    testWidgets('FlashSaleSection renders title, countdown timer, and items when active sales exist', (tester) async {
      final mockSale = FlashSaleEntity(
        id: 'fs_live',
        name: 'lightning-deals',
        title: 'Lightning Deals',
        startAt: DateTime.now().subtract(const Duration(hours: 1)),
        endAt: DateTime.now().add(const Duration(hours: 3)),
        items: const [
          FlashSaleItemEntity(
            id: 'item_1',
            productId: 'p1',
            productName: 'boAt Headset',
            regularPrice: 1999.0,
            salePrice: 899.0,
            discountPercentage: 55,
            stockAllocated: 50,
            stockSold: 20,
            remainingStock: 30,
          ),
        ],
      );

      final container = ProviderContainer(
        overrides: [
          activeFlashSalesProvider.overrideWith((ref) async => [mockSale]),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: FlashSaleSection(),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('FLASH SALE'), findsOneWidget);
      expect(find.text('LIVE'), findsOneWidget);
      expect(find.text('Lightning Deals'), findsOneWidget);
      expect(find.text('boAt Headset'), findsOneWidget);
    });

    testWidgets('ProductDetailFlashSaleBadge renders discount tag and order limit', (tester) async {
      final promo = FlashSaleItemEntity(
        id: 'promo_detail_item',
        productId: 'prod_99',
        productName: 'Fast Charger 65W',
        regularPrice: 1999.0,
        salePrice: 999.0,
        discountPercentage: 50,
        maximumQuantityPerOrder: 2,
        endAt: DateTime.now().add(const Duration(hours: 2)),
      );

      final container = ProviderContainer(
        overrides: [
          productFlashSaleProvider('prod_99').overrideWith((ref) async => promo),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: ProductDetailFlashSaleBadge(productId: 'prod_99'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('FLASH SALE DEAL'), findsOneWidget);
      expect(find.text('50% OFF'), findsOneWidget);
      expect(find.text('Limited to 2 unit(s) per order'), findsOneWidget);
    });
  });
}
