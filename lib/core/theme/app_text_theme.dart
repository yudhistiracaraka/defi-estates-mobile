import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextTheme {
  static const textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 34,
      height: 1.12,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(fontSize: 16, height: 1.5, color: AppColors.textBody),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.5,
      color: AppColors.textMuted,
    ),
  );

  static const sectionTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const cardTitle = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
  );

  static const valueEmphasis = TextStyle(
    color: AppColors.primarySoft,
    fontWeight: FontWeight.w700,
  );
}
