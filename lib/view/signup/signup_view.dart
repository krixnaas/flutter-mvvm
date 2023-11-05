import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final authViewModel = Get.put(AuthViewModel());
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(welcomeTop),
                  height: size.height * 0.12,
                ),
                Text(
                  signUpTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  signUpSubtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: tFormHeightSize - 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: authViewModel.firstNameController.value,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: firstNameHint,
                          labelText: firstNameHint,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context,
                              authViewModel.firstNameFocusNode,
                              authViewModel.lastNameFocusNode);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                        controller: authViewModel.lastNameController.value,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: lastNameHint,
                          labelText: lastNameHint,
                          border: OutlineInputBorder(),
                        ),
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context,
                              authViewModel.lastNameFocusNode,
                              authViewModel.emailFocusNode);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: tFormHeightSize - 20,
                ),
                TextFormField(
                  controller: authViewModel.emailController.value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: emailHint,
                    labelText: emailHint,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context,
                        authViewModel.emailFocusNode,
                        authViewModel.phoneFocusNode);
                  },
                ),
                const SizedBox(
                  height: tFormHeightSize - 20,
                ),
                TextFormField(
                  controller: authViewModel.phoneController.value,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: phoneHint,
                    labelText: phoneHint,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context,
                        authViewModel.phoneFocusNode,
                        authViewModel.passwordFocusNode);
                  },
                ),
                const SizedBox(
                  height: tFormHeightSize - 20,
                ),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: authViewModel.passwordController.value,
                        obscureText: _obsecurePassword.value,
                        focusNode: authViewModel.passwordFocusNode,
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
                      );
                    }),
                const SizedBox(
                  height: tFormHeightSize - 20,
                ),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller:
                            authViewModel.passwordConfirmationController.value,
                        obscureText: _obsecurePassword.value,
                        focusNode: authViewModel.passwordConfirmationFocusNode,
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
                SizedBox(
                  width: double.infinity,
                  child: Obx(() => RoundButtonWidget(
                        loading: authViewModel.loading.value,
                        title: signUp.toUpperCase(),
                        onPress: () {
                          if (authViewModel
                              .emailController.value.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please enter email', context);
                          } else if (authViewModel
                              .passwordController.value.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please enter password', context);
                          } else if (authViewModel
                                  .firstNameController.value.text.isEmpty ||
                              authViewModel
                                  .lastNameController.value.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Name Cannot be Empty', context);
                          } else if (authViewModel
                                  .passwordController.value.text.length <
                              6) {
                            Utils.flushBarErrorMessage(
                                'Please enter 6 digit` password', context);
                          } else if (authViewModel
                                  .passwordController.value.text !=
                              authViewModel
                                  .passwordConfirmationController.value.text) {
                            Utils.flushBarErrorMessage(
                                'Password Mismatched', context);
                          } else {
                            authViewModel.singupApi();
                          }
                        },
                      )),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(or),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Image(
                          image: AssetImage(googleLogoImage),
                          width: 20.0,
                        ),
                        onPressed: () {},
                        label: Text(googleAccount.toUpperCase()),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: Text.rich(
                          TextSpan(
                              text: alreadyHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: [
                                const TextSpan(
                                    text: login,
                                    style: TextStyle(color: Colors.blue))
                              ]),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
