import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.login, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.register, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getTokenApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.requestResetToken, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> verifyTokenApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.resetTokenVerify, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> resetPasswordApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.resetPassword, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> verifySignupOtpToken(dynamic data) async {
    dynamic response =
        await _apiServices.getPostApiResponse(AppUrl.registerVerify, data);
    try {
      return response;
    } catch (e) {
      throw e;
    }
  }
}
