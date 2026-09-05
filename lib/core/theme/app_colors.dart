import 'package:flutter/material.dart';

/// Centralized color palette for Shoppy.
/// Designed for a premium, modern e-commerce aesthetic with high contrast,
/// subtle slate neutrals, and vibrant brand accents.
class AppColors {
  // Brand Primary: Deep Indigo
  static const Color primary = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryHover = Color(0xFF4338CA); // Indigo 700
  static const Color primaryLight = Color(0xFF6366F1); // Indigo 500
  static const Color primary50 = Color(0xFFEEF2FF); // Indigo 50
  static const Color primary100 = Color(0xFFE0E7FF); // Indigo 100

  // Brand Secondary & Accents
  static const Color accent = Color(0xFFF59E0B); // Warm Amber
  static const Color accentLight = Color(0xFFFEF3C7);
  static const Color coral = Color(0xFFEC4899); // Pink / Coral
  static const Color coralLight = Color(0xFFFDF2F8);
  static const Color rose500 = Color(0xFFF43F5E); // Rose 500
  static const Color rose50 = Color(0xFFFFF1F2);
  static const Color violet = Color(0xFF8B5CF6); // AI Purple
  static const Color violetLight = Color(0xFFF5F3FF);

  // Semantic Status Colors
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color successLight = Color(0xFFECFDF5);
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color warningLight = Color(0xFFFFFBEB);
  static const Color error = Color(0xFFEF4444); // Red 500
  static const Color errorLight = Color(0xFFFEF2F2);
  static const Color info = Color(0xFF3B82F6); // Blue 500
  static const Color infoLight = Color(0xFFEFF6FF);

  // Slate Neutral Hierarchy
  static const Color slate950 = Color(0xFF020617);
  static const Color slate900 = Color(0xFF0F172A); // Primary Headings & Dark Text
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate700 = Color(0xFF334155); // Body Text
  static const Color slate600 = Color(0xFF475569); // Secondary Text
  static const Color slate500 = Color(0xFF64748B); // Muted / Captions
  static const Color slate400 = Color(0xFF94A3B8); // Subtle Icons / Borders
  static const Color slate300 = Color(0xFFCBD5E1); // Input Borders
  static const Color slate200 = Color(0xFFE2E8F0); // Dividers & Card Outlines
  static const Color slate100 = Color(0xFFF1F5F9); // Input Backgrounds / Chip BG
  static const Color slate50 = Color(0xFFF8FAFC); // App Background / Canvas
  static const Color white = Color(0xFFFFFFFF); // Card & Sheet Surface

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient promoGradient = LinearGradient(
    colors: [Color(0xFF1E1B4B), Color(0xFF312E81)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient aiGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFE2E8F0),
      Color(0xFFF1F5F9),
      Color(0xFFE2E8F0),
    ],
    stops: [0.1, 0.5, 0.9],
  );
}
