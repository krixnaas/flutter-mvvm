import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/services_list_model.dart';
import 'package:mvvm/repository/service_list_repository.dart';

class ServiceListViewModel with ChangeNotifier{
  final _myRepo = ServiceListRepository();

  ApiResponse<ServiceListModel> serviceList = ApiResponse.loading();

  setServiceList(ApiResponse<ServiceListModel> response){
    serviceList = response;
    notifyListeners();
  }

  Future<void> fetchServiceListApi() async{
    _myRepo.serviceListApi().then((value){
      setServiceList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setServiceList(ApiResponse.error(error.toString()));
    });
  }
}