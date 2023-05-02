import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/Utils.dart';
import 'package:mvvm_flutter/utils/app_colors.dart';
import 'package:mvvm_flutter/view_models/controller/login/LoginViewModel.dart';
import 'package:get/get.dart';
import '../res/components/RoundButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.toastMessage('Email is empty');
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  ),
                  TextFormField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      decoration: InputDecoration(
                          hintText: "Password", border: OutlineInputBorder())),
                  SizedBox(height: 40),
                  Obx(()=> RoundButton(
                      loading: loginVM.isLoading.value,
                      title: 'Login',
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          loginVM.login();
                        }
                      },
                      width: width * 0.6,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
