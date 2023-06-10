import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';

class OTPView extends StatefulWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(otpTitle, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize:80.0,
                ),),
                Text(otpSubtitle.toUpperCase(), style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 40.0,),
                Text(otpMessage + 'krixnaas@gmail.com', textAlign: TextAlign.center,),
                const SizedBox(height: 20.0,),
                OtpTextField(
                  numberOfFields: 4,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code){
                    print("OTP => $code");
                  },
                ),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text(next),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
