import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/view/widget/onboarding/costumebutton.dart';
import 'package:ecommerce_app/view/widget/onboarding/costumeslider.dart';
import 'package:ecommerce_app/view/widget/onboarding/customecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(flex: 5, child: CostumeSlider()),
            Expanded(flex: 3, child: CostumeController()),
            SizedBox(
              height: 10,
            ),
            Expanded(flex: 2, child: CostumeButton()),
          ],
        ),
      ),
    );
  }
}
