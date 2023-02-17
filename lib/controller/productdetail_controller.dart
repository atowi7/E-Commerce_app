import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/model/product.dart';

import 'package:get/get.dart';

abstract class BaseProductDetailController extends GetxController {
  initialData();
}

class ProductDetailController extends BaseProductDetailController {
  late ProductModel productModel;

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    productModel = Get.arguments['productmodel'];
  }
}
