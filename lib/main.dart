import 'package:flutter/material.dart';
import 'package:mvvm/utils/theme/theme.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/on_boarding_view.dart';
import 'package:mvvm/view/welcome_view.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/dashboard_view_model.dart';
import 'package:mvvm/view_model/forgot_password_view_model.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/profile_view_model.dart';
import 'package:mvvm/view_model/service_list_view_model.dart';
import 'package:mvvm/view_model/user_post_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:mvvm/view_model/welcome_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/onboarding_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
        ChangeNotifierProvider(create: (_) => WelcomeViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => ServiceListViewModel()),
        ChangeNotifierProvider(create: (_) => UserPostViewModel()  ),
      ],
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    )
    );
  }
}
