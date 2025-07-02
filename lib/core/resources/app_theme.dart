import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:bookly_app/core/resources/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      titleLarge: AppStyles.textBold,
      titleMedium: AppStyles.textSemiBold,
      titleSmall: AppStyles.textsmall,
      bodyLarge: AppStyles.textBodyBold,
      bodyMedium: AppStyles.textBodySemiBold,
    ),
  );
}
