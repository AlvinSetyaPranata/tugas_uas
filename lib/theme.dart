import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFB11226);
  static const Color primaryDark = Color(0xFF8D0E1C);
  static const Color secondary = Color(0xFFFFC857);
  static const Color accent = Color(0xFF4CBED2);
  static const Color background = Color(0xFFFDF6F3);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF2D1414);
  static const Color textSecondary = Color(0xFF7A5C5C);
  static const Color border = Color(0xFFF0D8D1);
  static const Color muted = Color(0xFFB99292);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFCC3A2F), Color(0xFFB11226)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

ThemeData buildAppTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      surface: AppColors.surface,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
      fontFamily: 'Plus Jakarta Sans',
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
      ),
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: base.textTheme.titleLarge?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: AppColors.surface,
      indicatorColor: AppColors.primary.withOpacity(.1),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600),
      ),
      iconTheme: WidgetStateProperty.all(
        const IconThemeData(color: AppColors.textSecondary),
      ),
    ),
    cardTheme: base.cardTheme.copyWith(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
  );
}
