import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/wishlist/presentation/providers/wishlist_providers.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/widgets/app_network_image.dart';

/// A modern, Figma-quality e-commerce product card with ratings, wishlist toggle,
/// stock urgency badge, and instant add-to-cart button.
class ProductCard extends ConsumerWidget {
  final ProductEntity product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWishlisted = ref.watch(isWishlistedProvider(product.id));

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadius.borderMd,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with Wishlist & Rating overlays
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: AppNetworkImage(
                        imageUrl: product.productImage,
                        fit: BoxFit.cover,
                        memCacheWidth: 350,
                      ),
                    ),

                    // Wishlist Floating Button (Top Left)
                    Positioned(
                      top: AppDimensions.sm,
                      left: AppDimensions.sm,
                      child: Material(
                        color: AppColors.white.withValues(alpha: 0.92),
                        shape: const CircleBorder(),
                        elevation: 2,
                        shadowColor: Colors.black.withValues(alpha: 0.1),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            ref
                                .read(wishlistNotifierProvider.notifier)
                                .toggle(product);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: AppIcon(
                              isWishlisted
                                  ? AppIcons.wishlistFilled
                                  : AppIcons.wishlist,
                              color: isWishlisted
                                  ? AppColors.error
                                  : AppColors.slate600,
                              size: AppIconSizes.productAction,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Rating Badge (Top Right)
                    if (product.productRating > 0)
                      Positioned(
                        top: AppDimensions.sm,
                        right: AppDimensions.sm,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.92),
                            borderRadius: AppRadius.borderFull,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const AppIcon(
                                AppIcons.star,
                                size: AppIconSizes.rating,
                                color: AppColors.accent,
                              ),
                              const SizedBox(width: AppDimensions.xxs),
                              Text(
                                product.productRating.toStringAsFixed(1),
                                style: AppTypography.caption.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.slate800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Product Info & Price
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Seller / Brand Tag
                    Text(
                      product.sellerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.label.copyWith(
                        color: AppColors.textMuted,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 3),

                    // Product Title
                    Text(
                      product.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.sm),

                    // Price and Quick Add-to-Cart Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: AppTypography.priceCard,
                            ),
                            if (product.stock <= 5 && product.stock > 0)
                              Text(
                                AppStrings.product.onlyLeft(product.stock),
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.warning,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            else if (product.stock == 0)
                              Text(
                                AppStrings.product.outOfStock,
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.error,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),

                        // Quick Add Button
                        Material(
                          color: product.stock > 0
                              ? AppColors.primary
                              : AppColors.border,
                          borderRadius: AppRadius.borderSm,
                          child: InkWell(
                            borderRadius: AppRadius.borderSm,
                            onTap: product.stock > 0
                                ? () async {
                                    await ref
                                        .read(cartNotifierProvider.notifier)
                                        .addToCart(product.id, quantity: 1);
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            AppStrings.product
                                                .addedToCart(product.productName),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          backgroundColor: AppColors.slate900,
                                          behavior: SnackBarBehavior.floating,
                                          duration:
                                              const Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: AppIcon(
                                AppIcons.addToCart,
                                size: AppIconSizes.productAction,
                                color: AppColors.white,
                              ),
                            ),
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
  }
}
