import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/view_model/otp_view_model.dart';
import 'package:mvvm/view_model/signup_otp_view_model.dart';

class SignUpOTPView extends StatefulWidget {
  const SignUpOTPView({Key? key}) : super(key: key);

  @override
  State<SignUpOTPView> createState() => _SignUpOTPViewState();
}

class _SignUpOTPViewState extends State<SignUpOTPView> {
  final signUpOTPViewModel = Get.put(SignUpOTPViewModel());
  final _formKey = GlobalKey<FormState>();
  String otpID = "";
  String enteredCode = "";
  @override
  void initState() {
    super.initState();

    // Retrieve email from arguments
    final arguments = Get.arguments;
    if (arguments is String) {
      otpID = arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              otpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(
              signUpOtpSubtitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 40.0,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                otpMessage + otpID,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Form(
              key: _formKey,
              child: OtpTextField(
                numberOfFields: 4,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  enteredCode = code.toString();
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Obx(
                () => RoundButtonWidget(
                  loading: signUpOTPViewModel.loading.value,
                  title: next,
                  onPress: () {
                    signUpOTPViewModel.verifySignupOtpToken(enteredCode, otpID);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
