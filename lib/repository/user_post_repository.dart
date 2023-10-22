import 'dart:convert';

import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';

class UserPostRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> userPostApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponseWithToken(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
