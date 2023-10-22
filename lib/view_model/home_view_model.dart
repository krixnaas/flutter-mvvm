import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/carousel_model.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{
  List<MovieListModel> carouselItems = [];
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  ApiResponse<BannerListModel> bannerList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response;
    notifyListeners();
  }

  setBannersList(ApiResponse<BannerListModel> response2){
    bannerList = response2;
    notifyListeners();
  }

  Future<void> fetchBannerListApi() async{
    _myRepo.bannerListApi().then((value){
      print(value);
      setBannersList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setBannersList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchMovieListApi() async{
    _myRepo.movieListApi().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<String> items = [];
  int currentPage = 1;
  int itemsPerPage = 10;
  bool isLoading = false;

  Future<void> loadMoreItems() async {
    // Simulating an API call to fetch more items
    // Generate dummy items
    int startIndex = items.length + 1;
    int endIndex = startIndex + itemsPerPage;
    isLoading = true;
    List<String> newItems = List.generate(endIndex - startIndex, (index) => 'Item ${startIndex + index}');

    items.addAll(newItems);

    // Notify listeners that the items have been updated
    notifyListeners();
  }

  /*


  List<String> items = [];
  int currentPage = 1;
  bool isLoading = false;

  void loadMoreItems() {
    if (isLoading) return; // Prevent concurrent loading

    isLoading = true;
    notifyListeners();
    // Simulate data fetching or API call
    Future.delayed(Duration(seconds: 2), () {
      for (int i = 0; i < 20; i++) {
        items.add('Item ${items.length + 1}');
      }
      currentPage++;

      isLoading = false;
      notifyListeners();
    });
  }
*/
}