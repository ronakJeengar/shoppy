import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/icons/app_icon.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/flash_sale_providers.dart';
import 'flash_sale_card.dart';
import 'flash_sale_countdown_timer.dart';

/// Full-width Flash Sale showcase section designed for the Home Screen.
/// Automatically refreshes when the current sale countdown expires.
class FlashSaleSection extends ConsumerWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSalesAsync = ref.watch(activeFlashSalesProvider);

    return activeSalesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (sales) {
        if (sales.isEmpty) return const SizedBox.shrink();

        // Pick top priority active sale
        final topSale = sales.first;
        if (topSale.items.isEmpty) return const SizedBox.shrink();

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFFBEB), // Amber 50
                Color(0xFFFEF3C7), // Amber 100
                Color(0xFFFFF7ED), // Orange 50
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: AppRadius.borderLg,
            border: Border.all(
              color: const Color(0xFFFDE68A),
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header with Title & Countdown Timer
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title with Flash Icon
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xFFDC2626),
                              borderRadius: AppRadius.borderSm,
                            ),
                            child: const AppIcon(
                              AppIcons.flash,
                              size: 16,
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
                                      'FLASH SALE',
                                      style: AppTypography.headingSmall.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: const Color(0xFF991B1B),
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 1.5,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFDC2626),
                                        borderRadius: AppRadius.borderFull,
                                      ),
                                      child: Text(
                                        'LIVE',
                                        style: AppTypography.label.copyWith(
                                          color: AppColors.white,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (topSale.title.isNotEmpty)
                                  Text(
                                    topSale.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTypography.bodySmall.copyWith(
                                      fontSize: 11,
                                      color: AppColors.slate600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Countdown Timer with auto-refresh on expiration
                    FlashSaleCountdownTimer(
                      endTime: topSale.endAt,
                      serverTime: topSale.serverTime,
                      isCompact: false,
                      accentColor: const Color(0xFFDC2626),
                      backgroundColor: AppColors.white,
                      textColor: const Color(0xFF991B1B),
                      onExpired: () {
                        ref.invalidate(activeFlashSalesProvider);
                      },
                    ),
                  ],
                ),
              ),

              // Items Carousel
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  itemCount: topSale.items.length,
                  itemBuilder: (context, index) {
                    final item = topSale.items[index];
                    return FlashSaleCard(item: item);
                  },
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        );
      },
    );
  }
}
