import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/widgets/app_icon.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../providers/emi_providers.dart';

class EmiPlanSelectorWidget extends ConsumerStatefulWidget {
  final double amount;
  final ValueChanged<SelectedEmiSelection?>? onSelectionChanged;

  const EmiPlanSelectorWidget({
    super.key,
    required this.amount,
    this.onSelectionChanged,
  });

  @override
  ConsumerState<EmiPlanSelectorWidget> createState() => _EmiPlanSelectorWidgetState();
}

class _EmiPlanSelectorWidgetState extends ConsumerState<EmiPlanSelectorWidget> {
  String? _selectedPlanId;

  @override
  Widget build(BuildContext context) {
    final emiAsync = ref.watch(emiPlansProvider(widget.amount));
    final currentSelection = ref.watch(selectedEmiSelectionProvider);

    return emiAsync.when(
      loading: () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.slate50,
          borderRadius: AppRadius.borderMd,
          border: Border.all(color: AppColors.slate200),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
          ),
        ),
      ),
      error: (err, _) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.08),
          borderRadius: AppRadius.borderMd,
          border: Border.all(color: AppColors.error.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            const AppIcon(AppIcons.errorOutline, color: AppColors.error, size: AppIconSizes.medium),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Failed to load EMI plans. Please check your connection.',
                style: AppTypography.caption.copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      data: (response) {
        if (!response.eligible) {
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.08),
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.warning.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                const AppIcon(AppIcons.info, color: AppColors.warning, size: AppIconSizes.medium),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    response.message ??
                        'EMI is available on orders between ${CurrencyFormatter.format(response.minOrderValue)} and ${CurrencyFormatter.format(response.maxOrderValue)}.',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.slate700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final plans = response.plans;
        if (plans.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.slate50,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.slate200),
            ),
            child: const Text(
              'No active EMI plans currently available for this order total.',
              style: AppTypography.caption,
            ),
          );
        }

        // Auto-select first plan if none selected
        final activePlanId = _selectedPlanId ?? currentSelection?.plan.planId ?? plans.first.planId;
        final selectedPlan = plans.firstWhere(
          (p) => p.planId == activePlanId,
          orElse: () => plans.first,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'Select Bank / Partner',
              style: AppTypography.caption.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.slate700,
              ),
            ),
            const SizedBox(height: 8),

            // Horizontal bank selector
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: plans.map((plan) {
                  final isSelectedBank = plan.planId == selectedPlan.planId;
                  final hasNoCost = plan.tenures.any((t) => t.isNoCost);

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      borderRadius: AppRadius.borderMd,
                      onTap: () {
                        setState(() {
                          _selectedPlanId = plan.planId;
                        });
                        // Auto-select first tenure of newly selected bank
                        if (plan.tenures.isNotEmpty) {
                          final newSel = SelectedEmiSelection(
                            plan: plan,
                            tenure: plan.tenures.first,
                          );
                          ref.read(selectedEmiSelectionProvider.notifier).state = newSel;
                          widget.onSelectionChanged?.call(newSel);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelectedBank ? AppColors.primary50 : AppColors.white,
                          borderRadius: AppRadius.borderMd,
                          border: Border.all(
                            color: isSelectedBank ? AppColors.primary : AppColors.slate200,
                            width: isSelectedBank ? 1.5 : 1,
                          ),
                          boxShadow: isSelectedBank ? AppShadows.card : null,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppIcon(
                                  AppIcons.creditCard,
                                  size: AppIconSizes.small,
                                  color: isSelectedBank ? AppColors.primary : AppColors.slate600,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  plan.provider,
                                  style: AppTypography.bodySmall.copyWith(
                                    fontWeight: isSelectedBank ? FontWeight.bold : FontWeight.w600,
                                    color: isSelectedBank ? AppColors.primary : AppColors.slate900,
                                  ),
                                ),
                              ],
                            ),
                            if (hasNoCost) ...[
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.success.withValues(alpha: 0.1),
                                  borderRadius: AppRadius.borderSm,
                                ),
                                child: Text(
                                  'No Cost EMI',
                                  style: AppTypography.caption.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.success,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Select Tenure (${selectedPlan.provider})',
              style: AppTypography.caption.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.slate700,
              ),
            ),
            const SizedBox(height: 8),

            // Tenure Cards
            ...selectedPlan.tenures.map((tenure) {
              final isSelectedTenure = currentSelection?.plan.planId == selectedPlan.planId &&
                  currentSelection?.tenure.months == tenure.months;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  borderRadius: AppRadius.borderMd,
                  onTap: () {
                    final newSel = SelectedEmiSelection(
                      plan: selectedPlan,
                      tenure: tenure,
                    );
                    ref.read(selectedEmiSelectionProvider.notifier).state = newSel;
                    widget.onSelectionChanged?.call(newSel);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelectedTenure
                          ? AppColors.primary50.withValues(alpha: 0.3)
                          : AppColors.slate50,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(
                        color: isSelectedTenure ? AppColors.primary : AppColors.slate200,
                        width: isSelectedTenure ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Radio circle
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelectedTenure ? AppColors.primary : AppColors.slate400,
                              width: 2,
                            ),
                          ),
                          child: isSelectedTenure
                              ? Center(
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                )
                              : null,
                        ),

                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${CurrencyFormatter.format(tenure.monthlyInstallment)} / mo',
                                    style: AppTypography.bodyLarge.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.slate900,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'for ${tenure.months} Months',
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppColors.slate600,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (tenure.isNoCost)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.success.withValues(alpha: 0.12),
                                        borderRadius: AppRadius.borderSm,
                                      ),
                                      child: Text(
                                        '0% Interest',
                                        style: AppTypography.caption.copyWith(
                                          color: AppColors.success,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    )
                                  else
                                    Text(
                                      '${tenure.interestRate}% p.a.',
                                      style: AppTypography.caption.copyWith(
                                        color: AppColors.slate600,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    tenure.processingFee > 0
                                        ? 'Processing Fee: ${CurrencyFormatter.format(tenure.processingFee)}'
                                        : 'Free Processing Fee',
                                    style: AppTypography.caption.copyWith(
                                      color: AppColors.slate500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const Text(' • ', style: TextStyle(color: AppColors.slate400, fontSize: 10)),
                                  Text(
                                    'Total: ${CurrencyFormatter.format(tenure.totalPayable)}',
                                    style: AppTypography.caption.copyWith(
                                      color: AppColors.slate600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 8),
            Row(
              children: [
                const AppIcon(AppIcons.shield, size: AppIconSizes.xs, color: AppColors.slate400),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Authoritative interest & processing fees calculated by backend. Final loan terms provided by bank.',
                    style: AppTypography.caption.copyWith(
                      fontSize: 10,
                      color: AppColors.slate500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
