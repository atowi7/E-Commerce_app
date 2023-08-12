import 'package:ecommerce_app/controller/forgetpassword/checkemail_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailController());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('31'.tr),
      // ),
      body: GetBuilder<CheckEmailController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  // const Logo(
                  //   isLottie: true,
                  //   image: ImageAssets.profile,
                  // ),
                  const Icon(
                    Icons.email_rounded,
                    size: 200,
                    color: AppColor.primaryColor,
                  ),
                  CustomTextTitle(title: '31'.tr),
                  CustomTextBody(title: '32'.tr),
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
                  CustomButton(
                    title: '33'.tr,
                    onPressed: () {
                      controller.openVerfication();
                    },
                  ),
                  CustomButton(
                    title: '160'.tr,
                    onPressed: () {
                      controller.backTologin();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
