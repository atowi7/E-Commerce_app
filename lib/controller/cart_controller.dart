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
  int discount = 0;

  TextEditingController? couponController;

  AppServices appServices = Get.find();

  CartData cartdata = CartData(Get.find());

  late StatusRequest statusRequest;

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
      statusRequest = StatusRequest.serverFailure;
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
        Get.snackbar('NOTFY', 'add to cart sucess');
      } else {
        Get.snackbar('NOTFY', 'add to cart Fail');
        statusRequest = StatusRequest.noDatafailure;
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
        Get.snackbar('NOTFY', 'delete from cart sucess');
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
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
        discount = int.parse(couponModel!.couponDiscount!);
        getTotalPrice();
      } else {
        // couponName = 'invalid';
        discount = 0;
        Get.snackbar('NOTFY', 'Invalid coupon');
      }
    } else {
      Get.snackbar('NOTFY', 'Server Error');
    }
    update();
  }

  @override
  double getTotalPrice() {
    return totalPrice - (totalPrice * (discount / 100));
  }

  @override
  goToCheckout() {
    if (dataList.isEmpty) return Get.snackbar('Notify', 'Cart is empty');
    Get.toNamed(AppRoute.checkout, arguments: {
      'totalPrice': totalPrice.toString(),
      'couponName:': couponName ?? '0',
    });
  }

  @override
  refreshPage() async {
    await viewCart();
    dataList.clear();
    totalPrice = 0;
    prosAmount = 0;
  }
}
