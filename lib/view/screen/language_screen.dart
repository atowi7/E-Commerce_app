import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/localization/localalngchange.dart';
import 'package:ecommerce_app/view/widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocalLangChange> {
  const LanguageScreen({super.key});
  // ch() async {
  //   var res = await checkInternet();
  //   print(res);
  // }

  @override
  Widget build(BuildContext context) {
    // ch();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1'.tr,
            style: Theme.of(context).textTheme.headline1,
          ),
          CustomButtonLang(
              text: 'AR',
              onPressed: () {
                controller.changeLang('ar');
                Get.toNamed(AppRoute.onBoarding);
              }),
          CustomButtonLang(
              text: 'EN',
              onPressed: () {
                controller.changeLang('en');
                Get.toNamed(AppRoute.onBoarding);
              }),
        ],
      ),
    );
  }
}
