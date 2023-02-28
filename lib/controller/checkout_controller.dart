import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/Addressmodel.dart';
import 'package:get/get.dart';

abstract class BaseCheckoutController extends GetxController {
  choosePyamentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAdderss(String val);
  gethippingAdderss();
}

class CheckoutController extends BaseCheckoutController {
  String? payment;
  String? delivery;
  String? addressId;

  List<AddressModel> dataList = [];

  AppServices appServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    gethippingAdderss();
    super.onInit();
  }

  @override
  choosePyamentMethod(String val) {
    payment = val;
    update();
  }

  @override
  chooseDeliveryType(String val) {
    delivery = val;
    update();
  }

  @override
  chooseShippingAdderss(String val) {
    addressId = val;
    update();
  }

  @override
  gethippingAdderss() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(appServices.sharedPreferences.getString('userid')!);

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
}
