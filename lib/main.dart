import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/locale/languages.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/theme/theme.dart';
import 'package:mvvm/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'API',
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        getPages: Routes.appRoutes(),
        theme: Themes().lightTheme,
        darkTheme: Themes().lightTheme,
        home: const SplashView());
  }
}
