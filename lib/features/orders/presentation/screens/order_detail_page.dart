import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/core/widgets/app_network_image.dart';
import '../../domain/entities/order_entity.dart';
import 'package:shopp_app/features/orders/presentation/providers/order_providers.dart';
import '../widgets/order_timeline.dart';
import 'package:shopp_app/features/reviews/presentation/widgets/write_review_dialog.dart';
import 'package:shopp_app/core/utils/currency_formatter.dart';

class OrderDetailPage extends ConsumerStatefulWidget {
  final String orderId;

  const OrderDetailPage({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends ConsumerState<OrderDetailPage> {
  bool _isCancelling = false;

  Color _getStatusColor(String status) {
    switch (status) {
      case 'CONFIRMED':
        return AppColors.info;
      case 'PROCESSING':
        return AppColors.warning;
      case 'SHIPPED':
        return AppColors.violet;
      case 'DELIVERED':
        return AppColors.success;
      case 'CANCELLED':
        return AppColors.error;
      default:
        return AppColors.slate500;
    }
  }

  void _showCancelDialog(OrderEntity order) {
    final reasons = [
      'Found a better price elsewhere',
      'Ordered by mistake',
      'Delivery date is too late',
      'Need to change shipping address',
      'Other',
    ];
    String selectedReason = reasons.first;

    showDialog(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Cancel Order'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you sure you want to cancel order ${order.orderNumber}?',
                    style: AppTypography.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Reason for cancellation:',
                    style: AppTypography.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: selectedReason,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    ),
                    items: reasons
                        .map(
                          (r) => DropdownMenuItem(
                            value: r,
                            child: Text(r, style: AppTypography.bodyMedium),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setDialogState(() => selectedReason = val);
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text('Keep Order'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    Navigator.pop(dialogCtx);
                    setState(() => _isCancelling = true);
                    final success = await ref
                        .read(ordersNotifierProvider.notifier)
                        .cancelOrder(order.id, reason: selectedReason);

                    if (!mounted) return;
                    setState(() => _isCancelling = false);
                    if (success) {
                      ref.invalidate(orderDetailProvider(order.id));
                      ScaffoldMessenger.of(this.context).showSnackBar(
                        const SnackBar(
                          content: Text('Order cancelled successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(this.context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to cancel order'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Cancel Order'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderAsync = ref.watch(orderDetailProvider(widget.orderId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: AppTypography.headingSmall,
        ),
      ),
      body: orderAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        error: (err, _) => Center(
          child: Text(
            err.toString().replaceAll('Exception: ', ''),
            style: AppTypography.bodyMedium.copyWith(color: AppColors.error),
          ),
        ),
        data: (order) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Order Header Card
            _buildHeaderCard(context, order),
            const SizedBox(height: 16),

            // 2. Tracking Timeline Card
            OrderTimeline(order: order),
            const SizedBox(height: 16),

            // 3. Shipping Address Card
            if (order.shippingAddress != null)
              _buildAddressCard(order),
            if (order.shippingAddress != null)
              const SizedBox(height: 16),

            // 4. Purchased Items Snapshot Card
            _buildItemsCard(order),
            const SizedBox(height: 16),

            // 5. Payment Details Card
            _buildPaymentCard(order),
            const SizedBox(height: 16),

            // 6. Price Breakdown Card
            _buildPriceBreakdownCard(order, theme),
            const SizedBox(height: 20),

            // View Tax Invoice Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.borderMd,
                  ),
                ),
                icon: const AppIcon(
                  AppIcons.invoice,
                  size: AppIconSizes.action,
                  color: Colors.white,
                ),
                label: Text(
                  'View Tax Invoice',
                  style: AppTypography.buttonText.copyWith(color: Colors.white),
                ),
                onPressed: () => context.push('/orders/${order.id}/invoice'),
              ),
            ),
            const SizedBox(height: 12),

            // 7. Cancel Order Action Button (if eligible)
            if (order.canCancel && !order.isCancelled)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadius.borderMd,
                    ),
                  ),
                  icon: _isCancelling
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.error,
                          ),
                        )
                      : const AppIcon(AppIcons.cancel, size: AppIconSizes.action),
                  label: Text(
                    _isCancelling
                        ? 'Cancelling Order...'
                        : 'Cancel Order',
                    style: AppTypography.buttonText.copyWith(color: AppColors.error),
                  ),
                  onPressed: _isCancelling
                      ? null
                      : () => _showCancelDialog(order),
                ),
              ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, OrderEntity order) {
    final statusColor = _getStatusColor(order.status);

    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderMd,
        side: BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Number',
                  style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: order.orderNumber));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order number copied'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        order.orderNumber,
                        style: AppTypography.titleSmall,
                      ),
                      const SizedBox(width: 4),
                      const AppIcon(AppIcons.copy, size: AppIconSizes.sm, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Status',
                  style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: AppRadius.borderSm,
                    border: Border.all(
                      color: statusColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    order.status,
                    style: AppTypography.labelSmall.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Date',
                  style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                ),
                Text(
                  '${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year} at ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}',
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(OrderEntity order) {
    final addr = order.shippingAddress!;

    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderMd,
        side: BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                AppIcon(AppIcons.location,
                    color: AppColors.primary, size: AppIconSizes.md),
                SizedBox(width: 8),
                Text(
                  'Shipping Address',
                  style: AppTypography.headingSmall,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              addr.fullName,
              style: AppTypography.titleSmall,
            ),
            const SizedBox(height: 2),
            Text(
              addr.formattedAddress,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 2),
            Text(
              'Phone: ${addr.phone}',
              style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard(OrderEntity order) {
    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderMd,
        side: BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purchased Items (${order.orderItems.length})',
              style: AppTypography.headingSmall,
            ),
            const SizedBox(height: 12),
            ...order.orderItems.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppNetworkImage(
                          imageUrl: item.productImage,
                          width: 50,
                          height: 50,
                          borderRadius: AppRadius.borderSm,
                          fit: BoxFit.cover,
                          memCacheWidth: 150,
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
                                style: AppTypography.titleSmall,
                              ),
                              Text(
                                'Sold by ${item.sellerName}',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                'Qty: ${item.quantity} × ${CurrencyFormatter.format(item.unitPrice)}',
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(item.lineTotal),
                          style: AppTypography.titleSmall,
                        ),
                      ],
                    ),
                    if (order.status == 'DELIVERED')
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            foregroundColor: AppColors.accent,
                          ),
                          icon: const AppIcon(AppIcons.starEmpty, size: AppIconSizes.button),
                          label: const Text(
                            'Review Item',
                            style: AppTypography.bodySmall,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => WriteReviewDialog(
                                productId: item.productId,
                                productName: item.productName,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(OrderEntity order) {
    final payment = order.payment;

    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderMd,
        side: BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                AppIcon(AppIcons.payment, color: AppColors.primary, size: AppIconSizes.medium),
                SizedBox(width: 8),
                Text(
                  'Payment Details',
                  style: AppTypography.headingSmall,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                Text(
                  order.isCod ? 'Cash on Delivery (COD)' : (payment?.paymentMethod ?? 'CARD'),
                  style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Status',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                Text(
                  order.isCod && payment?.status == 'PENDING'
                      ? 'Pending (Pay on Delivery)'
                      : (payment?.status ?? 'COMPLETED'),
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: (payment?.status == 'REFUNDED')
                        ? AppColors.warning
                        : (payment?.status == 'COMPLETED')
                            ? AppColors.success
                            : (order.isCod)
                                ? AppColors.info
                                : AppColors.slate900,
                  ),
                ),
              ],
            ),
            if (payment != null && payment.transactionId.isNotEmpty) ...[
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction ID',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  Text(
                    payment.transactionId,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPriceBreakdownCard(OrderEntity order, ThemeData theme) {
    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderMd,
        side: BorderSide(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Total Breakdown',
              style: AppTypography.headingSmall,
            ),
            const SizedBox(height: 12),
            _summaryRow('Subtotal', CurrencyFormatter.format(order.subtotal)),
            const SizedBox(height: 6),
            _summaryRow(
              'Shipping',
              order.shippingFee == 0
                  ? 'FREE'
                  : CurrencyFormatter.format(order.shippingFee),
              valueColor: order.shippingFee == 0 ? AppColors.success : null,
            ),
            if (order.isCod) ...[
              const SizedBox(height: 6),
              _summaryRow(
                'COD Fee',
                order.codFee == 0 ? 'FREE' : CurrencyFormatter.format(order.codFee),
                valueColor: order.codFee == 0 ? AppColors.success : null,
              ),
            ],
            const SizedBox(height: 6),
            if (order.taxBreakdown != null) ...[
              if (order.taxBreakdown!.taxableAmount > 0) ...[
                _summaryRow('Taxable Value', CurrencyFormatter.format(order.taxBreakdown!.taxableAmount)),
                const SizedBox(height: 6),
              ],
              if (order.taxBreakdown!.isInterState)
                _summaryRow('IGST (Inter-State)', CurrencyFormatter.format(order.taxBreakdown!.igst))
              else ...[
                _summaryRow('CGST (Central Tax)', CurrencyFormatter.format(order.taxBreakdown!.cgst)),
                const SizedBox(height: 6),
                _summaryRow('SGST (State Tax)', CurrencyFormatter.format(order.taxBreakdown!.sgst)),
              ],
            ] else ...[
              _summaryRow('Estimated GST (Incl.)', CurrencyFormatter.format(order.tax)),
            ],
            const Divider(height: 20),
            _summaryRow(
              order.isCod && !order.isDelivered ? 'Total (Payable on Delivery)' : 'Total Paid',
              CurrencyFormatter.format(order.totalAmount),
              isTotal: true,
              valueColor: theme.primaryColor,
            ),
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
          style: isTotal
              ? AppTypography.titleSmall
              : AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: isTotal
              ? AppTypography.headlineSmall.copyWith(color: valueColor ?? AppColors.slate900)
              : AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? AppColors.slate900,
                ),
        ),
      ],
    );
  }
}
