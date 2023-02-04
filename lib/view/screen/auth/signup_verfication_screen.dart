import 'package:ecommerce_app/controller/auth/signupverfication_controller.dart';
import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignupVerficationScreen extends StatelessWidget {
  const SignupVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SignupVerficationController verficationController =
    //     Get.put(SignupVerficationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Emial Verfication'),
      ),
      body: GetBuilder<SignupVerficationController>(
          init: SignupVerficationController(),
          builder: (controller) {
            return controller.statusRequest == StatusRequest.loading
                ? Center(child: Lottie.asset(ImageAssets.loading))
                : ListView(
                    children: [
                      const Logo(),
                      CustomTextTitle(
                          title: 'Check Your Email :${controller.email}'),
                      const CustomTextBody(
                          title: 'Please Enter the verfication code'),
                      OtpTextField(
                        numberOfFields: 6,
                        showFieldAsBox: true,
                        onSubmit: (value) {
                          controller.openSucess(value);
                        },
                      ),
                    ],
                  );
          }),
    );
  }
}
