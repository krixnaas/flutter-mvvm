import 'package:flutter/material.dart';
import 'package:mvvm/utils/theme/widget_theme/text_field_theme.dart';
import 'package:mvvm/utils/theme/widget_theme/app_outlined_button_theme.dart';
import 'package:mvvm/utils/theme/widget_theme/app_elevated_button_theme.dart';

class Themes {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
  );
}
