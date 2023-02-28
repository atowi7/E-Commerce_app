import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardBox extends StatelessWidget {
  final String title;
  final bool active;
  const CardBox({super.key, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 4,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: active ? AppColor.blue : AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: active ? AppColor.white : AppColor.black,
            ),
      ),
    );
  }
}
