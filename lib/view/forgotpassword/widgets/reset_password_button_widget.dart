import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/view_model/forgot_password_view_model.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  final formKey;
  final forgetPasswordResetVM = Get.put(ForgotPasswordViewModel());
  ResetPasswordButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButtonWidget(
          loading: forgetPasswordResetVM.loading.value,
          title: 'Next',
          onPress: () {
            if (forgetPasswordResetVM.idController.value.text.isEmpty) {
              Utils.flushBarErrorMessage('Please enter valid ID', context);
            } else {
              forgetPasswordResetVM.getTokenApi();
              print('token request api hit');
            }
          },
        ));
  }
}
