import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // RCN Core Colors
  static const Color navy = Color(0xFF002147);
  static const Color gold = Color(0xFFFFD700);
  static const Color black = Color(0xFF0A0A0A);
  static const Color slate = Color(0xFF2B3E50);
  
  // Training Mode Colors
  static const Color paradeColor = Color(0xFF38BDF8); // Blue
  static const Color dayColor = Color(0xFF10B981);    // Green
  static const Color weekendColor = Color(0xFFFACC15); // Yellow

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: navy,
        brightness: Brightness.dark,
        primary: gold,
        secondary: gold.withOpacity(0.8),
        surface: const Color(0xFF1A1A1A),
        background: black,
      ),
      scaffoldBackgroundColor: black,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, letterSpacing: -1),
        displayMedium: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.outfit(fontWeight: FontWeight.w600),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A1A1A),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: Colors.white.withOpacity(0.05), width: 1),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
