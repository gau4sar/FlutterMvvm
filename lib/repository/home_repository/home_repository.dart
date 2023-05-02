import 'dart:ui';
import 'package:mvvm_flutter/data/network/network_api_services.dart';
import 'package:mvvm_flutter/models/home/user_list_model.dart';
import 'package:mvvm_flutter/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}