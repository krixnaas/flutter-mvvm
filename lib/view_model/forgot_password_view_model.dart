import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class ForgotPasswordViewModel extends GetxController {
  bool _animate = false;

  bool get animate => _animate;

  set animate(bool value) {
    _animate = value;
  }

  final _myRepo = AuthRepository();
  UserPreference userPreference = UserPreference();

  final idController = TextEditingController().obs;
  final idFoucsNode = FocusNode().obs;

  RxBool loading = false.obs;

  Future<void> getTokenApi() async {
    loading.value = true;
    Map data = {'phone': idController.value.text};
    _myRepo.getTokenApi(data).then((value) {
      if (value['success'] == false) {
        Utils.successSnackBar(value['message']);
      } else {
        Get.delete<ForgotPasswordViewModel>();
        Get.toNamed(RoutesName.otp, arguments: idController.value.text)!
            .then((value) {});
        Utils.successSnackBar('Token Requested');
      }

      loading.value = false;
    }).onError((error, stactTrace) {
      print(error.toString());
      loading.value = false;
      Utils.failedSnackBar(error.toString());
    });
  }
}
