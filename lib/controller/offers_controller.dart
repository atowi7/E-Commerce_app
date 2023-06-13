import 'package:ecommerce_app/controller/search_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/offers_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseOffersController extends MySearchController {
  getData();
}

class OffersController extends BaseOffersController {
  List products = [];
  String? deliveryTime;

  AppServices appServices = Get.find();

  OffersData notificationData = OffersData(Get.find());

  @override
  void onInit() {
    searchTextController = TextEditingController();
    getData();
    deliveryTime = appServices.sharedPreferences.getString('deliverytime');
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await notificationData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        products.clear();
        products.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
