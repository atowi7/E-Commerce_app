import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/function/exitapp_alert.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          exitAppAlert();
          return true;
        },
        child: GetBuilder<SignupController>(builder: (controller) {
          return HandlingDataReqest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  const CustomTextTitle(title: 'Welcom Back'),
                  const CustomTextBody(
                      title:
                          'Sign up with your email and password or continue with socail media'),
                  CustomTextForm(
                    labelText: 'User Name',
                    hintText: 'User Name',
                    icon: Icons.person,
                    isNumber: false,
                    controller: controller.userName,
                    validator: (val) {
                      return inputValidation('username', val!, 10, 50);
                    },
                    onTapIcon: controller.showPassword(),
                  ),
                  CustomTextForm(
                    labelText: 'Email',
                    hintText: 'Email',
                    icon: Icons.email,
                    isNumber: false,
                    controller: controller.email,
                    validator: (val) {
                      return inputValidation('email', val!, 10, 50);
                    },
                  ),
                  CustomTextForm(
                    labelText: 'Phone',
                    hintText: 'Phone',
                    icon: Icons.phone,
                    isNumber: true,
                    controller: controller.phone,
                    validator: (val) {
                      return inputValidation('phone', val!, 10, 50);
                    },
                  ),
                  CustomTextForm(
                    labelText: 'Password',
                    hintText: 'Password',
                    icon: Icons.lock,
                    isNumber: false,
                    controller: controller.password,
                    obscureText: controller.isPassHidden,
                    validator: (val) {
                      return inputValidation('password', val!, 10, 50);
                    },
                  ),
                  CustomButton(
                    title: 'Sign Up',
                    onPressed: () {
                      controller.openSignupVerfication();
                    },
                  ),
                  CustomTextAuth(
                    t1: 'Already have an account ',
                    t2: ' Sign in',
                    onTap: () {
                      controller.openLogin();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
