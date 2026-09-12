import 'package:flutter/material.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../../domain/entities/coupon_entity.dart';

class CouponCard extends StatelessWidget {
  final CouponEntity coupon;
  final bool isApplied;
  final VoidCallback? onApply;

  const CouponCard({
    super.key,
    required this.coupon,
    this.isApplied = false,
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final discountLabel = coupon.discountType == 'PERCENTAGE'
        ? '${coupon.discountValue.toStringAsFixed(0)}% OFF'
        : '₹${coupon.discountValue.toStringAsFixed(0)} FLAT OFF';

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.lg,
        vertical: AppDimensions.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderMd,
        border: Border.all(
          color: isApplied ? AppColors.success : AppColors.border,
          width: isApplied ? 1.5 : 1.0,
        ),
        boxShadow: AppShadows.card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Code badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isApplied
                        ? AppColors.success.withValues(alpha: 0.12)
                        : AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: AppRadius.borderSm,
                    border: Border.all(
                      color: isApplied
                          ? AppColors.success.withValues(alpha: 0.5)
                          : AppColors.primary.withValues(alpha: 0.3),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppIcon(
                        AppIcons.coupon,
                        size: AppIconSizes.sm,
                        color: isApplied ? AppColors.success : AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        coupon.code,
                        style: AppTypography.labelLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isApplied ? AppColors.success : AppColors.primary,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Apply button or Applied indicator
                if (isApplied)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(
                        AppIcons.checkCircle,
                        size: AppIconSizes.sm,
                        color: AppColors.success,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppStrings.coupons.applied,
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                else
                  TextButton(
                    onPressed: onApply,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      backgroundColor: AppColors.primary.withValues(alpha: 0.08),
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadius.borderSm,
                      ),
                    ),
                    child: Text(
                      AppStrings.coupons.apply,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // Discount title & description
            Text(
              discountLabel,
              style: AppTypography.headingSmall.copyWith(
                color: AppColors.slate900,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (coupon.description.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                coupon.description,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],

            const SizedBox(height: 8),
            const Divider(height: 1, color: AppColors.divider),
            const SizedBox(height: 8),

            // Terms (Min order, Max discount)
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [
                if (coupon.minimumOrderValue > 0)
                  Text(
                    '${AppStrings.coupons.minOrderValue} ₹${coupon.minimumOrderValue.toStringAsFixed(0)}',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                if (coupon.maximumDiscountAmount != null)
                  Text(
                    '${AppStrings.coupons.maxDiscount} ₹${coupon.maximumDiscountAmount!.toStringAsFixed(0)}',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                if (coupon.firstOrderOnly)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: const BoxDecoration(
                      color: AppColors.warningLight,
                      borderRadius: AppRadius.borderSm,
                    ),
                    child: Text(
                      AppStrings.coupons.firstOrderOnly,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
