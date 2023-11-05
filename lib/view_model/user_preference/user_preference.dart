import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userModel.data!.token.toString());
    return true;
  }

  Future<UserModel> getUesr() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    if (token != null) {
      return UserModel(data: Data(token: token));
    } else {
      return UserModel(
        success: false,
        data: Data(token: token),
        message: 'Token not found',
        status: 404,
        timestamp: 'timestamp_value',
      );
    }
  }

  Future removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

  Future<bool> saveOTP(String otp) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('otp', otp.toString());
    return true;
  }

  Future getOTP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? otp = sp.getString('otp');
    return otp;
  }

  Future removeOTP() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('otp');
    return true;
  }
}
