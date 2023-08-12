import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Logo extends StatelessWidget {
  final bool isLottie;
  final String image;
  const Logo({super.key, required this.isLottie, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.3,
      width: Get.size.width * 0.3,
      padding: EdgeInsets.all(Get.size.width * 0.05),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(25)),
      child: isLottie
          ? Lottie.asset(image, fit: BoxFit.contain)
          : Image.asset(image),
    );
  }
}
