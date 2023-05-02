import 'dart:async';
import 'package:get/get.dart';
import 'package:mvvm_flutter/res/routes/routes_name.dart';
import 'package:mvvm_flutter/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  final userPreferences = UserPreference();

  void isLogin() {
    userPreferences.isUserLoggedIn().then((value) {
      if (value) {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.homeScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.loginScreen));
      }
    });
  }
}
