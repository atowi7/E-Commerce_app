import 'package:ecommerce_app/controller/auth/resetpassword_controller.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController =
        Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reset Password'),
      ),
      body: ListView(
        children: [
          const Logo(),
          const CustomTextTitle(title: 'Change Password'),
          // const CustomTextBody(
          //     title:
          //         'Sign in with your email and password or continue with socail media'),
          CustomTextForm(
            labelText: 'Password',
            hintText: 'Password',
            isNumber: false,
            icon: Icons.lock,
            controller: resetPasswordController.password,
            validator: (val) {
              return inputValidation('password', val!, 10, 50);
            },
          ),
          CustomTextForm(
            labelText: 'RePassword',
            hintText: 'RePassword',
            icon: Icons.lock,
            isNumber: false,
            controller: resetPasswordController.repassword,
            validator: (val) {
              return inputValidation('password', val!, 10, 50);
            },
          ),

          CustomButton(
            title: 'save',
            onPressed: () {
              resetPasswordController.openSucess();
            },
          ),
        ],
      ),
    );
  }
}
