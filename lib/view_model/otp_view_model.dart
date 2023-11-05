import 'package:get/get.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class OTPViewModel extends GetxController {
  final _myRepo = AuthRepository();
  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;

  Future<void> verifyOtpToken(String enteredCode, String otpID) async {
    loading.value = true;
    Map data = {'otp': enteredCode};
    _myRepo.verifyTokenApi(data).then((value) {
      if (value['success'] == false) {
        Utils.failedSnackBar(value['message']);
      } else {
        Get.delete<OTPViewModel>();
        userPreference.saveOTP(enteredCode);
        Get.toNamed(RoutesName.resetpassword)!.then((value) {});
      }

      loading.value = false;
    }).onError((error, stactTrace) {
      print(error.toString());
      loading.value = false;
      Utils.successSnackBar(error.toString());
    });
  }
}
