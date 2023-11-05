import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

AppBar buildAppBar(
    String name, bool isDarkMode, TextTheme txtTheme, BuildContext context) {
  return AppBar(
    leading: Icon(
      Icons.menu,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
    title: Text(
      name,
      style: txtTheme.headlineSmall,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 2, top: 0),
        child: IconButton(
          onPressed: () {
            Get.toNamed(RoutesName.profile);
          },
          icon: const Image(image: AssetImage(userProfileImage)),
        ),
      ),
    ],
  );
}
