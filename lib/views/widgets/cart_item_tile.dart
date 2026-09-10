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
import 'package:shopp_app/features/cart/domain/entities/cart_entity.dart';
import 'package:shopp_app/views/widgets/app_network_image.dart';

class CartItemTile extends StatelessWidget {
  final CartItemEntity item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final canIncrement = item.quantity < item.stock;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.lg,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.card,
      ),
      child: Padding(
        padding: AppDimensions.paddingMd,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Thumbnail
            AppNetworkImage(
              imageUrl: item.productImage,
              width: AppDimensions.avatarXl,
              height: AppDimensions.avatarXl,
              borderRadius: AppRadius.borderSm,
              fit: BoxFit.cover,
              memCacheWidth: 200,
            ),
            const SizedBox(width: 14),

            // Product Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const AppIcon(
                          AppIcons.close,
                          size: AppIconSizes.action,
                          color: AppColors.textMuted,
                        ),
                        onPressed: onRemove,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    AppStrings.product.soldBy(item.sellerName),
                    style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                  ),
                  if (!item.isAvailable) ...[
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.product.outOfStock,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),

                  // Price & Stepper Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: AppTypography.priceCard,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.slate100,
                          borderRadius: AppRadius.borderSm,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              borderRadius: const BorderRadius.horizontal(left: Radius.circular(6)),
                              onTap: () {
                                if (item.quantity > 1) {
                                  onQuantityChanged(item.quantity - 1);
                                } else {
                                  onRemove();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: AppIcon(
                                  item.quantity > 1
                                      ? AppIcons.remove
                                      : AppIcons.delete,
                                  size: AppIconSizes.sm,
                                  color: item.quantity > 1 ? AppColors.slate700 : AppColors.error,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '${item.quantity}',
                                style: AppTypography.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            InkWell(
                              borderRadius: const BorderRadius.horizontal(right: Radius.circular(6)),
                              onTap: canIncrement
                                  ? () => onQuantityChanged(item.quantity + 1)
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: AppIcon(
                                  AppIcons.add,
                                  size: AppIconSizes.sm,
                                  color: canIncrement ? AppColors.slate700 : AppColors.disabled,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
