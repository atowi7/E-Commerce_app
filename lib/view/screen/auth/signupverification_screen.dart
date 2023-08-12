import 'package:ecommerce_app/controller/auth/signupverfication_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignupVerificationScreen extends StatelessWidget {
  const SignupVerificationScreen({super.key});

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
              // const Logo(
              //   isLottie: true,
              //   image: ImageAssets.profile,
              // ),
              const Icon(
                Icons.person_2_rounded,
                size: 200,
                color: AppColor.primaryColor,
              ),
              CustomTextTitle(title: '25'.tr),
              CustomTextBody(title: '${'26'.tr} in ${controller.email}'),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                onSubmit: (value) {
                  controller.opensuccess(value);
                },
              ),
              InkWell(
                onTap: () {
                  controller.resend();
                },
                child: Center(
                    child: Text(
                  '27'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColor.primaryColor),
                )),
              )
            ],
          ),
        );
      }),
    );
  }
}
