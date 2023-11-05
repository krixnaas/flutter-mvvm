import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class ResetPasswordViewModel extends GetxController {
  bool _animate = false;

  bool get animate => _animate;

  set animate(bool value) {
    _animate = value;
  }

  UserPreference userPreference = UserPreference();
  final _myRepo = AuthRepository();
  final passwordController = TextEditingController().obs;
  final passwordFoucsNode = FocusNode().obs;
  final passwordConfirmationController = TextEditingController().obs;
  final passwordConfirmationFoucsNode = FocusNode().obs;

  RxBool loading = false.obs;

  Future<void> resetPassword() async {
    loading.value = true;
    String otp = await userPreference.getOTP();
    Map data = {
      'otp': otp,
      'password': passwordController.value.text,
      'password_confirmation': passwordConfirmationController.value.text
    };
    _myRepo.resetPasswordApi(data).then((value) {
      if (value['success'] == false) {
        Utils.failedSnackBar(value['message']);
      } else {
        Get.delete<ResetPasswordViewModel>();
        userPreference.removeOTP();
        Get.toNamed(RoutesName.login)!.then((value) {});
        Utils.successSnackBar("Password has been reset successfully.");
      }

      loading.value = false;
    }).onError((error, stactTrace) {
      loading.value = false;
      Utils.failedSnackBar(error.toString());
    });
  }
}
