import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvvm_flutter/models/login/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    return UserModel(token: token);
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    return token != null && token.isNotEmpty == true;
  }

  Future<bool> clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
