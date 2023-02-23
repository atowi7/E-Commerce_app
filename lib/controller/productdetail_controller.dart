import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';

import 'package:get/get.dart';

abstract class BaseProductDetailController extends GetxController {
  initialData();
  addCart(String proid);
  deleteCart(String proid);
  addCount();
  deleteCount();
  getCount(String proid);
}

class ProductDetailController extends BaseProductDetailController {
  late ProductModel productModel;
  int count = 0;

  AppServices appServices = Get.find();

  CartData cartdata = CartData(Get.find());

  late StatusRequest statusRequest;

  List itemf = [
    {'name': 'red', 'active': 0},
    {'name': 'blue', 'active': 1},
    {'name': 'green', 'active': 0},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    productModel = Get.arguments['productmodel'];
    count = await getCount(productModel.id!);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addCount() {
    addCart(productModel.id!);
    count++;
  }

  @override
  deleteCount() {
    if (count > 0) {
      deleteCart(productModel.id!);
      count--;
    }
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
        update();
      } else {
        Get.snackbar('NOTFY', 'add to cart Fail');
        statusRequest = StatusRequest.noDatafailure;
      }
    }
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
        update();
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
