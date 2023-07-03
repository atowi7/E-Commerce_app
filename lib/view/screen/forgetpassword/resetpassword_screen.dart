import 'package:ecommerce_app/controller/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
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
    Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('35'.tr),
      ),
      body: GetBuilder<ResetPasswordController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const Logo(),
                CustomTextTitle(title: '36'.tr),
                // const CustomTextBody(
                //     title:
                //         'Sign in with your email and password or continue with socail media'),
                CustomTextForm(
                  labelText: '18'.tr,
                  hintText: '18'.tr,
                  isNumber: false,
                  obscureText: controller.isPassHidden,
                  icon: Icons.lock,
                  controller: controller.password,
                  validator: (val) {
                    return inputValidation('password', val!, 10, 50);
                  },
                  onTapIcon: controller.showPassword(),
                ),
                CustomTextForm(
                  labelText: '37'.tr,
                  hintText: '37'.tr,
                  icon: Icons.lock,
                  isNumber: false,
                  obscureText: controller.isPassHidden,
                  controller: controller.repassword,
                  validator: (val) {
                    return inputValidation('password', val!, 10, 50);
                  },
                  onTapIcon: controller.showPassword(),
                ),

                CustomButton(
                  title: '38'.tr,
                  onPressed: () {
                    controller.openSucess();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
