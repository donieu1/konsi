import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../domain/entities/theme/app_colors.dart';

class SystemUiOverlayManager {
  static void setSystemUIOverlayStyle(ThemeMode themeMode) {
    if (Platform.isAndroid) {
      bool isDarkMode = themeMode == ThemeMode.dark;
      
      Color statusBarColor = isDarkMode ? AppColors.textHint : Colors.transparent;

      Brightness statusBarIconBrightness = isDarkMode ? Brightness.light : Brightness.dark;

      Color navigationBarColor = isDarkMode ? AppColors.textHint : Colors.transparent;
      Brightness navigationBarIconBrightness = isDarkMode ? Brightness.light : Brightness.dark;

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: navigationBarIconBrightness,
          systemNavigationBarColor: navigationBarColor,
          statusBarIconBrightness: statusBarIconBrightness,
          statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
          statusBarColor: statusBarColor,
        ),
      );
    } else if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
        ),
      );
    }
  }
}
