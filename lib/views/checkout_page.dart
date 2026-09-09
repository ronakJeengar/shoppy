import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/domain/models/ui_state.dart';
import 'package:shopp_app/features/addresses/domain/entities/address_entity.dart';
import 'package:shopp_app/features/addresses/presentation/providers/address_providers.dart';
import 'package:shopp_app/features/cart/domain/entities/cart_entity.dart';
import 'package:shopp_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:shopp_app/features/checkout/presentation/providers/checkout_providers.dart';
import 'package:shopp_app/views/order_confirmation_page.dart';
import 'package:shopp_app/views/widgets/address_form_dialog.dart';
import 'package:shopp_app/views/widgets/app_button.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selected = ref.read(selectedAddressProvider);
      if (selected != null) {
        ref.read(checkoutNotifierProvider.notifier).validateCheckout(selected.id);
      }
    });
  }

  void _showAddressSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        final addresses = ref.watch(addressNotifierProvider).dataOrNull ?? [];
        final selected = ref.watch(selectedAddressProvider);

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select Delivery Address',
                    style: AppTypography.headingSmall,
                  ),
                  TextButton.icon(
                    icon: const AppIcon(AppIcons.add, size: 18),
                    label: const Text('New'),
                    onPressed: () {
                      Navigator.pop(ctx);
                      _openAddressForm(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (addresses.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text(
                      'No saved addresses. Tap New to add one.',
                      style: AppTypography.bodySmall.copyWith(color: AppColors.slate500),
                    ),
                  ),
                )
              else
                ...addresses.map((addr) {
                  final isSelected = selected?.id == addr.id;
                  return _buildSelectionTile(
                    title: addr.fullName,
                    subtitle:
                        '${addr.formattedAddress}\nPhone: ${addr.phone}',
                    isSelected: isSelected,
                    onTap: () {
                      ref.read(selectedAddressProvider.notifier).state = addr;
                      ref.read(checkoutNotifierProvider.notifier).validateCheckout(addr.id);
                      Navigator.pop(ctx);
                    },
                  );
                }),
            ],
          ),
        );
      },
    );
  }

  void _openAddressForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AddressFormBottomSheet(),
    ).then((_) {
      if (!mounted) return;
      final selected = ref.read(selectedAddressProvider);
      if (selected != null) {
        ref.read(checkoutNotifierProvider.notifier).validateCheckout(selected.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedAddress = ref.watch(selectedAddressProvider);
    final checkoutState = ref.watch(checkoutNotifierProvider);
    final cart = ref.watch(cartNotifierProvider).dataOrNull ?? const CartEntity.empty();

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Checkout', style: AppTypography.headingSmall),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressSection(selectedAddress),
            const SizedBox(height: 16),
            _buildShippingMethodSection(checkoutState, selectedAddress),
            const SizedBox(height: 16),
            _buildPaymentMethodSection(checkoutState),
            const SizedBox(height: 16),
            _buildOrderReviewSection(cart, checkoutState),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(
        context,
        selectedAddress,
        cart,
        checkoutState,
      ),
    );
  }

  Widget _buildAddressSection(AddressEntity? selected) {
    return Container(
      padding: const EdgeInsets.all(16),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: AppRadius.borderSm,
                    ),
                    child: const Center(child: AppIcon(AppIcons.address, color: AppColors.primary, size: 18)),
                  ),
                  const SizedBox(width: 10),
                  const Text('Delivery Address', style: AppTypography.headingSmall),
                ],
              ),
              if (selected != null)
                TextButton(
                  onPressed: () => _showAddressSelector(context),
                  child: Text(
                    'Change',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (selected == null)
            AppButton(
              label: 'Add Delivery Address',
              icon: AppIcons.addressAdd,
              variant: AppButtonVariant.outline,
              isFullWidth: true,
              onPressed: () => _openAddressForm(context),
            )
          else ...[
            Text(
              selected.fullName,
              style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              selected.formattedAddress,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.slate600),
            ),
            const SizedBox(height: 2),
            Text(
              'Phone: ${selected.phone}',
              style: AppTypography.caption.copyWith(color: AppColors.slate500),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildShippingMethodSection(
    CheckoutState checkoutState,
    AddressEntity? selectedAddress,
  ) {
    final isStandard = checkoutState.selectedShippingMethod == 'STANDARD';

    return Container(
      padding: const EdgeInsets.all(16),
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
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: AppRadius.borderSm,
                ),
                child: const Center(child: AppIcon(AppIcons.shipping, color: AppColors.primary, size: 18)),
              ),
              const SizedBox(width: 10),
              const Text('Shipping Method', style: AppTypography.headingSmall),
            ],
          ),
          const SizedBox(height: 14),
          _buildSelectionTile(
            title: 'Standard Delivery (3-5 Days)',
            subtitle: 'Free on orders over \$100.00, otherwise \$15.00',
            isSelected: isStandard,
            onTap: () {
              ref.read(checkoutNotifierProvider.notifier).setShippingMethod('STANDARD');
              if (selectedAddress != null) {
                ref.read(checkoutNotifierProvider.notifier).validateCheckout(selectedAddress.id);
              }
            },
          ),
          _buildSelectionTile(
            title: 'Express Delivery (1-2 Days)',
            subtitle: 'Flat rate \$25.00 with priority fulfillment',
            isSelected: !isStandard,
            onTap: () {
              ref.read(checkoutNotifierProvider.notifier).setShippingMethod('EXPRESS');
              if (selectedAddress != null) {
                ref.read(checkoutNotifierProvider.notifier).validateCheckout(selectedAddress.id);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection(CheckoutState checkoutState) {
    final currentMethod = checkoutState.selectedPaymentMethod;

    return Container(
      padding: const EdgeInsets.all(16),
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
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: AppRadius.borderSm,
                ),
                child: const Center(child: AppIcon(AppIcons.payment, color: AppColors.primary, size: 18)),
              ),
              const SizedBox(width: 10),
              const Text('Payment Method', style: AppTypography.headingSmall),
            ],
          ),
          const SizedBox(height: 14),
          _buildSelectionTile(
            title: 'Credit / Debit Card',
            subtitle: 'Instant secure checkout via Stripe',
            isSelected: currentMethod == 'CARD',
            icon: AppIcons.creditCard,
            onTap: () => ref.read(checkoutNotifierProvider.notifier).setPaymentMethod('CARD'),
          ),
          _buildSelectionTile(
            title: 'Cash on Delivery (COD)',
            subtitle: 'Pay with cash upon receipt of order',
            isSelected: currentMethod == 'COD',
            icon: AppIcons.cash,
            onTap: () => ref.read(checkoutNotifierProvider.notifier).setPaymentMethod('COD'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderReviewSection(
    CartEntity cart,
    CheckoutState checkoutState,
  ) {
    final validation = checkoutState.validation;
    final subtotal = validation?.subtotal ?? cart.subtotal;
    final shipping = validation?.shippingFee ?? (checkoutState.selectedShippingMethod == 'EXPRESS' ? 25.0 : (subtotal >= 100 ? 0.0 : 15.0));
    final tax = validation?.tax ?? cart.tax;
    final total = validation?.grandTotal ?? (subtotal + shipping + tax);

    return Container(
      padding: const EdgeInsets.all(16),
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
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: AppRadius.borderSm,
                ),
                child: const Center(child: AppIcon(AppIcons.orders, color: AppColors.primary, size: 18)),
              ),
              const SizedBox(width: 10),
              const Text('Order Summary', style: AppTypography.headingSmall),
            ],
          ),
          const SizedBox(height: 14),
          _summaryRow('Items Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _summaryRow(
            'Shipping Fee',
            shipping == 0 ? 'FREE' : '\$${shipping.toStringAsFixed(2)}',
            valueColor: shipping == 0 ? AppColors.success : null,
          ),
          const SizedBox(height: 8),
          _summaryRow('Estimated Tax (8%)', '\$${tax.toStringAsFixed(2)}'),
          const Divider(height: 24, color: AppColors.slate200),
          _summaryRow(
            'Order Total',
            '\$${total.toStringAsFixed(2)}',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionTile({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
    String? icon,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.borderMd,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary50.withValues(alpha: 0.5) : AppColors.slate50,
          borderRadius: AppRadius.borderMd,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.slate200,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.slate400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
            if (icon != null) ...[
              AppIcon(icon, size: 20, color: isSelected ? AppColors.primary : AppColors.slate600),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.slate900,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTypography.caption.copyWith(color: AppColors.slate500),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildBottomBar(
    BuildContext context,
    AddressEntity? selectedAddress,
    CartEntity cart,
    CheckoutState checkoutState,
  ) {
    final validation = checkoutState.validation;
    final subtotal = validation?.subtotal ?? cart.subtotal;
    final shipping = validation?.shippingFee ?? (checkoutState.selectedShippingMethod == 'EXPRESS' ? 25.0 : (subtotal >= 100 ? 0.0 : 15.0));
    final tax = validation?.tax ?? cart.tax;
    final displayTotal = validation?.grandTotal ?? (subtotal + shipping + tax);
    final canPlace = selectedAddress != null && !checkoutState.isPlacingOrder;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.bottomBar,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Payable',
                  style: AppTypography.caption.copyWith(color: AppColors.slate500),
                ),
                Text(
                  '\$${displayTotal.toStringAsFixed(2)}',
                  style: AppTypography.priceCard.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: AppButton(
                label: checkoutState.isPlacingOrder ? 'Processing...' : 'Place Order',
                icon: AppIcons.lock,
                isLoading: checkoutState.isPlacingOrder,
                isFullWidth: true,
                onPressed: canPlace
                    ? () async {
                        final order = await ref.read(checkoutNotifierProvider.notifier).placeOrder(
                          addressId: selectedAddress.id,
                        );
                        if (order != null && context.mounted) {
                          ref.read(cartNotifierProvider.notifier).loadCart();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OrderConfirmationPage(order: order),
                            ),
                          );
                        } else if (context.mounted && checkoutState.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(checkoutState.error!),
                              backgroundColor: AppColors.error,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
