import 'package:ecommerce_app/controller/search_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BaseHomeController extends MySearchController {
  getData();

  goToItem(List categories, String cid);
  goToProductDetial(ProductModel productModel);
}

class HomeController extends BaseHomeController {
  String? id;
  String? name;

  String? cardTitle;
  String? cardDesc;

  String? deliveryTime;

  HomeData homeData = HomeData(Get.find());
  AppServices appServices = Get.find();

  List headings = [];
  List categories = [];
  // get categoriess => categories;
  List allProducts = [];
  List topSellingProducts = [];

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

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        headings.addAll(response['headings']);
        cardTitle = headings[0]['heading_title'];
        cardDesc = headings[0]['heading_body'];

        deliveryTime = headings[0]['heading_deliverytime'];
        appServices.sharedPreferences.setString('deliverytime', deliveryTime!);

        allProducts.addAll(response['products']);
        categories.addAll(response['categories']);
        if (response['producttopselling'] != 0) {
          topSellingProducts.addAll(response['producttopselling']);
        }
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
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
