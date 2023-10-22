import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 1000));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  @override
  Future getGetApiResponseWithToken(String url, {String? token}) async {
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 10));
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
      Response response = await post(Uri.parse(url),
          body: data)
          .timeout(const Duration(seconds: 10));
      print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponseWithToken(String url, dynamic data, {String? token}) async {
    dynamic responseJson;
    try {
      Response response = await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      }, body: data).timeout(const Duration(seconds: 10));
      print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorizeException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accurate while communcation with server ' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
