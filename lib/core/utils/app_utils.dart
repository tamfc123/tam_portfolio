import 'package:flutter/material.dart';

/// App Utilities
/// Contains utility functions and helpers
class AppUtils {
  // Private constructor to prevent instantiation
  AppUtils._();

  /// Check if the device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Get screen dimensions
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if device is mobile
  static bool isMobile(BuildContext context) {
    return getScreenWidth(context) < 768;
  }

  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    final width = getScreenWidth(context);
    return width >= 768 && width < 1024;
  }

  /// Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return getScreenWidth(context) >= 1024;
  }

  /// Show snackbar
  static void showSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show error snackbar
  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show success snackbar
  static void showSuccessSnackBar(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
