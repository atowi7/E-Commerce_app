import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/Addressmodel.dart';
import 'package:get/get.dart';

abstract class BaseViewAddressController extends GetxController {
  viewAddress();
  deleteAddress(String addressid);
  goToAddAddress();
  goToEditAddress(String addressId, String name, String street, String city);
}

class ViewAddressController extends BaseViewAddressController {
  List<AddressModel> dataList = [];

  AppServices appServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }

  @override
  viewAddress() async {
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

  @override
  deleteAddress(addressid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.deleteAddress(addressid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        dataList.removeWhere((element) => element.addressId == addressid);
        update();
        Get.snackbar('39'.tr, '144'.tr);
      } else {
        Get.snackbar('39'.tr, '145'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addressadd);
  }

  @override
  goToEditAddress(addressId, name, street, city) {
    Get.toNamed(AppRoute.addressedit, arguments: {
      'addressid': addressId,
      'name': name,
      'street': street,
      'city': city,
    });
  }
}
