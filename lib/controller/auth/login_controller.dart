import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseLoginController extends GetxController {
  login();
  openSignUp();
  openForgerPassword();
}

class LoginController extends BaseLoginController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController pass;

  bool isPassHidden = true;

  LoginData loginData = LoginData(Get.find());

  StatusRequest? statusRequest;

  showPassword() {
    isPassHidden == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  @override
  login() {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = loginData.postData(email.text, pass.text);

      statusRequest = handleData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.homePage);
        } else {
          Get.defaultDialog(
              title: 'ERROR',
              middleText: 'THERE IS PROBLEM IN EMAIL OR PASSWORD');
          //statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.defaultDialog(title: 'ERROR', middleText: 'SERVER ERROR');
      }
    } else {
      Get.defaultDialog(title: 'ERROR', middleText: 'VALIDATION ERROR');
    }
    update();
  }

  @override
  openSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  openForgerPassword() {
    Get.offNamed(AppRoute.checkemail);
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
