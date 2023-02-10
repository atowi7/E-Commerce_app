import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseOnboardingController extends GetxController {
  changePage(index);
  next();
}

class OnboardingController extends BaseOnboardingController {
  int pageIndex = 0;
  late PageController pageController;

  AppServices appServices = Get.find();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  changePage(index) {
    pageIndex = index;
    update();
  }

  @override
  next() {
    pageIndex++;
    if (pageIndex == onBoardinglist.length) {
      appServices.sharedPreferences.setString('page', 'l');
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(pageIndex,
          duration: const Duration(seconds: 1), curve: Curves.easeIn);
    }
  }
}
