import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/features/invoices/data/mappers/invoice_mappers.dart';
import 'package:shopp_app/features/invoices/data/models/invoice_model.dart';
import 'package:shopp_app/features/invoices/presentation/providers/invoice_providers.dart';
import 'package:shopp_app/features/invoices/presentation/screens/invoice_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final intraStateJson = {
    'orderId': 'ord_intra_001',
    'orderNumber': 'SHP-2026-0001',
    'invoiceNumber': 'INV-2026-000001',
    'invoiceDate': '2026-09-13T10:00:00.000Z',
    'invoiceStatus': 'ISSUED',
    'seller': {
      'legalName': 'Shoppy Commerce India Private Limited',
      'tradeName': 'Shoppy India',
      'address': {
        'addressLine1': 'Embassy Tech Village, Outer Ring Road',
        'addressLine2': 'Devarabisanahalli',
        'city': 'Bengaluru',
        'state': 'Karnataka',
        'stateCode': '29',
        'postalCode': '560103',
        'country': 'India',
      },
      'gstin': '29ABCDE1234F1Z5',
      'pan': 'ABCDE1234F',
      'cin': 'U72900KA2026PTC123456',
      'phone': '+91 80 1234 5678',
      'email': 'support@shoppy.in',
    },
    'billingAddress': {
      'fullName': 'Ronak Jeengar',
      'addressLine1': 'Indiranagar 100ft Road',
      'addressLine2': 'HAL 2nd Stage',
      'city': 'Bengaluru',
      'state': 'Karnataka',
      'stateCode': '29',
      'postalCode': '560038',
      'country': 'India',
      'phone': '+91 9876543210',
    },
    'shippingAddress': {
      'fullName': 'Ronak Jeengar',
      'addressLine1': 'Indiranagar 100ft Road',
      'addressLine2': 'HAL 2nd Stage',
      'city': 'Bengaluru',
      'state': 'Karnataka',
      'stateCode': '29',
      'postalCode': '560038',
      'country': 'India',
      'phone': '+91 9876543210',
    },
    'items': [
      {
        'productId': 'prod_001',
        'productName': 'Wireless Noise Cancelling Headphones',
        'sku': 'TECH-NC-001',
        'hsnCode': '85183000',
        'quantity': 1,
        'unitPrice': 5000.0,
        'mrp': 6999.0,
        'discount': 500.0,
        'effectiveAmount': 4500.0,
        'taxableAmount': 3813.56,
        'gstRate': 18.0,
        'cgstRate': 9.0,
        'cgst': 343.22,
        'sgstRate': 9.0,
        'sgst': 343.22,
        'igstRate': 0.0,
        'igst': 0.0,
        'totalTax': 686.44,
        'lineTotal': 4500.0,
      }
    ],
    'taxSummary': [
      {
        'hsnCode': '85183000',
        'gstRate': 18.0,
        'taxableAmount': 3813.56,
        'cgst': 343.22,
        'sgst': 343.22,
        'igst': 0.0,
        'totalTax': 686.44,
      }
    ],
    'shipping': {
      'method': 'STANDARD',
      'methodName': 'Standard Delivery',
      'shippingAmount': 50.0,
      'shippingZone': 'LOCAL',
      'destinationPinCode': '560038',
      'isFreeShipping': false,
    },
    'cod': {
      'isCod': true,
      'fee': 40.0,
    },
    'payment': {
      'method': 'COD',
      'status': 'PENDING',
      'transactionId': '',
      'provider': 'COD',
    },
    'totals': {
      'subtotal': 5000.0,
      'discount': 500.0,
      'taxableAmount': 3889.83,
      'cgst': 350.09,
      'sgst': 350.08,
      'igst': 0.0,
      'totalTax': 700.17,
      'shippingFee': 50.0,
      'codFee': 40.0,
      'grandTotal': 4590.0,
      'amountInWords': 'Four Thousand Five Hundred Ninety Rupees Only',
    },
    'isInterState': false,
  };

  final interStateJson = {
    'orderId': 'ord_inter_002',
    'orderNumber': 'SHP-2026-0002',
    'invoiceNumber': 'INV-2026-000002',
    'invoiceDate': '2026-09-13T11:00:00.000Z',
    'invoiceStatus': 'ISSUED',
    'seller': {
      'legalName': 'Shoppy Commerce India Private Limited',
      'tradeName': 'Shoppy India',
      'address': {
        'addressLine1': 'Embassy Tech Village',
        'city': 'Bengaluru',
        'state': 'Karnataka',
        'stateCode': '29',
        'postalCode': '560103',
        'country': 'India',
      },
      'gstin': '29ABCDE1234F1Z5',
    },
    'billingAddress': {
      'fullName': 'Aarav Patel',
      'addressLine1': 'Nariman Point',
      'city': 'Mumbai',
      'state': 'Maharashtra',
      'stateCode': '27',
      'postalCode': '400021',
      'country': 'India',
      'phone': '+91 9988776655',
    },
    'shippingAddress': {
      'fullName': 'Aarav Patel',
      'addressLine1': 'Nariman Point',
      'city': 'Mumbai',
      'state': 'Maharashtra',
      'stateCode': '27',
      'postalCode': '400021',
      'country': 'India',
      'phone': '+91 9988776655',
    },
    'items': [
      {
        'productId': 'prod_002',
        'productName': 'Organic Green Tea Pack',
        'sku': 'GROC-TEA-002',
        'hsnCode': '09021020',
        'quantity': 2,
        'unitPrice': 300.0,
        'mrp': 400.0,
        'discount': 0.0,
        'effectiveAmount': 600.0,
        'taxableAmount': 571.42,
        'gstRate': 5.0,
        'cgstRate': 0.0,
        'cgst': 0.0,
        'sgstRate': 0.0,
        'sgst': 0.0,
        'igstRate': 5.0,
        'igst': 28.58,
        'totalTax': 28.58,
        'lineTotal': 600.0,
      }
    ],
    'taxSummary': [
      {
        'hsnCode': '09021020',
        'gstRate': 5.0,
        'taxableAmount': 571.42,
        'cgst': 0.0,
        'sgst': 0.0,
        'igst': 28.58,
        'totalTax': 28.58,
      }
    ],
    'shipping': {
      'method': 'EXPRESS',
      'methodName': 'Express Delivery',
      'shippingAmount': 100.0,
      'shippingZone': 'NATIONAL',
      'destinationPinCode': '400021',
      'isFreeShipping': false,
    },
    'cod': {
      'isCod': false,
      'fee': 0.0,
    },
    'payment': {
      'method': 'PREPAID',
      'status': 'PAID',
      'transactionId': 'pay_razorpay_998877',
      'provider': 'RAZORPAY',
    },
    'totals': {
      'subtotal': 600.0,
      'discount': 0.0,
      'taxableAmount': 656.17,
      'cgst': 0.0,
      'sgst': 0.0,
      'igst': 43.83,
      'totalTax': 43.83,
      'shippingFee': 100.0,
      'codFee': 0.0,
      'grandTotal': 700.0,
      'amountInWords': 'Seven Hundred Rupees Only',
    },
    'isInterState': true,
  };

  group('Feature 7: Invoice Models, Entities & Mappers', () {
    test('Intra-state InvoiceModel deserialization and mapping to InvoiceEntity', () {
      final model = InvoiceModel.fromJson(intraStateJson);
      expect(model.invoiceNumber, 'INV-2026-000001');
      expect(model.orderNumber, 'SHP-2026-0001');
      expect(model.invoiceStatus, 'ISSUED');
      expect(model.seller.tradeName, 'Shoppy India');
      expect(model.seller.gstin, '29ABCDE1234F1Z5');
      expect(model.billingAddress.state, 'Karnataka');
      expect(model.items.length, 1);
      expect(model.items.first.sku, 'TECH-NC-001');
      expect(model.items.first.hsnCode, '85183000');
      expect(model.items.first.cgst, 343.22);
      expect(model.items.first.sgst, 343.22);
      expect(model.items.first.igst, 0.0);
      expect(model.cod.isCod, isTrue);
      expect(model.cod.fee, 40.0);
      expect(model.totals.cgst, 350.09);
      expect(model.totals.sgst, 350.08);
      expect(model.totals.igst, 0.0);
      expect(model.totals.grandTotal, 4590.0);

      final entity = model.toEntity();
      expect(entity.invoiceNumber, 'INV-2026-000001');
      expect(entity.isIssued, isTrue);
      expect(entity.isCancelled, isFalse);
      expect(entity.isCod, isTrue);
      expect(entity.isInterState, isFalse);
      expect(entity.totals.amountInWords, 'Four Thousand Five Hundred Ninety Rupees Only');
    });

    test('Inter-state InvoiceModel maps to IGST with isInterState true', () {
      final model = InvoiceModel.fromJson(interStateJson);
      expect(model.invoiceNumber, 'INV-2026-000002');
      expect(model.items.first.cgst, 0.0);
      expect(model.items.first.sgst, 0.0);
      expect(model.items.first.igst, 28.58);
      expect(model.totals.cgst, 0.0);
      expect(model.totals.sgst, 0.0);
      expect(model.totals.igst, 43.83);
      expect(model.totals.grandTotal, 700.0);

      final entity = model.toEntity();
      expect(entity.isInterState, isTrue);
      expect(entity.isCod, isFalse);
      expect(entity.totals.igst, 43.83);
    });

    test('Cancelled invoice status marks isCancelled as true', () {
      final cancelledJson = Map<String, dynamic>.from(intraStateJson);
      cancelledJson['invoiceStatus'] = 'CANCELLED';

      final model = InvoiceModel.fromJson(cancelledJson);
      final entity = model.toEntity();
      expect(entity.isCancelled, isTrue);
      expect(entity.isIssued, isFalse);
    });
  });

  group('Feature 7: InvoicePage UI Integration', () {
    testWidgets('Renders complete Tax Invoice view with loaded intra-state entity', (tester) async {
      tester.view.physicalSize = const Size(800, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final entity = InvoiceModel.fromJson(intraStateJson).toEntity();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            orderInvoiceProvider('ord_intra_001').overrideWith(
              (ref) => Future.value(entity),
            ),
          ],
          child: const MaterialApp(
            home: InvoicePage(orderId: 'ord_intra_001'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Header card
      expect(find.text('TAX INVOICE'), findsWidgets);
      expect(find.text('INV-2026-000001'), findsOneWidget);
      expect(find.text('ISSUED'), findsOneWidget);

      // Seller details
      expect(find.textContaining('Shoppy India'), findsOneWidget);
      expect(find.text('Seller GSTIN:'), findsOneWidget);
      expect(find.text('29ABCDE1234F1Z5'), findsOneWidget);

      // Customer address
      expect(find.text('Ronak Jeengar'), findsWidgets);
      expect(find.textContaining('Indiranagar'), findsWidgets);

      // Items table
      expect(find.text('Wireless Noise Cancelling Headphones'), findsOneWidget);
      expect(find.textContaining('85183000'), findsWidgets);

      // Payment and Delivery card
      expect(find.text('PAYMENT & DELIVERY'), findsOneWidget);
      expect(find.text('Cash on Delivery'), findsOneWidget);

      // Totals card
      expect(find.text('ORDER TOTALS'), findsOneWidget);
      expect(find.text('Four Thousand Five Hundred Ninety Rupees Only'), findsOneWidget);
      expect(find.text('CGST:'), findsWidgets);
      expect(find.text('SGST:'), findsWidgets);
    });

    testWidgets('Renders error state with retry button when invoice fetch fails', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            orderInvoiceProvider('ord_fail_001').overrideWith(
              (ref) => Future.error(Exception('Invoice not found or unauthorized')),
            ),
          ],
          child: const MaterialApp(
            home: InvoicePage(orderId: 'ord_fail_001'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Failed to load tax invoice'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}
