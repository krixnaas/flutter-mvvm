import 'package:get/get.dart';

class WelcomeViewModel extends GetxController {
  bool _animate = false;

  bool get animate => _animate;

  set animate(bool value) {
    _animate = value;
  }
}
