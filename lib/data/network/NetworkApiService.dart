// ignore: file_names
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/view_model/user_preference/user_preference.dart';

class NetworkApiService extends BaseApiServices {
  UserPreference userPreference = UserPreference();

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getGetApiResponseWithToken(String url) async {
    final userPreference = UserPreference();
    final userModel = await userPreference.getUesr();
    final bearerToken = userModel.data!.token;
    dynamic responseJson;
    try {
      // Add the bearer token to the `Authorization` header of the HTTP request.
      final headers = {
        'Authorization': 'Bearer $bearerToken',
      };
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postApiResponseWithToken(String url, dynamic data) async {
    final userPreference = UserPreference();
    final userModel = await userPreference.getUesr();
    final bearerToken = userModel.data!.token;
    dynamic responseJson;
    try {
      final headers = {
        'Authorization': 'Bearer $bearerToken',
      };
      Response response = await http
          .post(Uri.parse(url), headers: headers, body: data)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
  }
}
