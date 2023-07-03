import 'package:ecommerce_app/controller/forgetpassword/verifycode_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('24'.tr),
      ),
      body: GetBuilder<VerifycodeController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const Logo(),
              CustomTextTitle(title: '${'25'.tr} :${controller.email}'),
               CustomTextBody(title: '34'.tr),
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
