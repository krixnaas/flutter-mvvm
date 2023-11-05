import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login/login_view.dart';
import 'package:mvvm/view/profile/profile_view.dart';
import 'package:page_transition/page_transition.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomeView(),
      const ProfileView(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    //variables
    var mediaQuery = MediaQuery.of(context);
    final txtTheme = Theme.of(context).textTheme;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _bottomNavIndex,
          children: _widgetOptions(),
        ),
        /*SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(dashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(dashboardTitle, style: txtTheme.bodyLarge,),
               Text(dashboardHeading, style: txtTheme.headlineMedium,),
               const SizedBox(height: dashboardPadding,),
               Container(
                 decoration: const BoxDecoration(
                   border: Border(left: BorderSide(width: 4))
                 ),
                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(dashboardSearch, style: txtTheme.headlineMedium?.apply(color: Colors.grey.withOpacity(0.5)),),
                     const Icon(Icons.mic, size: 25,),
                   ],
                 )
               ),
               const SizedBox(height: dashboardPadding,),
               SizedBox(
                 width: 170,
                 height: 50,
                 child: Row(
                   children: [
                     Container(
                       width: 45,
                       height: 45,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: AppColors.tDarkColor,
                       ),
                       child: Center(
                         child: Text("JS", style: txtTheme.headlineMedium,),
                       ),
                     )
                   ],
                 ),
               )
             ],
            ),
          ),
        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const LoginView(),
                    type: PageTransitionType.bottomToTop));
          },
          backgroundColor: AppColors.tPrimaryColor,
          child: Icon(
            Icons.qr_code_scanner_sharp,
            color: AppColors.tDarkColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            splashColor: AppColors.tSecondaryColor,
            activeColor: AppColors.tSecondaryColor,
            inactiveColor: Colors.black.withOpacity(.5),
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              setState(() {
                _bottomNavIndex = index;
              });
            }),
      ),
    );
  }
}
