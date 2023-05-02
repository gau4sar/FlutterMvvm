import 'package:get/get.dart';
import 'package:mvvm_flutter/data/response/status.dart';
import 'package:mvvm_flutter/models/home/user_list_model.dart';
import 'package:mvvm_flutter/repository/home_repository/home_repository.dart';

import '../../../utils/Utils.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;

  final userList = UserListModel().obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setUserList(UserListModel value) => userList.value = value;

  void setError(String value) => error.value = value;

  void userListApi() {
    setRxRequestStatus(Status.LOADING);
    print("setRxRequestStatus LOADING");
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print("setRxRequestStatus COMPLETED " + value.data!.length.toString());
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      Utils.toastMessage(error.toString());
      print("setRxRequestStatus ERROR " + error.toString());
    });
  }
}
