import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../../../../core/utils/ui_state.dart';
import '../../domain/entities/notification_entity.dart';
import 'package:shopp_app/features/notifications/presentation/providers/notification_providers.dart';
import 'package:shopp_app/features/orders/presentation/screens/order_detail_page.dart';
import 'package:shopp_app/core/widgets/empty_state.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationNotifierProvider.notifier).loadNotifications();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _getTypeIcon(String type) {
    switch (type) {
      case 'ORDER_CONFIRMED':
        return AppIcons.checkCircleOutline;
      case 'ORDER_SHIPPED':
        return AppIcons.shipping;
      case 'ORDER_DELIVERED':
        return AppIcons.checkAll;
      case 'ORDER_CANCELLED':
        return AppIcons.cancel;
      case 'PROMOTION':
        return AppIcons.tag;
      default:
        return AppIcons.notifications;
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
    final notifState = ref.watch(notificationNotifierProvider);
    final unreadCount = ref.watch(notificationUnreadCountProvider);
    final notifications = notifState.data ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const AppIcon(AppIcons.back, color: AppColors.slate800),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: Text(AppStrings.notifications.title, style: AppTypography.headingSmall),
        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: () =>
                  ref.read(notificationNotifierProvider.notifier).markAllAsRead(),
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
      body: notifState.isLoading && notifications.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
          : notifications.isEmpty
              ? EmptyStateView(
                  icon: AppIcons.notificationsOff,
                  title: AppStrings.notifications.empty,
                  description: AppStrings.notifications.emptySubtitle,
                )
              : RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () =>
                      ref.read(notificationNotifierProvider.notifier).loadNotifications(),
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: AppDimensions.paddingVerticalSm,
                    itemCount: notifications.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: AppColors.divider, indent: 68),
                    itemBuilder: (context, index) {
                      final notif = notifications[index];
                      return _buildNotificationTile(context, notif);
                    },
                  ),
                ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context,
    NotificationEntity notif,
  ) {
    final typeColor = _getTypeColor(notif.type);
    final typeIcon = _getTypeIcon(notif.type);

    return InkWell(
      onTap: () {
        ref.read(notificationNotifierProvider.notifier).markAsRead(notif.id);
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
              child: Center(child: AppIcon(typeIcon, color: typeColor, size: AppIconSizes.md)),
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
