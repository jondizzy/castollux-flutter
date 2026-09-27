import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _ink = Color(0xFF202621);
  static const _paper = Color(0xFFF3F1E9);
  static const _forest = Color(0xFF315A45);
  static const _clay = Color(0xFFB5523D);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: _forest,
      brightness: Brightness.light,
      surface: _paper,
      primary: _forest,
      secondary: _clay,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: _paper,
      fontFamily: 'Georgia',
      appBarTheme: const AppBarTheme(
        backgroundColor: _paper,
        foregroundColor: _ink,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: _ink,
          fontFamily: 'Georgia',
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.72),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD7D9CF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD7D9CF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _forest, width: 1.5),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _forest,
        foregroundColor: Colors.white,
      ),
    );
  }
}
