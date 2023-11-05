import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/view_model/reset_password_view_model.dart';

class ResetButton extends StatelessWidget {
  final formKey;
  final resetPasswordViewModel = Get.put(ResetPasswordViewModel());
  ResetButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return RoundButtonWidget(
      loading: resetPasswordViewModel.loading.value,
      title: resetButtonText,
      onPress: () {
        if (resetPasswordViewModel.passwordController.value.text.isEmpty) {
          Utils.flushBarErrorMessage('Please enter email', context);
        } else if (resetPasswordViewModel
            .passwordConfirmationController.value.text.isEmpty) {
          Utils.flushBarErrorMessage('Please enter password', context);
        } else if (resetPasswordViewModel.passwordController.value.text.length <
            6) {
          Utils.flushBarErrorMessage('Please enter 6 digit` password', context);
        } else if (resetPasswordViewModel.passwordController.value.text !=
            resetPasswordViewModel.passwordConfirmationController.value.text) {
          Utils.flushBarErrorMessage('Password Didn\'t match', context);
        } else {
          resetPasswordViewModel.resetPassword();
          print('api hit');
        }
      },
    );
  }
}
