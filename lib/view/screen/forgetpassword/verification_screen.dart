import 'package:ecommerce_app/controller/forgetpassword/verifycode_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('24'.tr),
      ),
      body: GetBuilder<VerifycodeController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              // const Logo(
              //   isLottie: true,
              //   image: ImageAssets.profile,
              // ),
              const Icon(
                Icons.email_outlined,
                size: 50,
                color: AppColor.primaryColor,
              ),
              CustomTextTitle(title: '25'.tr),
              CustomTextBody(title: '${'26'.tr} ${controller.email}'),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                onSubmit: (value) {
                  controller.openResetPassword(value);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
