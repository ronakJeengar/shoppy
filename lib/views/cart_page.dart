import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/views/checkout_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';
import 'package:shopp_app/views/widgets/cart_item_tile.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';
import 'package:shopp_app/views/widgets/error_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void _confirmClearCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppStrings.cart.clearCart, style: AppTypography.headingSmall),
        content: Text(
          AppStrings.cart.clearCartConfirm,
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(AppStrings.common.cancel, style: const TextStyle(color: AppColors.textSecondary)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<CartProvider>().clearCart();
            },
            child: Text(AppStrings.common.delete, style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${AppStrings.cart.title} (${cartProvider.totalItemCount})',
          style: AppTypography.headingSmall,
        ),
        actions: [
          if (cartProvider.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined, color: AppColors.textSecondary),
              tooltip: AppStrings.cart.clearCart,
              onPressed: () => _confirmClearCart(context),
            ),
        ],
      ),
      body: _buildBody(context, cartProvider),
      bottomNavigationBar: cartProvider.items.isNotEmpty
          ? _buildCheckoutBar(context, cartProvider)
          : null,
    );
  }

  Widget _buildBody(BuildContext context, CartProvider cartProvider) {
    if (cartProvider.isLoading && cartProvider.items.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      );
    }

    if (cartProvider.errorMessage != null && cartProvider.items.isEmpty) {
      return ErrorStateView(
        message: cartProvider.errorMessage!,
        onRetry: () => cartProvider.loadCart(),
      );
    }

    if (cartProvider.items.isEmpty) {
      return EmptyStateView(
        icon: Icons.shopping_cart_outlined,
        title: AppStrings.cart.empty,
        description: AppStrings.cart.emptySubtitle,
        buttonText: AppStrings.cart.startShopping,
        onButtonPressed: () => Navigator.pop(context),
      );
    }

    const double freeShippingThreshold = 100.0;
    final double currentSubtotal = cartProvider.subtotal;
    final bool qualifiesForFreeShipping = currentSubtotal >= freeShippingThreshold;
    final double neededForFreeShipping = (freeShippingThreshold - currentSubtotal).clamp(0.0, freeShippingThreshold);
    final double freeShippingProgress = (currentSubtotal / freeShippingThreshold).clamp(0.0, 1.0);

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => cartProvider.loadCart(),
      child: ListView(
        padding: AppDimensions.paddingVerticalMd,
        children: [
          // Free Shipping Progress Meter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimensions.lg, vertical: 4),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.border),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      qualifiesForFreeShipping ? Icons.check_circle_rounded : Icons.local_shipping_outlined,
                      size: AppIconSizes.sm + 2,
                      color: qualifiesForFreeShipping ? AppColors.success : AppColors.primary,
                    ),
                    const SizedBox(width: AppDimensions.sm),
                    Expanded(
                      child: Text(
                        qualifiesForFreeShipping
                            ? AppStrings.cart.freeShippingUnlocked
                            : AppStrings.cart.freeShippingAddMore(neededForFreeShipping),
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: qualifiesForFreeShipping ? AppColors.success : AppColors.slate800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.sm),
                ClipRRect(
                  borderRadius: AppRadius.borderFull,
                  child: LinearProgressIndicator(
                    value: freeShippingProgress,
                    minHeight: 6,
                    backgroundColor: AppColors.slate100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      qualifiesForFreeShipping ? AppColors.success : AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // Cart Items List
          ...cartProvider.items.map((item) {
            return CartItemTile(
              item: item,
              onQuantityChanged: (qty) {
                cartProvider.updateQuantity(item.productId, qty);
              },
              onRemove: () {
                cartProvider.removeItem(item.productId);
              },
            );
          }),

          const SizedBox(height: AppDimensions.md),

          // Order Summary Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimensions.lg, vertical: AppDimensions.sm),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.border),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.cart.orderSummary, style: AppTypography.headingSmall),
                const SizedBox(height: 14),
                _summaryRow(AppStrings.cart.subtotal, '\$${cartProvider.subtotal.toStringAsFixed(2)}'),
                const SizedBox(height: AppDimensions.sm),
                _summaryRow(
                  AppStrings.cart.shipping,
                  cartProvider.shipping == 0 ? AppStrings.cart.shippingFree : '\$${cartProvider.shipping.toStringAsFixed(2)}',
                  valueColor: cartProvider.shipping == 0 ? AppColors.success : null,
                ),
                const SizedBox(height: AppDimensions.sm),
                _summaryRow(AppStrings.cart.tax, '\$${cartProvider.tax.toStringAsFixed(2)}'),
                const Divider(height: AppDimensions.xxl, color: AppColors.divider),
                _summaryRow(
                  AppStrings.cart.estimatedTotal,
                  '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                  isBold: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppDimensions.xxxl),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary)
              : AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: isBold
              ? AppTypography.headingSmall.copyWith(color: AppColors.primary)
              : AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? AppColors.textPrimary,
                ),
        ),
      ],
    );
  }

  Widget _buildCheckoutBar(BuildContext context, CartProvider cartProvider) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppShadows.bottomBar,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.cart.total,
                style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
              ),
              Text(
                '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                style: AppTypography.priceCard.copyWith(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(width: AppDimensions.xl),
          Expanded(
            child: AppButton(
              label: AppStrings.cart.proceedToCheckout,
              icon: Icons.arrow_forward_rounded,
              isFullWidth: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
