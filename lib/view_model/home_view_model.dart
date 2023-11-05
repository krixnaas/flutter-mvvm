import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/carousel_model.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewModel extends GetxController {
  List<MovieListModel> carouselItems = [];
  final _myRepo = HomeRepository();
  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  ApiResponse<BannerListModel> bannerList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
  }

  setBannersList(ApiResponse<BannerListModel> response2) {
    bannerList = response2;
  }

  Future<void> fetchBannerListApi() async {
    _myRepo.bannerListApi().then((value) {
      setBannersList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBannersList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchMovieListApi() async {
    _myRepo.movieListApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
  }
}
