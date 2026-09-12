import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/features/coupons/data/models/coupon_model.dart';
import 'package:shopp_app/features/coupons/data/mappers/coupon_mappers.dart';
import 'package:shopp_app/features/coupons/presentation/widgets/coupon_card.dart';
import 'package:shopp_app/features/cart/data/models/cart_model.dart';
import 'package:shopp_app/features/cart/data/mappers/cart_mappers.dart';
import 'package:shopp_app/features/cart/domain/entities/cart_entity.dart';
import 'package:shopp_app/features/cart/presentation/widgets/coupon_section.dart';

void main() {
  group('Coupon Models & Mappers Tests', () {
    test('CouponModel parses from JSON accurately', () {
      final json = {
        'code': 'welcome10',
        'name': 'Welcome 10% Off',
        'description': 'Save 10% on your first order',
        'discountType': 'PERCENTAGE',
        'discountValue': 10,
        'minimumOrderValue': 499,
        'maximumDiscountAmount': 250,
        'isActive': true,
        'firstOrderOnly': true,
      };

      final model = CouponModel.fromJson(json);
      expect(model.code, 'WELCOME10');
      expect(model.name, 'Welcome 10% Off');
      expect(model.discountType, 'PERCENTAGE');
      expect(model.discountValue, 10.0);
      expect(model.minimumOrderValue, 499.0);
      expect(model.maximumDiscountAmount, 250.0);
      expect(model.firstOrderOnly, isTrue);

      final entity = model.toEntity();
      expect(entity.code, 'WELCOME10');
      expect(entity.minimumOrderValue, 499.0);
      expect(entity.firstOrderOnly, isTrue);

      final backToModel = entity.toModel();
      expect(backToModel.code, 'WELCOME10');
    });

    test('AppliedCouponModel parses from JSON and maps to Entity', () {
      final json = {
        'code': 'FLAT500',
        'name': 'Flat ₹500 Off',
        'description': 'Flat ₹500 discount',
        'discountType': 'FIXED',
        'discountValue': 500,
        'discountAmount': 500,
      };

      final model = AppliedCouponModel.fromJson(json);
      expect(model.code, 'FLAT500');
      expect(model.discountAmount, 500.0);

      final entity = model.toEntity();
      expect(entity.code, 'FLAT500');
      expect(entity.discountAmount, 500.0);
    });

    test('CartModel parses coupon and discount fields from backend response', () {
      final json = {
        'id': 'cart_123',
        'items': [
          {
            'id': 'item_1',
            'productId': 'prod_1',
            'productName': 'Smart Watch',
            'sellerName': 'Seller',
            'price': 2999.0,
            'quantity': 1,
            'stock': 10,
            'lineTotal': 2999.0,
          }
        ],
        'itemCount': 1,
        'subtotal': 2999.0,
        'shipping': 0.0,
        'tax': 457.47,
        'total': 2499.0,
        'discount': 500.0,
        'taxableAmount': 2117.80,
        'couponCode': 'FLAT500',
        'appliedCoupon': {
          'code': 'FLAT500',
          'discountType': 'FIXED',
          'discountValue': 500,
          'discountAmount': 500,
        },
      };

      final model = CartModel.fromJson(json);
      expect(model.discount, 500.0);
      expect(model.couponCode, 'FLAT500');
      expect(model.appliedCoupon, isNotNull);
      expect(model.appliedCoupon!.discountAmount, 500.0);
      expect(model.total, 2499.0);

      final entity = model.toEntity();
      expect(entity.discount, 500.0);
      expect(entity.couponCode, 'FLAT500');
      expect(entity.appliedCoupon?.discountAmount, 500.0);
    });
  });

  group('Coupon Widget Tests', () {
    testWidgets('CouponCard renders coupon code and discount label', (tester) async {
      const couponModel = CouponModel(
        code: 'FESTIVE20',
        name: 'Festive 20% Off',
        description: 'Get 20% off up to ₹1,000',
        discountType: 'PERCENTAGE',
        discountValue: 20,
        minimumOrderValue: 999,
        maximumDiscountAmount: 1000,
      );
      final coupon = couponModel.toEntity();

      bool applied = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CouponCard(
              coupon: coupon,
              isApplied: false,
              onApply: () => applied = true,
            ),
          ),
        ),
      );

      expect(find.text('FESTIVE20'), findsOneWidget);
      expect(find.text('20% OFF'), findsOneWidget);
      expect(find.text('Get 20% off up to ₹1,000'), findsOneWidget);
      expect(find.text('APPLY'), findsOneWidget);

      await tester.tap(find.text('APPLY'));
      await tester.pump();
      expect(applied, isTrue);
    });

    testWidgets('CouponSection renders input view when no coupon applied', (tester) async {
      const emptyCart = CartEntity(
        id: 'cart_1',
        items: [],
        subtotal: 1000,
        total: 1000,
      );

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CouponSection(cart: emptyCart),
            ),
          ),
        ),
      );

      expect(find.text('Apply Coupon'), findsOneWidget);
      expect(find.text('APPLY'), findsOneWidget);
      expect(find.text('View Available Offers'), findsOneWidget);
    });

    testWidgets('CouponSection renders applied view with savings when coupon applied', (tester) async {
      const appliedCart = CartEntity(
        id: 'cart_1',
        items: [],
        subtotal: 2000,
        discount: 200,
        couponCode: 'WELCOME10',
        total: 1800,
      );

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CouponSection(cart: appliedCart),
            ),
          ),
        ),
      );

      expect(find.text('WELCOME10'), findsOneWidget);
      expect(find.text('Applied'), findsOneWidget);
      expect(find.text('Remove'), findsOneWidget);
      expect(find.textContaining('You save ₹200 on this order!'), findsOneWidget);
    });
  });
}
