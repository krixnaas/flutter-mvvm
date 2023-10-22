import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userModel = UserModel.fromJson(value);
      final userPreferences = Provider.of<UserViewModel>(context, listen:false);
      userPreferences.saveUser(userModel);
      if (kDebugMode) {
        print(value.toString());
      }
      Utils.flushBarErrorMessage('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.dashboard);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    });
  }
  Future<void> singupApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('SingUp Successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}