import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/Addressmodel.dart';
import 'package:get/get.dart';

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
  String? addressId;
  String? userId;

  late String totalPrice;
  late String couponName;

  List<AddressModel> dataList = [];

  AppServices appServices = Get.find();

  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    userId = appServices.sharedPreferences.getString('userid');
    totalPrice = Get.arguments['totalPrice'];
    couponName = Get.arguments['couponName'];
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
        dataList.clear();
        dataList.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }

  @override
  checkout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.addOrder(
      totalPrice,
      '10',
      couponName,
      payment!,
      deliveryType!,
      addressId!,
      userId!,
    );

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        print(data);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }
}
