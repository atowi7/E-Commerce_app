import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomeController extends StatelessWidget {
  const CustomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onBoardingList.length,
          (index) => AnimatedContainer(
            width: index == controller.pageIndex ? 18 : 12,
            height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    });
  }
}
