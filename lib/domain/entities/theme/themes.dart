import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    
    primaryColor: AppColors.primary,
    cardColor: Colors.white,
    useMaterial3: false,
    iconTheme: IconThemeData(color: Colors.grey[900],),
    appBarTheme:  const AppBarTheme(backgroundColor: Color(0xffF7F7F7), ),
    colorScheme: ColorScheme(
      onBackground: AppColors.contrast,
      background: AppColors.contrast,
      outlineVariant: AppColors.buttonColor,
      primary: AppColors.primary,
      onPrimary: AppColors.contrast,
      secondary: AppColors.secondary,
      onSecondary: AppColors.primarySwatch,
      error: AppColors.error,
      onError: AppColors.contrast,
      surface: AppColors.contrast,
      onSurface: AppColors.contrast,
      shadow: AppColors.darkGrey,
      brightness: Brightness.light,
    ),
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      displayLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: AppColors.primary),
      displayMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primary),
      titleMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText),
      displaySmall: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.darkText),
      headlineLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.text),
      headlineMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.darkText),
      bodyMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.accentLightGray),
      labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.text),
      bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.text),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );

  final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme(
        onBackground: AppColors.contrast,
      background: AppColors.contrast,
      outlineVariant: AppColors.contrast,
      primary: AppColors.primary,
      onPrimary: AppColors.contrast,
      secondary: AppColors.secondary,
      onSecondary: AppColors.contrast,
      error: AppColors.error,
      onError: AppColors.contrast,
      surface: AppColors.mediumGrey!,
      onSurface: AppColors.accentLightGray,
      shadow: AppColors.darkGrey,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      displayLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: AppColors.primary),
      displayMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primary),
      titleMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.contrast),
      displaySmall: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.primary),
      headlineLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.accentLightGray),
      headlineMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.contrast),
      bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.text),
      labelLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.contrast),
      bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.text),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
