import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icon_sizes.dart';

/// Reusable SVG icon widget ensuring consistent styling, sizing, color-tinting,
/// and accessibility across the entire Shoppy application.
class AppIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final BoxFit fit;

  const AppIcon(
    this.assetPath, {
    super.key,
    this.size = AppIconSizes.md,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  });

  /// Convenience constructor for extra-small icons (12px)
  const AppIcon.xs(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.xs;

  /// Convenience constructor for small icons (16px)
  const AppIcon.sm(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.sm;

  /// Convenience constructor for medium icons (20px)
  const AppIcon.md(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.md;

  /// Convenience constructor for large icons (24px)
  const AppIcon.lg(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.lg;

  /// Convenience constructor for extra-large icons (28px)
  const AppIcon.xl(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.xl;

  /// Convenience constructor for extra-extra-large icons (32px)
  const AppIcon.xxl(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.xxl;

  /// Convenience constructor for hero icons (48px)
  const AppIcon.hero(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.hero;

  /// Convenience constructor for empty-state icons (64px)
  const AppIcon.emptyState(
    this.assetPath, {
    super.key,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
  }) : size = AppIconSizes.emptyState;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? AppIconSizes.md;
    final effectiveColor = color ?? IconTheme.of(context).color ?? AppColors.slate700;

    return SvgPicture.asset(
      assetPath,
      width: effectiveSize,
      height: effectiveSize,
      fit: fit,
      colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
      semanticsLabel: semanticLabel,
    );
  }
}
