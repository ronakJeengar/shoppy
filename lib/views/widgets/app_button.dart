import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
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
/// Built on centralized tokens for seamless system-wide design changes.
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
    this.height = AppDimensions.buttonHeight,
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
        fgColor = AppColors.textPrimary;
        break;
      case AppButtonVariant.outline:
        bgColor = Colors.transparent;
        fgColor = AppColors.slate800;
        borderSide = const BorderSide(color: AppColors.border, width: 1.2);
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
        width: AppIconSizes.md,
        height: AppIconSizes.md,
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
            Icon(icon, size: AppIconSizes.md, color: fgColor),
            const SizedBox(width: AppDimensions.sm),
          ],
          Text(
            label,
            style: AppTypography.button.copyWith(color: fgColor),
          ),
        ],
      );
    }

    final effectiveHeight = height ?? AppDimensions.buttonHeight;
    final minWidth = isFullWidth ? double.infinity : AppDimensions.giant;

    Widget buttonWidget;
    if (variant == AppButtonVariant.outline) {
      buttonWidget = OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: fgColor,
          side: borderSide,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderMd),
          padding: padding ?? AppDimensions.buttonPadding,
          minimumSize: Size(minWidth, effectiveHeight),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: content,
      );
    } else if (variant == AppButtonVariant.text) {
      buttonWidget = TextButton(
        style: TextButton.styleFrom(
          foregroundColor: fgColor,
          padding: padding ?? AppDimensions.paddingHorizontalLg,
          minimumSize: Size(minWidth, effectiveHeight),
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
          padding: padding ?? AppDimensions.buttonPadding,
          minimumSize: Size(minWidth, effectiveHeight),
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
