import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verifycode_data.dart';
import 'package:get/get.dart';

abstract class BaseVerifyCodeController extends GetxController {
  // check();
  openResetPassword(String verifycode);
}

class VerifycodeController extends BaseVerifyCodeController {
  String? email;

  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  openResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    
    var response = await verifyCodeData.postData(email!, verifycode);

    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.resetPassword, arguments: {'email': email});
      } else {
        Get.defaultDialog(title: '94'.tr, middleText: '99'.tr);
        //statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.defaultDialog(title: '94'.tr, middleText: '96'.tr);
      statusRequest = StatusRequest.serverFailure;
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
