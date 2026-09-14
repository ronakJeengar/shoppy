import 'package:flutter_test/flutter_test.dart';
import 'package:shopp_app/features/checkout/domain/entities/payment_entity.dart';
import 'package:shopp_app/features/emi/data/mappers/emi_mappers.dart';
import 'package:shopp_app/features/emi/data/models/emi_plan_model.dart';
import 'package:shopp_app/features/emi/domain/entities/emi_plan_entity.dart';
import 'package:shopp_app/features/emi/presentation/providers/emi_providers.dart';
import 'package:shopp_app/features/orders/data/mappers/order_mappers.dart';
import 'package:shopp_app/features/orders/data/models/order_model.dart';
import 'package:shopp_app/features/orders/domain/entities/order_entity.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Feature 8: EMI Models & Mappers', () {
    test('EmiTenureModel deserializes and maps to EmiTenureEntity correctly', () {
      final json = {
        'tenureId': 'hdfc_3m',
        'months': 3,
        'interestRate': 0.0,
        'isNoCost': true,
        'processingFee': 0.0,
        'processingFeeType': 'FIXED',
        'monthlyInstallment': 3333.33,
        'totalInterest': 0.0,
        'totalRepaid': 10000.0,
        'totalPayable': 10000.0,
      };

      final model = EmiTenureModel.fromJson(json);
      expect(model.tenureId, 'hdfc_3m');
      expect(model.months, 3);
      expect(model.interestRate, 0.0);
      expect(model.isNoCost, isTrue);
      expect(model.monthlyInstallment, 3333.33);

      final entity = model.toEntity();
      expect(entity.tenureId, 'hdfc_3m');
      expect(entity.months, 3);
      expect(entity.interestRate, 0.0);
      expect(entity.isNoCost, isTrue);
      expect(entity.monthlyInstallment, 3333.33);
      expect(entity.totalPayable, 10000.0);
    });

    test('EmiPlanModel deserializes with tenures list and maps to EmiPlanEntity', () {
      final json = {
        '_id': 'plan_hdfc_01',
        'planId': 'hdfc_bank_emi',
        'provider': 'HDFC Bank',
        'providerCode': 'HDFC',
        'providerType': 'BANK',
        'minAmount': 3000.0,
        'maxAmount': 500000.0,
        'isEligible': true,
        'description': 'HDFC Bank Credit Card EMI',
        'termsAndConditions': 'Valid on major credit cards',
        'tenures': [
          {
            'tenureId': 'hdfc_3m',
            'months': 3,
            'interestRate': 0.0,
            'isNoCost': true,
            'processingFee': 0.0,
            'processingFeeType': 'FIXED',
            'monthlyInstallment': 5000.0,
            'totalInterest': 0.0,
            'totalRepaid': 15000.0,
            'totalPayable': 15000.0,
          },
          {
            'tenureId': 'hdfc_6m',
            'months': 6,
            'interestRate': 15.0,
            'isNoCost': false,
            'processingFee': 199.0,
            'processingFeeType': 'FIXED',
            'monthlyInstallment': 2611.0,
            'totalInterest': 666.0,
            'totalRepaid': 15666.0,
            'totalPayable': 15865.0,
          },
        ],
      };

      final model = EmiPlanModel.fromJson(json);
      expect(model.planId, 'hdfc_bank_emi');
      expect(model.provider, 'HDFC Bank');
      expect(model.tenures.length, 2);

      final entity = model.toEntity();
      expect(entity.planId, 'hdfc_bank_emi');
      expect(entity.tenures.length, 2);
      expect(entity.tenures[0].isNoCost, isTrue);
      expect(entity.tenures[1].isNoCost, isFalse);
      expect(entity.tenures[1].interestRate, 15.0);
    });

    test('EmiPlansResponseModel parses full response envelope correctly', () {
      final json = {
        'currency': 'INR',
        'currencySymbol': '₹',
        'amount': 25000.0,
        'eligible': true,
        'minOrderValue': 3000.0,
        'maxOrderValue': 500000.0,
        'plans': [
          {
            '_id': 'plan_icici_01',
            'planId': 'icici_bank_emi',
            'provider': 'ICICI Bank',
            'providerCode': 'ICICI',
            'providerType': 'BANK',
            'minAmount': 3000.0,
            'maxAmount': 500000.0,
            'isEligible': true,
            'tenures': [],
          }
        ],
      };

      final model = EmiPlansResponseModel.fromJson(json);
      expect(model.eligible, isTrue);
      expect(model.amount, 25000.0);
      expect(model.plans.length, 1);

      final entity = model.toEntity();
      expect(entity.eligible, isTrue);
      expect(entity.currency, 'INR');
      expect(entity.plans.first.providerCode, 'ICICI');
    });

    test('EmiPlansResponseModel handles ineligible order value with reasonCode', () {
      final json = {
        'currency': 'INR',
        'currencySymbol': '₹',
        'amount': 1500.0,
        'eligible': false,
        'reasonCode': 'EMI_AMOUNT_TOO_LOW',
        'message': 'Order amount ₹1,500 is below minimum EMI threshold of ₹3,000',
        'minOrderValue': 3000.0,
        'maxOrderValue': 500000.0,
        'plans': [],
      };

      final model = EmiPlansResponseModel.fromJson(json);
      expect(model.eligible, isFalse);
      expect(model.reasonCode, 'EMI_AMOUNT_TOO_LOW');
      expect(model.plans, isEmpty);

      final entity = model.toEntity();
      expect(entity.eligible, isFalse);
      expect(entity.reasonCode, 'EMI_AMOUNT_TOO_LOW');
    });

    test('EmiQuoteModel roundtrip mapping matches entity', () {
      final quoteModel = const EmiQuoteModel(
        planId: 'sbi_bank_emi',
        provider: 'State Bank of India',
        providerCode: 'SBI',
        tenureMonths: 12,
        interestRate: 14.5,
        principal: 20000.0,
        monthlyInstallment: 1800.75,
        totalInterest: 1609.0,
        processingFee: 99.0,
        processingFeeType: 'FIXED',
        totalRepaid: 21609.0,
        totalPayable: 21708.0,
        isNoCost: false,
      );

      final entity = quoteModel.toEntity();
      expect(entity.planId, 'sbi_bank_emi');
      expect(entity.tenureMonths, 12);
      expect(entity.totalPayable, 21708.0);

      final backToModel = entity.toModel();
      expect(backToModel.planId, quoteModel.planId);
      expect(backToModel.monthlyInstallment, quoteModel.monthlyInstallment);
    });

    test('EmiDetailsSnapshotModel mapping to EmiDetailsSnapshotEntity and back', () {
      final snapshotModel = const EmiDetailsSnapshotModel(
        isEmi: true,
        planId: 'hdfc_bank_emi',
        provider: 'HDFC Bank',
        providerCode: 'HDFC',
        tenureMonths: 6,
        interestRate: 0.0,
        processingFee: 0.0,
        processingFeeType: 'FIXED',
        principal: 18000.0,
        monthlyInstallment: 3000.0,
        totalInterest: 0.0,
        totalPayable: 18000.0,
        isNoCost: true,
      );

      final entity = snapshotModel.toEntity();
      expect(entity.isEmi, isTrue);
      expect(entity.isNoCost, isTrue);
      expect(entity.provider, 'HDFC Bank');
      expect(entity.monthlyInstallment, 3000.0);

      final backModel = entity.toModel();
      expect(backModel.planId, snapshotModel.planId);
      expect(backModel.totalPayable, snapshotModel.totalPayable);
    });
  });

  group('Feature 8: SelectedEmiSelection Equality & State', () {
    test('SelectedEmiSelection equality checks planId and tenureMonths', () {
      final plan1 = const EmiPlanEntity(
        id: 'p1',
        planId: 'hdfc_bank_emi',
        provider: 'HDFC Bank',
        providerCode: 'HDFC',
        tenures: [],
      );
      final plan2 = const EmiPlanEntity(
        id: 'p1_alt',
        planId: 'hdfc_bank_emi',
        provider: 'HDFC Bank (Alternate)',
        providerCode: 'HDFC',
        tenures: [],
      );
      final plan3 = const EmiPlanEntity(
        id: 'p2',
        planId: 'icici_bank_emi',
        provider: 'ICICI Bank',
        providerCode: 'ICICI',
        tenures: [],
      );

      final tenure3m = const EmiTenureEntity(
        tenureId: 't3',
        months: 3,
        interestRate: 0.0,
        monthlyInstallment: 1000.0,
        totalInterest: 0.0,
        totalPayable: 3000.0,
      );
      final tenure6m = const EmiTenureEntity(
        tenureId: 't6',
        months: 6,
        interestRate: 14.0,
        monthlyInstallment: 520.0,
        totalInterest: 120.0,
        totalPayable: 3120.0,
      );

      final sel1 = SelectedEmiSelection(plan: plan1, tenure: tenure3m);
      final sel2 = SelectedEmiSelection(plan: plan2, tenure: tenure3m);
      final selDifferentTenure = SelectedEmiSelection(plan: plan1, tenure: tenure6m);
      final selDifferentPlan = SelectedEmiSelection(plan: plan3, tenure: tenure3m);

      expect(sel1, equals(sel2));
      expect(sel1.hashCode, equals(sel2.hashCode));
      expect(sel1, isNot(equals(selDifferentTenure)));
      expect(sel1, isNot(equals(selDifferentPlan)));
    });
  });

  group('Feature 8: OrderEntity EMI Integration', () {
    test('OrderEntity correctly exposes isEmi and isPendingPayment getters', () {
      final emiSnapshot = const EmiDetailsSnapshotEntity(
        isEmi: true,
        planId: 'axis_bank_emi',
        provider: 'Axis Bank',
        providerCode: 'AXIS',
        tenureMonths: 6,
        interestRate: 14.0,
        monthlyInstallment: 2000.0,
        totalInterest: 400.0,
        totalPayable: 12400.0,
      );

      final payment = const PaymentEntity(
        id: 'pay_1',
        orderId: 'ord_emi_101',
        transactionId: 'txn_1',
        provider: 'AXIS',
        paymentMethod: 'EMI',
        amount: 12000.0,
        currency: 'INR',
        status: 'PENDING',
      );

      final order = OrderEntity(
        id: 'ord_emi_101',
        orderNumber: 'SHP-2026-EMI-101',
        shippingAddress: null,
        orderItems: [],
        payment: payment,
        status: 'PENDING_PAYMENT',
        subtotal: 12000.0,
        totalAmount: 12000.0,
        tax: 0.0,
        shippingFee: 0.0,
        discount: 0.0,
        shippingMethod: 'STANDARD',
        createdAt: DateTime.now(),
        emiDetails: emiSnapshot,
      );

      expect(order.isEmi, isTrue);
      expect(order.isCod, isFalse);
      expect(order.isPendingPayment, isTrue);
      expect(order.emiDetails, isNotNull);
      expect(order.emiDetails!.provider, 'Axis Bank');
      expect(order.emiDetails!.tenureMonths, 6);
    });

    test('OrderModel deserializes emiDetails snapshot correctly', () {
      final json = {
        '_id': 'ord_123',
        'orderNumber': 'SHP-2026-00123',
        'items': [],
        'subtotal': 15000.0,
        'discount': 0.0,
        'shippingFee': 0.0,
        'tax': 0.0,
        'totalAmount': 15000.0,
        'shippingMethod': 'STANDARD',
        'status': 'PENDING_PAYMENT',
        'payment': {
          '_id': 'pay_123',
          'orderId': 'ord_123',
          'transactionId': 'txn_123',
          'provider': 'HDFC',
          'paymentMethod': 'EMI',
          'amount': 15000.0,
          'currency': 'INR',
          'status': 'PENDING',
        },
        'emiDetails': {
          'isEmi': true,
          'planId': 'hdfc_bank_emi',
          'provider': 'HDFC Bank',
          'providerCode': 'HDFC',
          'tenureMonths': 3,
          'interestRate': 0.0,
          'processingFee': 0.0,
          'processingFeeType': 'FIXED',
          'principal': 15000.0,
          'monthlyInstallment': 5000.0,
          'totalInterest': 0.0,
          'totalPayable': 15000.0,
          'isNoCost': true,
        },
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };

      final orderModel = OrderModel.fromJson(json);
      expect(orderModel.isEmi, isTrue);
      expect(orderModel.isPendingPayment, isTrue);
      expect(orderModel.emiDetails, isNotNull);
      expect(orderModel.emiDetails!.isEmi, isTrue);
      expect(orderModel.emiDetails!.isNoCost, isTrue);

      final orderEntity = orderModel.toEntity();
      expect(orderEntity.isEmi, isTrue);
      expect(orderEntity.emiDetails!.provider, 'HDFC Bank');
      expect(orderEntity.emiDetails!.monthlyInstallment, 5000.0);
    });
  });
}
