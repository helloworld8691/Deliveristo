import 'package:flutter/material.dart';
import 'app_colors.dart';

final appTheme = ThemeData(
  unselectedWidgetColor: Colors.white54,
  scaffoldBackgroundColor: AppColors.bgColor,
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