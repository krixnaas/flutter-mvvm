import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/dashboard_view.dart';
import 'package:mvvm/view/forgotpassword/forgot_password_mail_view.dart';
import 'package:mvvm/view/forgotpassword/forgot_password_phone_view.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/on_boarding_view.dart';
import 'package:mvvm/view/otp_view.dart';
import 'package:mvvm/view/profile/update_profile_view.dart';
import 'package:mvvm/view/service_detail_view.dart';
import 'package:mvvm/view/service_list_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';
import 'package:mvvm/view/user_post_view.dart';
import 'package:mvvm/view/welcome_view.dart';
import 'package:mvvm/view/profile/profile_view.dart';
import 'package:page_transition/page_transition.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return PageTransition(
          child: const HomeView(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesName.onboarding:
        return MaterialPageRoute(builder: (BuildContext context) => const OnBoardingView());
      case RoutesName.welcome:
        return MaterialPageRoute(builder: (BuildContext context) => const WelcomeView()); 
      case RoutesName.forgotpasswordmail:
        return MaterialPageRoute(builder: (BuildContext context) => const ForgotPasswordMailView());
      case RoutesName.forgotpasswordphone:
        return MaterialPageRoute(builder: (BuildContext context) => const ForgotPasswordPhoneView());
      case RoutesName.otp:
        return MaterialPageRoute(builder: (BuildContext context) => const OTPView());
      case RoutesName.dashboard:
        return MaterialPageRoute(builder: (BuildContext context) => const DashboardView());
      case RoutesName.profile:
        return MaterialPageRoute(builder: (BuildContext context) => const ProfileView());
      case RoutesName.update_profile:
        return MaterialPageRoute(builder: (BuildContext context) => const UpdateProfileView());
      case RoutesName.user_post:
        return MaterialPageRoute(builder: (BuildContext context) => const UserPostView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}