import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../providers/coupon_providers.dart';
import 'coupon_card.dart';

class CouponBottomSheet extends ConsumerWidget {
  final String? currentlyAppliedCode;
  final void Function(String code) onSelectCoupon;

  const CouponBottomSheet({
    super.key,
    this.currentlyAppliedCode,
    required this.onSelectCoupon,
  });

  static Future<void> show(
    BuildContext context, {
    String? currentlyAppliedCode,
    required void Function(String code) onSelectCoupon,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CouponBottomSheet(
        currentlyAppliedCode: currentlyAppliedCode,
        onSelectCoupon: onSelectCoupon,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final couponsAsync = ref.watch(availableCouponsProvider);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 8),
              width: 38,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.slate300,
                borderRadius: AppRadius.borderFull,
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.lg,
              vertical: AppDimensions.sm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const AppIcon(
                      AppIcons.coupon,
                      size: AppIconSizes.action,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppStrings.coupons.availableOffers,
                      style: AppTypography.headingSmall,
                    ),
                  ],
                ),
                IconButton(
                  icon: const AppIcon(AppIcons.close, size: AppIconSizes.action),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),

          // Content
          Expanded(
            child: couponsAsync.when(
              data: (coupons) {
                if (coupons.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.xl),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppIcon(
                            AppIcons.coupon,
                            size: AppIconSizes.hero,
                            color: AppColors.slate300,
                          ),
                          const SizedBox(height: AppDimensions.md),
                          Text(
                            AppStrings.coupons.noOffersAvailable,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: AppDimensions.sm),
                  itemCount: coupons.length,
                  itemBuilder: (context, index) {
                    final coupon = coupons[index];
                    final isApplied = currentlyAppliedCode != null &&
                        currentlyAppliedCode!.toUpperCase() ==
                            coupon.code.toUpperCase();

                    return CouponCard(
                      coupon: coupon,
                      isApplied: isApplied,
                      onApply: () {
                        Navigator.pop(context);
                        onSelectCoupon(coupon.code);
                      },
                    );
                  },
                );
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.xl),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ),
              error: (err, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.xl),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        err.toString(),
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.sm),
                      TextButton(
                        onPressed: () => ref.refresh(availableCouponsProvider),
                        child: Text(AppStrings.common.retry),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
