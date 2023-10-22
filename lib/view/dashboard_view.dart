import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/profile/profile_view.dart';
import 'package:mvvm/view/service_list_view.dart';
import 'package:mvvm/view/user_post_view.dart';
import 'package:page_transition/page_transition.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  var currentPage = DrawerSections.dashboard;
  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const HomeView(),
      const ServiceListView(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.book_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    //variables
    var mediaQuery = MediaQuery.of(context);
    final txtTheme = Theme.of(context).textTheme;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
              Container(
              color: Colors.green[700],
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      "Username",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "email@domain.com",
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
                  MyDrawerList()
                ],
              ),
            )
        ),
      ),
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
        onPressed: (){
          Navigator.push(context, PageTransition(child: const UserPostView(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: AppColors.tPrimaryColor,
        child: Icon(Icons.add, color: AppColors.tDarkColor,),
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
          onTap: (index){
            setState(() {
              _bottomNavIndex = index;
            });
          }
      ),
    );
  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "My Ads", Icons.post_add_sharp,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Profile", Icons.manage_accounts_sharp,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(7, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
              Navigator.pushNamed(context, RoutesName.dashboard);
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              Navigator.pushNamed(context, RoutesName.profile);
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 9) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  ads,
  saved,
  radio,
  business,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
