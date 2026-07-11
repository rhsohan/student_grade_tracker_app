import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF4F46E5), // Indigo
    primary: const Color(0xFF4F46E5),
    secondary: const Color(0xFF10B981), // Emerald
    tertiary: const Color(0xFFF59E0B), // Amber
    error: const Color(0xFFEF4444), // Red
    surface: const Color(0xFFF9FAFB),
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: Color(0xFF1F2937)),
    titleTextStyle: TextStyle(
      color: Color(0xFF1F2937),
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFFF3F4F6), // Slightly off-white for depth
  cardTheme: CardThemeData(
    elevation: 8,
    shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.1),
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.zero,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    labelStyle: const TextStyle(color: Color(0xFF6B7280)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4F46E5),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.4),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedItemColor: Color(0xFF4F46E5),
    unselectedItemColor: Color(0xFF9CA3AF),
  ),
);
