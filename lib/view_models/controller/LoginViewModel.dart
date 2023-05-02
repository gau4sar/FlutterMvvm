import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter/respository/login_repository/login_repository.dart';

import '../../utils/Utils.dart';

class LoginViewModel extends GetxController {
  final loginRepository = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

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
    }).onError((error, stackTrace) {
      print(error.toString());
      isLoading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
