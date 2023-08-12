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

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
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

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        dataList.removeWhere((element) => element.addressId == addressid);
        viewAddress();
        Get.snackbar('39'.tr, '144'.tr, duration: const Duration(seconds: 2));
      } else {
        Get.snackbar('39'.tr, '145'.tr, duration: const Duration(seconds: 2));
       // statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr, duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

  }

  @override
  goToAddAddress() {
    Get.offNamed(AppRoute.addressadd);
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
