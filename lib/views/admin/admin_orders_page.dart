import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/providers/admin_provider.dart';

class AdminOrdersPage extends StatefulWidget {
  const AdminOrdersPage({super.key});

  @override
  State<AdminOrdersPage> createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends State<AdminOrdersPage> {
  final List<String> _statusTabs = [
    'ALL',
    'CONFIRMED',
    'PROCESSING',
    'SHIPPED',
    'DELIVERED',
    'CANCELLED',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminProvider>().loadOrders();
    });
  }

  void _showOrderActionSheet(BuildContext context, OrderModel order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetCtx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order #${order.orderNumber}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      order.status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text('Total Amount: \$${order.totalAmount.toStringAsFixed(2)}'),
              if (order.shippingAddress != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Shipping To: ${order.shippingAddress!.fullName}, ${order.shippingAddress!.city}',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
              const Divider(height: 24),
              const Text(
                'Allowed State Transitions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 12),

              // Transition Buttons based on state machine
              if (order.status == 'CONFIRMED')
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(44),
                  ),
                  icon: const Icon(Icons.autorenew),
                  label: const Text('Move to Processing'),
                  onPressed: () async {
                    Navigator.pop(sheetCtx);
                    await context
                        .read<AdminProvider>()
                        .updateOrderStatus(order.id, status: 'PROCESSING');
                  },
                ),

              if (order.status == 'PROCESSING') ...[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(44),
                  ),
                  icon: const Icon(Icons.local_shipping_outlined),
                  label: const Text('Dispatch / Ship Order'),
                  onPressed: () {
                    Navigator.pop(sheetCtx);
                    _openShippingDialog(context, order);
                  },
                ),
              ],

              if (order.status == 'SHIPPED')
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(44),
                  ),
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Mark as Delivered'),
                  onPressed: () async {
                    Navigator.pop(sheetCtx);
                    await context
                        .read<AdminProvider>()
                        .updateOrderStatus(order.id, status: 'DELIVERED');
                  },
                ),

              if (['CONFIRMED', 'PROCESSING'].contains(order.status)) ...[
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    minimumSize: const Size.fromHeight(44),
                  ),
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Cancel Order & Restock'),
                  onPressed: () async {
                    Navigator.pop(sheetCtx);
                    await context.read<AdminProvider>().updateOrderStatus(
                          order.id,
                          status: 'CANCELLED',
                          note: 'Cancelled by administrator',
                        );
                  },
                ),
              ],

              if (['DELIVERED', 'CANCELLED'].contains(order.status))
                const Text(
                  'Order has reached a terminal status. No further transitions permitted.',
                  style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _openShippingDialog(BuildContext context, OrderModel order) {
    final carrierController = TextEditingController(text: 'FedEx');
    final trackingController =
        TextEditingController(text: 'TRK-${DateTime.now().millisecondsSinceEpoch}');

    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Ship Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: carrierController,
              decoration: const InputDecoration(labelText: 'Carrier Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: trackingController,
              decoration: const InputDecoration(labelText: 'Tracking Number'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(dialogCtx);
              await context.read<AdminProvider>().updateOrderStatus(
                    order.id,
                    status: 'SHIPPED',
                    carrier: carrierController.text.trim(),
                    trackingNumber: trackingController.text.trim(),
                  );
            },
            child: const Text('Confirm Shipment'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final admin = context.watch<AdminProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Filter Tabs Horizontal List
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              itemCount: _statusTabs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final tab = _statusTabs[index];
                final isSelected = admin.selectedOrderStatus == tab;

                return ChoiceChip(
                  label: Text(tab),
                  selected: isSelected,
                  onSelected: (_) {
                    admin.loadOrders(status: tab);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),

          // Orders List
          Expanded(
            child: admin.isLoadingOrders && admin.orders.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : admin.orders.isEmpty
                    ? const Center(
                        child: Text(
                          'No orders found for selected status',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => admin.loadOrders(),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: admin.orders.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final o = admin.orders[index];
                            return Card(
                              elevation: 0.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.grey.shade200),
                              ),
                              child: ListTile(
                                onTap: () => _showOrderActionSheet(context, o),
                                title: Text(
                                  o.orderNumber,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Text(
                                  '${o.shippingAddress?.fullName ?? 'Customer'} • \$${o.totalAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius:
                                            BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        o.status,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade800,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(Icons.chevron_right,
                                        size: 18, color: Colors.grey),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
