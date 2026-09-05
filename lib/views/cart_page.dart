import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
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
        title: const Text('Clear Cart', style: AppTypography.headingSmall),
        content: const Text(
          'Are you sure you want to remove all items from your cart?',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: AppColors.slate600)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<CartProvider>().clearCart();
            },
            child: const Text('Clear All', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

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
          'Shopping Cart (${cartProvider.totalItemCount})',
          style: AppTypography.headingSmall,
        ),
        actions: [
          if (cartProvider.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined, color: AppColors.slate600),
              tooltip: 'Clear Cart',
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
        title: 'Your cart is empty',
        description: 'Looks like you haven\'t added any items yet. Discover trending products today!',
        buttonText: 'Start Shopping',
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          // Free Shipping Progress Meter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.slate200),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      qualifiesForFreeShipping ? Icons.check_circle_rounded : Icons.local_shipping_outlined,
                      size: 18,
                      color: qualifiesForFreeShipping ? AppColors.success : AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        qualifiesForFreeShipping
                            ? '🎉 You unlocked FREE Standard Shipping!'
                            : 'Add \$${neededForFreeShipping.toStringAsFixed(2)} more for FREE Delivery',
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: qualifiesForFreeShipping ? AppColors.success : AppColors.slate800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
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

          const SizedBox(height: 12),

          // Order Summary Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.borderMd,
              border: Border.all(color: AppColors.slate200),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Summary', style: AppTypography.headingSmall),
                const SizedBox(height: 14),
                _summaryRow('Subtotal', '\$${cartProvider.subtotal.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                _summaryRow(
                  'Shipping',
                  cartProvider.shipping == 0 ? 'FREE' : '\$${cartProvider.shipping.toStringAsFixed(2)}',
                  valueColor: cartProvider.shipping == 0 ? AppColors.success : null,
                ),
                const SizedBox(height: 8),
                _summaryRow('Estimated Tax', '\$${cartProvider.tax.toStringAsFixed(2)}'),
                const Divider(height: 24, color: AppColors.slate200),
                _summaryRow(
                  'Estimated Total',
                  '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                  isBold: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
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
              ? AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: AppColors.slate900)
              : AppTypography.bodyMedium.copyWith(color: AppColors.slate600),
        ),
        Text(
          value,
          style: isBold
              ? AppTypography.headingSmall.copyWith(color: AppColors.primary)
              : AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? AppColors.slate900,
                ),
        ),
      ],
    );
  }

  Widget _buildCheckoutBar(BuildContext context, CartProvider cartProvider) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.bottomBar,
        border: Border(
          top: BorderSide(color: AppColors.slate200, width: 1),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Amount',
                style: AppTypography.caption.copyWith(color: AppColors.slate500),
              ),
              Text(
                '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                style: AppTypography.priceCard.copyWith(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: AppButton(
              label: 'Proceed to Checkout',
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
