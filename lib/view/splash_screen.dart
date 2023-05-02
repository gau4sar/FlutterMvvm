import 'package:flutter/material.dart';
import 'package:mvvm_flutter/res/components/InternetException.dart';
import 'package:mvvm_flutter/utils/app_colors.dart';
import 'package:mvvm_flutter/view_models/services/SplashServices.dart';
import '../data/AppException.dart';
import 'package:get/get_utils/get_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();


  @override
  void initState() {
    super.initState();

    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: Text(
            'welcome_back'.tr,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
