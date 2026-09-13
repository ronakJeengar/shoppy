import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/errors/failures.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/shipping/data/mappers/shipping_mappers.dart';
import 'package:shopp_app/features/shipping/data/models/shipping_model.dart';
import 'package:shopp_app/features/shipping/domain/entities/shipping_entity.dart';
import 'package:shopp_app/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:shopp_app/features/shipping/domain/usecases/check_serviceability_usecase.dart';
import 'package:shopp_app/features/shipping/domain/usecases/get_shipping_methods_usecase.dart';
import 'package:shopp_app/features/shipping/domain/usecases/get_shipping_quote_usecase.dart';
import 'package:shopp_app/features/shipping/presentation/providers/shipping_providers.dart';
import 'package:shopp_app/features/shipping/presentation/widgets/pin_serviceability_card.dart';

class FakeShippingRepository implements ShippingRepository {
  final Map<String, PinServiceabilityEntity> serviceabilityMap;
  final Map<String, ShippingQuoteEntity> quoteMap;
  final List<AvailableShippingMethodEntity> methods;

  FakeShippingRepository({
    this.serviceabilityMap = const {},
    this.quoteMap = const {},
    this.methods = const [],
  });

  @override
  Future<Result<PinServiceabilityEntity>> checkServiceability(String pinCode) async {
    if (serviceabilityMap.containsKey(pinCode)) {
      return Success(serviceabilityMap[pinCode]!);
    }
    return FailureResult(ServerFailure('PIN code $pinCode not found'));
  }

  @override
  Future<Result<ShippingQuoteEntity>> calculateShippingQuote({
    required String pinCode,
    required double subtotal,
    String shippingMethod = 'STANDARD',
  }) async {
    final key = '$pinCode-$shippingMethod';
    if (quoteMap.containsKey(key)) {
      return Success(quoteMap[key]!);
    }
    if (quoteMap.containsKey(pinCode)) {
      return Success(quoteMap[pinCode]!);
    }
    return FailureResult(ServerFailure('Quote not available for PIN $pinCode'));
  }

