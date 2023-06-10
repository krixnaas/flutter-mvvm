import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();

  }
  @override
  Widget build(BuildContext context) {
  final authViewModel = Provider.of<AuthViewModel>(context);
  final size  = MediaQuery.of(context).size;
  return SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image:AssetImage(welcomeTop), height: size.height * 0.22,),
              Text(loginTitle, style: Theme.of(context).textTheme.headlineLarge,),
              Text(loginSubtitle, style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: tFormHeightSize-20,),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: emailHint,
                  labelText: emailHint,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value){
                  Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                },
              ),
              SizedBox(height: tFormHeightSize-20,),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context , value, child){
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      focusNode: passwordFocusNode,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: passwordHint,
                        labelText: passwordHint,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.fingerprint),
                        suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value = !_obsecurePassword.value ;
                            },
                            child: Icon(
                                _obsecurePassword.value ?  Icons.visibility_off_outlined :
                                Icons.visibility
                            )),
                      ),
                    );

                  }
              ),
              SizedBox(height: tFormHeightSize-20,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      forgot_password_modal_bottom_sheet(context);
                      },
                    child: Text(forgotPassword)
                ),
              ),
              SizedBox(height: tFormHeightSize-20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RoutesName.dashboard);
                  },
                  child: Text(login.toUpperCase()),
                ),
              ),
              SizedBox(height: tFormHeightSize-10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(or),
                  SizedBox(height: tFormHeightSize-10,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: Image(
                        image:AssetImage(googleLogoImage),
                        width: 20.0,
                      ),
                      onPressed: (){},
                      label: Text(googleAccount),
                    ),
                  ),
                  SizedBox(height: tFormHeightSize-20,),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, RoutesName.signup);
                  },child: Text.rich(
                    TextSpan(
                        text: noAccount,
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(text: signUp, style: TextStyle(color: Colors.blue)
                          )
                        ]
                    ),)
                  )
                ],
              ),
              RoundButton(
                loading: authViewModel.loading,
                title: 'Login',
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter email', context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter password', context);
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage('Please enter 6 digit password', context);
                  }else {
                    Map data = {
                      'email' : _emailController.text.toString(),
                      'password' : _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                    print('api hit');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }

  Future<dynamic> forgot_password_modal_bottom_sheet(BuildContext context) {
    return showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        builder: (context) => Container(
                          padding: EdgeInsets.all(tDefaultSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(forgotPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
                              Text(forgotPasswordSubtitle, style: Theme.of(context).textTheme.titleMedium,),
                              const SizedBox(height: 30.0,),
                              ForgotPasswordWidget(
                                  btnIcon: Icons.mail_outline_rounded,
                                  title: emailHint,
                                  subTitle: resetViaEmail,
                                  onTap: (){
                                    Navigator.pushNamed(context, RoutesName.forgotpasswordmail);
                                  }),
                              const SizedBox(height: 20.0,),
                              ForgotPasswordWidget(
                                  btnIcon: Icons.mobile_friendly_outlined,
                                  title: phoneHint,
                                  subTitle: resetViaPhone,
                                  onTap: (){
                                    Navigator.pushNamed(context, RoutesName.forgotpasswordphone);
                                  }),
                            ],
                          ),
                        )
                      );
  }
}

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key, required this.btnIcon, required this.title, required this.subTitle, required this.onTap,
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
            Icon(btnIcon, size: 60.0,),
            const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge,),
                Text(subTitle, style: Theme.of(context).textTheme.titleSmall,),
              ],
            )
          ],
        ),
      ),
    );
  }
}