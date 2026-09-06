import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_spacing.dart';

/// Centralized dimensional system for Shoppy.
/// Defines spacing scale, standard insets, component heights, and touch target constraints.
class AppDimensions {
  // Spacing Scale Aliases
  static const double none = 0.0;
  static const double xxs = AppSpacing.xxs; // 2.0
  static const double xs = AppSpacing.xs;   // 4.0
  static const double sm = AppSpacing.sm;   // 8.0
  static const double md = AppSpacing.md;   // 12.0
  static const double lg = AppSpacing.lg;   // 16.0
  static const double xl = AppSpacing.xl;   // 20.0
  static const double xxl = AppSpacing.xxl; // 24.0
  static const double xxxl = AppSpacing.xxxl; // 32.0
  static const double huge = AppSpacing.huge; // 48.0
  static const double giant = 64.0;

  // Standard EdgeInsets Spacing
  static const EdgeInsets paddingZero = EdgeInsets.zero;
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  // Directional EdgeInsets
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(horizontal: xl);

  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(vertical: lg);

  // Semantic Insets
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: lg, vertical: md);
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets modalPadding = EdgeInsets.all(xxl);
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(horizontal: lg, vertical: 14.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0);
  static const EdgeInsets buttonPaddingSm = EdgeInsets.symmetric(horizontal: md, vertical: sm);

  // Standard Component Heights & Sizes
  static const double buttonHeight = 48.0;
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightLg = 54.0;
  static const double inputHeight = 48.0;
  static const double appBarHeight = 56.0;
  static const double bottomBarHeight = 64.0;

  // Avatars
  static const double avatarXs = 24.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 40.0;
  static const double avatarLg = 56.0;
  static const double avatarXl = 80.0;

  // Cards & Layout Components
  static const double productCardWidth = 170.0;
  static const double productCardImageHeight = 140.0;
  static const double carouselHeight = 180.0;
  static const double mediaGalleryHeight = 320.0;
  static const double badgeSize = 18.0;

  // Accessibility & Touch Target Constraints
  static const double minTouchTarget = 48.0;
  static const BoxConstraints touchTargetConstraints = BoxConstraints(
    minWidth: minTouchTarget,
    minHeight: minTouchTarget,
  );
}
