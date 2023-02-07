import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/foregetpassword/verifycode_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseVerifycodeController extends GetxController {
  // check();
  openResetPassword(String verifycode);
}

class VerifycodeController extends BaseVerifycodeController {
  final formKey = GlobalKey<FormState>();

  String? email;

  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  StatusRequest? statusRequest;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  openResetPassword(verifycode) {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = verifyCodeData.postData(email!, verifycode);

      statusRequest = handleData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.resetPassword, arguments: {'email': email});
        } else {
          Get.defaultDialog(title: 'ERROR', middleText: 'VERIFY CODE ERROR');
          //statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.defaultDialog(title: 'ERROR', middleText: 'SERVER ERROR');
        statusRequest = StatusRequest.serverFailure;
      }
    } else {
      Get.defaultDialog(title: 'ERROR', middleText: 'VALIDATION ERROR');
    }
    update();
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
