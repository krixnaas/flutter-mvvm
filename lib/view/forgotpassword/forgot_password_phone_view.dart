import 'package:flutter/material.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/services/forgot_password_services.dart';

class ForgotPasswordPhoneView extends StatefulWidget {
  const ForgotPasswordPhoneView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPhoneView> createState() => _ForgotPasswordPhoneViewState();
}

class _ForgotPasswordPhoneViewState extends State<ForgotPasswordPhoneView> {
  bool animate=false;
  ForgotPasswordServices forgotPasswordServices = ForgotPasswordServices();
  TextEditingController _phoneController = TextEditingController();

  FocusNode phoneFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _phoneController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotPasswordServices.startAnimate().then((value) {
      setState(() {
        animate = value; // Update the local animate variable in the widget's state
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
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                AnimatedPositioned(
                  top: animate ? 0 : -30,
                  left: animate ? 0 : -30,
                  duration: const Duration(milliseconds: 1600),
                  child:Image(image:AssetImage(forgotPasswordImage), height: height * 0.3,),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  top: 20,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: animate ? 1 : 0,
                    child: Column(
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
                  ),
                ),
                SizedBox(height: tFormHeightSize-10,),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: phoneHint,
                    labelText: phoneHint,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                ),
                SizedBox(height: tFormHeightSize-10,),
                SizedBox(
                    width: double.infinity, child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, RoutesName.otp);
                }, child: const Text(next))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
