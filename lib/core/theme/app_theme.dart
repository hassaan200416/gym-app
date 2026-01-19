/// Application-wide theme configuration.
/// 
/// Defines the visual design system including colors, typography, and component
/// styles. The theme uses a dark color scheme optimized for the hero image
/// background and maintains consistency across all UI components.
import 'package:flutter/material.dart';

class AppTheme {
  /// Returns the application's dark theme configuration.
  /// 
  /// The theme features:
  /// - Deep purple primary color (#7C3AED)
  /// - Pink accent color (#EC4899)
  /// - Dark backgrounds optimized for image overlays
  /// - Material 3 design system
  static ThemeData light() {
    const primary = Color(0xFF7C3AED);
    const surface = Color(0xFF0F0F0F);
    const onSurface = Colors.white;

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: const Color(0xFFEC4899), // Pink accent
        surface: surface,
        onSurface: onSurface,
        onPrimary: Colors.white,
        surfaceContainerHighest: const Color(0xFF1A1A1A),
        surfaceContainerHigh: const Color(0xFF252525),
        onSurfaceVariant: Colors.white70,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: surface,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }
}
