import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CostumeSlider extends GetView<OnboardingController> {
  const CostumeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.changePage(index);
      },
      itemCount: onBoardinglist.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(onBoardinglist[i].title,
              style: Theme.of(context).textTheme.headline1),
          Expanded(
            child: Lottie.asset(
              onBoardinglist[i].image,
            ),
          ),
          Text(onBoardinglist[i].content,
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
