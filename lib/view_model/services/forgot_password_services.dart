import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class ForgotPasswordServices{
  bool animate = false;
  Future<bool> startAnimate() async{
    await Future.delayed(Duration(milliseconds: 500));
    return animate=true;
    await Future.delayed(Duration(milliseconds: 5000));
  }
}