import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/foregetpassword/resetpassword_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseResetPasswordController extends GetxController {
  openSucess();
}

class ResetPasswordController extends BaseResetPasswordController {
  final formKey = GlobalKey<FormState>();

  String? email;

  late TextEditingController password;
  late TextEditingController repassword;

  bool isPassHidden = true;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  showPassword() {
    isPassHidden == true ? false : true;
    update();
  }

  @override
  openSucess() async {
    if (formKey.currentState!.validate()) {
      if (password.text == repassword.text) {
        statusRequest = StatusRequest.loading;
        update();
        
        var response = await resetPasswordData.postData(email!, password.text);

        statusRequest = handleData(response);
        if (statusRequest == StatusRequest.sucess) {
          if (response['status'] == 'sucess') {
            Get.offNamed(AppRoute.sucessResetPassword);
          } else {
            Get.defaultDialog(title: '94'.tr, middleText: '94'.tr);
            //statusRequest = StatusRequest.noDatafailure;
          }
        } else {
          Get.defaultDialog(title: '94'.tr, middleText: '96'.tr);
          statusRequest = StatusRequest.serverFailure;
        }
      } else {
        Get.defaultDialog(title: '94'.tr, middleText: '103'.tr);
      }
    } else {
      Get.defaultDialog(title: '94'.tr, middleText: '97'.tr);
    }

    update();
  }

  // @override
  // void dispose() {
  //   password.dispose();
  //   repassword.dispose();
  // }
}
