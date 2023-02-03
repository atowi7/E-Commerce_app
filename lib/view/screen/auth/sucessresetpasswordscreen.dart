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
        title: const Text('Sucess'),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.check_circle,
            size: 300,
          ),
          const Text('Your are verfied'),
          CustomButton(
              title: 'Go to Login',
              onPressed: () {
                Get.offNamed(AppRoute.login);
              }),
        ],
      ),
    );
  }
}
