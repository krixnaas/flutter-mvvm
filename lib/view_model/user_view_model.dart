import 'package:get/get.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends GetxController {
  Future<bool> saveUser(UserModel user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.data!.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    if (token != null) {
      return UserModel(data: Data(token: token));
    } else {
      // Handle the case where the token is not found in SharedPreferences.
      // You can return a default or handle it as needed.
      return UserModel(
        success: false,
        data: Data(token: token),
        message: 'Token not found',
        status: 404,
        timestamp: 'timestamp_value',
      );
    }
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    print(sp);
    sp.remove('token');
    //return sp.clear();
    return true;
  }
}
