import 'package:flutter/foundation.dart';

class OTPViewModel with ChangeNotifier {
  bool _animate = false;

  bool get animate => _animate;

  set animate(bool value) {
    _animate = value;
    notifyListeners(); // Notify listeners of the change
  }
}