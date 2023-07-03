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
  goToProductDetial(ProductModel productModel);
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        products.clear();
        products.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  goToProductDetial(ProductModel productModel) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      'productmodel': productModel,
    });
  }
}
