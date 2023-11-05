import 'dart:async';
import 'package:get/get.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();
  Future<bool> startAnimate() async {
    return true;
  }

  void checkAuthentication() {
    userPreference.getUesr().then((value) {
      if (value != null && value.data != null && value.data!.token != null) {
        if (value.data!.token!.isEmpty || value.data!.token == 'null') {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RoutesName.onboarding));
        } else {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RoutesName.dashboard));
        }
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.onboarding));
      }
    });
  }
}
