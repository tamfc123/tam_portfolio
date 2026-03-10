import 'package:flutter/material.dart';

/// Extension providing gradient derived from the current theme.
extension PortfolioThemeAccent on ThemeData {
  LinearGradient get accentGradient => LinearGradient(
        colors: [
          colorScheme.primary,
          colorScheme.secondary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

/// Design system for layout spacing and border radius.
/// Colors are defined by the active theme instead of global constants.

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