import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Font Constants
/// Centralized font family definitions
class AppFonts {
  static const String primary = 'Poppins';
  static const String secondary = 'Montserrat';
}

/// Modern Dark Theme Configuration
/// Focuses on Deep Sea Blue and Neon Purple color schemes
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // ============================================================
  // DARK THEME - Modern Portfolio Dark Theme (Primary)
  // ============================================================

  /// Modern Dark Theme Data with Deep Sea Blue & Neon Purple
  static ThemeData get modernDarkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // Deep Sea Blue as primary color (#0F2B4D)
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6F5AFF), // Neon Purple
        brightness: Brightness.dark,
        surface: const Color(0xFF0A0E27), // Very dark navy
        onSurface: const Color(0xFFE8EAFF), // Light purple-white
        primaryContainer: const Color(0xFF1A1A3E), // Dark purple container
        onPrimaryContainer: const Color(0xFFB4A7FF), // Light purple text
      ),

      scaffoldBackgroundColor: const Color(0xFF0A0E27),
      
      // AppBar - Modern dark gradient look
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0F1938),
        foregroundColor: const Color(0xFFE8EAFF),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFE8EAFF),
          letterSpacing: 0.5,
        ),
      ),

      // Text Theme with Google Fonts
      textTheme: _buildDarkModernTextTheme(),

      // Elevated Button - Modern glass-morphism style
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6F5AFF), // Neon Purple
          foregroundColor: const Color(0xFFE8EAFF),
          elevation: 8,
          shadowColor: const Color(0xFF6F5AFF).withValues(alpha: 0.5),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF6F5AFF),
          side: const BorderSide(
            color: Color(0xFF6F5AFF),
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF6F5AFF),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input Decoration - Modern minimal style
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A1A3E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF2A2A4E),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF2A2A4E),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF6F5AFF),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFFF4757),
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFFF4757),
            width: 2,
          ),
        ),
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFFB4A7FF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xFF7A7A9E),
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        isDense: true,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: const Color(0xFF1A1A3E),
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: Color(0xFF2A2A4E),
        thickness: 1,
        space: 0,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF1A1A3E),
        selectedColor: const Color(0xFF6F5AFF),
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFFE8EAFF),
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color(0xFF2A2A4E),
          ),
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: Color(0xFF6F5AFF),
        size: 24,
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFF6F5AFF),
        circularTrackColor: Color(0xFF2A2A4E),
      ),
    );
  }

  // ============================================================
  // LIGHT THEME - Modern Light Theme (Secondary)
  // ============================================================

  /// Modern Light Theme Data
  static ThemeData get modernLightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6F5AFF),
        brightness: Brightness.light,
        surface: const Color(0xFFFAFBFF),
        onSurface: const Color(0xFF1F1535),
        primaryContainer: const Color(0xFFEDE7FF),
        onPrimaryContainer: const Color(0xFF3D2E99),
      ),

      scaffoldBackgroundColor: const Color(0xFFFAFBFF),
      
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: const Color(0xFF1F1535),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F1535),
          letterSpacing: 0.5,
        ),
      ),

      textTheme: _buildLightModernTextTheme(),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6F5AFF),
          foregroundColor: const Color(0xFFFFFFFF),
          elevation: 4,
          shadowColor: const Color(0xFF6F5AFF).withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF6F5AFF),
          side: const BorderSide(
            color: Color(0xFF6F5AFF),
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF6F5AFF),
            width: 2,
          ),
        ),
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF6F5AFF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFFFFFFFF),
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  // ============================================================
  // TEXT THEME BUILDERS
  // ============================================================

  /// Build Modern Dark Text Theme
  static TextTheme _buildDarkModernTextTheme() {
    return TextTheme(
      // Display Styles - Extra Large Headlines
      displayLarge: GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        color: const Color(0xFFE8EAFF),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: const Color(0xFFE8EAFF),
        letterSpacing: -0.3,
        height: 1.2,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: const Color(0xFFE8EAFF),
        height: 1.3,
      ),

      // Headline Styles - Page Titles
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: const Color(0xFFE8EAFF),
        letterSpacing: 0.2,
        height: 1.3,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFE8EAFF),
        letterSpacing: 0.2,
        height: 1.4,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFE8EAFF),
        letterSpacing: 0.1,
        height: 1.4,
      ),

      // Title Styles - Section Headers
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFE8EAFF),
        letterSpacing: 0.1,
        height: 1.4,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFE8EAFF),
        letterSpacing: 0.15,
        height: 1.5,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFB4A7FF),
        letterSpacing: 0.1,
        height: 1.5,
      ),

      // Body Styles - Main Content
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFE8EAFF),
        letterSpacing: 0.5,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFD8DAFF),
        letterSpacing: 0.25,
        height: 1.6,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF9B96B4),
        letterSpacing: 0.4,
        height: 1.5,
      ),

      // Label Styles - Small Text, Buttons, Captions
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFB4A7FF),
        letterSpacing: 0.1,
        height: 1.5,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF7A7A9E),
        letterSpacing: 0.5,
        height: 1.5,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF5A5A7A),
        letterSpacing: 0.5,
        height: 1.4,
      ),
    );
  }

  /// Build Modern Light Text Theme
  static TextTheme _buildLightModernTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1F1535),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1F1535),
        letterSpacing: -0.3,
        height: 1.2,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1F1535),
        height: 1.3,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1F1535),
        letterSpacing: 0.2,
        height: 1.3,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F1535),
        letterSpacing: 0.2,
        height: 1.4,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F1535),
        letterSpacing: 0.1,
        height: 1.4,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F1535),
        letterSpacing: 0.1,
        height: 1.4,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F1535),
        letterSpacing: 0.15,
        height: 1.5,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF6F5AFF),
        letterSpacing: 0.1,
        height: 1.5,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF3A3A3A),
        letterSpacing: 0.5,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF5A5A5A),
        letterSpacing: 0.25,
        height: 1.6,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF7A7A7A),
        letterSpacing: 0.4,
        height: 1.5,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF6F5AFF),
        letterSpacing: 0.1,
        height: 1.5,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF999999),
        letterSpacing: 0.5,
        height: 1.5,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFAAAAAA),
        letterSpacing: 0.5,
        height: 1.4,
      ),
    );
  }
}
