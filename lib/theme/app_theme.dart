import 'package:flutter/material.dart';

class AppColors {
  static const Color darkGreen = Color(0xFF042623);
  static const Color darkGreenLight = Color(0xFF163832);
  static const Color gold = Color(0xFFC7A567);
  static const Color goldLight = Color(0xFFE7DEC7);
  static const Color background = Color(0xFFF3F4F6);
  static const Color card = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1B1B1B);
  static const Color textSecondary = Color(0xFF8A8A8A);

  static const Color statusAcceptedBg = Color(0xFFDCEFDF);
  static const Color statusAcceptedFg = Color(0xFF2E8B57);
  static const Color statusRejectedBg = Color(0xFFF9DCDC);
  static const Color statusRejectedFg = Color(0xFFC0392B);
  static const Color statusReviewBg = Color(0xFFDCEAF9);
  static const Color statusReviewFg = Color(0xFF2E6FB0);
  static const Color statusActiveBg = Color(0xFFDCEFDF);
  static const Color statusActiveFg = Color(0xFF2E8B57);
  static const Color statusPausedBg = Color(0xFFF9DCDC);
  static const Color statusPausedFg = Color(0xFFC0392B);

  static const Color iconBlueBg = Color(0xFFDCEAFB);
  static const Color iconBlueFg = Color(0xFF3B82C4);
}

class AppTextStyles {
  // Figma uses "itf Qomra Arabic" (headings/numbers) and "Expo Arabic" (body).
  // Both are proprietary fonts not available on Google Fonts; Cairo is used as
  // the closest open substitute. Supply the .ttf files and register them in
  // pubspec.yaml to get an exact font match.
  static TextStyle heading({
    double size = 24,
    FontWeight weight = FontWeight.w500,
    Color color = Colors.white,
  }) {
    return TextStyle(
      fontFamily: 'Cairo',
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.5,
      letterSpacing: -size * 0.019,
    );
  }

  static TextStyle body({
    double size = 14,
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.textPrimary,
  }) {
    return TextStyle(
      fontFamily: 'Cairo',
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.0,
    );
  }
}

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.darkGreen,
        primary: AppColors.darkGreen,
        secondary: AppColors.gold,
      ),
      fontFamily: 'Cairo',
    );
    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
