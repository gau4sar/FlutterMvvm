import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter/models/login/UserModel.dart';
import 'package:mvvm_flutter/res/components/InternetException.dart';
import 'package:mvvm_flutter/view_models/controller/home/HomeViewModel.dart';
import 'package:mvvm_flutter/view_models/controller/user_preferences/user_preferences_view_model.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userPreferences = UserPreference();

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  userPreferences.clear();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              {
                return const Center(child: CircularProgressIndicator());
              }
            case Status.COMPLETED:
              {
                print("COMPLETED ui");
                return ListView.builder(
                    itemCount: homeController.userList.value.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(homeController
                                      .userList.value.data![index].avatar
                                      .toString())),
                              title: Text(homeController
                                  .userList.value.data![index].firstName
                                  .toString())));
                    });
              }
            case Status.ERROR:
              {
                if (homeController.error.value == "No internet") {
                  return InternetExceptionWidget(onPress: () {
                    homeController.userListApi();
                  });
                } else {
                  return Center(child: Text(homeController.error.toString()));
                }
              }
          }
        }));
  }
}
