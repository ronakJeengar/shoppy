import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';

/// Centralized typographic scale for Shoppy.
/// Follows modern design hierarchy with proportional line-heights, letter-spacing, and weights.
/// Standardized on 'Inter' with resilient cross-platform system fallbacks.
class AppTypography {
  static const String fontFamily = 'Inter';
  static const List<String> fontFamilyFallback = [
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Roboto',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  // ==========================================
  // Display & Hero Headers
  // ==========================================
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
    color: AppColors.slate900,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    color: AppColors.slate900,
    height: 1.25,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.slate900,
    height: 1.25,
  );

  // ==========================================
  // Headings
  // ==========================================
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.slate900,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.slate900,
    height: 1.35,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.slate900,
    height: 1.4,
  );

  // Backward-compatible heading aliases
  static const TextStyle headingLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.slate900,
    height: 1.3,
  );
  static const TextStyle headingMedium = headlineMedium;
  static const TextStyle headingSmall = headlineSmall;

  // ==========================================
  // Titles
  // ==========================================
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.slate900,
    height: 1.35,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.slate900,
    height: 1.4,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.slate800,
    height: 1.4,
  );

  // ==========================================
  // Subtitles
  // ==========================================
  static const TextStyle subtitleLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.slate700,
    height: 1.4,
  );

  static const TextStyle subtitleMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.slate500,
    height: 1.4,
  );

  // ==========================================
  // Body Text
  // ==========================================
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.slate700,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.slate600,
    height: 1.45,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.slate500,
    height: 1.4,
  );

  // ==========================================
  // Labels & Badges
  // ==========================================
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.slate900,
    height: 1.35,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.slate700,
    height: 1.3,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.slate600,
    height: 1.2,
  );

  // Backward-compatible label alias
  static const TextStyle label = labelSmall;

  // ==========================================
  // Captions & Overlines
  // ==========================================
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.slate400,
    letterSpacing: 0.2,
    height: 1.3,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
    color: AppColors.slate500,
    height: 1.2,
  );

  // ==========================================
  // Price Hierarchy
  // ==========================================
  static const TextStyle priceHero = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: AppColors.slate900,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static const TextStyle priceLarge = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.slate900,
    letterSpacing: -0.3,
    height: 1.2,
  );

  static const TextStyle priceMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 1.25,
  );

  static const TextStyle priceSmall = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.25,
  );

  static const TextStyle priceCard = priceMedium;

  static const TextStyle priceOriginal = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.slate400,
    decoration: TextDecoration.lineThrough,
    height: 1.25,
  );

  // ==========================================
  // Buttons
  // ==========================================
  static const TextStyle buttonText = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.white,
    height: 1.3,
  );

  // ==========================================
  // Semantic Aliases
  // ==========================================
  static const TextStyle h1 = displayLarge;
  static const TextStyle h2 = displayMedium;
  static const TextStyle h3 = headingLarge;
  static const TextStyle h4 = headingMedium;
  static const TextStyle button = buttonText;
  static const TextStyle productTitle = headingSmall;
  static const TextStyle productDescription = bodyMedium;
  static const TextStyle price = priceCard;
  static const TextStyle discount = label;
  static const TextStyle badge = label;

  /// Full Material 3 [TextTheme] built from centralized [AppTypography] tokens.
  static TextTheme get textTheme => const TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}

/// Convenience extensions on [BuildContext] for theme-aware typography.
extension AppTypographyContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

