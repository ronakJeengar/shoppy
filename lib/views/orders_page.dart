import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/providers/order_provider.dart';
import 'package:shopp_app/views/home_page.dart';
import 'package:shopp_app/views/order_detail_page.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderProvider>().loadOrders(refresh: true);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<OrderProvider>().loadMoreOrders();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'CONFIRMED':
        return AppColors.info;
      case 'PROCESSING':
        return AppColors.warning;
      case 'SHIPPED':
        return AppColors.primary;
      case 'DELIVERED':
        return AppColors.success;
      case 'CANCELLED':
        return AppColors.error;
      default:
        return AppColors.slate500;
    }
  }

  Color _getStatusBg(String status) {
    switch (status) {
      case 'CONFIRMED':
        return AppColors.infoLight;
      case 'PROCESSING':
        return AppColors.warningLight;
      case 'SHIPPED':
        return AppColors.primary50;
      case 'DELIVERED':
        return AppColors.successLight;
      case 'CANCELLED':
        return AppColors.errorLight;
      default:
        return AppColors.slate100;
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = context.watch<OrderProvider>();

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('My Orders', style: AppTypography.headingSmall),
      ),
      body: orderProvider.isLoading && orderProvider.orders.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
          : orderProvider.orders.isEmpty
              ? EmptyStateView(
                  icon: Icons.receipt_long_outlined,
                  title: 'No orders yet',
                  description: 'When you place orders, they will appear here with live tracking updates.',
                  buttonText: 'Start Shopping',
                  onButtonPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false,
                    );
                  },
                )
              : RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => orderProvider.refreshOrders(),
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: orderProvider.orders.length +
                        (orderProvider.isLoadingMore ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (index == orderProvider.orders.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          ),
                        );
                      }
                      final order = orderProvider.orders[index];
                      return _buildOrderCard(context, order);
                    },
                  ),
                ),
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderModel order) {
    final statusColor = _getStatusColor(order.status);
    final statusBg = _getStatusBg(order.status);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.slate200),
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
                builder: (_) => OrderDetailPage(orderId: order.id),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.orderNumber,
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.slate900,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: AppRadius.borderFull,
                      ),
                      child: Text(
                        order.status,
                        style: AppTypography.label.copyWith(color: statusColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Preview first item
                if (order.orderItems.isNotEmpty) ...[
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: AppRadius.borderSm,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: AppColors.slate100,
                          child: order.orderItems.first.productImage.isNotEmpty
                              ? Image.network(
                                  order.orderItems.first.productImage,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.shopping_bag_outlined, color: AppColors.slate400),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderItems.first.productName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.slate800,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              order.orderItems.length > 1
                                  ? '+ ${order.orderItems.length - 1} more items'
                                  : 'Qty: ${order.orderItems.first.quantity}',
                              style: AppTypography.caption.copyWith(color: AppColors.slate500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: AppColors.slate200),
                ],

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: AppTypography.caption.copyWith(color: AppColors.slate500),
                    ),
                    Text(
                      '\$${order.totalAmount.toStringAsFixed(2)}',
                      style: AppTypography.priceCard,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
