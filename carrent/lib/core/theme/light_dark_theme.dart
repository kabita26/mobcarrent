import 'package:flutter/material.dart';
import 'app_theme.dart'; // Assuming your theme configuration is in app_theme.dart

class LightDarkTheme {
  // This method returns the appropriate theme based on the user's preference.
  static ThemeData getTheme({required bool isDarkMode}) {
    return AppTheme.getApplicationTheme(isDarkMode: isDarkMode);
  }

  // This method handles the theme switch for the app.
  static ThemeMode getThemeMode({required bool isDarkMode}) {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
