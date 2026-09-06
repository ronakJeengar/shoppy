import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_spacing.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/data/models/order_model.dart';

class OrderTimeline extends StatelessWidget {
  final OrderModel order;

  const OrderTimeline({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    if (order.isCancelled) {
      return _buildCancelledTimeline(context);
    }

    final steps = [
      _TimelineStep(
        title: 'Order Placed',
        subtitle: 'We have received your order',
        statusKey: 'CONFIRMED',
        icon: AppIcons.checkCircle,
        stepIndex: 0,
      ),
      _TimelineStep(
        title: 'Processing',
        subtitle: 'Seller is preparing your items',
        statusKey: 'PROCESSING',
        icon: Icons.inventory_2_outlined,
        stepIndex: 1,
      ),
      _TimelineStep(
        title: 'Shipped',
        subtitle: order.carrier.isNotEmpty
            ? '${order.carrier} • Tracking #${order.trackingNumber}'
            : 'Package is on its way',
        statusKey: 'SHIPPED',
        icon: Icons.local_shipping_outlined,
        stepIndex: 2,
      ),
      _TimelineStep(
        title: 'Delivered',
        subtitle: 'Package safely delivered',
        statusKey: 'DELIVERED',
        icon: Icons.home_outlined,
        stepIndex: 3,
      ),
    ];

    final currentStep = order.trackingStepIndex;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Progress',
                style: AppTypography.headingSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                ),
              ),
              _buildStatusBadge(order.status),
            ],
          ),
          if (order.carrier.isNotEmpty && order.trackingNumber.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildTrackingInfo(context),
          ],
          const SizedBox(height: AppSpacing.md),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            separatorBuilder: (context, index) {
              final isPassed = index < currentStep;
              return Container(
                margin: const EdgeInsets.only(left: 17),
                height: 24,
                width: 2,
                color: isPassed ? AppColors.primary : AppColors.slate200,
              );
            },
            itemBuilder: (context, index) {
              final step = steps[index];
              final isCompleted = index <= currentStep && currentStep >= 0;
              final isCurrent = index == currentStep;
              final historyItem = order.statusHistory.firstWhere(
                (h) => h.status.toUpperCase() == step.statusKey,
                orElse: () => OrderStatusHistoryItem(
                  status: '',
                  timestamp: DateTime.now(),
                  note: '',
                ),
              );

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStepNode(isCompleted, isCurrent, step.icon),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              step.title,
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight:
                                    isCurrent ? FontWeight.bold : FontWeight.w600,
                                color: isCompleted
                                    ? AppColors.slate900
                                    : AppColors.slate400,
                              ),
                            ),
                            if (historyItem.status.isNotEmpty)
                              Text(
                                _formatTime(historyItem.timestamp),
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.slate400,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          step.subtitle,
                          style: AppTypography.caption.copyWith(
                            color: isCompleted
                                ? AppColors.slate600
                                : AppColors.slate400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStepNode(bool isCompleted, bool isCurrent, IconData icon) {
    if (isCompleted) {
      return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isCurrent ? AppColors.primary : AppColors.primary50,
          shape: BoxShape.circle,
          boxShadow: isCurrent
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Icon(
          isCurrent ? icon : Icons.check,
          color: isCurrent ? Colors.white : AppColors.primary,
          size: 18,
        ),
      );
    }

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.slate100,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.slate200, width: 1.5),
      ),
      child: Icon(
        icon,
        color: AppColors.slate400,
        size: 18,
      ),
    );
  }

  Widget _buildCancelledTimeline(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.cancel, color: AppColors.error, size: 24),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Order Cancelled',
                style: AppTypography.headingSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
                ),
              ),
              const Spacer(),
              _buildStatusBadge('CANCELLED'),
            ],
          ),
          if (order.cancellationReason.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Reason: ${order.cancellationReason}',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.slate700,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrackingInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        children: [
          const Icon(Icons.pin_drop_outlined, size: 16, color: AppColors.primary),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              '${order.carrier}: ${order.trackingNumber}',
              style: AppTypography.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.slate900,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: order.trackingNumber));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tracking number copied to clipboard'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.copy, size: 14, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color fg;
    switch (status.toUpperCase()) {
      case 'DELIVERED':
        bg = AppColors.successLight;
        fg = AppColors.success;
        break;
      case 'SHIPPED':
      case 'PROCESSING':
        bg = AppColors.primary50;
        fg = AppColors.primary;
        break;
      case 'CANCELLED':
        bg = AppColors.errorLight;
        fg = AppColors.error;
        break;
      default:
        bg = AppColors.slate100;
        fg = AppColors.slate600;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        status.replaceAll('_', ' '),
        style: AppTypography.caption.copyWith(
          fontWeight: FontWeight.bold,
          color: fg,
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (time.year == now.year && time.month == now.month && time.day == now.day) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
    return '${time.month}/${time.day}';
  }
}

class _TimelineStep {
  final String title;
  final String subtitle;
  final String statusKey;
  final IconData icon;
  final int stepIndex;

  _TimelineStep({
    required this.title,
    required this.subtitle,
    required this.statusKey,
    required this.icon,
    required this.stepIndex,
  });
}
