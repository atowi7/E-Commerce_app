import 'package:ecommerce_app/controller/address/editaddress_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAddressController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('57'.tr),
      ),
      body: GetBuilder<EditAddressController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(children: [
            CustomTextForm(
              labelText: '53'.tr,
              hintText: '53'.tr,
              icon: Icons.add_location_alt,
              isNumber: false,
              controller: controller.name,
              validator: null,
            ),
            CustomTextForm(
              labelText: '54'.tr,
              hintText: '54'.tr,
              icon: Icons.streetview_rounded,
              isNumber: false,
              controller: controller.street,
              validator: null,
            ),
            CustomTextForm(
              labelText: '55'.tr,
              hintText: '55'.tr,
              icon: Icons.location_city_rounded,
              isNumber: false,
              controller: controller.city,
              validator: null,
            ),
            CustomButton(
                title: '58'.tr,
                onPressed: () {
                  controller.editAddress();
                })
          ]),
        );
      }),
    );
  }
}
