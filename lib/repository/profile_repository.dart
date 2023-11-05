import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';

class ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> getProfileData() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponseWithToken(AppUrl.profile);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateProfile(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApiResponseWithToken(
          AppUrl.updateProfile, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
