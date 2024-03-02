import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomeSlider extends GetView<OnboardingController> {
  const CustomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.changePage(index);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(onBoardingList[i].title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge),
          Expanded(
            child: Lottie.asset(
              onBoardingList[i].image,
            ),
          ),
          Text(onBoardingList[i].content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }
}
