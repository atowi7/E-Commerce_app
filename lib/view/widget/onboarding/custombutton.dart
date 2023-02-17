import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customeButton extends GetView<OnboardingController> {
  const customeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
        ),
        onPressed: () {
          controller.next();
        },
        child: Text(
          '12'.tr,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
