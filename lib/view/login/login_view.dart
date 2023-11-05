import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/login/widgets/login_button_widget.dart';
import 'package:mvvm/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginViewModel = Get.put(AuthViewModel());

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage(welcomeTop),
                    height: size.height * 0.22,
                  ),
                  Text(
                    loginTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    loginSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: tFormHeightSize - 10,
                  ),
                  TextFormField(
                    controller: loginViewModel.emailController.value,
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
                          loginViewModel.emailFoucsNode.value,
                          loginViewModel.passwordFoucsNode.value);
                    },
                  ),
                  const SizedBox(
                    height: tFormHeightSize - 15,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: loginViewModel.passwordController.value,
                          obscureText: _obsecurePassword.value,
                          focusNode: loginViewModel.passwordFoucsNode.value,
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
                    height: tFormHeightSize - 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Row(
                            children: [
                              Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                  checkColor: Colors.blueGrey,
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    loginViewModel.rememberMe.value = value!;
                                  },
                                  value: loginViewModel.rememberMe.value),
                              TextButton(
                                  onPressed: () {
                                    loginViewModel.toggleRememberMe(
                                        !loginViewModel.rememberMe.value);
                                  },
                                  child: const Text(rememberMe)),
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            forgot_password_modal_bottom_sheet(context);
                          },
                          child: const Text(forgotPassword)),
                    ],
                  ),
                  const SizedBox(
                    height: tFormHeightSize - 20,
                  ),
                  LoginButtonWidget(
                    formKey: _formKey,
                  ),
                  const SizedBox(
                    height: tFormHeightSize - 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(or),
                      const SizedBox(
                        height: tFormHeightSize - 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: const Image(
                            image: AssetImage(googleLogoImage),
                            width: 20.0,
                          ),
                          onPressed: () {},
                          label: const Text(googleAccount),
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeightSize - 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesName.signup);
                          },
                          child: Text.rich(
                            TextSpan(
                                text: noAccount,
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: const [
                                  TextSpan(
                                      text: signUp,
                                      style: TextStyle(color: Colors.blue))
                                ]),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> forgot_password_modal_bottom_sheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        builder: (context) => Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forgotPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    forgotPasswordSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ForgotPasswordWidget(
                      btnIcon: Icons.mail_outline_rounded,
                      title: emailHint,
                      subTitle: resetViaEmail,
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.forgotpasswordmail);
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ForgotPasswordWidget(
                      btnIcon: Icons.mobile_friendly_outlined,
                      title: phoneHint,
                      subTitle: resetViaPhone,
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.forgotpasswordphone);
                      }),
                ],
              ),
            ));
  }
}

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 60.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
