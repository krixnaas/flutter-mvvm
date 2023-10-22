abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getGetApiResponseWithToken(String url, {String? token});
  Future<dynamic> getPostApiResponseWithToken(String url, dynamic data, {String? token});

  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
