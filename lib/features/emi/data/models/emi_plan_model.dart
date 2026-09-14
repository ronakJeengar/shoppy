import 'package:freezed_annotation/freezed_annotation.dart';

part 'emi_plan_model.freezed.dart';

@freezed
abstract class EmiTenureModel with _$EmiTenureModel {
  const factory EmiTenureModel({
    required String tenureId,
    required int months,
    required double interestRate,
    @Default(false) bool isNoCost,
    @Default(0.0) double processingFee,
    @Default('FIXED') String processingFeeType,
    @Default(0.0) double monthlyInstallment,
    @Default(0.0) double totalInterest,
    @Default(0.0) double totalRepaid,
    @Default(0.0) double totalPayable,
  }) = _EmiTenureModel;

  factory EmiTenureModel.fromJson(Map<String, dynamic> json) {
    return EmiTenureModel(
      tenureId: json['tenureId']?.toString() ?? json['_id']?.toString() ?? '',
      months: (json['months'] as num?)?.toInt() ?? 0,
      interestRate: (json['interestRate'] as num?)?.toDouble() ?? 0.0,
      isNoCost: json['isNoCost'] == true || (json['interestRate'] as num?)?.toDouble() == 0.0,
      processingFee: (json['processingFee'] as num?)?.toDouble() ?? 0.0,
      processingFeeType: json['processingFeeType']?.toString() ?? 'FIXED',
      monthlyInstallment: (json['monthlyInstallment'] as num?)?.toDouble() ??
          (json['quote']?['monthlyInstallment'] as num?)?.toDouble() ??
          0.0,
      totalInterest: (json['totalInterest'] as num?)?.toDouble() ??
          (json['quote']?['totalInterest'] as num?)?.toDouble() ??
          0.0,
      totalRepaid: (json['totalRepaid'] as num?)?.toDouble() ??
          (json['quote']?['totalRepaid'] as num?)?.toDouble() ??
          0.0,
      totalPayable: (json['totalPayable'] as num?)?.toDouble() ??
          (json['quote']?['totalPayable'] as num?)?.toDouble() ??
          0.0,
    );
  }
}

@freezed
abstract class EmiPlanModel with _$EmiPlanModel {
  const factory EmiPlanModel({
    required String id,
    required String planId,
    required String provider,
    required String providerCode,
    @Default('BANK') String providerType,
    @Default(3000.0) double minAmount,
    @Default(500000.0) double maxAmount,
    @Default(true) bool isEligible,
    @Default('') String description,
    @Default('') String termsAndConditions,
    @Default([]) List<EmiTenureModel> tenures,
  }) = _EmiPlanModel;

  factory EmiPlanModel.fromJson(Map<String, dynamic> json) {
    final rawTenures = json['tenures'] as List<dynamic>? ?? [];
    return EmiPlanModel(
      id: json['id']?.toString() ?? json['planId']?.toString() ?? json['_id']?.toString() ?? '',
      planId: json['planId']?.toString() ?? json['id']?.toString() ?? json['_id']?.toString() ?? '',
      provider: json['provider']?.toString() ?? '',
      providerCode: json['providerCode']?.toString() ?? '',
      providerType: json['providerType']?.toString() ?? 'BANK',
      minAmount: (json['minAmount'] as num?)?.toDouble() ?? 3000.0,
      maxAmount: (json['maxAmount'] as num?)?.toDouble() ?? 500000.0,
      isEligible: json['isEligible'] != false,
      description: json['description']?.toString() ?? '',
      termsAndConditions: json['termsAndConditions']?.toString() ?? '',
      tenures: rawTenures
          .whereType<Map<String, dynamic>>()
          .map((t) => EmiTenureModel.fromJson(t))
          .toList(),
    );
  }
}

@freezed
abstract class EmiEligibilityModel with _$EmiEligibilityModel {
  const factory EmiEligibilityModel({
    required bool eligible,
    String? reasonCode,
    String? message,
    @Default(3000.0) double minOrderValue,
    @Default(500000.0) double maxOrderValue,
  }) = _EmiEligibilityModel;

  factory EmiEligibilityModel.fromJson(Map<String, dynamic> json) {
    return EmiEligibilityModel(
      eligible: json['eligible'] == true,
      reasonCode: json['reasonCode']?.toString(),
      message: json['message']?.toString(),
      minOrderValue: (json['minOrderValue'] as num?)?.toDouble() ??
          (json['minAmount'] as num?)?.toDouble() ??
          3000.0,
      maxOrderValue: (json['maxOrderValue'] as num?)?.toDouble() ??
          (json['maxAmount'] as num?)?.toDouble() ??
          500000.0,
    );
  }
}

@freezed
abstract class EmiPlansResponseModel with _$EmiPlansResponseModel {
  const factory EmiPlansResponseModel({
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    @Default(0.0) double amount,
    required bool eligible,
    String? reasonCode,
    String? message,
    @Default(3000.0) double minOrderValue,
    @Default(500000.0) double maxOrderValue,
    @Default([]) List<EmiPlanModel> plans,
  }) = _EmiPlansResponseModel;

