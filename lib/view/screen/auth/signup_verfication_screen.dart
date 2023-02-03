import 'package:ecommerce_app/controller/auth/signupverfication_controller.dart';
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
    SignupVerficationController verficationController =
        Get.put(SignupVerficationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Emial Verfication'),
      ),
      body: ListView(
        children: [
          const Logo(),
          const CustomTextTitle(title: 'Check Email'),
          const CustomTextBody(title: 'Please Enter the verfication code'),
          OtpTextField(
            numberOfFields: 5,
            showFieldAsBox: true,
            onSubmit: (value) {
              verficationController.openSucess();
            },
          ),
        ],
      ),
    );
  }
}
