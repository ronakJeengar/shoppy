import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/views/widgets/app_button.dart';

/// A polished, modern empty-state component with icon, description, and primary CTA.
class EmptyStateView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Color? iconColor;

  const EmptyStateView({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.buttonText,
    this.onButtonPressed,
    this.iconColor,
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
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: iconColor ?? AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: AppTypography.headingMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.slate500),
              textAlign: TextAlign.center,
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 24),
              AppButton(
                label: buttonText!,
                onPressed: onButtonPressed,
                variant: AppButtonVariant.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
