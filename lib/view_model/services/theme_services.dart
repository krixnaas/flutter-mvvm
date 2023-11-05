import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeServices extends GetxController {
  var isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    update();
  }

  ThemeData get currentTheme =>
      isDarkMode ? ThemeData.dark() : ThemeData(brightness: Brightness.light);
}

final themeServices = Get.put(ThemeServices());
