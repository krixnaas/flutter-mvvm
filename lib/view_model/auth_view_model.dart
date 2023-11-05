import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class AuthViewModel extends GetxController {
  final _myRepo = AuthRepository();
  UserPreference userPreference = UserPreference();

  //Login
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool rememberMe = true.obs;

  final emailFoucsNode = FocusNode().obs;
  final passwordFoucsNode = FocusNode().obs;

  //Signup
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final passwordConfirmationController = TextEditingController().obs;

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmationFocusNode = FocusNode();

  RxBool loading = false.obs;

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  Future<void> loginApi() async {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _myRepo.loginApi(data).then((value) {
      //print(value);
      if (value['status'] == 405) {
        Utils.failedSnackBar(value['message']);
        Get.delete<AuthViewModel>();
        Get.toNamed(RoutesName.signupotp,
                arguments: emailController.value.text)!
            .then((value) {});
        //redirect to account verify section.
      } else if (value['success'] == false) {
        Utils.failedSnackBar(value['message']);
      } else {
        if (rememberMe.value) {
          userPreference.saveUser(UserModel.fromJson(value)).then((value) {
            Get.delete<AuthViewModel>();
            Get.toNamed(RoutesName.dashboard)!.then((value) {});
          });
        } else {
          Get.delete<AuthViewModel>();
          Get.toNamed(RoutesName.dashboard)!.then((value) {});
        }
        Utils.successSnackBar('Login Successful!');
      }

      loading.value = false;
    }).onError((error, stactTrace) {
      print(error.toString());
      loading.value = false;
      Utils.failedSnackBar(error.toString());
    });
  }

  Future<void> singupApi() async {
    Map data = {
      'first_name': firstNameController.value.text,
      'last_name': lastNameController.value.text,
      'email': emailController.value.text,
      'phone': phoneController.value.text,
      'password': passwordController.value.text,
      'password_confirmation': passwordConfirmationController.value.text,
    };
    loading.value = true;
    _myRepo.signUpApi(data).then((value) {
      if (value['success'] == false) {
        Utils.failedSnackBar(value['message']);
      } else {
        Get.delete<AuthViewModel>();
        Get.toNamed(RoutesName.signupotp,
                arguments: emailController.value.text)!
            .then((value) {});
        Utils.successSnackBar('Sign Up Successful! Please Verify your email.');
      }

      loading.value = false;
    }).onError((error, stactTrace) {
      loading.value = false;
      Utils.failedSnackBar(error.toString());
    });
  }
}
