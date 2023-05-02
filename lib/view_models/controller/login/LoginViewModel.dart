import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter/res/routes/routes_name.dart';
import 'package:mvvm_flutter/repository/login_repository/login_repository.dart';
import 'package:mvvm_flutter/view_models/controller/user_preferences/user_preferences_view_model.dart';

import '../../../models/login/UserModel.dart';
import '../../../utils/Utils.dart';

class LoginViewModel extends GetxController {
  final loginRepository = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final userPreferences = UserPreference();

  RxBool isLoading = false.obs;

  void login() {
    isLoading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    loginRepository.loginApi(data).then((value) {
      isLoading.value = false;
      Utils.snackBar('Login Successful', value.toString());
      userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
        Get.toNamed(RouteName.homeScreen);
      }).onError((error, stackTrace) {
        Utils.snackBar('Error', error.toString());
      });
    }).onError((error, stackTrace) {
      print(error.toString());
      isLoading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
