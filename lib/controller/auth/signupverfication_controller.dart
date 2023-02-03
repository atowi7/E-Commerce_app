import 'package:ecommerce_app/core/constant/route.dart';
import 'package:get/get.dart';

abstract class BaseSignupVerficationController extends GetxController {
  openSucess();
}

class SignupVerficationController extends BaseSignupVerficationController {
  @override
  openSucess() {
    Get.offNamed(AppRoute.successSignup);
  }
}
