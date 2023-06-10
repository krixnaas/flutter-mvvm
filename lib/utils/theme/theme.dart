import 'package:flutter/material.dart';
import 'package:mvvm/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:mvvm/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:mvvm/utils/theme/widget_theme/text_field_theme.dart';
import 'package:mvvm/utils/theme/widget_theme/text_theme.dart';

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TAppTextTheme.lightTextTheme,
    outlinedButtonTheme: tOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TelevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme:TAppTextTheme.darkTextTheme,
    outlinedButtonTheme: tOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TelevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}