  @override
  Future<Result<List<AvailableShippingMethodEntity>>> getShippingMethods() async {
    return Success(methods);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final sampleServiceableJson = {
    'serviceable': true,
    'pinCode': '560001',
    'city': 'Bengaluru',
    'district': 'Bengaluru Urban',
    'state': 'Karnataka',
    'stateCode': 'KA',
    'shippingZone': 'LOCAL',
    'codAvailable': true,
    'delivery': {
      'standard': {
        'available': true,
        'minDays': 2,
        'maxDays': 3,
        'formattedWindow': '2–3 business days',
      },
      'express': {
        'available': true,
        'minDays': 1,
        'maxDays': 2,
        'formattedWindow': '1–2 business days',
      },
    },
  };

  final sampleUnserviceableJson = {
    'serviceable': false,
    'pinCode': '999999',
    'city': 'Test Unserviceable',
    'state': 'Test',
    'message': 'Delivery is currently unavailable to PIN code 999999',
  };

  final sampleQuoteJson = {
    'currency': 'INR',
    'currencySymbol': '₹',
    'serviceable': true,
    'pinCode': '560001',
    'city': 'Bengaluru',
    'district': 'Bengaluru Urban',
    'state': 'Karnataka',
    'stateCode': 'KA',
    'shippingZone': 'LOCAL',
    'method': {
      'code': 'STANDARD',
      'name': 'Standard Delivery',
      'minDays': 2,
      'maxDays': 3,
      'formattedWindow': '2–3 business days',
      'baseCharge': 49.0,
    },
    'availableMethods': [
      {
        'code': 'STANDARD',
        'name': 'Standard Delivery',
        'minDays': 2,
        'maxDays': 3,
        'formattedWindow': '2–3 business days',
        'baseCharge': 49.0,
      },
      {
        'code': 'EXPRESS',
        'name': 'Express Delivery',
        'minDays': 1,
        'maxDays': 2,
        'formattedWindow': '1–2 business days',
        'baseCharge': 99.0,
      },
    ],
    'shippingAmount': 0.0,
    'freeShipping': true,
    'freeShippingThreshold': 999.0,
    'amountNeededForFreeShipping': 0.0,
    'deliveryEstimate': {
      'minDays': 2,
      'maxDays': 3,
      'formattedWindow': '2–3 business days',
    },
  };

  group('Shipping Models & Mappers Tests', () {
    test('PinServiceabilityModel parses serviceable JSON accurately', () {
      final model = PinServiceabilityModel.fromJson(sampleServiceableJson);
      expect(model.serviceable, isTrue);
      expect(model.pinCode, '560001');
      expect(model.city, 'Bengaluru');
      expect(model.state, 'Karnataka');
      expect(model.stateCode, 'KA');
      expect(model.shippingZone, 'LOCAL');
      expect(model.codAvailable, isTrue);
      expect(model.delivery?.standard?.available, isTrue);
      expect(model.delivery?.standard?.formattedWindow, '2–3 business days');
      expect(model.delivery?.express?.available, isTrue);
      expect(model.delivery?.express?.formattedWindow, '1–2 business days');

      // Mapper test
      final entity = model.toEntity();
      expect(entity.serviceable, isTrue);
      expect(entity.pinCode, '560001');
      expect(entity.city, 'Bengaluru');
      expect(entity.delivery?.standard?.minDays, 2);

      final backToModel = entity.toModel();
      expect(backToModel.pinCode, model.pinCode);
      expect(backToModel.serviceable, model.serviceable);
    });

    test('PinServiceabilityModel parses unserviceable JSON correctly', () {
      final model = PinServiceabilityModel.fromJson(sampleUnserviceableJson);
      expect(model.serviceable, isFalse);
      expect(model.pinCode, '999999');
      expect(model.message, contains('Delivery is currently unavailable'));

      final entity = model.toEntity();
      expect(entity.serviceable, isFalse);
      expect(entity.message, model.message);
    });

    test('ShippingQuoteModel parses authoritative calculation accurately', () {
      final model = ShippingQuoteModel.fromJson(sampleQuoteJson);
      expect(model.serviceable, isTrue);
      expect(model.freeShipping, isTrue);
      expect(model.shippingAmount, 0.0);
      expect(model.freeShippingThreshold, 999.0);
      expect(model.amountNeededForFreeShipping, 0.0);
      expect(model.availableMethods.length, 2);
      expect(model.selectedMethod?.code, 'STANDARD');
      expect(model.deliveryEstimate?.formattedWindow, '2–3 business days');

      final entity = model.toEntity();
      expect(entity.freeShipping, isTrue);
      expect(entity.shippingAmount, 0.0);
      expect(entity.availableMethods.length, 2);
      expect(entity.toModel().pinCode, '560001');
    });

    test('DeliveryWindowModel builds formatted window when omitted', () {
      final model = DeliveryWindowModel.fromJson({'minDays': 3, 'maxDays': 5});
      expect(model.minDays, 3);
      expect(model.maxDays, 5);
      expect(model.formattedWindow, '3–5 business days');
    });
  });

  group('Shipping Use Cases Tests', () {
    final mockEntity = PinServiceabilityModel.fromJson(sampleServiceableJson).toEntity();
    final mockQuote = ShippingQuoteModel.fromJson(sampleQuoteJson).toEntity();

    final fakeRepo = FakeShippingRepository(
      serviceabilityMap: {'560001': mockEntity},
      quoteMap: {'560001': mockQuote},
      methods: mockQuote.availableMethods,
    );

    test('CheckServiceabilityUseCase returns success for valid PIN', () async {
      final useCase = CheckServiceabilityUseCase(fakeRepo);
      final result = await useCase('560001');
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull?.city, 'Bengaluru');
    });

    test('GetShippingQuoteUseCase returns calculated quote', () async {
      final useCase = GetShippingQuoteUseCase(fakeRepo);
      final result = await useCase(pinCode: '560001', subtotal: 1200.0);
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull?.freeShipping, isTrue);
      expect(result.dataOrNull?.shippingAmount, 0.0);
    });

    test('GetShippingMethodsUseCase returns available shipping methods', () async {
      final useCase = GetShippingMethodsUseCase(fakeRepo);
      final result = await useCase();
      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull?.length, 2);
    });
  });

  group('PinServiceabilityNotifier State & Validation Tests', () {
    final mockEntity = PinServiceabilityModel.fromJson(sampleServiceableJson).toEntity();
    final fakeRepo = FakeShippingRepository(
      serviceabilityMap: {'560001': mockEntity},
    );

    test('Rejects non-6-digit PIN with validation error without network request', () async {
      final container = ProviderContainer(
        overrides: [
          shippingRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(pinServiceabilityNotifierProvider.notifier);
      await notifier.check('5600');

      final state = container.read(pinServiceabilityNotifierProvider);
      expect(state.error, contains('valid 6-digit Indian PIN code'));
      expect(state.result, isNull);
    });

    test('Rejects PIN starting with 0', () async {
      final container = ProviderContainer(
        overrides: [
          shippingRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(pinServiceabilityNotifierProvider.notifier);
      await notifier.check('012345');

      final state = container.read(pinServiceabilityNotifierProvider);
      expect(state.error, contains('cannot start with 0'));
      expect(state.result, isNull);
    });

    test('Successfully checks valid PIN and updates state and selected PIN', () async {
      final container = ProviderContainer(
        overrides: [
          shippingRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(pinServiceabilityNotifierProvider.notifier);
      await notifier.check('560001');

      final state = container.read(pinServiceabilityNotifierProvider);
      expect(state.error, isNull);
      expect(state.result?.serviceable, isTrue);
      expect(state.result?.city, 'Bengaluru');
      expect(container.read(selectedPinCodeProvider), '560001');
    });
  });

  group('PinServiceabilityCard Widget Tests', () {
    final mockEntity = PinServiceabilityModel.fromJson(sampleServiceableJson).toEntity();
    final unserviceableEntity = PinServiceabilityModel.fromJson(sampleUnserviceableJson).toEntity();

    final fakeRepo = FakeShippingRepository(
      serviceabilityMap: {
        '560001': mockEntity,
        '999999': unserviceableEntity,
      },
    );

    Widget createTestApp(Widget child) {
      return ProviderScope(
        overrides: [
          shippingRepositoryProvider.overrideWithValue(fakeRepo),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(child: child),
          ),
        ),
      );
    }

    testWidgets('Renders card header, delivery truck icon, and input field', (tester) async {
      await tester.pumpWidget(createTestApp(const PinServiceabilityCard()));
      await tester.pumpAndSettle();

      expect(find.text('Delivery Serviceability'), findsOneWidget);
      expect(find.text('Check delivery speed & options for your area'), findsOneWidget);
      expect(find.text('Check'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(AppIcon), findsWidgets);
    });

    testWidgets('Entering invalid PIN shows inline error message', (tester) async {
      await tester.pumpWidget(createTestApp(const PinServiceabilityCard()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '1234');
      await tester.tap(find.text('Check'));
      await tester.pumpAndSettle();

      expect(find.textContaining('valid 6-digit Indian PIN code'), findsOneWidget);
    });

    testWidgets('Entering serviceable PIN renders city, state, delivery days, and COD status', (tester) async {
      await tester.pumpWidget(createTestApp(const PinServiceabilityCard()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '560001');
      await tester.tap(find.text('Check'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Delivery available to Bengaluru, Karnataka (560001)'), findsOneWidget);
      expect(find.textContaining('Standard Delivery: 2–3 business days'), findsOneWidget);
      expect(find.textContaining('Express Delivery: 1–2 business days'), findsOneWidget);
      expect(find.textContaining('Cash on Delivery (COD) eligible'), findsOneWidget);
    });

    testWidgets('Entering unserviceable PIN renders clear unavailable notice', (tester) async {
      await tester.pumpWidget(createTestApp(const PinServiceabilityCard()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '999999');
      await tester.tap(find.text('Check'));
      await tester.pumpAndSettle();

      expect(find.text('Service Unavailable to PIN 999999'), findsOneWidget);
      expect(find.textContaining('Delivery is currently unavailable to PIN code 999999'), findsOneWidget);
    });
  });
}
