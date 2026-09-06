import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/notification_model.dart';
import 'package:shopp_app/providers/notification_provider.dart';
import 'package:shopp_app/views/order_detail_page.dart';
import 'package:shopp_app/views/widgets/empty_state.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationProvider>().loadNotifications(refresh: true);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<NotificationProvider>().loadMoreNotifications();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'ORDER_CONFIRMED':
        return Icons.check_circle_outline_rounded;
      case 'ORDER_SHIPPED':
        return Icons.local_shipping_outlined;
      case 'ORDER_DELIVERED':
        return Icons.done_all_rounded;
      case 'ORDER_CANCELLED':
        return Icons.cancel_outlined;
      case 'PROMOTION':
        return Icons.local_offer_outlined;
      default:
        return Icons.notifications_none_rounded;
    }
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'ORDER_CONFIRMED':
        return AppColors.info;
      case 'ORDER_SHIPPED':
        return AppColors.primary;
      case 'ORDER_DELIVERED':
        return AppColors.success;
      case 'ORDER_CANCELLED':
        return AppColors.error;
      case 'PROMOTION':
        return AppColors.accent;
      default:
        return AppColors.violet;
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifProvider = context.watch<NotificationProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.slate800),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppStrings.notifications.title, style: AppTypography.headingSmall),
        actions: [
          if (notifProvider.unreadCount > 0)
            TextButton(
              onPressed: () => notifProvider.markAllAsRead(),
              child: Text(
                AppStrings.notifications.markAllAsRead,
                style: AppTypography.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: notifProvider.isLoading && notifProvider.notifications.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
          : notifProvider.notifications.isEmpty
              ? EmptyStateView(
                  icon: Icons.notifications_off_outlined,
                  title: AppStrings.notifications.empty,
                  description: AppStrings.notifications.emptySubtitle,
                )
              : RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => notifProvider.refreshNotifications(),
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: AppDimensions.paddingVerticalSm,
                    itemCount: notifProvider.notifications.length +
                        (notifProvider.isLoadingMore ? 1 : 0),
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: AppColors.divider, indent: 68),
                    itemBuilder: (context, index) {
                      if (index == notifProvider.notifications.length) {
                        return const Center(
                          child: Padding(
                            padding: AppDimensions.paddingLg,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.2,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          ),
                        );
                      }
                      final notif = notifProvider.notifications[index];
                      return _buildNotificationTile(context, notif);
                    },
                  ),
                ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context,
    NotificationModel notif,
  ) {
    final typeColor = _getTypeColor(notif.type);
    final typeIcon = _getTypeIcon(notif.type);

    return InkWell(
      onTap: () {
        context.read<NotificationProvider>().markAsRead(notif.id);
        if (notif.orderId != null && notif.orderId!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OrderDetailPage(orderId: notif.orderId!),
            ),
          );
        }
      },
      child: Container(
        color: notif.isRead
            ? Colors.transparent
            : AppColors.primary50.withValues(alpha: 0.5),
        padding: AppDimensions.inputPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: AppDimensions.paddingSm,
              decoration: BoxDecoration(
                color: typeColor.withValues(alpha: 0.1),
                borderRadius: AppRadius.borderSm,
              ),
              child: Icon(typeIcon, color: typeColor, size: AppIconSizes.md),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notif.title,
                          style: AppTypography.bodySmall.copyWith(
                            fontWeight: notif.isRead ? FontWeight.w600 : FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      if (!notif.isRead)
                        Container(
                          width: AppDimensions.sm,
                          height: AppDimensions.sm,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.xs),
                  Text(
                    notif.body,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatTimestamp(notif.createdAt),
                        style: AppTypography.caption.copyWith(color: AppColors.textMuted),
                      ),
                      if (notif.orderId != null)
                        Text(
                          AppStrings.notifications.viewOrder,
                          style: AppTypography.caption.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return AppStrings.notifications.justNow;
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}
