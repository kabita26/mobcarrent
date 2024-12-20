import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: const Color(0xFFD39632),
      scaffoldBackgroundColor: const Color.fromARGB(255, 225, 223, 221), 
      fontFamily: " Montserrat Bold",
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily:"Montserrat Bold"
          )
        )
      ),
      inputDecorationTheme:const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            
            color:const Color(0xFFD39632),
          )
        )
      )
      );
}
