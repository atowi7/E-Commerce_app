import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CostumeController extends StatelessWidget {
  const CostumeController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onBoardinglist.length,
          (index) => AnimatedContainer(
            width: index == controller.pageIndex ? 16 : 8,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    });
  }
}
