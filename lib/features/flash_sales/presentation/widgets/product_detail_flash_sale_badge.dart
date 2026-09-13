import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/icons/app_icon.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/flash_sale_providers.dart';
import 'flash_sale_countdown_timer.dart';

/// Promotional banner widget displayed on Product Detail Page when a product is enrolled in an active Flash Sale.
class ProductDetailFlashSaleBadge extends ConsumerWidget {
  final String productId;

  const ProductDetailFlashSaleBadge({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promoAsync = ref.watch(productFlashSaleProvider(productId));

    return promoAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (promo) {
        if (promo == null) return const SizedBox.shrink();

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFEF2F2), // Red 50
                Color(0xFFFFFBEB), // Amber 50
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: AppRadius.borderMd,
            border: Border.all(
              color: const Color(0xFFFCA5A5), // Red 300
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Flash icon + Deal text + Limit
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFFDC2626),
                        borderRadius: AppRadius.borderFull,
                      ),
                      child: const AppIcon(
                        AppIcons.flash,
                        size: 14,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'FLASH SALE DEAL',
                                style: AppTypography.label.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF991B1B),
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              if (promo.discountPercentage > 0) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFDC2626),
                                    borderRadius: AppRadius.borderFull,
                                  ),
                                  child: Text(
                                    '${promo.discountPercentage}% OFF',
                                    style: AppTypography.label.copyWith(
                                      color: AppColors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            promo.maximumQuantityPerOrder > 0
                                ? 'Limited to ${promo.maximumQuantityPerOrder} unit(s) per order'
                                : 'Special promotional price',
                            style: AppTypography.label.copyWith(
                              color: AppColors.slate600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Right: Countdown pill if end time is available
              if (promo.endAt != null)
                FlashSaleCountdownTimer(
                  endTime: promo.endAt!,
                  serverTime: promo.serverTime,
                  isCompact: true,
                  accentColor: const Color(0xFFDC2626),
                  backgroundColor: AppColors.white,
                  textColor: const Color(0xFF991B1B),
                  onExpired: () {
                    ref.invalidate(productFlashSaleProvider(productId));
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
