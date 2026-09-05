import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/views/widgets/app_button.dart';

/// A friendly, actionable error recovery view.
class ErrorStateView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String retryText;

  const ErrorStateView({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText = 'Try Again',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.errorLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cloud_off_rounded,
                size: 36,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Something went wrong',
              style: AppTypography.headingSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: AppTypography.bodySmall.copyWith(color: AppColors.slate500),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 20),
              AppButton(
                label: retryText,
                icon: Icons.refresh_rounded,
                onPressed: onRetry,
                variant: AppButtonVariant.secondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
