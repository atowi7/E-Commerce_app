import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('28'.tr),
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 350,
              color: AppColor.primaryColor,
            ),
            SizedBox(
              height: Get.height * 0.2,
            ),
            Text(
              '29'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: Get.height * 0.2,
            ),
            CustomButton(
                title: '30'.tr,
                onPressed: () {
                  Get.offNamed(AppRoute.login);
                }),
          ],
        ),
      ),
    );
  }
}
