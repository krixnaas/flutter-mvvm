import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

AppBar buildAppBar(String name, bool isDarkMode, TextTheme txtTheme, BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.all(4),
      child: IconButton(
        icon: const Image(image: AssetImage(userProfileImage)),//Icon(Icons.menu, color: isDarkMode ? Colors.white : Colors.black,),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    ),
    title: Text(name, style: txtTheme.titleLarge,),
    elevation: 1,
    backgroundColor: isDarkMode ? Colors.transparent : AppColors.whiteColor,
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 0, top: 0),
        child: IconButton(onPressed: () {
        }, icon: Icon(Icons.notifications, color: Colors.black87,)
        ),
      ),/*
      Container(
        margin: const EdgeInsets.only(right: 15, top: 0),
        child: IconButton(onPressed: () {
          Navigator.pushNamed(context, RoutesName.profile);
        }, icon: const Image(image: AssetImage(userProfileImage)),),
      )*/
    ],
  );
}