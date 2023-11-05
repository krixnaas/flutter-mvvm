import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/forgotpassword/widgets/reset_password_button_widget.dart';
import 'package:mvvm/view_model/forgot_password_view_model.dart';
import 'package:mvvm/view_model/services/forgot_password_services.dart';

class ForgotPasswordMailView extends StatefulWidget {
  const ForgotPasswordMailView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordMailView> createState() => _ForgotPasswordMailViewState();
}

class _ForgotPasswordMailViewState extends State<ForgotPasswordMailView> {
  final forgotPasswordViewModel = Get.put(ForgotPasswordViewModel());
  final _formKey = GlobalKey<FormState>();
  ForgotPasswordServices forgotPasswordServices = ForgotPasswordServices();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    forgotPasswordViewModel.idController.value.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(
                  child: Image(
                    image: const AssetImage(forgotPasswordImage),
                    height: height * 0.2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      forgotPasswordPage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(forgetEmailSubtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                const SizedBox(
                  height: tFormHeightSize - 10,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: forgotPasswordViewModel.idController.value,
                    focusNode: forgotPasswordViewModel.idFoucsNode.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: emailHint,
                      labelText: emailHint,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesName.forgotpasswordphone);
                      },
                      child: const Text(retriveByPhone)),
                ),
                ResetPasswordButtonWidget(
                  formKey: _formKey,
                ),
                const SizedBox(
                  height: tFormHeightSize,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(RoutesName.login);
                    },
                    child: Text.rich(
                      TextSpan(
                          text: rememberPassword,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const [
                            TextSpan(
                                text: login,
                                style: TextStyle(color: Colors.blue))
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
