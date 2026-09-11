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
import 'package:shopp_app/core/utils/ui_state.dart';
import 'package:shopp_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/wishlist/presentation/providers/wishlist_providers.dart';
import 'package:shopp_app/features/catalog/presentation/screens/home_page.dart';
import 'package:shopp_app/features/catalog/presentation/screens/product_detail_page.dart';
import 'package:shopp_app/core/widgets/app_button.dart';
import 'package:shopp_app/core/widgets/app_network_image.dart';
import 'package:shopp_app/core/widgets/empty_state.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistState = ref.watch(wishlistNotifierProvider);
    final items = wishlistState.dataOrNull ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: Text(
          '${AppStrings.wishlist.title} (${items.length})',
          style: AppTypography.headingSmall,
        ),
      ),
      body: _buildBody(context, ref, wishlistState, items),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    UiState<List<ProductEntity>> wishlistState,
    List<ProductEntity> items,
  ) {
    if (wishlistState.isLoading && items.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      );
    }

    if (items.isEmpty) {
      return EmptyStateView(
        icon: AppIcons.wishlist,
        iconColor: AppColors.coral,
        title: AppStrings.wishlist.empty,
        description: AppStrings.wishlist.emptySubtitle,
        buttonText: AppStrings.cart.startShopping,
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
      onRefresh: () => ref.read(wishlistNotifierProvider.notifier).loadWishlist(),
      child: GridView.builder(
        padding: AppDimensions.cardPadding,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.62,
          crossAxisSpacing: AppDimensions.md,
          mainAxisSpacing: AppDimensions.md,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final product = items[index];

          return Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.border),
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
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: AppNetworkImage(
                              imageUrl: product.imageUrl,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(AppRadius.md),
                              ),
                              fit: BoxFit.cover,
                              memCacheWidth: 350,
                            ),
                          ),
                          Positioned(
                            top: AppDimensions.sm,
                            right: AppDimensions.sm,
                            child: Material(
                              color: AppColors.white.withValues(alpha: 0.92),
                              shape: const CircleBorder(),
                              elevation: 2,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () {
                                  ref.read(wishlistNotifierProvider.notifier).remove(product.id);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: AppIcon(
                                    AppIcons.wishlistFilled,
                                    color: AppColors.coral,
                                    size: AppIconSizes.productAction,
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
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.xs),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: AppTypography.priceCard,
                          ),
                          const SizedBox(height: AppDimensions.sm),
                          AppButton(
                            label: AppStrings.wishlist.moveToCart,
                            icon: AppIcons.addToCart,
                            height: AppDimensions.buttonHeightSm,
                            variant: AppButtonVariant.outline,
                            isFullWidth: true,
                            onPressed: () async {
                              final success = await ref
                                  .read(cartNotifierProvider.notifier)
                                  .addToCart(product.id, quantity: 1);
                              if (success && context.mounted) {
                                ref.read(wishlistNotifierProvider.notifier).remove(product.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AppStrings.wishlist.movedToCart(product.productName),
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
