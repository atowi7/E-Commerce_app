import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:get/get.dart';

abstract class BaseCartController extends GetxController {
  viewCart(String cartid);
  addCart(String proid);
  deleteCart(String proid);
  getCount(String proid);
}

class CartController extends BaseCartController {
  AppServices appServices = Get.find();

  CartData cartdata = CartData(Get.find());

  late StatusRequest statusRequest;

  @override
  viewCart(String cartid) {
    // TODO: implement viewCart
    throw UnimplementedError();
  }

  @override
  addCart(proid) async {
    statusRequest = StatusRequest.loading;

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
    }
  }

  @override
  deleteCart(String proid) async {
    statusRequest = StatusRequest.loading;

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
}
