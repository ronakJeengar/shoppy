import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/features/orders/presentation/providers/order_providers.dart';
import 'package:shopp_app/views/widgets/app_network_image.dart';
import 'package:shopp_app/views/widgets/order_timeline.dart';
import 'package:shopp_app/views/widgets/write_review_dialog.dart';

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
        return Colors.blue;
      case 'PROCESSING':
        return Colors.orange;
      case 'SHIPPED':
        return Colors.purple;
      case 'DELIVERED':
        return Colors.green;
      case 'CANCELLED':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showCancelDialog(OrderModel order) {
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
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Reason for cancellation:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
                            child: Text(r, style: const TextStyle(fontSize: 13)),
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
          style: TextStyle(fontWeight: FontWeight.bold),
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
            style: const TextStyle(color: Colors.red),
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
            const SizedBox(height: 24),

            // 7. Cancel Order Action Button (if eligible)
            if (order.canCancel && !order.isCancelled)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: _isCancelling
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red,
                          ),
                        )
                      : const AppIcon(AppIcons.cancel, size: 18),
                  label: Text(
                    _isCancelling
                        ? 'Cancelling Order...'
                        : 'Cancel Order',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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

  Widget _buildHeaderCard(BuildContext context, OrderModel order) {
    final statusColor = _getStatusColor(order.status);

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Number',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const AppIcon(AppIcons.copy, size: 14, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Status',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: statusColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Date',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year} at ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 13,
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


  Widget _buildAddressCard(OrderModel order) {
    final addr = order.shippingAddress!;

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
                AppIcon(AppIcons.address,
                    color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              addr.fullName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              addr.formattedAddress,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 2),
            Text(
              'Phone: ${addr.phone}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard(OrderModel order) {
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
            Text(
              'Purchased Items (${order.orderItems.length})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(8),
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
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Sold by ${item.sellerName}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            'Qty: ${item.quantity} × \$${item.unitPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${item.lineTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                if (order.status == 'DELIVERED')
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        foregroundColor: Colors.amber.shade800,
                      ),
                      icon: const AppIcon(AppIcons.starEmpty, size: 16),
                      label: const Text(
                        'Review Item',
                        style: TextStyle(fontSize: 12),
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

  Widget _buildPaymentCard(OrderModel order) {
    final payment = order.payment;

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
                AppIcon(AppIcons.payment, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  'Payment Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  payment?.paymentMethod ?? 'CARD',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Status',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  payment?.status ?? 'COMPLETED',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: (payment?.status == 'REFUNDED')
                        ? Colors.orange
                        : (payment?.status == 'COMPLETED')
                            ? Colors.green
                            : Colors.black87,
                  ),
                ),
              ],
            ),
            if (payment != null && payment.transactionId.isNotEmpty) ...[
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transaction ID',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  Text(
                    payment.transactionId,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPriceBreakdownCard(OrderModel order, ThemeData theme) {
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
              'Order Total Breakdown',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _summaryRow('Subtotal', '\$${order.subtotal.toStringAsFixed(2)}'),
            const SizedBox(height: 6),
            _summaryRow(
              'Shipping',
              order.shippingFee == 0
                  ? 'FREE'
                  : '\$${order.shippingFee.toStringAsFixed(2)}',
              valueColor: order.shippingFee == 0 ? Colors.green : null,
            ),
            const SizedBox(height: 6),
            _summaryRow('Estimated Tax', '\$${order.tax.toStringAsFixed(2)}'),
            const Divider(height: 20),
            _summaryRow(
              'Total Paid',
              '\$${order.totalAmount.toStringAsFixed(2)}',
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
}
