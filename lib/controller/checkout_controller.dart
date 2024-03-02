import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/key.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/Addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

abstract class BaseCheckoutController extends GetxController {
  choosePyamentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAdderss(String val);
  getShippingAdderss();
  payByCard(BuildContext context);
  checkout();
}

class CheckoutController extends BaseCheckoutController {
  String? payment;
  bool isPaymentSuccess = false;
  String? deliveryType;
  String? deliveryPrice;
  String? addressId;
  String? userId;

  late String totalPrice;
  late String couponId;
  late String couponDiscount;

  List<AddressModel> addressList = [];

  AppServices appServices = Get.find();

  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  CartController cartController = Get.put(CartController());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    userId = appServices.sharedPreferences.getString('userid');
    totalPrice = Get.arguments['totalPrice'];
    deliveryPrice = Get.arguments['deliveryPrice'];
    couponId = Get.arguments['couponId'] ?? '0';
    couponDiscount = Get.arguments['couponDiscount'] ?? '0';
    addressId = '0';
    getShippingAdderss();
    super.onInit();
  }

  @override
  choosePyamentMethod(String val) {
    payment = val;
    update();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  chooseShippingAdderss(String val) {
    addressId = val;
    update();
  }

  @override
  getShippingAdderss() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getData(userId!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        addressList.clear();
        addressList.addAll(data.map((e) => AddressModel.fromJson(e)));
        addressId = addressList[0].addressId;
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }

  @override
  payByCard(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckout(
        sandboxMode: true,
        clientId: AppKey.paypalClientId,
        secretKey: AppKey.paypalSecretKey,
        returnURL: "https://atowi7.com/ECommerce_app/paypalsuccess.php",
        cancelURL: "https://atowi7.com/ECommerce_app/paypalerror.php",
        transactions: [
          {
            "amount": {
              "total": '70',
              "currency": "SAR",
              "details": {
                "subtotal": totalPrice,
                // "shipping": '0',
                // "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": const {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                // {
                //   "name": "Pineapple",
                //   "quantity": 5,
                //   "price": '10',
                //   "currency": "USD"
                // }
              ],
              // // shipping address is Optional
              // "shipping_address": {
              //   "recipient_name": "Raman Singh",
              //   "line1": "Delhi",
              //   "line2": "",
              //   "city": "Delhi",
              //   "country_code": "IN",
              //   "postal_code": "11001",
              //   "phone": "+00000000",
              //   "state": "Texas"
              // },
            }
          }
        ],
        note: '158'.tr,
        onSuccess: (Map params) async {
          choosePyamentMethod('1');
          isPaymentSuccess = true;
          return AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: '39'.tr,
            desc: '161'.tr,
            btnCancelIcon: Icons.close_outlined,
            btnCancelColor: AppColor.primaryColor,
            btnCancelOnPress: () {
              Navigator.of(context).pop();
            },
          ).show();
        },
        onError: (error) {
          return AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: '96'.tr,
            desc: '162'.tr,
            btnCancelIcon: Icons.close_outlined,
            btnCancelColor: AppColor.primaryColor,
            btnCancelOnPress: () {
              Get.back();
            },
          ).show();
        },
        onCancel: () {
          return AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            title: '39'.tr,
            desc: '163'.tr,
            btnCancelIcon: Icons.close_outlined,
            btnCancelColor: AppColor.primaryColor,
            btnCancelOnPress: () {
              Get.back();
            },
          ).show();
        },
      ),
    ));
  }

  @override
  checkout() async {
    if (deliveryType == null) {
      return Get.snackbar('39'.tr, '115'.tr,
          duration: const Duration(seconds: 2));
    }

    if (deliveryType == '0') {
      if (addressList.isEmpty) {
        return Get.snackbar('39'.tr, '116'.tr,
            duration: const Duration(seconds: 2));
      }
    }

    if (payment == null) {
      return Get.snackbar('39'.tr, '114'.tr,
          duration: const Duration(seconds: 2));
    }

    // if (payment == '0') {

    // }

    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.addOrder(
      totalPrice,
      deliveryType == '1' ? '0' : deliveryPrice!,
      couponId,
      couponDiscount,
      payment!,
      deliveryType!,
      addressId!,
      userId!,
    );

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('39'.tr, '117'.tr, duration: const Duration(seconds: 2));
        cartController.refreshPage();
        Get.offNamed(AppRoute.homePage);
      } else {
        Get.snackbar('39'.tr, '118'.tr, duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('39'.tr, '96'.tr, duration: const Duration(seconds: 2));
    }
    update();
  }
}
