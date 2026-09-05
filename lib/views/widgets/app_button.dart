import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';

enum AppButtonVariant {
  primary,
  secondary,
  outline,
  danger,
  text,
}

/// A modern, versatile button component with loading state, icons, and variants.
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = false,
    this.height = 48.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color fgColor;
    BorderSide borderSide = BorderSide.none;

    switch (variant) {
      case AppButtonVariant.primary:
        bgColor = AppColors.primary;
        fgColor = AppColors.white;
        break;
      case AppButtonVariant.secondary:
        bgColor = AppColors.slate100;
        fgColor = AppColors.slate900;
        break;
      case AppButtonVariant.outline:
        bgColor = Colors.transparent;
        fgColor = AppColors.slate800;
        borderSide = const BorderSide(color: AppColors.slate300, width: 1.2);
        break;
      case AppButtonVariant.danger:
        bgColor = AppColors.error;
        fgColor = AppColors.white;
        break;
      case AppButtonVariant.text:
        bgColor = Colors.transparent;
        fgColor = AppColors.primary;
        break;
    }

    final bool isDisabled = onPressed == null || isLoading;
    if (isDisabled && variant != AppButtonVariant.text && variant != AppButtonVariant.outline) {
      bgColor = bgColor.withValues(alpha: 0.6);
    }

    Widget content;
    if (isLoading) {
      content = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.2,
          valueColor: AlwaysStoppedAnimation<Color>(fgColor),
        ),
      );
    } else {
      content = Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: fgColor),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: AppTypography.buttonText.copyWith(color: fgColor),
          ),
        ],
      );
    }

    Widget buttonWidget;
    if (variant == AppButtonVariant.outline) {
      buttonWidget = OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: fgColor,
          side: borderSide,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderMd),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          minimumSize: Size(isFullWidth ? double.infinity : 64, height ?? 48),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: content,
      );
    } else if (variant == AppButtonVariant.text) {
      buttonWidget = TextButton(
        style: TextButton.styleFrom(
          foregroundColor: fgColor,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          minimumSize: Size(isFullWidth ? double.infinity : 64, height ?? 48),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: content,
      );
    } else {
      buttonWidget = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.6),
          disabledForegroundColor: fgColor.withValues(alpha: 0.8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.borderMd,
            side: borderSide,
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          minimumSize: Size(isFullWidth ? double.infinity : 64, height ?? 48),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: content,
      );
    }

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: buttonWidget);
    }
    return buttonWidget;
  }
}
