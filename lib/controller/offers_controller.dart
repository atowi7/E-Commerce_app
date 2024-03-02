import 'package:ecommerce_app/controller/search_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/offers_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseOffersController extends MySearchController {
  getData();
  goToProductDetial(ProductModel productModel, String heroTag);
}

class OffersController extends BaseOffersController {
  String? userid;
  List products = [];
  String? deliveryTime;

  AppServices appServices = Get.find();

  OffersData offersData = OffersData(Get.find());

  @override
  void onInit() {
    userid = appServices.sharedPreferences.getString('userid');
    searchTextController = TextEditingController();
    getData();
    deliveryTime = appServices.sharedPreferences.getString('deliverytime');
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await offersData.getData(userid!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        products.clear();
        products.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  goToProductDetial(ProductModel productModel, heroTag) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      'productmodel': productModel,
      'herotag': heroTag,
    });
  }
}
