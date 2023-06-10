import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: AppColors.tSecondaryColor,
    floatingLabelStyle: TextStyle(color: AppColors.tSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: AppColors.tSecondaryColor,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: AppColors.tPrimaryColor,
    floatingLabelStyle: TextStyle(color: AppColors.tPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: AppColors.tPrimaryColor),
    ),
  );
}