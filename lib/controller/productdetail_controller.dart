import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';

import 'package:get/get.dart';

abstract class BaseProductDetailController extends GetxController {
  initialData();
  addCart(String proid);
  deleteCart(String proid);
  addCount();
  deleteCount();
  getCount(String proid);
  sendRatring(String proId, double rate, String comment);
}

class ProductDetailController extends BaseProductDetailController {
  late ProductModel productModel;
  int count = 0;

  AppServices appServices = Get.find();

  CartData cartdata = CartData(Get.find());

  late StatusRequest statusRequest;

  // List itemf = [
  //   {'name': 'red', 'active': 0},
  //   {'name': 'blue', 'active': 1},
  //   {'name': 'green', 'active': 0},
  // ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    productModel = Get.arguments['productmodel'];
    print('productModel $productModel');
    count = await getCount(productModel.id!);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addCount() {
    addCart(productModel.id!);
    count++;
  }

  @override
  deleteCount() {
    if (count > 0) {
      deleteCart(productModel.id!);
      count--;
    }
  }

  @override
  addCart(proid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.addCart(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('39'.tr, '104'.tr);
        update();
      } else {
        Get.snackbar('39'.tr, '105'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  deleteCart(String proid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.deleteCart(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('39'.tr, '106'.tr);
        update();
      } else {
        Get.snackbar('94'.tr, '107'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
  }

  @override
  getCount(String proid) async {
    var response = await cartdata.getCount(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (statusRequest == StatusRequest.sucess) {
      int count = int.parse(response['data']);
      return count;
    }
  }

  @override
  sendRatring(proId, rate, comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartdata.sendRating(proId, rate.toString(), comment);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('39'.tr, '129'.tr);
      } else {
        Get.snackbar('94'.tr, '130'.tr);
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
    }
    update();
  }
}
