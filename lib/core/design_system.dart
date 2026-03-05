import 'package:flutter/material.dart';

/// Design system for the Flutter Web portfolio app.
/// Contains colors, spacing, and border radius constants for consistent UI.
class AppColors {
  /// Primary color: deep purple neon
  static const Color primaryColor = Color(0xFF7C3AED);

  /// Secondary color: complementary to primary
  static const Color secondaryColor = Color(0xFF06B6D4);

  /// Background color: dark theme
  static const Color backgroundColor = Color(0xFF0F0F0F);

  /// Surface color: slightly lighter than background for cards/elements
  static const Color surfaceColor = Color(0xFF1A1A1A);

  /// Accent gradient: neon gradient for highlights
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF7C3AED), Color(0xFF10B981)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// Spacing constants for consistent padding and margins.
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 48.0;
}

/// Border radius constants for consistent corner rounding.
class AppBorderRadius {
  static const BorderRadius small = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius large = BorderRadius.all(Radius.circular(16.0));
}