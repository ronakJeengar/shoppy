import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/domain/models/ui_state.dart';
import 'package:shopp_app/views/widgets/app_network_image.dart';
import 'package:shopp_app/views/widgets/order_timeline.dart';

void main() {
  group('UiState Freezed Model Tests', () {
    test('initial state flags and dataOrNull', () {
      const state = UiState<String>.initial();
      expect(state.isInitial, isTrue);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.dataOrNull, isNull);
    });

    test('loading state flags and dataOrNull', () {
      const state = UiState<String>.loading();
      expect(state.isLoading, isTrue);
      expect(state.isInitial, isFalse);
      expect(state.dataOrNull, isNull);
    });

    test('success state flags and data access', () {
      const state = UiState<String>.success('hello shoppy');
      expect(state.isSuccess, isTrue);
      expect(state.isLoading, isFalse);
      expect(state.dataOrNull, equals('hello shoppy'));
      state.whenOrNull(
        success: (data) => expect(data, 'hello shoppy'),
      );
    });

    test('empty state flags and message', () {
      const state = UiState<String>.empty('Nothing here');
      expect(state.isEmpty, isTrue);
      expect(state.dataOrNull, isNull);
      state.whenOrNull(
        empty: (msg) => expect(msg, 'Nothing here'),
      );
    });

    test('error state flags and code', () {
      const state = UiState<String>.error('Server timeout', code: 504);
      expect(state.isError, isTrue);
      expect(state.dataOrNull, isNull);
      state.whenOrNull(
        error: (msg, code) {
          expect(msg, 'Server timeout');
          expect(code, 504);
        },
      );
    });
  });

  group('OrderTimeline Widget Tests', () {
    testWidgets('renders active order progress steps and tracking information',
        (WidgetTester tester) async {
      final order = OrderModel(
        id: 'ord_123',
        orderNumber: 'ORD-98765',
        orderItems: [],
        subtotal: 100.0,
        shippingFee: 10.0,
        tax: 5.0,
        totalAmount: 115.0,
        status: 'SHIPPED',
        carrier: 'FedEx Express',
        trackingNumber: 'FX123456789',
        createdAt: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: OrderTimeline(order: order),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Order Progress'), findsOneWidget);
      expect(find.text('SHIPPED'), findsOneWidget);
      expect(find.text('Order Placed'), findsOneWidget);
      expect(find.text('Processing'), findsOneWidget);
      expect(find.text('Shipped'), findsOneWidget);
      expect(find.text('Delivered'), findsOneWidget);
      expect(find.textContaining('FedEx Express: FX123456789'), findsOneWidget);
    });

    testWidgets('renders cancelled order banner with reason',
        (WidgetTester tester) async {
      final order = OrderModel(
        id: 'ord_cancelled',
        orderNumber: 'ORD-00000',
        orderItems: [],
        subtotal: 50.0,
        shippingFee: 0.0,
        tax: 0.0,
        totalAmount: 50.0,
        status: 'CANCELLED',
        cancellationReason: 'Customer requested change of address',
        createdAt: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: OrderTimeline(order: order),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Order Cancelled'), findsOneWidget);
      expect(find.text('CANCELLED'), findsOneWidget);
      expect(find.textContaining('Reason: Customer requested change of address'),
          findsOneWidget);
    });
  });

  group('AppNetworkImage Widget Tests', () {
    testWidgets('renders placeholder icon when imageUrl is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppNetworkImage(
              imageUrl: '',
              width: 100,
              height: 100,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.inventory_2_outlined), findsOneWidget);
    });
  });

  group('ProviderScope Integration Test', () {
    testWidgets('ProviderScope injects Riverpod dependencies into widget tree',
        (WidgetTester tester) async {
      final testProvider = Provider<String>((ref) => 'Shoppy Riverpod Active');

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Consumer(
              builder: (context, ref, _) {
                final text = ref.watch(testProvider);
                return Scaffold(body: Text(text));
              },
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Shoppy Riverpod Active'), findsOneWidget);
    });
  });
}
