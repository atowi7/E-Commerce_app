import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/product_data.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';

import 'package:get/get.dart';

abstract class BaseProductController extends GetxController {
  initialData();
  getselcat(int i);
}

class ProductController extends BaseProductController {
  List categories = [];
  List products = [];
  int? selcat;

  ProductData productData = ProductData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selcat = Get.arguments['selcat'];
  }

  @override
  getselcat(int i) {
    selcat = i;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await productData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        products.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }
}
