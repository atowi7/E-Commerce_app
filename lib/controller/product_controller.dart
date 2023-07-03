import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/product_data.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';

import 'package:get/get.dart';

abstract class BaseProductController extends GetxController {
  initialData();
  getselcat(String catid);
  goToProductDetial(ProductModel productModel);
}

class ProductController extends BaseProductController {
  String? userid;
  List categories = [];
  List products = [];
  String? cid;
  String? deliveryTime;

  ProductData productData = ProductData(Get.find());
  AppServices appServices = Get.find();

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    getData(cid!);
    deliveryTime = appServices.sharedPreferences.getString('deliverytime');
    super.onInit();
  }

  @override
  initialData() {
    userid = appServices.sharedPreferences.getString('userid');
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
    update();

    var response = await productData.getData(userid!, cid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        products.clear();
        products.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '96'.tr);
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  goToProductDetial(ProductModel productModel) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      'productmodel': productModel,
    });
  }
}
