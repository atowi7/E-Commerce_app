import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseEditAddressController extends GetxController {
  editAddress();
}

class EditAddressController extends BaseEditAddressController {
  late String addressId;
  late TextEditingController name;
  late TextEditingController street;
  late TextEditingController city;
  String? userid;

  AppServices appServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    addressId = Get.arguments['addressid'];
    name = TextEditingController();
    street = TextEditingController();
    city = TextEditingController();

    name.text = Get.arguments['name'];
    street.text = Get.arguments['street'];
    city.text = Get.arguments['city'];

    userid = appServices.sharedPreferences.getString('userid');
    super.onInit();
  }

  @override
  editAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.editAddress(
        addressId, name.text, street.text, city.text, userid!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('39'.tr, '142'.tr,duration:const Duration(seconds: 2));
        // Get.toNamed(AppRoute.addressview);
      } else {
        Get.snackbar('39'.tr, '143'.tr,duration:const Duration(seconds: 2));
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr,duration:const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }
}
