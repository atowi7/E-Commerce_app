import 'package:ecommerce_app/controller/address/addaddressdetail_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/function/input_validation.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailAdd extends StatelessWidget {
  const AddressDetailAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text('52'.tr),
      ),
      body: GetBuilder<AddAddressDetailController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                CustomTextForm(
                  labelText: '53'.tr,
                  hintText: '53'.tr,
                  icon: Icons.add_location_alt,
                  isNumber: false,
                  controller: controller.name,
                  validator: (val) {
                    return inputValidation('', val!, 2, 20);
                  },
                ),
                CustomTextForm(
                  labelText: '54'.tr,
                  hintText: '54'.tr,
                  icon: Icons.streetview_rounded,
                  isNumber: false,
                  controller: controller.street,
                  validator: (val) {
                    return inputValidation('', val!, 2, 20);
                  },
                ),
                CustomTextForm(
                  labelText: '55'.tr,
                  hintText: '55'.tr,
                  icon: Icons.location_city_rounded,
                  isNumber: false,
                  controller: controller.city,
                  validator: (val) {
                    return inputValidation('', val!, 2, 20);
                  },
                ),
                CustomButton(
                    title: '56'.tr,
                    onPressed: () {
                      controller.addAddress();
                    })
              ]),
            ),
          ),
        );
      }),
    );
  }
}
