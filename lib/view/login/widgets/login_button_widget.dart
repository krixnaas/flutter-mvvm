import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/res/components/round_button.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  final loginViewModel = Get.put(AuthViewModel());
  LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButtonWidget(
          loading: loginViewModel.loading.value,
          title: 'Login',
          onPress: () {
            if (loginViewModel.emailController.value.text.isEmpty) {
              Utils.flushBarErrorMessage('Please enter email', context);
            } else if (loginViewModel.passwordController.value.text.isEmpty) {
              Utils.flushBarErrorMessage('Please enter password', context);
            } else if (loginViewModel.passwordController.value.text.length <
                6) {
              Utils.flushBarErrorMessage(
                  'Please enter 6 digit` password', context);
            } else {
              loginViewModel.loginApi();
              print('api hit');
            }
          },
        ));
  }
}
