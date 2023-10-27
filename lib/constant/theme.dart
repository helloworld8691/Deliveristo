import 'package:flutter/material.dart';
import 'app_colors.dart';

final appTheme = ThemeData(
  unselectedWidgetColor: Colors.white54,
  scaffoldBackgroundColor: AppColors.bgColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 2
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white54),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white54),
    ),
  ),
);