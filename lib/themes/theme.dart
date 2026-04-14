import 'package:flutter/material.dart';

class AppTheme {
  // ── Dark palette ──────────────────────────────────────────
  static const _darkPrimary = Color(0xFF4FC3F7);
  static const _darkBackground = Color(0xFF0D0D0D);
  static const _darkSurface = Color(0xFF1A1A1A);
  static const _darkSurfaceVariant = Color(0xFF252525);
  static const _darkOnSurface = Color(0xFFE0E0E0);
  static const _darkOnSurfaceVariant = Color(0xFF9E9E9E);
  static const _darkError = Color(0xFFCF6679);

  // ── Light palette ─────────────────────────────────────────
  static const _lightPrimary = Color(0xFF0288D1);
  static const _lightBackground = Color(0xFFF5F7FA);
  static const _lightSurface = Color(0xFFFFFFFF);
  static const _lightSurfaceVariant = Color(0xFFE8EDF2);
  static const _lightOnSurface = Color(0xFF1A1A1A);
  static const _lightOnSurfaceVariant = Color(0xFF5F6368);
  static const _lightError = Color(0xFFB00020);

  // ── Dark theme ────────────────────────────────────────────
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimary,
      surface: _darkSurface,
      surfaceContainerHighest: _darkSurfaceVariant,
      onPrimary: Color(0xFF0D0D0D),
      onSurface: _darkOnSurface,
      onSurfaceVariant: _darkOnSurfaceVariant,
      error: _darkError,
    ),
    scaffoldBackgroundColor: _darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkBackground,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: _darkOnSurface,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: _darkOnSurface),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _darkPrimary,
        foregroundColor: Color(0xFF0D0D0D),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _darkPrimary,
        side: BorderSide(color: _darkPrimary),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurfaceVariant,
      hintStyle: TextStyle(color: _darkOnSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: _darkPrimary, width: 1.5),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkSurfaceVariant,
      contentTextStyle: TextStyle(color: _darkOnSurface),
    ),
  );

  // ── Light theme ───────────────────────────────────────────
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: _lightPrimary,
      surface: _lightSurface,
      surfaceContainerHighest: _lightSurfaceVariant,
      onPrimary: Colors.white,
      onSurface: _lightOnSurface,
      onSurfaceVariant: _lightOnSurfaceVariant,
      error: _lightError,
    ),
    scaffoldBackgroundColor: _lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightBackground,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: _lightOnSurface,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: _lightOnSurface),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _lightPrimary,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _lightPrimary,
        side: BorderSide(color: _lightPrimary),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightSurfaceVariant,
      hintStyle: TextStyle(color: _lightOnSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: _lightPrimary, width: 1.5),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightSurfaceVariant,
      contentTextStyle: TextStyle(color: _lightOnSurface),
    ),
  );
}