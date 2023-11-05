import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: AppColors.tSecondaryColor,
    floatingLabelStyle: TextStyle(color: AppColors.tSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.tSecondaryColor,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: AppColors.tPrimaryColor,
    floatingLabelStyle: TextStyle(color: AppColors.tPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.tPrimaryColor),
    ),
  );
}
