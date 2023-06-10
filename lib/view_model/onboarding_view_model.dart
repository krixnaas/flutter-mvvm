import 'package:flutter/cupertino.dart';

class OnBoardingViewModel with ChangeNotifier{
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  set activeIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
  void skipToPage4() {
    print('Skip button pressed');
    _activeIndex = 3; // Set the active index to 2 (Page 3)
    notifyListeners();
  }

  void jumpToNext() {
    print('Jump button pressed');
    if(_activeIndex==3)
      {
        _activeIndex = 0;
      }else{
      _activeIndex=_activeIndex+1; // Set the active index to 2 (Page 3)
    }

    notifyListeners();
  }
}