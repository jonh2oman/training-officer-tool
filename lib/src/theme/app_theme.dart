import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // RCN Core Colors
  static const Color navy = Color(0xFF002147);
  static const Color gold = Color(0xFFFFD700);
  static const Color goldDark = Color(0xFFB8860B);
  static const Color black = Color(0xFF0A0A0A);
  static const Color slate = Color(0xFF2B3E50);
  
  // Sea Theme Colors
  static const Color seaBackground = Color(0xFF001220);
  static const Color seaSurface = Color(0xFF002A44);
  static const Color seaAccent = Color(0xFF00FFFF);

  // Training Mode Colors
  static const Color paradeColor = Color(0xFF38BDF8);
  static const Color dayColor = Color(0xFF10B981);
  static const Color weekendColor = Color(0xFFFACC15);

  static ThemeData get lightTheme {
    return _buildTheme(Brightness.light, const Color(0xFFFAF9F6), const Color(0xFFF2F1EC), Colors.black87);
  }

  static ThemeData get darkTheme {
    return _buildTheme(Brightness.dark, black, const Color(0xFF1A1A1A), Colors.white);
  }

  static ThemeData get seaTheme {
    final base = _buildTheme(Brightness.dark, seaBackground, seaSurface, Colors.white);
    return base.copyWith(
      colorScheme: const ColorScheme.dark(
        primary: seaAccent,
        secondary: gold,
        surface: seaSurface,
        background: seaBackground,
      ),
    );
  }

  static ThemeData _buildTheme(Brightness brightness, Color background, Color surface, Color textPrimary) {
    final isDark = brightness == Brightness.dark;
    
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: navy,
        brightness: brightness,
        primary: isDark ? gold : goldDark,
        secondary: isDark ? gold.withOpacity(0.8) : goldDark.withOpacity(0.8),
        surface: surface,
        background: background,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.interTextTheme(
        isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: textPrimary),
        bodyMedium: TextStyle(color: textPrimary.withOpacity(0.7)),
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
            width: 1,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? gold : navy,
          foregroundColor: isDark ? black : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
