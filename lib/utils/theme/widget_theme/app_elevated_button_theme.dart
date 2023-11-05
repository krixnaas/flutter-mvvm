import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  /* ---- Light Theme---- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: AppColors.tWhiteColor,
      backgroundColor: AppColors.tSecondaryColor,
      side: BorderSide(color: AppColors.tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
    ),
  );

  /* ---- Dark Theme---- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    foregroundColor: AppColors.tSecondaryColor,
    backgroundColor: AppColors.tWhiteColor,
    side: BorderSide(color: AppColors.tWhiteColor),
    padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
  ));
}
