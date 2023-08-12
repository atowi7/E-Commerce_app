import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeButton extends GetView<OnboardingController> {
  const CustomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
           ),
        onPressed: () {
          controller.next();
        },
        child: Text(
          '12'.tr,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
