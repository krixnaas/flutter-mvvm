import 'package:get/get.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/view_model/reset_password_view_model.dart';
import 'package:mvvm/view/resetpassword/reset_button_widget.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final resetPasswordViewModel = Get.put(ResetPasswordViewModel());
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage(welcomeTop),
                      height: size.height * 0.22,
                    ),
                    Text(
                      resetPasswordTitle,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      resetPasswordSubTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: tFormHeightSize - 10,
                    ),
                    ValueListenableBuilder(
                        valueListenable: _obsecurePassword,
                        builder: (context, value, child) {
                          return TextFormField(
                            controller:
                                resetPasswordViewModel.passwordController.value,
                            obscureText: _obsecurePassword.value,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintText: passwordHint,
                              labelText: passwordHint,
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.fingerprint),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _obsecurePassword.value =
                                        !_obsecurePassword.value;
                                  },
                                  child: Icon(_obsecurePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility)),
                            ),
                            onFieldSubmitted: (value) {
                              Utils.fieldFocusChange(
                                context,
                                resetPasswordViewModel.passwordFoucsNode.value,
                                resetPasswordViewModel
                                    .passwordConfirmationFoucsNode.value,
                              );
                            },
                          );
                        }),
                    const SizedBox(
                      height: tFormHeightSize - 20,
                    ),
                    const SizedBox(
                      height: tFormHeightSize - 20,
                    ),
                    ValueListenableBuilder(
                        valueListenable: _obsecurePassword,
                        builder: (context, value, child) {
                          return TextFormField(
                            controller: resetPasswordViewModel
                                .passwordConfirmationController.value,
                            obscureText: _obsecurePassword.value,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintText: passwordConfirmation,
                              labelText: passwordConfirmation,
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.fingerprint),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _obsecurePassword.value =
                                        !_obsecurePassword.value;
                                  },
                                  child: Icon(_obsecurePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility)),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: tFormHeightSize - 20,
                    ),
                    const SizedBox(
                      height: tFormHeightSize - 20,
                    ),
                    ResetButton(
                      formKey: _formKey,
                    ),
                    const SizedBox(
                      height: tFormHeightSize - 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
