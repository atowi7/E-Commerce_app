import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:ecommerce_app/data/model/coupponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseCartController extends GetxController {
  viewCart();
  addCart(String proid);
  deleteCartByUser();
  deleteCart(String proid);
  applyCoupon();
  double getTotalPrice();
  refreshPage();
  goToCheckout();
}

class CartController extends BaseCartController {
  List<CartModel> dataList = [];
  CouponModel? couponModel;
  int prosAmount = 0;
  double totalPrice = 0;
  double shipping = 0;

  String? couponId;
  String? couponName;
  int couponDiscount = 0;

  TextEditingController? couponController;

  AppServices appServices = Get.find();

  CartData cartdata = CartData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    viewCart();
    couponController = TextEditingController();
    super.onInit();
  }

  @override
  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata
        .getData(appServices.sharedPreferences.getString('userid')!);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => CartModel.fromJson(e)));
        Map amountAndprice = response['amountandprice'];
        prosAmount = int.parse(amountAndprice['amount']);
        totalPrice = double.parse(amountAndprice['totalprice']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      //statusRequest = StatusRequest.serverFailure;
    }
    update();
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
      } else {
        Get.snackbar('39'.tr, '105'.tr);
        // statusRequest = StatusRequest.noDatafailure;
      }
    } else {
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
        refreshPage();
      } else {
        Get.snackbar('39'.tr, '107'.tr);
        // statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  deleteCartByUser() async {
    await cartdata
        .deleteCartByUser(appServices.sharedPreferences.getString('userid')!);
  }

  @override
  applyCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.checkCoupon(couponController!.text);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Map<String, dynamic> data = response['data'];
        couponModel = CouponModel.fromJson(data);
        couponId = couponModel!.couponId;
        couponName = couponModel!.couponName;
        couponDiscount = int.parse(couponModel!.couponDiscount!);
        getTotalPrice();
      } else {
        couponName = 'invalid';
        couponDiscount = 0;
        Get.snackbar('39'.tr, '108'.tr);
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
    }
    update();
  }

  @override
  double getTotalPrice() {
    return totalPrice - (totalPrice * (couponDiscount / 100));
  }

  @override
  goToCheckout() {
    if (dataList.isEmpty) return Get.snackbar('39'.tr, '107'.tr);
    Get.toNamed(AppRoute.ordersCheckout, arguments: {
      'totalPrice': getTotalPrice().toString(),
      'couponId': couponId,
      'couponName': couponName,
      'couponDiscount': couponDiscount.toString(),
    });
  }

  @override
  refreshPage() {
    totalPrice = 0;
    prosAmount = 0;
    viewCart();
  }
}
