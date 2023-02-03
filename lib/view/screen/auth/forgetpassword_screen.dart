import 'package:ecommerce_app/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController forgetPasswordController =
        Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forget Password'),
      ),
      body: Form(
        key: forgetPasswordController.formKey,
        child: ListView(
          children: [
            const Logo(),
            const CustomTextTitle(title: 'Check Email'),
            const CustomTextBody(
                title:
                    'Please Enter your email to recieve the verfication code'),
            CustomTextForm(
              labelText: 'Email',
              hintText: 'Email',
              icon: Icons.email,
              isNumber: false,
              controller: forgetPasswordController.email,
              validator: (val) {
                return inputValidation('email', val!, 10, 50);
              },
            ),
            CustomButton(
              title: 'Check',
              onPressed: () {
                forgetPasswordController.openVerfication();
              },
            ),
          ],
        ),
      ),
    );
  }
}
