
import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/sizes.dart';

class tOutlinedButtonTheme{
  tOutlinedButtonTheme._();

  /* ---- Light Theme---- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: AppColors.tSecondaryColor,
      side: BorderSide(color: AppColors.tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
    ),
  );

  /* ---- Dark Theme---- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        foregroundColor: AppColors.tWhiteColor,
        backgroundColor: AppColors.tSecondaryColor,
        side: BorderSide(color: AppColors.tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
      ),
  );
}