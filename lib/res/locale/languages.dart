import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome_back': 'Welcome Back',
          'login': 'Login',
          'email_hint': 'Email',
          'password_hint': 'Password',
          'message': 'What is your name',
          'name': 'Test',
          'internet_exception':
              'We are unable to show results.\nPlease check your Internet connection.',
          'general_exception':
              'We are unable to Process the request.\nPlease try again.'
        },
        'ne_NP': {
          'welcome_back': 'नाम के हो',
          'message': 'नाम के हो ?',
          'name': 'टेस्ट'
        },
      };
}
