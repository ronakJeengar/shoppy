import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';

/// Centralized typographic scale for Shoppy.
/// Follows modern design hierarchy with proportional line-heights and weights.
class AppTypography {
  // Display & Headings
  static const TextStyle displayLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
    color: AppColors.slate900,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    color: AppColors.slate900,
    height: 1.25,
  );

  static const TextStyle headingLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.slate900,
    height: 1.3,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.slate900,
    height: 1.35,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.slate900,
    height: 1.4,
  );

  // Subtitles
  static const TextStyle subtitleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.slate700,
    height: 1.4,
  );

  static const TextStyle subtitleMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.slate500,
    height: 1.4,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.slate700,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.slate600,
    height: 1.45,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.slate500,
    height: 1.4,
  );

  // Captions & Labels
  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.slate400,
    letterSpacing: 0.2,
  );

  static const TextStyle label = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  // Price Hierarchy
  static const TextStyle priceHero = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: AppColors.slate900,
    letterSpacing: -0.5,
  );

  static const TextStyle priceCard = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static const TextStyle priceOriginal = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.slate400,
    decoration: TextDecoration.lineThrough,
  );

  // Buttons
  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.white,
  );
}
