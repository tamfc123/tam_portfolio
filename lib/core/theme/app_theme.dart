import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design_system.dart';

/// Font Constants
/// Centralized font family definitions
class AppFonts {
  static const String primary = 'Poppins';
  static const String secondary = 'Montserrat';
}

/// Modern Dark Theme for Flutter Web Portfolio
/// Dark modern developer portfolio theme with neon purple accents
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Dark Theme Data - Modern Developer Portfolio
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme with neon purple primary
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, // Neon purple
        brightness: Brightness.dark,
        surface: AppColors.surfaceColor, // Dark grey for cards
        onSurface: Colors.white,
        primaryContainer: AppColors.surfaceColor,
        onPrimaryContainer: Colors.white,
      ),

      // Very dark background
      scaffoldBackgroundColor: AppColors.backgroundColor,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      // Text Theme with Poppins
      textTheme: TextTheme(
        // Hero title - large and bold
        headlineLarge: GoogleFonts.poppins(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.2,
        ),
        // Section headers
        headlineMedium: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1.3,
        ),
        // Sub-section titles
        titleLarge: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1.4,
        ),
        // Main body text
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 1.6,
        ),
        // Secondary body text
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey[300],
          height: 1.5,
        ),
      ),

      // Elevated Button Theme - Modern with gradient support
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent for gradient
          foregroundColor: Colors.white,
          elevation: 0, // No shadow for gradient effect
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Card Theme - Dark grey background
      cardTheme: CardThemeData(
        color: AppColors.surfaceColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        labelStyle: GoogleFonts.poppins(
          color: Colors.grey[400],
        ),
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey[500],
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
        size: 24,
      ),
    );
  }

  /// Modern Dark Theme (alias for darkTheme for compatibility)
  static ThemeData get modernDarkTheme => darkTheme;
}
