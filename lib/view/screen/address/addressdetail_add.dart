import 'package:ecommerce_app/controller/address/addaddressdetail_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
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
        title: const Text('Add Address Detail'),
      ),
      body: GetBuilder<AddAddressDetailController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(children: [
            CustomTextForm(
              labelText: 'name',
              hintText: 'name',
              icon: Icons.add_location_alt,
              isNumber: false,
              controller: controller.name,
              validator: (val) {},
            ),
            CustomTextForm(
              labelText: 'street',
              hintText: 'street',
              icon: Icons.streetview_rounded,
              isNumber: false,
              controller: controller.street,
              validator: (val) {},
            ),
            CustomTextForm(
              labelText: 'City',
              hintText: 'City',
              icon: Icons.location_city_rounded,
              isNumber: false,
              controller: controller.city,
              validator: (val) {},
            ),
            CustomButton(
                title: 'ADD',
                onPressed: () {
                  controller.addAddress();
                })
          ]),
        );
      }),
    );
  }
}
