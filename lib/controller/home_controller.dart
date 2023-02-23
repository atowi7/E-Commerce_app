import 'package:ecommerce_app/controller/search_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BaseHomeController extends SearchController {
  getData();

  goToItem(List categories, String cid);
  goToProductDetial(ProductModel productModel);
}

class HomeController extends BaseHomeController {
  String? id;
  String? name;

  HomeData homeData = HomeData(Get.find());
  AppServices appServices = Get.find();

  List categories = [];
  List products = [];

  @override
  void onInit() {
    id = appServices.sharedPreferences.getString('userid');
    name = appServices.sharedPreferences.getString('username');
    searchTextController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        categories.addAll(response['categories']);
        products.addAll(response['products']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }

  @override
  goToItem(categories, cid) {
    Get.toNamed(AppRoute.product, arguments: {
      'categories': categories,
      'cid': cid,
    });
  }

  @override
  goToProductDetial(ProductModel productModel) {
    Get.toNamed(AppRoute.productdetail, arguments: {
      'productmodel': productModel,
    });
  }
}
