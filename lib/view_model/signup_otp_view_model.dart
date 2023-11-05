import 'package:get/get.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class SignUpOTPViewModel extends GetxController {
  final _myRepo = AuthRepository();
  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;

  Future<void> verifySignupOtpToken(String enteredCode, String otpID) async {
    loading.value = true;
    Map data = {'otp': enteredCode, 'phone': otpID};
    _myRepo.verifySignupOtpToken(data).then((value) {
      if (value['success'] == false) {
        Utils.failedSnackBar(value['message']);
      } else {
        Get.delete<SignUpOTPViewModel>();
        Get.toNamed(RoutesName.success_view)!.then((value) {});
        Utils.successSnackBar('Account Verified Successfully!');
      }
      loading.value = false;
    }).onError((error, stactTrace) {
      print(error.toString());
      loading.value = false;
      Utils.failedSnackBar(error.toString());
    });
  }
}
