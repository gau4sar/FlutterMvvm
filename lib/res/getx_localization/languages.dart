import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'welcome_back': 'Welcome\nBack',
          'internet_exception':
              "We're unable tp show results.\nPlease check your data\nconenction."
        },
        'ur_PK': {'email_hint': '  د سید فا'},
      };
}
