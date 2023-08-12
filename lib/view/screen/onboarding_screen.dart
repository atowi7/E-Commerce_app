import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce_app/view/widget/onboarding/customslider.dart';
import 'package:ecommerce_app/view/widget/onboarding/customcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: const Column(
          children: [
            Expanded(flex: 5, child: CustomeSlider()),
            Expanded(flex: 2, child: CustomeController()),
            SizedBox(
              height: 10,
            ),
            Expanded(flex: 1, child: CustomeButton()),
          ],
        ),
      ),
    );
  }
}
