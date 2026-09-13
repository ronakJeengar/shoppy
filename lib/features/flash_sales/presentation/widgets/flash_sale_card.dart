import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_names.dart';
import '../../../../core/icons/app_icon.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/flash_sale_entity.dart';

/// Card widget representing a single product enrolled in an active flash sale.
/// Displays high-converting strike-through pricing, discount badges, and stock progress.
class FlashSaleCard extends StatelessWidget {
  final FlashSaleItemEntity item;
  final double width;
  final VoidCallback? onTap;

  const FlashSaleCard({
    super.key,
    required this.item,
    this.width = 160.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount = item.regularPrice > item.salePrice;
    final discountText = item.discountPercentage > 0
        ? '${item.discountPercentage}% OFF'
        : '';

    // Stock claimed calculation
    final totalStock = item.stockAllocated;
    final soldStock = item.stockSold;
    double progress = 0.0;
    if (totalStock > 0) {
      progress = (soldStock / totalStock).clamp(0.0, 1.0);
    }

    return Semantics(
      label:
          '${item.productName}, Flash sale price ₹${item.salePrice.toStringAsFixed(0)}, Original price ₹${item.regularPrice.toStringAsFixed(0)}, $discountText',
      button: true,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else if (item.productId.isNotEmpty) {
            context.push(RouteNames.productDetail(item.productId));
          }
        },
        child: Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppRadius.borderMd,
            boxShadow: AppShadows.card,
            border: Border.all(
              color: item.isSoldOut
                  ? AppColors.slate200
                  : const Color(0xFFFDE68A), // Subtle golden border
              width: 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with Flash Badge Overlay
              Expanded(
                flex: 11,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (item.productImage.isNotEmpty)
                      CachedNetworkImage(
                        imageUrl: item.productImage,
                        fit: BoxFit.cover,
                        memCacheWidth: 400,
                        placeholder: (context, url) => Container(
                          color: AppColors.slate100,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.slate100,
                          child: const Center(
                            child: AppIcon(
                              AppIcons.shoppingBag,
                              size: 28,
                              color: AppColors.slate400,
                            ),
                          ),
                        ),
                      )
                    else
                      Container(
                        color: AppColors.slate100,
                        child: const Center(
                          child: AppIcon(
                            AppIcons.shoppingBag,
                            size: 28,
                            color: AppColors.slate400,
                          ),
                        ),
                      ),

                    // Top Left: Flash Discount Pill
                    if (hasDiscount && discountText.isNotEmpty)
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFDC2626), Color(0xFFB91C1C)],
                            ),
                            borderRadius: AppRadius.borderFull,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withValues(alpha: 0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const AppIcon(
                                AppIcons.flash,
                                size: 10,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                discountText,
                                style: AppTypography.label.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Sold out scrim if fully claimed
                    if (item.isSoldOut)
                      Container(
                        color: Colors.black.withValues(alpha: 0.55),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.slate900,
                              borderRadius: AppRadius.borderSm,
                            ),
                            child: Text(
                              'SOLD OUT',
                              style: AppTypography.label.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Card Details
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Title
                      Text(
                        item.productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate800,
                        ),
                      ),

                      // Prices (Sale Price + Strike-through Regular/MRP)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '₹${item.salePrice.toStringAsFixed(0)}',
                            style: AppTypography.label.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: const Color(0xFFDC2626), // Flash sale crimson
                            ),
                          ),
                          if (hasDiscount) ...[
                            const SizedBox(width: 4),
                            Text(
                              '₹${item.regularPrice.toStringAsFixed(0)}',
                              style: AppTypography.label.copyWith(
                                fontSize: 11,
                                color: AppColors.slate400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),

                      // Stock Claimed Progress Bar (if allocated)
                      if (totalStock > 0) ...[
                        ClipRRect(
                          borderRadius: AppRadius.borderFull,
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: AppColors.slate100,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              progress >= 0.8
                                  ? const Color(0xFFEF4444)
                                  : const Color(0xFFF59E0B),
                            ),
                            minHeight: 4,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.isSoldOut
                              ? 'Claimed 100%'
                              : item.remainingStock != null &&
                                      item.remainingStock! <= 5
                                  ? 'Only ${item.remainingStock} left!'
                                  : '${(progress * 100).toInt()}% claimed',
                          style: AppTypography.label.copyWith(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: progress >= 0.8
                                ? const Color(0xFFDC2626)
                                : AppColors.slate500,
                          ),
                        ),
                      ] else ...[
                        Text(
                          'Limited Time Deal',
                          style: AppTypography.label.copyWith(
                            fontSize: 9,
                            color: AppColors.slate500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
