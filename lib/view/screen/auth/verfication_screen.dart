import 'package:ecommerce_app/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app/controller/auth/verfication_controller.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerficationController verficationController =
        Get.put(VerficationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forget Password'),
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
              verficationController.openResetPassword();
            },
          ),
        ],
      ),
    );
  }
}
