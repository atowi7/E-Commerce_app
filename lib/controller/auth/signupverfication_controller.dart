import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/signupverification_data.dart';
import 'package:get/get.dart';

abstract class BaseSignupVerficationController extends GetxController {
  openSucess(String verifyCode);
  resend();
}

class SignupVerficationController extends BaseSignupVerficationController {
  SignupVerificationData signupVerificationData =
      SignupVerificationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  //String verifyCode;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  openSucess(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupVerificationData.postData(email!, verifyCode);
    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.sucess) {
      if (response['status'] == 'sucess') {
        Get.offNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(title: '94'.tr, middleText: '99'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.defaultDialog(title: '94'.tr, middleText: '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  resend() async {
    var response = await signupVerificationData.resend(email!);
    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.sucess) {
      if (response['status'] == 'sucess') {
        Get.defaultDialog(title: '39'.tr, middleText: '100'.tr);
      } else {
        Get.defaultDialog(title: '94'.tr, middleText: '101'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.defaultDialog(title: '94'.tr, middleText: '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
