import 'package:ecommerce_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSignupController extends GetxController {
  signup();
  openLogin();
  openSignupVerfication();
}

class SignupController extends BaseSignupController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  signup() {}

  @override
  openLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  openSignupVerfication() {
    if (formKey.currentState!.validate()) {
      print('OK');
      Get.offNamed(AppRoute.signupVerfication);
    } else {
      print('Not OK');
    }
  }

  // @override
  // void dispose() {
  //   userName.dispose();
  //   email.dispose();
  //   password.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
