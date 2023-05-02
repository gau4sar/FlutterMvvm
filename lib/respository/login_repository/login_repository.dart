import 'dart:ui';
import 'package:mvvm_flutter/data/network/network_api_services.dart';
import 'package:mvvm_flutter/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}