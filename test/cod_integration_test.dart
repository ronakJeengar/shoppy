import 'package:flutter_test/flutter_test.dart';
import 'package:shopp_app/features/checkout/data/mappers/checkout_mappers.dart';
import 'package:shopp_app/features/checkout/data/models/checkout_validation_model.dart';
import 'package:shopp_app/features/checkout/domain/entities/checkout_entity.dart';
import 'package:shopp_app/features/orders/data/mappers/order_mappers.dart';
import 'package:shopp_app/features/orders/data/models/order_model.dart';
import 'package:shopp_app/features/orders/domain/entities/order_entity.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Feature 6: COD Models & Entities', () {
    test('PaymentMethodOptionModel correctly deserializes and maps to PaymentMethodOptionEntity', () {
      final json = {
        'type': 'COD',
        'name': 'Cash on Delivery',
        'available': true,
        'fee': 40.0,
        'standardFee': 40.0,
        'isFeeFree': false,
        'freeAboveAmount': 1499.0,
        'minOrderValue': 299.0,
        'maxOrderValue': 50000.0,
        'message': 'Pay with cash upon delivery',
      };

      final model = PaymentMethodOptionModel.fromJson(json);
      expect(model.type, 'COD');
      expect(model.name, 'Cash on Delivery');
      expect(model.available, isTrue);
      expect(model.fee, 40.0);
      expect(model.isFeeFree, isFalse);
      expect(model.freeAboveAmount, 1499.0);
      expect(model.minOrderValue, 299.0);
      expect(model.maxOrderValue, 50000.0);

      final entity = model.toEntity();
      expect(entity.type, 'COD');
      expect(entity.name, 'Cash on Delivery');
      expect(entity.available, isTrue);
      expect(entity.fee, 40.0);
      expect(entity.isFeeFree, isFalse);
      expect(entity.freeAboveAmount, 1499.0);
    });

    test('PaymentMethodOptionModel with unavailable status and reasonCode deserializes properly', () {
      final json = {
        'type': 'COD',
        'name': 'Cash on Delivery',
        'available': false,
        'reasonCode': 'COD_LIMIT_EXCEEDED',
        'message': 'Order total ₹55000 exceeds maximum COD limit of ₹50000',
        'fee': 0.0,
      };

      final model = PaymentMethodOptionModel.fromJson(json);
      expect(model.available, isFalse);
      expect(model.reasonCode, 'COD_LIMIT_EXCEEDED');
      expect(model.message, contains('exceeds maximum COD limit'));

      final entity = model.toEntity();
      expect(entity.available, isFalse);
      expect(entity.reasonCode, 'COD_LIMIT_EXCEEDED');
    });

    test('CodDetailsModel correctly deserializes and maps to CodDetailsEntity', () {
      final json = {
        'isCod': true,
        'fee': 40.0,
        'standardFee': 40.0,
        'isFeeFree': false,
        'freeAboveAmount': 1499.0,
        'minOrderValue': 299.0,
        'maxOrderValue': 50000.0,
        'isEligible': true,
        'reasonCode': null,
        'message': null,
      };

      final model = CodDetailsModel.fromJson(json);
      expect(model.isCod, isTrue);
      expect(model.fee, 40.0);
      expect(model.isFeeFree, isFalse);
      expect(model.freeAboveAmount, 1499.0);
      expect(model.isEligible, isTrue);

      final entity = model.toEntity();
      expect(entity.isCod, isTrue);
      expect(entity.fee, 40.0);
      expect(entity.isFeeFree, isFalse);
      expect(entity.isEligible, isTrue);
    });

    test('CheckoutValidationModel parses paymentMethods, codFee, and codDetails accurately', () {
      final json = {
        'valid': true,
        'errors': <String>[],
        'warnings': <String>[],
        'subtotal': 1200.0,
        'discount': 100.0,
        'shippingFee': 49.0,
        'tax': 198.0,
        'codFee': 40.0,
        'grandTotal': 1387.0,
        'codDetails': {
          'isCod': true,
          'fee': 40.0,
          'isFeeFree': false,
          'freeAboveAmount': 1499.0,
          'isEligible': true,
        },
        'paymentMethods': [
          {
            'type': 'COD',
            'name': 'Cash on Delivery',
            'available': true,
            'fee': 40.0,
            'isFeeFree': false,
            'freeAboveAmount': 1499.0,
          },
          {
            'type': 'CARD',
            'name': 'Credit / Debit Card',
            'available': true,
            'fee': 0.0,
          }
        ],
      };

      final model = CheckoutValidationModel.fromJson(json);
      expect(model.valid, isTrue);
      expect(model.codFee, 40.0);
      expect(model.grandTotal, 1387.0);
      expect(model.codDetails?.isEligible, isTrue);
      expect(model.paymentMethods.length, 2);
      expect(model.paymentMethods.first.type, 'COD');
      expect(model.paymentMethods.first.fee, 40.0);

      final entity = model.toEntity();
      expect(entity.valid, isTrue);
      expect(entity.codFee, 40.0);
      expect(entity.grandTotal, 1387.0);
      expect(entity.codDetails?.isEligible, isTrue);
      expect(entity.paymentMethods.length, 2);
      expect(entity.paymentMethods.first.available, isTrue);
    });

    test('OrderModel parses COD fields and computes isCod properly', () {
      final json = {
        'id': 'ord_cod_123',
        'orderNumber': 'SHP-2026-0001',
        'status': 'CONFIRMED',
        'orderItems': [
          {
            'productId': 'p1',
            'productName': 'Test Item',
            'productImage': '',
            'sellerName': 'Shoppy Retail',
            'unitPrice': 499.0,
            'quantity': 1,
            'lineTotal': 499.0,
          }
        ],
        'subtotal': 499.0,
        'discount': 0.0,
        'shippingFee': 49.0,
        'tax': 90.0,
        'codFee': 40.0,
        'totalAmount': 678.0,
        'shippingAddress': {
          'fullName': 'Rahul Sharma',
          'phoneNumber': '9876543210',
          'addressLine1': 'MG Road',
          'city': 'Bengaluru',
          'state': 'Karnataka',
          'postalCode': '560001',
        },
        'payment': {
          'id': 'pay_1',
          'orderId': 'ord_cod_123',
          'transactionId': 'tx_cod_123',
          'paymentMethod': 'COD',
          'status': 'PENDING',
          'provider': 'COD',
          'amount': 678.0,
        },
        'codDetails': {
          'isCod': true,
          'fee': 40.0,
          'isFeeFree': false,
          'freeAboveAmount': 1499.0,
        },
        'createdAt': '2026-09-13T10:00:00.000Z',
      };

      final model = OrderModel.fromJson(json);
      expect(model.id, 'ord_cod_123');
      expect(model.codFee, 40.0);
      expect(model.isCod, isTrue);
      expect(model.payment?.paymentMethod, 'COD');
      expect(model.payment?.status, 'PENDING');
      expect(model.codDetails?['fee'], 40.0);

      final entity = model.toEntity();
      expect(entity.id, 'ord_cod_123');
      expect(entity.codFee, 40.0);
      expect(entity.isCod, isTrue);
      expect(entity.payment?.paymentMethod, 'COD');
      expect(entity.payment?.status, 'PENDING');
      expect(entity.codDetails?['isCod'], isTrue);
    });

    test('OrderModel with non-COD payment reports isCod as false', () {
      final json = {
        'id': 'ord_card_456',
        'orderNumber': 'SHP-2026-0002',
        'status': 'CONFIRMED',
        'orderItems': [],
        'subtotal': 999.0,
        'discount': 0.0,
        'shippingFee': 0.0,
        'tax': 180.0,
        'codFee': 0.0,
        'totalAmount': 1179.0,
        'shippingAddress': {
          'fullName': 'Rahul Sharma',
          'phoneNumber': '9876543210',
          'addressLine1': 'MG Road',
          'city': 'Bengaluru',
          'state': 'Karnataka',
          'postalCode': '560001',
        },
        'payment': {
          'id': 'pay_2',
          'orderId': 'ord_card_456',
          'transactionId': 'tx_card_456',
          'paymentMethod': 'CARD',
          'status': 'AUTHORIZED',
          'provider': 'STRIPE',
          'amount': 1179.0,
        },
        'createdAt': '2026-09-13T10:00:00.000Z',
      };

      final model = OrderModel.fromJson(json);
      expect(model.isCod, isFalse);
      expect(model.codFee, 0.0);

      final entity = model.toEntity();
      expect(entity.isCod, isFalse);
      expect(entity.codFee, 0.0);
    });

    test('Free COD applies when order value crosses free threshold (₹1499)', () {
      final json = {
        'valid': true,
        'errors': <String>[],
        'warnings': <String>[],
        'subtotal': 2000.0,
        'discount': 0.0,
        'shippingFee': 0.0,
        'tax': 360.0,
        'codFee': 0.0,
        'grandTotal': 2360.0,
        'codDetails': {
          'isCod': true,
          'fee': 0.0,
          'isFeeFree': true,
          'freeAboveAmount': 1499.0,
          'isEligible': true,
        },
        'paymentMethods': [
          {
            'type': 'COD',
            'name': 'Cash on Delivery',
            'available': true,
            'fee': 0.0,
            'isFeeFree': true,
            'freeAboveAmount': 1499.0,
          }
        ],
      };

      final model = CheckoutValidationModel.fromJson(json);
      expect(model.codFee, 0.0);
      expect(model.codDetails?.isFeeFree, isTrue);
      expect(model.paymentMethods.first.isFeeFree, isTrue);
      expect(model.paymentMethods.first.fee, 0.0);
    });
  });
}
