import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';
import 'package:mvvm/model/user_profile.dart';
import 'package:mvvm/repository/profile_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class ProfileViewModel extends getx.GetxController {
  final profileRepository = ProfileRepository();
  UserProfileModel userProfileModel = UserProfileModel();
  bool _animate = false;
  RxBool loading = false.obs;
  bool get animate => _animate;

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();

  set animate(bool value) {
    _animate = value;
  }

  Future<void> getProfileData() async {
    try {
      showLoading();
      final response = await profileRepository.getProfileData();
      if (response['success'] == false) {
        Utils.failedSnackBar(response['message']);
      }
      userProfileModel = UserProfileModel.fromJson(response);
      hideLoading();
    } catch (error) {
      Utils.successSnackBar('Failed to get profile data');
      hideLoading();
    }
  }

  Future<void> updateProfileData() async {
    try {
      showLoading();
      Map data = {
        'first_name': firstNameController.value.text,
        'last_name': lastNameController.value.text
      };
      final response = await profileRepository.updateProfile(data);
      if (response['success'] == false) {
        Utils.failedSnackBar(response['message']);
      }
      Get.delete<ProfileViewModel>();
      Get.toNamed(RoutesName.profile)!.then((value) {});
      Utils.successSnackBar('Profile Updated Successfully!');
      hideLoading();
    } catch (error) {
      Utils.successSnackBar('Failed to get profile data');
      hideLoading();
    }
  }

  void showLoading() {
    loading(true);
  }

  void hideLoading() {
    loading(false);
  }
}
