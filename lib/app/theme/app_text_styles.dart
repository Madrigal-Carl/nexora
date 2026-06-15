import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const headingMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(fontSize: 16, color: AppColors.textPrimary);

  static const caption = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}
