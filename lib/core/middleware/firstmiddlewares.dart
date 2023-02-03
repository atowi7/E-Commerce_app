import 'dart:ffi';

import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class FirstMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  AppServices appServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    return appServices.sharedPreferences.getString('m1') == 'visited'
        ? const RouteSettings(name: AppRoute.login)
        : null;
  }
}
