import '../../domain/entities/emi_plan_entity.dart';
import '../models/emi_plan_model.dart';

extension EmiTenureModelMapper on EmiTenureModel {
  EmiTenureEntity toEntity() {
    return EmiTenureEntity(
      tenureId: tenureId,
      months: months,
      interestRate: interestRate,
      isNoCost: isNoCost,
      processingFee: processingFee,
      processingFeeType: processingFeeType,
      monthlyInstallment: monthlyInstallment,
      totalInterest: totalInterest,
      totalRepaid: totalRepaid,
      totalPayable: totalPayable,
    );
  }
}

extension EmiPlanModelMapper on EmiPlanModel {
  EmiPlanEntity toEntity() {
    return EmiPlanEntity(
      id: id,
      planId: planId,
      provider: provider,
      providerCode: providerCode,
      providerType: providerType,
      minAmount: minAmount,
      maxAmount: maxAmount,
      isEligible: isEligible,
      description: description,
      termsAndConditions: termsAndConditions,
      tenures: tenures.map((t) => t.toEntity()).toList(),
    );
  }
}

extension EmiEligibilityModelMapper on EmiEligibilityModel {
  EmiEligibilityEntity toEntity() {
    return EmiEligibilityEntity(
      eligible: eligible,
      reasonCode: reasonCode,
      message: message,
      minOrderValue: minOrderValue,
      maxOrderValue: maxOrderValue,
    );
  }
}

extension EmiPlansResponseModelMapper on EmiPlansResponseModel {
  EmiPlansResponseEntity toEntity() {
    return EmiPlansResponseEntity(
      currency: currency,
      currencySymbol: currencySymbol,
      amount: amount,
      eligible: eligible,
      reasonCode: reasonCode,
      message: message,
      minOrderValue: minOrderValue,
      maxOrderValue: maxOrderValue,
      plans: plans.map((p) => p.toEntity()).toList(),
    );
  }
}

extension EmiQuoteModelMapper on EmiQuoteModel {
  EmiQuoteEntity toEntity() {
    return EmiQuoteEntity(
      planId: planId,
      provider: provider,
      providerCode: providerCode,
      tenureMonths: tenureMonths,
      interestRate: interestRate,
      principal: principal,
      monthlyInstallment: monthlyInstallment,
      totalInterest: totalInterest,
      processingFee: processingFee,
      processingFeeType: processingFeeType,
      totalRepaid: totalRepaid,
      totalPayable: totalPayable,
      isNoCost: isNoCost,
    );
  }
}

extension EmiDetailsSnapshotModelMapper on EmiDetailsSnapshotModel {
  EmiDetailsSnapshotEntity toEntity() {
    return EmiDetailsSnapshotEntity(
      isEmi: isEmi,
      planId: planId,
      provider: provider,
      providerCode: providerCode,
      tenureMonths: tenureMonths,
      interestRate: interestRate,
      processingFee: processingFee,
      processingFeeType: processingFeeType,
      principal: principal,
      monthlyInstallment: monthlyInstallment,
      totalInterest: totalInterest,
      totalPayable: totalPayable,
      isNoCost: isNoCost,
    );
  }
}

extension EmiDetailsSnapshotEntityMapper on EmiDetailsSnapshotEntity {
  EmiDetailsSnapshotModel toModel() {
    return EmiDetailsSnapshotModel(
      isEmi: isEmi,
      planId: planId,
      provider: provider,
      providerCode: providerCode,
      tenureMonths: tenureMonths,
      interestRate: interestRate,
      processingFee: processingFee,
      processingFeeType: processingFeeType,
      principal: principal,
      monthlyInstallment: monthlyInstallment,
      totalInterest: totalInterest,
      totalPayable: totalPayable,
      isNoCost: isNoCost,
    );
  }
}

extension EmiQuoteEntityMapper on EmiQuoteEntity {
  EmiQuoteModel toModel() {
    return EmiQuoteModel(
      planId: planId,
      provider: provider,
      providerCode: providerCode,
      tenureMonths: tenureMonths,
      interestRate: interestRate,
      principal: principal,
      monthlyInstallment: monthlyInstallment,
      totalInterest: totalInterest,
      processingFee: processingFee,
      processingFeeType: processingFeeType,
      totalRepaid: totalRepaid,
      totalPayable: totalPayable,
      isNoCost: isNoCost,
    );
  }
}

