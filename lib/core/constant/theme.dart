import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColor.blue,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      fontFamily: 'Cairo',
    ),
    iconTheme: IconThemeData(color: AppColor.blue),
    backgroundColor: AppColor.white,
    elevation: 0,
    centerTitle: true,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.blue),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColor.blue,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 28,
      color: AppColor.blue,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 25,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
    ),
  ),
);

ThemeData arabicTheme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColor.blue,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.white,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 28,
      color: AppColor.blue,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 25,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 20,
    ),
  ),
);
