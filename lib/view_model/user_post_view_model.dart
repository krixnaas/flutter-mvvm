import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/user_post_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class UserPostViewModel with ChangeNotifier {
  String _description = '';
  String selectedOption = 'Wanted'; // Set the default selected option

  final int maxWordCount = 150;
  int remainingWordCount = 150;

  void updateAdditionalDetails(String value) {
    _description = value;
    int wordCount = countWords(_description);
    remainingWordCount = maxWordCount - wordCount;
    notifyListeners();
  }

  int countWords(String text) {
    // Remove leading/trailing whitespaces and split the text into words
    List<String> words = text.trim().split(' ');

    // Filter out empty words (multiple whitespaces)
    words.removeWhere((word) => word.isEmpty);

    // Return the count of remaining words
    return words.length;
  }

  void updateSelectedOption(String value) {
    selectedOption = value;
    notifyListeners();
  }

  String selectedCategory="";
  void updateSelectedCategory(String value) {
    selectedCategory = value;
    notifyListeners();
    if (value != 'Announcement' && value != 'Sales' && value != 'Lost & Found') {
      selectedCategory = "";
      selectedOption = "Wanted";
      notifyListeners();
    }
  }

  final _myRepo = UserPostRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<void> userPostApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.userPostApi(data).then((value) {
      setLoading(false);

      if (kDebugMode) {
        print(value.toString());
      }
      Utils.flushBarErrorMessage('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.dashboard);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    });
  }
}