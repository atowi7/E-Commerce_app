import 'package:ecommerce_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseForgetPasswordController extends GetxController {
  check();
  openVerfication();
}

class ForgetPasswordController extends BaseForgetPasswordController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  check() {}

  @override
  openVerfication() {
    if (formKey.currentState!.validate()) {
      print('OK');
      Get.offNamed(AppRoute.verfication);
    } else {
      print('Not OK');
    }
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