  factory EmiPlansResponseModel.fromJson(Map<String, dynamic> json) {
    final rawPlans = json['plans'] as List<dynamic>? ?? [];
    return EmiPlansResponseModel(
      currency: json['currency']?.toString() ?? 'INR',
      currencySymbol: json['currencySymbol']?.toString() ?? '₹',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      eligible: json['eligible'] == true || json['eligibility']?['eligible'] == true,
      reasonCode: json['reasonCode']?.toString() ?? json['eligibility']?['reasonCode']?.toString(),
      message: json['message']?.toString() ?? json['eligibility']?['message']?.toString(),
      minOrderValue: (json['minOrderValue'] as num?)?.toDouble() ??
          (json['eligibility']?['minOrderValue'] as num?)?.toDouble() ??
          3000.0,
      maxOrderValue: (json['maxOrderValue'] as num?)?.toDouble() ??
          (json['eligibility']?['maxOrderValue'] as num?)?.toDouble() ??
          500000.0,
      plans: rawPlans
          .whereType<Map<String, dynamic>>()
          .map((p) => EmiPlanModel.fromJson(p))
          .toList(),
    );
  }
}

@freezed
abstract class EmiQuoteModel with _$EmiQuoteModel {
  const factory EmiQuoteModel({
    required String planId,
    required String provider,
    required String providerCode,
    required int tenureMonths,
    required double interestRate,
    required double principal,
    required double monthlyInstallment,
    required double totalInterest,
    required double processingFee,
    @Default('FIXED') String processingFeeType,
    required double totalRepaid,
    required double totalPayable,
    @Default(false) bool isNoCost,
  }) = _EmiQuoteModel;

  factory EmiQuoteModel.fromJson(Map<String, dynamic> json) {
    return EmiQuoteModel(
      planId: json['planId']?.toString() ?? '',
      provider: json['provider']?.toString() ?? '',
      providerCode: json['providerCode']?.toString() ?? '',
      tenureMonths: (json['tenureMonths'] as num?)?.toInt() ?? 0,
      interestRate: (json['interestRate'] as num?)?.toDouble() ?? 0.0,
      principal: (json['principal'] as num?)?.toDouble() ?? 0.0,
      monthlyInstallment: (json['monthlyInstallment'] as num?)?.toDouble() ?? 0.0,
      totalInterest: (json['totalInterest'] as num?)?.toDouble() ?? 0.0,
      processingFee: (json['processingFee'] as num?)?.toDouble() ?? 0.0,
      processingFeeType: json['processingFeeType']?.toString() ?? 'FIXED',
      totalRepaid: (json['totalRepaid'] as num?)?.toDouble() ?? 0.0,
      totalPayable: (json['totalPayable'] as num?)?.toDouble() ?? 0.0,
      isNoCost: json['isNoCost'] == true,
    );
  }
}

@freezed
abstract class EmiDetailsSnapshotModel with _$EmiDetailsSnapshotModel {
  const factory EmiDetailsSnapshotModel({
    @Default(false) bool isEmi,
    @Default('') String planId,
    @Default('') String provider,
    @Default('') String providerCode,
    @Default(0) int tenureMonths,
    @Default(0.0) double interestRate,
    @Default(0.0) double processingFee,
    @Default('FIXED') String processingFeeType,
    @Default(0.0) double principal,
    @Default(0.0) double monthlyInstallment,
    @Default(0.0) double totalInterest,
    @Default(0.0) double totalPayable,
    @Default(false) bool isNoCost,
  }) = _EmiDetailsSnapshotModel;

  factory EmiDetailsSnapshotModel.fromJson(Map<String, dynamic> json) {
    return EmiDetailsSnapshotModel(
      isEmi: json['isEmi'] == true,
      planId: json['planId']?.toString() ?? '',
      provider: json['provider']?.toString() ?? '',
      providerCode: json['providerCode']?.toString() ?? '',
      tenureMonths: (json['tenureMonths'] as num?)?.toInt() ?? 0,
      interestRate: (json['interestRate'] as num?)?.toDouble() ?? 0.0,
      processingFee: (json['processingFee'] as num?)?.toDouble() ?? 0.0,
      processingFeeType: json['processingFeeType']?.toString() ?? 'FIXED',
      principal: (json['principal'] as num?)?.toDouble() ?? 0.0,
      monthlyInstallment: (json['monthlyInstallment'] as num?)?.toDouble() ?? 0.0,
      totalInterest: (json['totalInterest'] as num?)?.toDouble() ?? 0.0,
      totalPayable: (json['totalPayable'] as num?)?.toDouble() ?? 0.0,
      isNoCost: json['isNoCost'] == true,
    );
  }
}
