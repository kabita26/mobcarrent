import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      // Change the theme according to the user preference
      colorScheme: isDarkMode
          ? const ColorScheme.dark(
              primary: Color(0xFF415A77), // Dark Blue-Gray
            )
          : const ColorScheme.light(
              primary: Color(0xFF778DA9), // Light Blue-Gray
            ),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      fontFamily: 'Montserrat',
      useMaterial3: true,

      // Change app bar color
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFF415A77), // Dark Blue-Gray for AppBar
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),

      // Change elevated button theme (Using coral-like color for primary actions)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFFFF6F61), // Coral-like color for buttons
          textStyle: const TextStyle(
            fontSize: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      // Change text field theme
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Red for error
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF778DA9), // Light Blue-Gray for focused border
          ),
        ),
      ),

      // Circular progress bar theme (Using the primary coral color)
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFFF6F61), // Coral-like color for progress indicator
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF778DA9), // Light Blue-Gray for bottom bar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
