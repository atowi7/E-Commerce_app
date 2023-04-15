import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/Addressmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

abstract class BaseCheckoutController extends GetxController {
  choosePyamentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAdderss(String val);
  getShippingAdderss();
  checkout();
}

class CheckoutController extends BaseCheckoutController {
  String? payment;
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
    deliveryPrice = '10';
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        addressList.clear();
        addressList.addAll(data.map((e) => AddressModel.fromJson(e)));
        addressId = addressList[0].addressId;
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }

  @override
  checkout() async {
    if (payment == null) {
      return Get.snackbar('NOTFY', 'Please choose payment method');
    }
    if (deliveryType == null) {
      return Get.snackbar('NOTFY', 'Please choose delivery type');
    }

    if (deliveryType == '0') {
      if (addressList.isEmpty) {
        return Get.snackbar('NOTFY', 'Please Add address');
      }
    }
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('NOTFY', 'add to Order sucess');
        cartController.deleteCartByUser();
        Get.offNamed(AppRoute.homePage);
      } else {
        Get.snackbar('NOTFY', 'add to Order Fail, please try again');
      }
    } else {
      Get.snackbar('NOTFY', 'Server Error');
    }
    update();
  }
}
