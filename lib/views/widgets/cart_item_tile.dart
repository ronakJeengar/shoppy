import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/cart_model.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel item;
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.slate200, width: 1),
        boxShadow: AppShadows.card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Thumbnail
            ClipRRect(
              borderRadius: AppRadius.borderSm,
              child: Container(
                width: 80,
                height: 80,
                color: AppColors.slate100,
                child: item.productImage.isNotEmpty
                    ? Image.network(
                        item.productImage,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.slate400,
                        ),
                      )
                    : const Icon(Icons.shopping_bag_outlined, color: AppColors.slate400),
              ),
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
                            color: AppColors.slate900,
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.close_rounded, size: 18, color: AppColors.slate400),
                        onPressed: onRemove,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Sold by ${item.sellerName}',
                    style: AppTypography.caption.copyWith(color: AppColors.slate500),
                  ),
                  if (!item.isAvailable) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Out of Stock',
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
                          border: Border.all(color: AppColors.slate200),
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
                                child: Icon(
                                  item.quantity > 1
                                      ? Icons.remove_rounded
                                      : Icons.delete_outline_rounded,
                                  size: 16,
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
                                  color: AppColors.slate900,
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
                                child: Icon(
                                  Icons.add_rounded,
                                  size: 16,
                                  color: canIncrement ? AppColors.slate700 : AppColors.slate300,
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
