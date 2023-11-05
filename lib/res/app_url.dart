class AppUrl {
  static var baseUrl = "http://10.0.2.2:8000/api";

  static var register = '$baseUrl/register';
  static var registerVerify = '$baseUrl/verify/registration';

  static var login = '$baseUrl/login';

  static var requestResetToken = '$baseUrl/token';
  static var resetTokenVerify = '$baseUrl/reset/token/verify';
  static var resetPassword = '$baseUrl/reset/password';

  static var profile = '$baseUrl/user';
  static var updateProfile = '$baseUrl/update/user';

  static var movieEndPoint = 'http://api.filmon.com/api/vod/genres';
  static var bannerEndPoint = 'https://xoto.krishnas.com.np/api/list';
}
