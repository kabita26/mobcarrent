import 'package:car_rent/app/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      // change the theme according to the user preference
      colorScheme: isDarkMode
          ? const ColorScheme.dark(
              primary: ThemeConstant.darkPrimaryColor,
            )
          : const ColorScheme.light(
              primary: Color.fromARGB(255, 17, 119, 20),
            ),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      fontFamily: 'Montserrat',
      useMaterial3: true,

      // Change app bar color
      // appBarTheme: const AppBarTheme(
      //   elevation: 0,
      //   backgroundColor: ThemeConstant.appBarColor,
      //   centerTitle: true,
      //   titleTextStyle: TextStyle(
      //     color: Colors.white,
      //     fontSize: 20,
      //   ),
      // ),

      // Change elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 9,
          foregroundColor: Colors.white,
          backgroundColor: ThemeConstant.primaryColor,
          textStyle: const TextStyle(
            fontSize: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding:
            const EdgeInsets.symmetric(vertical: 7),
        ),
      ),

      // Change text field theme
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 18,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeConstant.primaryColor,
          ),
        ),
      ),
      // Circular progress bar theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ThemeConstant.primaryColor,
      ),
      //Bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
