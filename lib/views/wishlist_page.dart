import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/wishlist_provider.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = context.watch<WishlistProvider>();
    final cartProvider = context.read<CartProvider>();

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Wishlist (${wishlistProvider.itemCount})',
          style: AppTypography.headingSmall,
        ),
      ),
      body: _buildBody(context, wishlistProvider, cartProvider),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WishlistProvider wishlistProvider,
    CartProvider cartProvider,
  ) {
    if (wishlistProvider.isLoading && wishlistProvider.items.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      );
    }

    if (wishlistProvider.items.isEmpty) {
      return EmptyStateView(
        icon: Icons.favorite_border_rounded,
        iconColor: AppColors.coral,
        title: 'Your wishlist is empty',
        description:
            'Explore products and tap the heart icon to save your favorites for later.',
        buttonText: 'Explore Products',
        onButtonPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
          );
        },
      );
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => wishlistProvider.loadWishlist(),
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.62,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: wishlistProvider.items.length,
        itemBuilder: (context, index) {
          final product = wishlistProvider.items[index];

          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.slate200),
              boxShadow: AppShadows.card,
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: AppRadius.borderMd,
              child: InkWell(
                borderRadius: AppRadius.borderMd,
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
                    // Image with Wishlist Remove button
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: AppColors.slate100,
                              child: product.imageUrl.isNotEmpty
                                  ? Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.image_not_supported_outlined,
                                        color: AppColors.slate400,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.shopping_bag_outlined,
                                      color: AppColors.slate400,
                                    ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Material(
                              color: AppColors.white.withValues(alpha: 0.92),
                              shape: const CircleBorder(),
                              elevation: 2,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () {
                                  wishlistProvider.removeFromWishlist(product.id);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    color: AppColors.coral,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodySmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.slate900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: AppTypography.priceCard,
                          ),
                          const SizedBox(height: 8),
                          AppButton(
                            label: 'Move to Cart',
                            icon: Icons.add_shopping_cart_rounded,
                            height: 34,
                            variant: AppButtonVariant.outline,
                            isFullWidth: true,
                            onPressed: () async {
                              final success =
                                  await cartProvider.addToCart(product);
                              if (success && context.mounted) {
                                wishlistProvider.removeFromWishlist(product.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product.productName} moved to cart!',
                                    ),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: AppColors.slate900,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
