import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DeliveryBox extends StatelessWidget {
  final String title;
  final bool active;
  const DeliveryBox({super.key, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 3,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: active ? AppColor.blue : AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            ImageAssets.onBoardingDriverImg,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: active ? AppColor.white : AppColor.black,
                ),
          ),
        ],
      ),
    );
  }
}
