import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/components/app_bar_widget.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeViewModel = Get.put(HomeViewModel());
  final userPrefrence = Get.put(UserViewModel());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar("Home", isDarkMode, txtTheme, context),
      ),
    );
  }
}
