import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSearchController extends GetxController {
  onSearch();
  onChangeSearch(String val);
  searchData();
}

class SearchController extends BaseSearchController {
  List<ProductModel> searchProducts = [];
  TextEditingController? searchTextController;
  bool isSearch = false;

  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  @override
  onSearch() {
    searchData();
    isSearch = true;
    update();
  }

  @override
  onChangeSearch(val) {
    if (val == '') {
      isSearch = false;
    }
    update();
  }

  @override
  searchData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.searchData(searchTextController!.text);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        searchProducts.clear();
        searchProducts.addAll(data.map((e) => ProductModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }
}
