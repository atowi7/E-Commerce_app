import 'package:ecommerce_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseVerficationController extends GetxController {
  openResetPassword();
}

class VerficationController extends BaseVerficationController {
  @override
  openResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }
}
