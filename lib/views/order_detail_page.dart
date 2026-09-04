import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/providers/order_provider.dart';
import 'package:shopp_app/views/widgets/write_review_dialog.dart';

class OrderDetailPage extends StatefulWidget {
  final String orderId;

  const OrderDetailPage({super.key, required this.orderId});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderProvider>().loadOrderDetails(widget.orderId);
    });
  }

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

  void _showCancelDialog(BuildContext context, OrderModel order) {
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
                    final success = await context
                        .read<OrderProvider>()
                        .cancelOrder(order.id, reason: selectedReason);

                    if (context.mounted) {
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order cancelled successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        final errMsg =
                            context.read<OrderProvider>().errorMessage ??
                                'Failed to cancel order';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errMsg),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
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
    final orderProvider = context.watch<OrderProvider>();
    final order = orderProvider.selectedOrder;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: orderProvider.isLoading && order == null
          ? const Center(child: CircularProgressIndicator())
          : order == null
              ? Center(
                  child: Text(
                    orderProvider.errorMessage ?? 'Order not found',
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // 1. Order Header Card
                    _buildHeaderCard(context, order),
                    const SizedBox(height: 16),

                    // 2. Tracking Timeline Card
                    _buildTrackingTimeline(order),
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
                          icon: orderProvider.isCancelling
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.red,
                                  ),
                                )
                              : const Icon(Icons.cancel_outlined),
                          label: Text(
                            orderProvider.isCancelling
                                ? 'Cancelling Order...'
                                : 'Cancel Order',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: orderProvider.isCancelling
                              ? null
                              : () => _showCancelDialog(context, order),
                        ),
                      ),
                    const SizedBox(height: 40),
                  ],
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
                      const Icon(Icons.copy, size: 14, color: Colors.blue),
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

  Widget _buildTrackingTimeline(OrderModel order) {
    if (order.isCancelled) {
      return Card(
        color: Colors.red.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.red.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.cancel, color: Colors.red, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Cancelled',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                    if (order.cancellationReason.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Reason: ${order.cancellationReason}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    final steps = ['Confirmed', 'Processing', 'Shipped', 'Delivered'];
    final currentStep = order.trackingStepIndex;

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
                Icon(Icons.local_shipping_outlined,
                    color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  'Fulfillment Timeline',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: List.generate(steps.length, (index) {
                final isDone = index <= currentStep;
                final isCurrent = index == currentStep;
                final color = isDone ? Colors.green : Colors.grey.shade300;

                return Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 3,
                              color: index == 0
                                  ? Colors.transparent
                                  : (index <= currentStep
                                      ? Colors.green
                                      : Colors.grey.shade300),
                            ),
                          ),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: color,
                            child: isDone
                                ? const Icon(Icons.check,
                                    size: 14, color: Colors.white)
                                : Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: Container(
                              height: 3,
                              color: index == steps.length - 1
                                  ? Colors.transparent
                                  : (index < currentStep
                                      ? Colors.green
                                      : Colors.grey.shade300),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        steps[index],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight:
                              isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isCurrent ? Colors.black87 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            if (order.carrier.isNotEmpty || order.trackingNumber.isNotEmpty) ...[
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (order.carrier.isNotEmpty)
                    Text(
                      'Carrier: ${order.carrier}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  if (order.trackingNumber.isNotEmpty)
                    Text(
                      'Tracking: ${order.trackingNumber}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ],
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
                Icon(Icons.location_on_outlined,
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey.shade100,
                        child: item.productImage.isNotEmpty
                            ? Image.network(
                                item.productImage,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.grey,
                                ),
                              )
                            : const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.grey,
                              ),
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
                      icon: const Icon(Icons.star_outline, size: 16),
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
                Icon(Icons.payment_outlined, color: Colors.blue, size: 20),
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
