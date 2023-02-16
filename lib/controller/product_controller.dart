import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/product_data.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';

import 'package:get/get.dart';

abstract class BaseProductController extends GetxController {
  initialData();
  getselcat(String catid);
}

class ProductController extends BaseProductController {
  List categories = [];
  List products = [];
  String? cid;

  ProductData productData = ProductData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    getData(cid!);
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    cid = Get.arguments['cid'];
  }

  @override
  getselcat(catid) {
    cid = catid;
    getData(cid!);
    update();
  }

  getData(String cid) async {
    statusRequest = StatusRequest.loading;

    var response = await productData.getData(cid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        products.clear();
        products.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }
}
