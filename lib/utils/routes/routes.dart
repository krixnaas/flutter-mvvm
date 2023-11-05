import 'package:get/get.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/dashboard_view.dart';
import 'package:mvvm/view/forgotpassword/forgot_password_mail_view.dart';
import 'package:mvvm/view/forgotpassword/forgot_password_phone_view.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login/login_view.dart';
import 'package:mvvm/view/on_boarding_view.dart';
import 'package:mvvm/view/forgotpassword/otp/otp_view.dart';
import 'package:mvvm/view/profile/update_profile_view.dart';
import 'package:mvvm/view/resetpassword/reset_password_view.dart';
import 'package:mvvm/view/signup/signup_view.dart';
import 'package:mvvm/view/signup/singup_otp_view.dart';
import 'package:mvvm/view/splash_view.dart';
import 'package:mvvm/view/success/success_view.dart';
import 'package:mvvm/view/welcome_view.dart';
import 'package:mvvm/view/profile/profile_view.dart';

class Routes {
  static appRoutes() {
    return [
      GetPage(
        name: RoutesName.home,
        page: () => const HomeView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.login,
        page: () => const LoginView(),
        transitionDuration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.signup,
        page: () => const SignUpView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.splash,
        page: () => const SplashView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.onboarding,
        page: () => const OnBoardingView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.welcome,
        page: () => const WelcomeView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.forgotpasswordmail,
        page: () => const ForgotPasswordMailView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.forgotpasswordphone,
        page: () => const ForgotPasswordPhoneView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.otp,
        page: () => const OTPView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.resetpassword,
        page: () => const ResetPasswordView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.dashboard,
        page: () => const DashboardView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.profile,
        page: () => const ProfileView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.update_profile,
        page: () => const UpdateProfileView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.downToUp,
      ),
      GetPage(
        name: RoutesName.success_view,
        page: () => const SuccessView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.signupotp,
        page: () => const SignUpOTPView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeft,
      ),
    ];
  }
}
