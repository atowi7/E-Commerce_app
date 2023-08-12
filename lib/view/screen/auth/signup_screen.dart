import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/function/exitapp_alert.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          exitAppAlert(context);
          return true;
        },
        child: GetBuilder<SignupController>(builder: (controller) {
          return HandlingDataReqest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  children: [
                    const Icon(
                      Icons.person_2_rounded,
                      size: 200,
                      color: AppColor.primaryColor,
                    ),
                    CustomTextTitle(title: '13'.tr),
                    CustomTextBody(title: '14'.tr),
                    CustomTextForm(
                      labelText: '15'.tr,
                      hintText: '15'.tr,
                      icon: Icons.person,
                      isNumber: false,
                      controller: controller.userName,
                      validator: (val) {
                        return inputValidation('username', val!, 5, 20);
                      },
                      onTapIcon: controller.showPassword(),
                    ),
                    CustomTextForm(
                      labelText: '16'.tr,
                      hintText: '16'.tr,
                      icon: Icons.email,
                      isNumber: false,
                      controller: controller.email,
                      validator: (val) {
                        return inputValidation('email', val!, 10, 50);
                      },
                    ),
                    // CustomTextForm(
                    //   labelText: '17'.tr,
                    //   hintText: '17'.tr,
                    //   icon: Icons.phone,
                    //   isNumber: true,
                    //   controller: controller.phone,
                    //   validator: (val) {
                    //     return inputValidation('phone', val!, 10, 30);
                    //   },
                    // ),
                    CustomTextForm(
                      labelText: '18'.tr,
                      hintText: '18'.tr,
                      icon: Icons.lock,
                      isNumber: false,
                      controller: controller.password,
                      obscureText: controller.isPassHidden,
                      validator: (val) {
                        return inputValidation('password', val!, 8, 20);
                      },
                    ),
                    CustomButton(
                      title: '13'.tr,
                      onPressed: () {
                        controller.openSignupVerfication();
                      },
                    ),
                    CustomTextAuth(
                      t1: '23'.tr,
                      t2: '19'.tr,
                      onTap: () {
                        controller.openLogin();
                      },
                    ),
                    // Text(
                    //   '150'.tr,
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.displaySmall,
                    // ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
