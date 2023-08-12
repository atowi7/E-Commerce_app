import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseAddAddressDetailController extends GetxController {
  addAddress();
}

class AddAddressDetailController extends BaseAddAddressDetailController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController street;
  late TextEditingController city;

  double? lat;
  double? long;

  AppServices appServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();
    street = TextEditingController();
    city = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    super.onInit();
  }

  @override
  addAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addressData.addAddress(
          name.text,
          lat.toString(),
          long.toString(),
          street.text,
          city.text,
          appServices.sharedPreferences.getString('userid')!);

      statusRequest = handleData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.snackbar('39'.tr, '140'.tr, duration: const Duration(seconds: 2));
          Get.offNamed(AppRoute.addressview);
        } else {
          Get.snackbar('39'.tr, '141'.tr, duration: const Duration(seconds: 2));
          statusRequest = StatusRequest.noDataFailure;
        }
      } else {
        Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
        statusRequest = StatusRequest.serverFailure;
      }
    }

    update();
  }
}
