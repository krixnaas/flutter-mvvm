import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.transparent : AppColors.whiteColor,
        title: Text("Update Profile", style: txtTheme.titleLarge,),
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image:AssetImage(userProfileImage))),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.tPrimaryColor,
                      ),
                      child: const Icon(LineAwesomeIcons.camera, size:20.0, color: Colors.black,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: tFormHeightSize,),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: nameHint,
                  labelText: nameHint,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, nameFocusNode, emailFocusNode);
                },
              ),
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
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, phoneFocusNode);
                },
              ),
              SizedBox(height: tFormHeightSize-20,),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: phoneHint,
                  labelText: phoneHint,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, phoneFocusNode);
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
              SizedBox(height: tFormHeightSize,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tPrimaryColor,
                    side: BorderSide.none,
                  ),
                  child: Text(editProfile.toUpperCase(), style: TextStyle(color: AppColors.tDarkColor),),
                ),
              ),
              SizedBox(height: tFormHeightSize,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: joined,
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: joinedAt,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        )
                      ]
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        foregroundColor: Colors.red,
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                      ),
                      child: Text(delete))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
