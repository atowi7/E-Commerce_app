import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: AppColor.blue),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.blue),
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        //color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
      ),
      labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.white)),
);

ThemeData arabicTheme = ThemeData(
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        //color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
      ),
      labelLarge: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.white)),
);
