import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/foregetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseCheckEmailController extends GetxController {
  // check();
  openVerfication();
}

class CheckEmailController extends BaseCheckEmailController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController email;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StatusRequest? statusRequest;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  openVerfication() {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = checkEmailData.postData(email.text);

      statusRequest = handleData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.verfication, arguments: {'email': email.text});
        } else {
          Get.defaultDialog(title: 'ERROR', middleText: 'EMAIL DOES NOT EXIST');
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
