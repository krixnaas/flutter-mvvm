import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/carousel_model.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> movieListApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.movieEndPoint);
      return MovieListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }

  Future<BannerListModel> bannerListApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.bannerEndPoint);
      print(response);
      return BannerListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}