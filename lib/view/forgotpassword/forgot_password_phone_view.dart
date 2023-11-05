import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/forgotpassword/widgets/reset_password_button_widget.dart';
import 'package:mvvm/view_model/forgot_password_view_model.dart';
import 'package:mvvm/view_model/services/forgot_password_services.dart';

class ForgotPasswordPhoneView extends StatefulWidget {
  const ForgotPasswordPhoneView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPhoneView> createState() =>
      _ForgotPasswordPhoneViewState();
}

class _ForgotPasswordPhoneViewState extends State<ForgotPasswordPhoneView> {
  bool animate = false;
  final forgotPasswordViewModel = Get.put(ForgotPasswordViewModel());
  final _formKey = GlobalKey<FormState>();
  ForgotPasswordServices forgotPasswordServices = ForgotPasswordServices();

  @override
  void initState() {
    super.initState();
    forgotPasswordViewModel.idController.value.clear();
    forgotPasswordServices.startAnimate().then((value) {
      setState(() {
        animate =
            value; // Update the local animate variable in the widget's state
      });
    });
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
                    Text(forgetPhoneSubtitle,
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
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: phoneHint,
                      labelText: phoneHint,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesName.forgotpasswordmail);
                      },
                      child: const Text(retriveByEmail)),
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
