import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/product_detail_page.dart';

/// A modern, Figma-quality e-commerce product card with ratings, wishlist toggle,
/// stock urgency badge, and instant add-to-cart button.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.slate200, width: 1),
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
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColors.slate100,
                      child: product.productImage.isNotEmpty
                          ? Image.network(
                              product.productImage,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 32,
                                  color: AppColors.slate400,
                                ),
                              ),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                        AppColors.primary,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Icon(
                                Icons.inventory_2_outlined,
                                size: 32,
                                color: AppColors.slate400,
                              ),
                            ),
                    ),

                    // Wishlist Floating Button (Top Left)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Consumer<WishlistProvider>(
                        builder: (context, wishlistProvider, _) {
                          final isWishlisted =
                              wishlistProvider.isInWishlist(product.id);
                          return Material(
                            color: AppColors.white.withValues(alpha: 0.92),
                            shape: const CircleBorder(),
                            elevation: 2,
                            shadowColor: Colors.black.withValues(alpha: 0.1),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () {
                                wishlistProvider.toggleWishlist(product);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  isWishlisted
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border,
                                  color: isWishlisted
                                      ? AppColors.error
                                      : AppColors.slate600,
                                  size: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Rating Badge (Top Right)
                    if (product.productRating > 0)
                      Positioned(
                        top: 8,
                        right: 8,
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
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: AppColors.accent,
                              ),
                              const SizedBox(width: 2),
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
                        color: AppColors.slate400,
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
                        color: AppColors.slate900,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 8),

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
                                'Only ${product.stock} left',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.warning,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            else if (product.stock == 0)
                              Text(
                                'Out of stock',
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
                              : AppColors.slate200,
                          borderRadius: AppRadius.borderSm,
                          child: InkWell(
                            borderRadius: AppRadius.borderSm,
                            onTap: product.stock > 0
                                ? () async {
                                    final cart = context.read<CartProvider>();
                                    await cart.addToCart(product);
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Added ${product.productName} to cart',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          backgroundColor: AppColors.slate900,
                                          behavior: SnackBarBehavior.floating,
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 16,
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
