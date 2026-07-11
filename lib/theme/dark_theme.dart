import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6366F1), // Lighter Indigo
    primary: const Color(0xFF6366F1),
    secondary: const Color(0xFF34D399), // Lighter Emerald
    tertiary: const Color(0xFFFBBF24), // Lighter Amber
    error: const Color(0xFFF87171), // Lighter Red
    surface: const Color(0xFF1F2937),
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: Color(0xFFF9FAFB)),
    titleTextStyle: TextStyle(
      color: Color(0xFFF9FAFB),
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF111827), // Deep dark gray
  cardTheme: CardThemeData(
    elevation: 8,
    shadowColor: Colors.black, // Cannot call .withValues on non-const, but we use black inside CardThemeData which is fine, wait CardThemeData shadowColor needs to be const or we can just use Colors.black38. Actually I will use Color(0x66000000)
    color: const Color(0xFF1F2937),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.zero,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF374151),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFF4B5563), width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFF374151), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFF87171), width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    labelStyle: const TextStyle(color: Color(0xFF9CA3AF)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Color(0xFF1F2937),
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedItemColor: Color(0xFF6366F1),
    unselectedItemColor: Color(0xFF6B7280),
  ),
);
