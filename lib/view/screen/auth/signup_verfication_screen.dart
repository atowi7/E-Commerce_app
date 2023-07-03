import 'package:ecommerce_app/controller/auth/signupverfication_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignupVerficationScreen extends StatelessWidget {
  const SignupVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupVerficationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('24'.tr),
      ),
      body: GetBuilder<SignupVerficationController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const Logo(),
              CustomTextTitle(title: '${'25'.tr} :${controller.email}'),
              CustomTextBody(title: '26'.tr),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                onSubmit: (value) {
                  controller.openSucess(value);
                },
              ),
              InkWell(
                onTap: () {
                  controller.resend();
                },
                child: Center(
                    child: Text(
                  '27'.tr,
                  style: Theme.of(context).textTheme.displaySmall,
                )),
              )
            ],
          ),
        );
      }),
    );
  }
}
