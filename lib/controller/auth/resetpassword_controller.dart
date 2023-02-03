import 'package:ecommerce_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseResetPasswordController extends GetxController {
  openSucess();
}

class ResetPasswordController extends BaseResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  openSucess() {
    Get.offNamed(AppRoute.sucessResetPassword);
  }

  // @override
  // void dispose() {
  //   password.dispose();
  //   repassword.dispose();
  // }
}
