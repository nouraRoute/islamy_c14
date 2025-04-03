import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brownColor),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.brownColor),
          iconTheme: IconThemeData(color: AppColors.brownColor, size: 25)));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.mainColor),
          iconTheme: IconThemeData(color: AppColors.mainColor, size: 25)));
}
