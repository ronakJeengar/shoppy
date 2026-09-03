import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/address_model.dart';
import 'package:shopp_app/providers/address_provider.dart';
import 'package:shopp_app/providers/cart_provider.dart';
import 'package:shopp_app/providers/checkout_provider.dart';
import 'package:shopp_app/views/order_confirmation_page.dart';
import 'package:shopp_app/views/widgets/address_form_dialog.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final addressProvider = context.read<AddressProvider>();
      final checkoutProvider = context.read<CheckoutProvider>();

      if (addressProvider.selectedAddress != null) {
        checkoutProvider.validateCheckout(
          addressProvider.selectedAddress!.id,
        );
      }
    });
  }

  void _showAddressSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Consumer2<AddressProvider, CheckoutProvider>(
          builder: (context, addrProv, checkoutProv, _) {
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('New'),
                        onPressed: () {
                          Navigator.pop(ctx);
                          _openAddressForm(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (addrProv.addresses.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text('No saved addresses. Tap New to add one.'),
                      ),
                    )
                  else
                    ...addrProv.addresses.map((addr) {
                      final isSelected =
                          addrProv.selectedAddress?.id == addr.id;
                      return _buildSelectionTile(
                        title: addr.fullName,
                        subtitle:
                            '${addr.formattedAddress}\nPhone: ${addr.phone}',
                        isSelected: isSelected,
                        onTap: () {
                          addrProv.selectAddress(addr);
                          checkoutProv.validateCheckout(addr.id);
                          Navigator.pop(ctx);
                        },
                      );
                    }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _openAddressForm(BuildContext context, {AddressModel? address}) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => AddressFormBottomSheet(existingAddress: address),
    );

    if (!context.mounted) return;

    if (result == true) {
      final addrProv = context.read<AddressProvider>();
      if (addrProv.selectedAddress != null) {
        context
            .read<CheckoutProvider>()
            .validateCheckout(addrProv.selectedAddress!.id);
      }
    }
  }

  void _handlePlaceOrder() async {
    final addressProvider = context.read<AddressProvider>();
    final checkoutProvider = context.read<CheckoutProvider>();
    final cartProvider = context.read<CartProvider>();

    if (addressProvider.selectedAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select or add a delivery address'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final order = await checkoutProvider.placeOrderAndPay(
      addressId: addressProvider.selectedAddress!.id,
      cartProvider: cartProvider,
    );

    if (mounted) {
      if (order != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => OrderConfirmationPage(order: order),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              checkoutProvider.errorMessage ?? 'Failed to place order.',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    final checkoutProvider = context.watch<CheckoutProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Delivery Address Card
          _buildAddressSection(addressProvider, checkoutProvider),
          const SizedBox(height: 16),

          // 2. Shipping Method Selection
          _buildShippingMethodSection(checkoutProvider, addressProvider),
          const SizedBox(height: 16),

          // 3. Payment Method Selection
          _buildPaymentMethodSection(checkoutProvider),
          const SizedBox(height: 16),

          // 4. Order Summary Card
          _buildOrderSummarySection(checkoutProvider, theme),
          const SizedBox(height: 80),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(
        context,
        checkoutProvider,
        addressProvider,
        theme,
      ),
    );
  }

  Widget _buildAddressSection(
    AddressProvider addressProvider,
    CheckoutProvider checkoutProvider,
  ) {
    final selected = addressProvider.selectedAddress;

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (selected != null)
                  TextButton(
                    onPressed: () => _showAddressSelector(context),
                    child: const Text('Change'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (selected == null)
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.add_location_alt),
                label: const Text('Add Delivery Address'),
                onPressed: () => _openAddressForm(context),
              )
            else ...[
              Text(
                selected.fullName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                selected.formattedAddress,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 2),
              Text(
                'Phone: ${selected.phone}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildShippingMethodSection(
    CheckoutProvider checkoutProvider,
    AddressProvider addressProvider,
  ) {
    final isStandard = checkoutProvider.shippingMethod == 'STANDARD';

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  'Shipping Method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildSelectionTile(
              title: 'Standard Delivery (3-5 Days)',
              subtitle: 'Free on orders over \$50.00, otherwise \$4.99',
              isSelected: isStandard,
              onTap: () {
                checkoutProvider.setShippingMethod(
                  'STANDARD',
                  addressProvider.selectedAddress?.id ?? '',
                );
              },
            ),
            _buildSelectionTile(
              title: 'Express Delivery (1-2 Days)',
              subtitle: 'Flat rate \$9.99 with priority dispatch',
              isSelected: !isStandard,
              onTap: () {
                checkoutProvider.setShippingMethod(
                  'EXPRESS',
                  addressProvider.selectedAddress?.id ?? '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSection(CheckoutProvider checkoutProvider) {
    final currentMethod = checkoutProvider.paymentMethod;

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.payment, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildSelectionTile(
              title: 'Credit / Debit Card',
              subtitle: 'Visa, Mastercard, American Express',
              isSelected: currentMethod == 'CARD',
              trailing: const Icon(Icons.credit_card, size: 20),
              onTap: () => checkoutProvider.setPaymentMethod('CARD'),
            ),
            _buildSelectionTile(
              title: 'UPI / Instant Bank Pay',
              subtitle: 'Google Pay, PhonePe, Paytm, NetBanking',
              isSelected: currentMethod == 'UPI',
              trailing: const Icon(Icons.account_balance, size: 20),
              onTap: () => checkoutProvider.setPaymentMethod('UPI'),
            ),
            _buildSelectionTile(
              title: 'Cash on Delivery (COD)',
              subtitle: 'Pay upon doorstep delivery',
              isSelected: currentMethod == 'COD',
              trailing: const Icon(Icons.local_atm, size: 20),
              onTap: () => checkoutProvider.setPaymentMethod('COD'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummarySection(
    CheckoutProvider checkoutProvider,
    ThemeData theme,
  ) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (checkoutProvider.isValidating)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            else ...[
              _summaryRow(
                'Subtotal',
                '\$${checkoutProvider.subtotal.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 8),
              _summaryRow(
                'Shipping',
                checkoutProvider.shippingFee == 0
                    ? 'FREE'
                    : '\$${checkoutProvider.shippingFee.toStringAsFixed(2)}',
                valueColor:
                    checkoutProvider.shippingFee == 0 ? Colors.green : null,
              ),
              const SizedBox(height: 8),
              _summaryRow(
                'Estimated Tax (8%)',
                '\$${checkoutProvider.tax.toStringAsFixed(2)}',
              ),
              const Divider(height: 20),
              _summaryRow(
                'Total Amount',
                '\$${checkoutProvider.grandTotal.toStringAsFixed(2)}',
                isTotal: true,
                valueColor: theme.primaryColor,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionTile({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.shade50.withValues(alpha: 0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool isTotal = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 15 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black87 : Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 17 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: valueColor ?? (isTotal ? Colors.black : Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    CheckoutProvider checkoutProvider,
    AddressProvider addressProvider,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Final Amount',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '\$${checkoutProvider.grandTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: checkoutProvider.isProcessingOrder
                  ? null
                  : _handlePlaceOrder,
              child: checkoutProvider.isProcessingOrder
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
