import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_dimensions.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';

/// A sleek text field component with label, prefix/suffix icons, and error handling.
/// Fully integrated with centralized design tokens and custom SVG icon system.
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool autofocus;
  final int maxLines;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final bool enableSuggestions;

  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.maxLines = 1,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = true,
    this.enableSuggestions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTypography.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.slate700,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          autofocus: autofocus,
          maxLines: maxLines,
          enabled: enabled,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textMuted),
            filled: true,
            fillColor: enabled ? AppColors.slate100 : AppColors.slate200.withValues(alpha: 0.5),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(AppDimensions.sm),
                    child: AppIcon(
                      prefixIcon!,
                      size: AppIconSizes.md,
                      color: AppColors.slate500,
                    ),
                  )
                : null,
            suffixIcon: suffixIcon,
            contentPadding: AppDimensions.inputPadding,
            border: const OutlineInputBorder(
              borderRadius: AppRadius.borderMd,
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: AppRadius.borderMd,
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: AppRadius.borderMd,
              borderSide: BorderSide(color: AppColors.borderFocused, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: AppRadius.borderMd,
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: AppRadius.borderMd,
              borderSide: BorderSide(color: AppColors.error, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
