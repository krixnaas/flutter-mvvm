import 'package:get/get.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

class OnBoardingViewModel extends GetxController {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  set activeIndex(int index) {
    _activeIndex = index;
  }

  void skipToPage4() {
    print('Skip button pressed');
    _activeIndex = 3; // Set the active index to 2 (Page 3)
  }

  void jumpToNext() {
    print('Jump button pressed');
    if (_activeIndex == 3) {
      Get.toNamed(RoutesName.login);
      _activeIndex = 0;
    } else {
      _activeIndex = _activeIndex + 1; // Set the active index to 2 (Page 3)
    }
  }
}
