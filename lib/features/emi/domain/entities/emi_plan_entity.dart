import 'package:freezed_annotation/freezed_annotation.dart';

part 'emi_plan_entity.freezed.dart';

@freezed
abstract class EmiTenureEntity with _$EmiTenureEntity {
  const factory EmiTenureEntity({
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
  }) = _EmiTenureEntity;
}

@freezed
abstract class EmiPlanEntity with _$EmiPlanEntity {
  const factory EmiPlanEntity({
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
    @Default([]) List<EmiTenureEntity> tenures,
  }) = _EmiPlanEntity;
}

@freezed
abstract class EmiEligibilityEntity with _$EmiEligibilityEntity {
  const factory EmiEligibilityEntity({
    required bool eligible,
    String? reasonCode,
    String? message,
    @Default(3000.0) double minOrderValue,
    @Default(500000.0) double maxOrderValue,
  }) = _EmiEligibilityEntity;
}

@freezed
abstract class EmiPlansResponseEntity with _$EmiPlansResponseEntity {
  const factory EmiPlansResponseEntity({
    @Default('INR') String currency,
    @Default('₹') String currencySymbol,
    @Default(0.0) double amount,
    required bool eligible,
    String? reasonCode,
    String? message,
    @Default(3000.0) double minOrderValue,
    @Default(500000.0) double maxOrderValue,
    @Default([]) List<EmiPlanEntity> plans,
  }) = _EmiPlansResponseEntity;
}

@freezed
abstract class EmiQuoteEntity with _$EmiQuoteEntity {
  const factory EmiQuoteEntity({
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
  }) = _EmiQuoteEntity;
}

@freezed
abstract class EmiDetailsSnapshotEntity with _$EmiDetailsSnapshotEntity {
  const factory EmiDetailsSnapshotEntity({
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
  }) = _EmiDetailsSnapshotEntity;
}
