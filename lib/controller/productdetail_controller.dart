import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';

import 'package:get/get.dart';

abstract class BaseProductDetailController extends GetxController {
  initialData();
  addCount();
  deleteCount();
}

class ProductDetailController extends BaseProductDetailController {
  late ProductModel productModel;
  int count = 0;

  late StatusRequest statusRequest;

  CartController cartController = Get.put(CartController());

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
    count = await cartController.getCount(productModel.id!);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addCount() {
    cartController.addCart(productModel.id!);
    count++;
    update();
  }

  @override
  deleteCount() {
    if (count > 0) {
      cartController.deleteCart(productModel.id!);
      count--;
      update();
    }
  }
}
