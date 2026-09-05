import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/orders_page.dart';
import 'package:shopp_app/views/widgets/app_button.dart';

class OrderConfirmationPage extends StatelessWidget {
  final OrderModel order;

  const OrderConfirmationPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.slate50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          elevation: 0,
          title: const Text('Order Confirmation', style: AppTypography.headingSmall),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Success Header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: AppColors.successLight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      size: 44,
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Order Confirmed',
                    style: AppTypography.headingLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Thank you for your order!',
                    style: AppTypography.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Order Number & Status Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.borderMd,
                border: Border.all(color: AppColors.slate200),
                boxShadow: AppShadows.card,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Reference',
                        style: AppTypography.caption.copyWith(color: AppColors.slate500),
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: order.orderNumber));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order number copied!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              order.orderNumber,
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.slate900,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.copy_rounded, size: 14, color: AppColors.primary),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: AppColors.slate200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Status',
                        style: AppTypography.caption.copyWith(color: AppColors.slate500),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.successLight,
                          borderRadius: AppRadius.borderFull,
                        ),
                        child: Text(
                          order.status,
                          style: AppTypography.label.copyWith(color: AppColors.success),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Method',
                        style: AppTypography.caption.copyWith(color: AppColors.slate500),
                      ),
                      Text(
                        order.shippingMethod == 'EXPRESS'
                            ? 'Express (1-2 Days)'
                            : 'Standard (3-5 Days)',
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Delivery Address Snapshot Card
            if (order.shippingAddress != null)
              Container(
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
                        const Icon(Icons.location_on_rounded, size: 18, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Shipping Address',
                          style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      order.shippingAddress!.fullName,
                      style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.shippingAddress!.formattedAddress,
                      style: AppTypography.caption.copyWith(color: AppColors.slate600),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),

            // Order Items & Pricing Breakdown Card
            Container(
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
                  Text(
                    'Ordered Items (${order.orderItems.length})',
                    style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...order.orderItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: AppRadius.borderSm,
                            child: Container(
                              width: 44,
                              height: 44,
                              color: AppColors.slate100,
                              child: item.productImage.isNotEmpty
                                  ? Image.network(item.productImage, fit: BoxFit.cover)
                                  : const Icon(Icons.shopping_bag_outlined, color: AppColors.slate400),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Qty: ${item.quantity} × \$${item.unitPrice.toStringAsFixed(2)}',
                                  style: AppTypography.caption.copyWith(color: AppColors.slate500),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$${item.lineTotal.toStringAsFixed(2)}',
                            style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                  const Divider(height: 20, color: AppColors.slate200),
                  _summaryRow('Subtotal', '\$${order.subtotal.toStringAsFixed(2)}'),
                  const SizedBox(height: 6),
                  _summaryRow(
                    'Shipping',
                    order.shippingFee == 0 ? 'FREE' : '\$${order.shippingFee.toStringAsFixed(2)}',
                    color: order.shippingFee == 0 ? AppColors.success : null,
                  ),
                  const SizedBox(height: 6),
                  _summaryRow('Tax', '\$${order.tax.toStringAsFixed(2)}'),
                  const Divider(height: 20, color: AppColors.slate200),
                  _summaryRow(
                    'Total Paid',
                    '\$${order.totalAmount.toStringAsFixed(2)}',
                    isTotal: true,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Actions
            AppButton(
              label: 'Continue Shopping',
              icon: Icons.store_rounded,
              isFullWidth: true,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 10),
            AppButton(
              label: 'View All Orders',
              icon: Icons.receipt_long_rounded,
              variant: AppButtonVariant.outline,
              isFullWidth: true,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const OrdersPage()),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.bold)
              : AppTypography.bodySmall.copyWith(color: AppColors.slate600),
        ),
        Text(
          value,
          style: isTotal
              ? AppTypography.headingSmall.copyWith(color: color ?? AppColors.primary)
              : AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color ?? AppColors.slate900,
                ),
        ),
      ],
    );
  }
}
