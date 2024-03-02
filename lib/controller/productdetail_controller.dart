import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/datasource/remote/product_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class BaseProductDetailController extends GetxController {
  initialData();
  addCart();
  // deleteCart(String proid);
  // getCount(String proid);
  // addCount();
  // deleteCount();
  goToChat(String adminId);
  ratingPermission();
  sendRatring(String proId, double value, String comment);
  // goToCart();
}

class ProductDetailController extends BaseProductDetailController {
  late String userId;
  late ProductModel productModel;

  bool enableRating = false;

  // double shipping

  late String heroTag;
  // int count = 0;

  var formKey = GlobalKey<FormState>();

  TextEditingController msgController = TextEditingController();

  AppServices appServices = Get.find();

  ProductData productData = ProductData(Get.find());

  CartController cartController = Get.find();

  CartData cartdata = CartData(Get.find());

  late StatusRequest statusRequest;

  // List itemf = [
  //   {'name': 'red', 'active': 0},
  //   {'name': 'blue', 'active': 1},
  //   {'name': 'green', 'active': 0},
  // ];

  @override
  void onInit() {
    userId = appServices.sharedPreferences.getString('userid')!;
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    productModel = Get.arguments['productmodel'];
    heroTag = Get.arguments['herotag'];
    // print(productModel.id);
    // count = await getCount(productModel.id!);
    statusRequest = StatusRequest.none;
    update();
  }

  // @override
  // addCount() {
  //   addCart(productModel.id!);
  //   count++;
  // }

  // @override
  // deleteCount() {
  //   if (count > 0) {
  //     deleteCart(productModel.id!);
  //     count--;
  //   }
  // }

  @override
  addCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartdata.addCart(
        appServices.sharedPreferences.getString('userid')!, productModel.id!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        cartController.refreshPage();
        Get.back();
        Get.snackbar('39'.tr, '104'.tr, duration: const Duration(seconds: 2));
      } else {
        Get.snackbar('39'.tr, '105'.tr, duration: const Duration(seconds: 2));
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  // @override
  // deleteCart(String proid) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartdata.deleteCart(
  //       appServices.sharedPreferences.getString('userid')!, proid);

  //   statusRequest = handleData(response);

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       Get.snackbar('39'.tr, '106'.tr,duration:const Duration(seconds: 2));
  //     } else {
  //       Get.snackbar('94'.tr, '107'.tr,duration:const Duration(seconds: 2));
  //       statusRequest = StatusRequest.noDataFailure;
  //     }
  //   } else {
  //     Get.snackbar('94'.tr, '96'.tr,duration:const Duration(seconds: 2));
  //     statusRequest = StatusRequest.serverFailure;
  //   }
  //   update();
  // }

  // @override
  // getCount(String proid) async {
  //   var response = await cartdata.getCount(
  //       appServices.sharedPreferences.getString('userid')!, proid);

  //   statusRequest = handleData(response);

  //   if (statusRequest == StatusRequest.success) {
  //     int count = int.parse(response['data']);
  //     return count;
  //   }
  // }

  @override
  goToChat(adminId) async {
    Get.toNamed(AppRoute.chatView,
        arguments: {'adminid': productModel.adminId});
  }

  @override
  ratingPermission() async {
    var response = await productData.ratingPermission(userId, productModel.id!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        enableRating = true;
      } else {
        enableRating = false;
      }
    } else {
      enableRating = false;
    }
    update();
  }

  @override
  sendRatring(proId, value, comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await productData.sendRating(value.toString(), comment, proId, userId);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('39'.tr, '129'.tr, duration: const Duration(seconds: 2));
      } else {
        Get.snackbar('94'.tr, '130'.tr, duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
    }
    update();
  }
}
