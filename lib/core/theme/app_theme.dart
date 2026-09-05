import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';

/// Central theme configuration for Shoppy.
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.slate50,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primary50,
        onPrimaryContainer: AppColors.primaryHover,
        secondary: AppColors.slate700,
        onSecondary: AppColors.white,
        secondaryContainer: AppColors.slate100,
        onSecondaryContainer: AppColors.slate900,
        error: AppColors.error,
        onError: AppColors.white,
        errorContainer: AppColors.errorLight,
        onErrorContainer: AppColors.error,
        surface: AppColors.white,
        onSurface: AppColors.slate900,
        outline: AppColors.slate200,
        outlineVariant: AppColors.slate100,
      ),

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.slate900,
        elevation: 0,
        scrolledUnderElevation: 1,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: AppTypography.headingMedium,
        iconTheme: IconThemeData(color: AppColors.slate800, size: 22),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),

      // Card Theme
      cardTheme: const CardThemeData(
        color: AppColors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderMd,
          side: BorderSide(color: AppColors.slate200, width: 1),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: AppTypography.buttonText,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.borderMd,
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.slate800,
          side: const BorderSide(color: AppColors.slate300, width: 1),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: AppTypography.buttonText.copyWith(color: AppColors.slate800),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.borderMd,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.slate100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.slate400),
        labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.slate600),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.slate200,
        thickness: 1,
        space: 1,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.slate100,
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.primary,
        disabledColor: AppColors.slate100,
        labelStyle: AppTypography.bodySmall,
        secondaryLabelStyle: AppTypography.bodySmall.copyWith(color: AppColors.white),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.borderFull,
        ),
        side: BorderSide.none,
      ),

      // Dialog Theme
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.white,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderLg,
        ),
      ),
    );
  }
}
