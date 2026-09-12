import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../../../../core/utils/ui_state.dart';
import '../../domain/entities/order_entity.dart';
import 'package:shopp_app/features/orders/presentation/providers/order_providers.dart';
import 'package:shopp_app/features/catalog/presentation/screens/home_page.dart';
import 'order_detail_page.dart';
import 'package:shopp_app/core/widgets/app_network_image.dart';
import 'package:shopp_app/core/widgets/empty_state.dart';
import 'package:shopp_app/core/utils/currency_formatter.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ordersNotifierProvider.notifier).loadOrders();
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
    final ordersState = ref.watch(ordersNotifierProvider);
    final orders = ordersState.data ?? [];

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: const Text('My Orders', style: AppTypography.headingSmall),
      ),
      body: ordersState.isLoading && orders.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
          : orders.isEmpty
              ? EmptyStateView(
                  icon: AppIcons.orders,
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
                  onRefresh: () => ref.read(ordersNotifierProvider.notifier).loadOrders(),
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: orders.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return _buildOrderCard(context, order);
                    },
                  ),
                ),
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderEntity order) {
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
                      AppNetworkImage(
                        imageUrl: order.orderItems.first.productImage,
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
                      CurrencyFormatter.format(order.totalAmount),
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
