import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        //color: AppColor.black,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
      ),
      button: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.white)),
);

ThemeData arabicTheme = ThemeData(
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        //color: AppColor.black,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
      ),
      button: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.white)),
);
