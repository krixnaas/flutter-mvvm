import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices{
  Future<UserModel> getUserData() => UserViewModel().getUser();
  Future<bool> startAnimate() async{
    return true;
  }
  void checkAuthentication(BuildContext context) async{
    await Future.delayed(Duration(milliseconds: 4000)); // Wait for animation to complete
    getUserData().then((value){
      print(value.token);
      if(value.token == null || value.token == '' || value.token == 'null')
      {
        Navigator.pushNamed(context, RoutesName.welcome);
      }else{
        Navigator.pushNamed(context, RoutesName.welcome);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}