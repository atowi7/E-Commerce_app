import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessResetPasswordScreen extends StatelessWidget {
  const SucessResetPasswordScreen({super.key});

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
              Icons.check_circle,
              size: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '29'.tr,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
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
