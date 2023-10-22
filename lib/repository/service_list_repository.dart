import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/services_list_model.dart';
import 'package:mvvm/res/app_url.dart';

class ServiceListRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<ServiceListModel> serviceListApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponseWithToken(AppUrl.serviceListEndPoint);
      print(response);
      return ServiceListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}